USE [Hydrology_pygq]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

-- =============================================
-- 降雨量表
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ST_PPTN_R')
		DROP TABLE [dbo].[ST_PPTN_R]
GO

CREATE TABLE [dbo].[ST_PPTN_R](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[DRP] [numeric](5, 1) NULL,
	[INTV] [numeric](5, 2) NULL,
	[PDR] [numeric](5, 2) NULL,
	[DYP] [numeric](5, 1) NULL,
	[WTH] [char](1) NULL,
	[TKTP] [char](10) NULL,
	CONSTRAINT [PK__ST_PPTN___952A629F035179CE] PRIMARY KEY CLUSTERED
		(
			[STCD] ASC,
			[TM] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ST_PPTN_R] ADD  CONSTRAINT [DF_ST_PPTN_R_TM]  DEFAULT (getdate()) FOR [TM]
GO

ALTER TABLE [dbo].[ST_PPTN_R] ADD  CONSTRAINT [DF_ST_PPTN_R_TKTP]  DEFAULT ('auto') FOR [TKTP]
GO

	
-- =============================================
-- 降雨量表Insert触发器， 用于累加日降雨量
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
USE [Hydrology_pygq]
GO

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'ST_PPTN_R_INSERT_TR' AND [XTYPE] = 'TR')
	DROP TRIGGER ST_PPTN_R_insert_TR
GO

CREATE TRIGGER ST_PPTN_R_INSERT_TR 
   ON  [dbo].[ST_PPTN_R]
   AFTER INSERT
