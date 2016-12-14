USE [master]
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

CREATE FUNCTION dbo.fn_get_month_lastday(@date DATETIME) 
	returns INT
AS
BEGIN 
	/* 根据指定的日期时间返回所在当月的最后一天 */
	DECLARE @year INT, @month INT, @temp VARCHAR(20);
	SET @year = DATENAME(year, @date);
	SET @month = DATENAME(month, @date);
	SELECT @temp = convert(VARCHAR(20), dateadd(d, -1, dateadd(m, 1, rtrim(@year) + '-' + rtrim(@month) + '-01')), 111);
	return DATENAME(day, @temp);
END

	
-- =============================================
-- 降雨量表Insert触发器， 用于累加日降雨量
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'ST_PPTN_R_insert_TR' AND [XTYPE] = 'TR')
	DROP TRIGGER ST_PPTN_R_insert_TR
GO

CREATE TRIGGER ST_PPTN_R_insert_TR 
   ON  ST_PPTN_R 
   AFTER INSERT
AS 
BEGIN
	DECLARE @id int, 						-- 当前数据表pk
		@stcd char(8),						-- 当前测站编码 
		@today datetime, 					-- 今天的时间截
		@yestday datetime,				-- 昨天的时间截
		@tomorrow datetime, 			-- 明天的时间截
		@hour int, 								-- 当前小时数
		@tol NUMERIC(5, 1),				-- 当天及时总降雨量
		@year int, 								-- 当前年份数
		@month int, 							-- 当前月份数
		@day int, 								-- 当前天数
		@last_day ini,						-- 当月最后一天
		@start_year int, 					-- 开始计算均值的年份数
		@count int, 							-- 表单数据数
		@num int, 								-- 算术平均数的分母
		@mydavp NUMERIC(5, 1), 		-- 多年平均旬月降水量
		@total NUMERIC(5, 1), 		-- 日降水量多年同期均值表中的同期降雨量总和
		@average NUMERIC(5, 1),		-- 日降水量多年同期均值表中的平均值
		@prdtp int;								-- 旬月标志：1--上旬， 2--中旬  3--下旬  4--全月
	
	/* 触发累计当天总降雨量 */
	SET @hour = DATENAME(hour, GETDATE());
	SELECT @id = [id], @stcd = [STCD] FROM inserted;
	IF(@hour > 8)
		begin
			SET @yestday = CONVERT(varchar(100), GETDATE()-1, 23) + ' 08:00:00';
			SET @today = CONVERT(varchar(100), GETDATE(), 23) + ' 08:00:00';
			SET @tomorrow = CONVERT(varchar(100), GETDATE()+1, 23) + ' 08:00:00';
		end
	ELSE
		begin
			SET @yestday = CONVERT(varchar(100), GETDATE()-2, 23) + ' 08:00:00';
			SET @today = CONVERT(varchar(100), GETDATE()-1, 23) + ' 08:00:00';
			SET @tomorrow = CONVERT(varchar(100), GETDATE(), 23) + ' 08:00:00';
		end
	SELECT @tol = SUM([DRP]) FROM [dbo].[ST_PPTN_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @today AND @tomorrow;
	UPDATE [dbo].[ST_PPTN_R] SET [DYP] = @tol WHERE [id] = @id;
	
	/* 计算并记录日降水量多年同期均值*/
	SET @year = DATENAME(year, @yestday);
	SET @month = DATENAME(month, @yestday);
	SET @day = DATENAME(day, @yestday);
	SELECT TOP 1 @start_year = [BGYR] FROM [dbo].[ST_PDDMYAV_S] ORDER BY [MODITIME] DESC;
	SELECT @num = count(*), @total = SUM([MYDAVP]) FROM [dbo].[ST_PDDMYAV_S] WHERE [MNTH] = @month AND [DAY] = @day;
	SELECT @count = count(*) FROM [dbo].[ST_PDDMYAV_S] WHERE [MNTH] = @month AND [DAY] = @day AND [EDYR] = @year;
	IF(@count > 0)
		BEGIN
			IF(@num > 0)
				BEGIN
					SET @average = (@total + @tol) / @num;
				END
			ELSE
				BEGIN
					SET @average = @tol;
				END
			UPDATE [dbo].[ST_PDDMYAV_S] SET [MYDAVP] = @average WHERE [MNTH] = @month AND [DAY] = @day AND [BGYR] = @start_year AND [EDYR] = @year AND [MODITIME] = GETDATE();
		END
	ELSE
		BEGIN
			IF(@num > 0)
				BEGIN
					SET @average = (@total + @tol) / (@num + 1);
				END
			ELSE
				BEGIN
					SET @average = @tol;
				END
			INSERT [dbo].[ST_PDDMYAV_S] ([STCD], [MNTH], [DAY], [BGYR], [EDYR], [MYDAVP]) VALUES (@stcd, @month, @day, @start_year, @year, @average);
		END
	
	/* 触发统计旬月降水量累计表 */
	SET @year = DATENAME(year, GETDATE());
	SET @month = DATENAME(month, GETDATE());
	SET @day = DATENAME(day, GETDATE());
	SET @last_day = DATENAME(day, convert(VARCHAR(20), dateadd(d, -1, dateadd(m, 1, rtrim(@year) + '-' + rtrim(@month) + '-01')), 111));
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
			UPDATE [dbo].ST_PDMMYSQ_S SET [ACCP] = ([ACCP] + @tol), [MODITIME] = GETDATE() WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = @prdtp;
		END
	ELSE
		BEGIN
			INSERT [dbo].ST_PDMMYSQ_S ([STCD], [ACCP], [YR], [MNTH], [PRDTP], [MODITIME]) VALUES (@stcd, @tol, @year, @month, @prdtp, GETDATE());
		END
	-- 记录全月数据
	SELECT @count = count(*) FROM [dbo].ST_PDMMYSQ_S WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = 4;
	IF(@count > 0)
		BEGIN
			UPDATE [dbo].ST_PDMMYSQ_S SET [ACCP] = ([ACCP] + @tol), [MODITIME] = GETDATE() WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = 4;
		END
	ELSE
		BEGIN
			INSERT [dbo].ST_PDMMYSQ_S ([STCD], [ACCP], [YR], [MNTH], [PRDTP], [MODITIME]) VALUES (@stcd, @tol, @year, @month, 4, GETDATE());
		END

	/* 触发计算旬月降水量均值表 */
	SELECT @count = count(*) FROM [dbo].ST_PDMMYAV_S WHERE [STCD] = @stcd AND [MNTH] = @month AND [PRDTP] = @prdtp;
	IF(@count > 0)
		BEGIN
			SELECT @mydavp = (SUM([ACCP])/count(*)) FROM [dbo].ST_PDMMYSQ_S WHERE [STCD] = @stcd AND [YR] = @year AND [MNTH] = @month AND [PRDTP] = @prdtp;
			UPDATE [dbo].ST_PDMMYAV_S SET [PRDTP] = @mydavp, [EDYR] = @year, [STTYRNUM] = ([BGYR] - @year + 1), [MODITIME] = GETDATE() 
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
			UPDATE [dbo].ST_PDMMYAV_S SET [PRDTP] = @mydavp, [EDYR] = @year, [STTYRNUM] = ([BGYR] - @year + 1), [MODITIME] = GETDATE()
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


IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'ST_RSVR_R_insert_TR' AND [XTYPE] = 'TR')
	DROP TRIGGER ST_RSVR_R_insert_TR
GO

CREATE TRIGGER ST_RSVR_R_insert_TR
	ON  ST_RSVR_R
AFTER INSERT
AS
	BEGIN
		declare @id int, @stcd char(8), @now datetime, @rz numeric(7, 3), @last_rz numeric(7, 3), @rw CHAR, @w NUMERIC(9, 3);
		SELECT @id = [id], @stcd = [STCD], @now = [TM], @rz = [RZ] FROM inserted;
		SELECT TOP 1 @last_rz = [RZ] FROM [dbo].[ST_RSVR_R] WHERE [STCD] = @stcd AND [TM] < @now ORDER BY [TM] DESC;
		SELECT @w = [W] FROM [dbo].[ST_ZVARL_B] WHERE [STCD] = @stcd AND [RZ] = @rz;
		IF(@last_rz > @rz)
			BEGIN 
				SET @rw = 4;
			END
		ELSE IF(@last_rz < @rz)
			BEGIN 
				SET @rw = 5;
			END
		ELSE 
			BEGIN 
				SET @rw = 6;
			END
		UPDATE [dbo].[ST_ZVARL_B] SET [W] = @w, [RWPTN] = @rw WHERE [id] = @id;
	END
GO