AS 
BEGIN
	DECLARE @id INT; 									-- 当前数据表pk
	DECLARE @stcd CHAR(8);						-- 当前测站编码 
	DECLARE @stnm CHAR(30);
	DECLARE @sttp CHAR(2);
	DECLARE @tktp CHAR(10);
	DECLARE @drp NUMERIC(5, 1);
	DECLARE @tm DATETIME;
	DECLARE @today DATETIME; 					-- 今天的时间截
	DECLARE @yestday DATETIME;				-- 昨天的时间截
	DECLARE @tomorrow DATETIME; 			-- 明天的时间截
	DECLARE @tol NUMERIC(5, 1);				-- 当天及时总降雨量
	DECLARE @year INT; 								-- 当前年份数
	DECLARE @month INT; 							-- 当前月份数
	DECLARE @day INT; 								-- 当前天数
	DECLARE @start_year INT; 					-- 开始计算均值的年份数
	DECLARE @count INT; 							-- 表单数据数
	DECLARE @num INT; 								-- 算术平均数的分母
	DECLARE @mydavp NUMERIC(5, 1); 		-- 多年平均旬月降水量
	DECLARE @total NUMERIC(5, 1); 		-- 日降水量多年同期均值表中的同期降雨量总和
	DECLARE @average NUMERIC(5, 1);		-- 日降水量多年同期均值表中的平均值
	DECLARE @prdtp INT;								-- 旬月标志：1--上旬， 2--中旬  3--下旬  4--全月
	
	/* 触发累计当天总降雨量 */
	SELECT @id = [id], @stcd = [STCD], @drp = [DRP], @tm = [TM], @tktp = [TKTP] FROM inserted;
	SELECT @today = today, @yestday = yestday, @tomorrow = tomorrow, @year = year, @month = month, @day = day
	FROM openrowset('sqloledb','Trusted_Connection=yes','exec [Hydrology_pygq].[dbo].[proc_get_datetime]');
	SELECT @tol = SUM([DRP]) FROM [dbo].[ST_PPTN_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @today AND @tomorrow;
	UPDATE [dbo].[ST_PPTN_R] SET [DYP] = @tol FROM [dbo].[ST_PPTN_R] WHERE [id] = @id;

	SELECT @stnm = [STNM], @sttp = [STTP] FROM [dbo].[ST_STBPRP_B] WHERE [STCD] = @stcd;
	INSERT [dbo].[ST_TASKLIST_D] ([RELATED], [PK], [STCD], [STNM], [STTP], [TKTP], [TM])
		VALUES ('ST_PPTN_R', @id, @stcd, @stnm, @sttp, @tktp, @tm);
	/* 计算并记录日降水量多年同期均值*/
	SELECT TOP 1 @start_year = [BGYR] FROM [dbo].[ST_PDDMYAV_S] ORDER BY [MODITIME] DESC;
	SET @start_year = ISNULL(@start_year, @year);
	SELECT @num = count(*), @total = SUM([MYDAVP]) FROM [dbo].[ST_PDDMYAV_S] WHERE [STCD] = @stcd AND [MNTH] = @month AND [DAY] = @day;
	SELECT @count = count(*) FROM [dbo].[ST_PDDMYAV_S] WHERE [STCD] = @stcd AND [MNTH] = @month AND [DAY] = @day AND [EDYR] = @year;
	IF(@count > 0)
		BEGIN
			IF(@num > 0)
				BEGIN
					SET @average = (@total + @drp) / @num;
				END
			ELSE
				BEGIN
					SET @average = @drp;
				END
			UPDATE [dbo].[ST_PDDMYAV_S] SET [MYDAVP] = @average, [EDYR] = @year, [STTYRNUM] = (@year - [BGYR] + 1), [MODITIME] = GETDATE() 
				WHERE [STCD] = @stcd AND [MNTH] = @month AND [DAY] = @day;
		END
	ELSE
		BEGIN
			IF(@num > 0)
				BEGIN
					SET @average = (@total + @drp) / (@num + 1);
				END
			ELSE
				BEGIN
					SET @average = @drp;
				END
			INSERT [dbo].[ST_PDDMYAV_S] ([STCD], [MNTH], [DAY], [BGYR], [EDYR], [MYDAVP], [STTYRNUM], [MODITIME]) 
				VALUES (@stcd, @month, @day, @start_year, @year, @average, 1, GETDATE());
		END
	
	/* 触发统计旬月降水量累计表 */
	IF(@day <= 10)	--上旬
		BEGIN
			SET @prdtp = 1;
		END
	ELSE IF(@day > 10 AND @day <= 20)		--中旬
		BEGIN
			SET @prdtp = 2;
		END
	ELSE	--下旬
		BEGIN
			SET @prdtp = 3;
		END
	-- 记录上旬、中旬、下旬数据
	SELECT @count = count(*) FROM [dbo].ST_PDMMYSQ_S WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = @prdtp;
	IF(@count > 0)
		BEGIN
			UPDATE [dbo].ST_PDMMYSQ_S SET [ACCP] = ([ACCP] + @drp), [MODITIME] = GETDATE() WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = @prdtp;
		END
	ELSE
		BEGIN
			INSERT [dbo].ST_PDMMYSQ_S ([STCD], [ACCP], [YR], [MNTH], [PRDTP], [MODITIME]) VALUES (@stcd, @drp, @year, @month, @prdtp, GETDATE());
		END
	-- 记录全月数据
	SELECT @count = count(*) FROM [dbo].ST_PDMMYSQ_S WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = 4;
	IF(@count > 0)
		BEGIN
			UPDATE [dbo].ST_PDMMYSQ_S SET [ACCP] = ([ACCP] + @drp), [MODITIME] = GETDATE() WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = 4;
		END
	ELSE
		BEGIN
			INSERT [dbo].ST_PDMMYSQ_S ([STCD], [ACCP], [YR], [MNTH], [PRDTP], [MODITIME]) VALUES (@stcd, @drp, @year, @month, 4, GETDATE());
		END

	/* 触发计算旬月降水量均值表 */
	SELECT @count = count(*) FROM [dbo].ST_PDMMYAV_S WHERE [STCD] = @stcd AND [MNTH] = @month AND [PRDTP] = @prdtp;
	IF(@count > 0)
		BEGIN
			SELECT @mydavp = (SUM([ACCP])/count(*)) FROM [dbo].ST_PDMMYSQ_S WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = @prdtp;
			UPDATE [dbo].ST_PDMMYAV_S SET [MYMAVP] = @mydavp, [EDYR] = @year, [STTYRNUM] = (@year - [BGYR] + 1), [MODITIME] = GETDATE() 
				WHERE [STCD] = @stcd AND [MNTH] = @month AND [PRDTP] = @prdtp;
		END
	ELSE
		BEGIN
			SELECT @mydavp = SUM([ACCP]) FROM [dbo].ST_PDMMYSQ_S WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = @prdtp;
			INSERT [dbo].ST_PDMMYAV_S ([STCD], [MNTH], [PRDTP], [MYMAVP], [BGYR], [EDYR], [STTYRNUM], [MODITIME])
				VALUES (@stcd, @month, @prdtp, @mydavp, @year, @year, 1, GETDATE());
		END
	SELECT @count = count(*) FROM [dbo].ST_PDMMYAV_S WHERE [STCD] = @stcd AND [MNTH] = @month AND [PRDTP] = 4;
	IF(@count > 0)
		BEGIN
			SELECT @mydavp = (SUM([ACCP])/count(*)) FROM [dbo].ST_PDMMYSQ_S WHERE [STCD] = @stcd AND [MNTH] = @month AND [PRDTP] = 4;
			UPDATE [dbo].ST_PDMMYAV_S SET [MYMAVP] = @mydavp, [EDYR] = @year, [STTYRNUM] = ([BGYR] - @year + 1), [MODITIME] = GETDATE()
			WHERE [STCD] = @stcd AND [MNTH] = @month AND [PRDTP] = 4;
		END
	ELSE
		BEGIN
			SELECT @mydavp = SUM([ACCP]) FROM [dbo].ST_PDMMYSQ_S WHERE [STCD] = @stcd AND [MNTH] = @month AND [PRDTP] = 4;
			INSERT [dbo].ST_PDMMYAV_S ([STCD], [MNTH], [PRDTP], [MYMAVP], [BGYR], [EDYR], [STTYRNUM], [MODITIME])
			VALUES (@stcd, @month, 4, @mydavp, @year, @year, 1, GETDATE());
		END
END
GO


-- =============================================
-- 降雨量表 DELETE 触发器， 用于累加日降雨量
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'ST_PPTN_R_DELETE_TR' AND [XTYPE] = 'TR')
	DROP TRIGGER ST_PPTN_R_DELETE_TR
GO

CREATE TRIGGER ST_PPTN_R_DELETE_TR
ON  ST_PPTN_R
AFTER DELETE
AS
BEGIN
	-- 降雨量表 DELETE 触发器， 用于累加日降雨量
	SET NOCOUNT ON;
	DECLARE @id INT; 									-- 当前数据表pk
	DECLARE @stcd CHAR(8);						-- 当前测站编码 
	DECLARE @tm DATETIME;							-- 所删除数据的时间截
	DECLARE @today DATETIME; 					-- 今天的时间截
	DECLARE @yestday DATETIME;				-- 昨天的时间截
	DECLARE @tomorrow DATETIME; 			-- 明天的时间截
	DECLARE @tol NUMERIC(5, 1);				-- 当天及时总降雨量
	DECLARE @year INT; 								-- 当前年份数
	DECLARE @month INT; 							-- 当前月份数
	DECLARE @day INT; 								-- 当前天数
	DECLARE @drp NUMERIC(5, 1);				-- 删除的降雨量
	DECLARE @num INT; 								-- 算术平均数的分母
	DECLARE @mydavp NUMERIC(5, 1); 		-- 多年平均旬月降水量
	DECLARE @total NUMERIC(5, 1); 		-- 日降水量多年同期均值表中的同期降雨量总和
	DECLARE @average NUMERIC(5, 1);		-- 日降水量多年同期均值表中的平均值
	DECLARE @prdtp INT;								-- 旬月标志：1--上旬， 2--中旬  3--下旬  4--全月
	DECLARE @sql NVARCHAR(1000);			-- 动态生成SQL字符串

	/* 触发累计计算当天总降雨量 */
	SELECT @id = [id], @stcd = [STCD], @drp = [DRP], @tm = [TM] FROM deleted;
	SET @sql = 'insert INTO #Tb_frame SELECT * FROM openrowset(''sqloledb'',''Trusted_Connection=yes'',''exec [Hydrology_pygq].[dbo].[proc_get_time_frame] @getdate="' + @tm + '"'')';
	IF OBJECT_ID('[dbo].[#Tb_frame]') IS NOT NULL
		DROP TABLE [dbo].[#Tb_frame]
	CREATE TABLE [dbo].[#Tb_frame](
		[today] DATETIME,
		[yestday] DATETIME,
		[tomorrow] DATETIME,
		[year] INT,
		[month] INT,
		[day] INT
	)
	EXECUTE sp_executesql @sql;
	SELECT TOP 1 @today = today, @yestday = yestday, @tomorrow = tomorrow, @year = year, @month = month, @day = day FROM #Tb_frame;
	SELECT @tol = SUM([DRP]) FROM [dbo].[ST_PPTN_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @today AND @tomorrow;
	UPDATE [dbo].[ST_PPTN_R] SET [DYP] = @tol WHERE [id] = @id;
	UPDATE [dbo].[ST_PPTN_R] SET [DYP] = ([DYP] + @drp) WHERE [TM] > @tm AND [TM] < @tomorrow;
	DELETE [dbo].[ST_TASKLIST_D] WHERE [RELATED] = 'ST_PPTN_R' AND [PK] = @id;

	/* 计算并记录日降水量多年同期均值*/
	SELECT @num = count(*), @total = SUM([MYDAVP]) FROM [dbo].[ST_PDDMYAV_S] WHERE [STCD] = @stcd AND [MNTH] = @month AND [DAY] = @day;
	IF(@num > 0)
		BEGIN
			SET @average = (@total - @drp) / @num;
		END
	ELSE
		BEGIN
			SET @average = @tol;
		END
	UPDATE [dbo].[ST_PDDMYAV_S] SET [MYDAVP] = @average, [MODITIME] = GETDATE() WHERE [STCD] = @stcd AND [MNTH] = @month AND [DAY] = @day AND [EDYR] = @year;

	/* 触发统计旬月降水量累计表 */
	IF(@day <= 10)	--上旬
		BEGIN
			SET @prdtp = 1;
		END
	ELSE IF(@day > 10 AND @day <= 20)		--中旬
		BEGIN
			SET @prdtp = 2;
		END
	ELSE	--下旬
		BEGIN
			SET @prdtp = 3;
		END
	-- 记录上旬、中旬、下旬数据
	UPDATE [dbo].ST_PDMMYSQ_S SET [ACCP] = ([ACCP] - @drp), [MODITIME] = GETDATE() WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = @prdtp;
	-- 记录全月数据
	UPDATE [dbo].ST_PDMMYSQ_S SET [ACCP] = ([ACCP] - @drp), [MODITIME] = GETDATE() WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = 4;

	/* 触发计算旬月降水量均值表 */
	WHILE @year <= DATENAME(year, GETDATE())
		BEGIN
			SELECT @mydavp = (SUM([ACCP])/count(*)) FROM [dbo].ST_PDMMYSQ_S WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = @prdtp;
			UPDATE [dbo].ST_PDMMYAV_S SET [PRDTP] = @mydavp, [EDYR] = @year, [STTYRNUM] = ([BGYR] - @year + 1), [MODITIME] = GETDATE()
			WHERE [STCD] = @stcd AND [MNTH] = @month AND [PRDTP] = @prdtp;
			SELECT @mydavp = (SUM([ACCP])/count(*)) FROM [dbo].ST_PDMMYSQ_S WHERE [STCD] = @stcd AND [MNTH] = @month AND [PRDTP] = 4;
			UPDATE [dbo].ST_PDMMYAV_S SET [PRDTP] = @mydavp, [EDYR] = @year, [STTYRNUM] = ([BGYR] - @year + 1), [MODITIME] = GETDATE()
			WHERE [STCD] = @stcd AND [MNTH] = @month AND [PRDTP] = 4;
			SET @year = @year + 1;
		END
END
GO

/**
清空降雨量数据
 */
TRUNCATE TABLE [dbo].[ST_PDMMYSQ_S];
TRUNCATE TABLE [dbo].[ST_PDMMYAV_S];
TRUNCATE TABLE [dbo].[ST_PDDMYAV_S];
TRUNCATE TABLE [dbo].[ST_PPTN_R];
DELETE [dbo].[ST_TASKLIST_D] WHERE [RELATED] = 'ST_PPTN_R';