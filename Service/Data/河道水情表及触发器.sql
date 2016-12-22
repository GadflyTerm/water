USE [master]
GO

/****** Object:  Table [dbo].[ST_RIVER_R]    Script Date: 12/22/2016 09:45:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ST_RIVER_R](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[Z] [numeric](7, 3) NULL,
	[Q] [numeric](9, 3) NULL,
	[XSA] [numeric](9, 3) NULL,
	[XSAVV] [numeric](5, 3) NULL,
	[XSMXV] [numeric](5, 3) NULL,
	[FLWCHRCD] [char](1) NULL,
	[WPTN] [char](1) NULL,
	[MSQMT] [char](1) NULL,
	[MSAMT] [char](1) NULL,
	[MSVMT] [char](1) NULL,
	CONSTRAINT [PK__ST_RIVER__952A629F1293BD5E] PRIMARY KEY CLUSTERED
		(
			[STCD] ASC,
			[TM] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO


-- =============================================
-- 根据统计时段, 计算河道水情多日均值
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	河道水情多日均值表存用于储河道水文（水位、堰闸）站时段的水位和流量的平均值
-- =============================================
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'proc_set_rvav' AND [XTYPE] = 'P')
	DROP PROCEDURE [dbo].[proc_set_rvav]
GO
CREATE PROCEDURE [dbo].[proc_set_rvav]
		@stcd char(8),
		@tm DATETIME = NULL
AS
	BEGIN
		DECLARE @frame INT; 							-- 统计时段
		DECLARE @begin DATETIME; 					-- 查询的开始时间截
		DECLARE @end DATETIME; 						-- 查询的结束时间截
		DECLARE @avz NUMERIC(7, 3);				-- 平均水位
		DECLARE @avq NUMERIC(9, 3);				-- 平均流量
		DECLARE @param VARCHAR(200);			-- 时间类型参数转字符串
		DECLARE @sql NVARCHAR(1000);			-- 动态生成SQL字符串
		DECLARE @count INT; 							-- 表单数据数
		SET @param = CONVERT(varchar(100), ISNULL(@tm, GETDATE()), 20);
		SET @sql = 'insert INTO #Tb_frame SELECT * FROM openrowset(''sqloledb'',''Trusted_Connection=yes'',''exec [dbo].[proc_get_time_frame] @getdate="' + @param + '"'')';
		IF OBJECT_ID('[dbo].[#Tb_frame]') IS NOT NULL
			DROP TABLE [dbo].[#Tb_frame]
		CREATE TABLE [dbo].[#Tb_frame](
			[frame] INT,
			[begin] DATETIME,
			[end] DATETIME
		)
		EXECUTE sp_executesql @sql;
		SET @frame = 1;
		WHILE (@frame <= 6)
			BEGIN
				SELECT @begin = [begin], @end = [end] FROM #Tb_frame WHERE [frame] = @frame;
				SELECT @avz= SUM([Z])/COUNT(*), @avq = SUM([Q])/COUNT(*) FROM [dbo].[ST_RIVER_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @begin AND @end;
				SELECT @count = COUNT(*) FROM [dbo].[ST_RVAV_R] WHERE [STCD] = @stcd AND CONVERT(varchar(100), [IDTM], 23) = CONVERT(varchar(100), @end, 23) AND [STTDRCD] = @frame;
				IF (@count > 0)
					BEGIN
						UPDATE [dbo].[ST_RVAV_R] SET [IDTM] = @tm, [AVZ] = @avz, [AVQ] = @avq
						WHERE [STCD] = @stcd AND CONVERT(varchar(100), [IDTM], 23) = CONVERT(varchar(100), @end, 23) AND [STTDRCD] = @frame;
					END
				ELSE
					BEGIN
						INSERT [dbo].[ST_RVAV_R] ([STCD], [IDTM], [STTDRCD], [AVZ], [AVQ]) VALUES (@stcd, @tm, @frame, @avz, @avq);
					END
				SET @frame = @frame + 1
			END
	END

	
	-- =============================================
	-- 根据统计时段, 计算河道水情极值
	-- Author:		<Author,,Name>
	-- Create date: <Create Date,,>
	-- Description:	河道水情极值表用于存储测站时段水文要素的最大（高）、最小（低）值及其发生的时间。
	-- =============================================
	IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'proc_set_rvevs' AND [XTYPE] = 'P')
		DROP PROCEDURE [dbo].[proc_set_rvevs]
GO
CREATE PROCEDURE [dbo].[proc_set_rvevs]
		@stcd char(8),
		@tm DATETIME = NULL
AS
	BEGIN
		DECLARE @frame INT; 							-- 统计时段
		DECLARE @begin DATETIME; 					-- 查询的开始时间截
		DECLARE @end DATETIME; 						-- 查询的结束时间截
		DECLARE @htz NUMERIC(7, 3);				-- 最高河道水位
		DECLARE @htztm DATETIME;					-- 最高河道水位出现时间
		DECLARE @mxq NUMERIC(9, 3);				-- 最大流量
		DECLARE @mxqtm DATETIME;					-- 最大流量出现时间
		DECLARE @ltz NUMERIC(7, 3);				-- 最低河道水位
		DECLARE @ltztm DATETIME;					-- 最低河道水位出现时间
		DECLARE @mnq NUMERIC(9, 3);				-- 最小流量
		DECLARE @mnqtm DATETIME;					-- 最小流量出现时间
		DECLARE @param VARCHAR(200);			-- 时间类型参数转字符串
		DECLARE @sql NVARCHAR(1000);			-- 动态生成SQL字符串
		DECLARE @count INT; 							-- 表单数据数
		SET @param = CONVERT(varchar(100), ISNULL(@tm, GETDATE()), 20);
		SET @sql = 'insert INTO #Tb_frame SELECT * FROM openrowset(''sqloledb'',''Trusted_Connection=yes'',''exec [dbo].[proc_get_time_frame] @getdate="' + @param + '"'')';
		IF OBJECT_ID('[dbo].[#Tb_frame]') IS NOT NULL
			DROP TABLE [dbo].[#Tb_frame]
		CREATE TABLE [dbo].[#Tb_frame](
			[frame] INT,
			[begin] DATETIME,
			[end] DATETIME
		)
		EXECUTE sp_executesql @sql;
		SET @frame = 1;
		WHILE (@frame <= 6)
			BEGIN
				SELECT @begin = [begin], @end = [end] FROM #Tb_frame WHERE [frame] = @frame;
				SELECT TOP 1 @htztm = [TM], @htz = [Z] FROM [dbo].[ST_RIVER_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @begin AND @end ORDER BY [Z] DESC;
				SELECT TOP 1 @mxqtm = [TM], @mxq = [Q] FROM [dbo].[ST_RIVER_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @begin AND @end ORDER BY [Q] DESC;
				SELECT TOP 1 @ltztm = [TM], @ltz = [Z] FROM [dbo].[ST_RIVER_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @begin AND @end ORDER BY [Z] ASC;
				SELECT TOP 1 @mnqtm = [TM], @mnq = [Q] FROM [dbo].[ST_RIVER_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @begin AND @end ORDER BY [Q] ASC;
				SELECT @count = COUNT(*) FROM [dbo].[ST_RVEVS_R] WHERE [STCD] = @stcd AND CONVERT(varchar(100), [IDTM], 23) = CONVERT(varchar(100), @end, 23) AND [STTDRCD] = @frame;
				IF (@count > 0)
					BEGIN
						UPDATE [dbo].[ST_RVEVS_R] SET [IDTM] = @tm, [HTZ] = @htz, [LTZ] = @ltz, [MXQ] = @mxq, [MNQ] = @mnq, [HTZTM] = @htztm, [LTZTM] = @ltztm, [MXQTM] = @mxqtm, [MNQTM] = @mnqtm
						WHERE [STCD] = @stcd AND CONVERT(varchar(100), [IDTM], 23) = CONVERT(varchar(100), @end, 23) AND [STTDRCD] = @frame;
					END
				ELSE
					BEGIN
						INSERT [dbo].[ST_RVEVS_R] ([STCD], [IDTM], [STTDRCD], [HTZ], [LTZ], [MXQ], [MNQ], [HTZTM], [LTZTM], [MXQTM], [MNQTM])
						VALUES (@stcd, @tm, @frame, @htz, @ltz, @mxq, @mnq, @htztm, @ltztm, @mxqtm, @mnqtm);
					END
				SET @frame = @frame + 1
			END
	END
	

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'ST_RIVER_R_INSERT_TR' AND [XTYPE] = 'TR')
	DROP TRIGGER ST_RIVER_R_INSERT_TR
GO
CREATE TRIGGER ST_RIVER_R_INSERT_TR
	ON  ST_RIVER_R
AFTER INSERT
AS
	BEGIN
		DECLARE @id INT; 								-- 当前数据表pk
		DECLARE @stcd CHAR(8);					-- 当前测站编码 
		DECLARE @tm DATETIME;						-- 当前时间截
		DECLARE @z NUMERIC(7, 3);				-- 当前水位
		DECLARE @q NUMERIC(9, 3);				-- 当前流量
		DECLARE @wptn CHAR(1);					-- 当前流量
		DECLARE @last_z NUMERIC(7, 3);	-- 上一条记录的水位
		/* 触发器根据INSERT数据对比上一条记录生成河道水水势 */
		SELECT @id = [id], @stcd = [STCD], @tm = [TM], @z = [Z], @q = [Q] FROM inserted;
		SELECT TOP 1 @last_z = [RZ] FROM [dbo].[ST_RIVER_R] WHERE [STCD] = @stcd AND [TM] < @tm ORDER BY [TM] DESC;
		IF(@last_z > @z)
			BEGIN
				SET @wptn = 4;
			END
		ELSE IF(@last_z < @z)
			BEGIN
				SET @wptn = 5;
			END
		ELSE
			BEGIN
				SET @wptn = 6;
			END
		UPDATE [dbo].[ST_RIVER_R] SET [WPTN] = @wptn, [MSQMT] = 'ADCP', [MSAMT] = 'ADCP', [MSVMT] = 'ADCP' WHERE [id] = @id;
		EXEC [dbo].[proc_set_rvav] @stcd, @tm;				-- 计算统计时段平均水位和平均流量
		EXEC [dbo].[proc_set_rvevs] @stcd, @tm;				-- 根据统计时段, 计算河道水情极值
	END


IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'ST_RIVER_R_DELETE_TR' AND [XTYPE] = 'TR')
	DROP TRIGGER ST_RIVER_R_DELETE_TR
GO

CREATE TRIGGER ST_RIVER_R_DELETE_TR
	ON  ST_RIVER_R
AFTER DELETE
AS
	BEGIN
		DECLARE @id INT; 									-- 当前数据表pk
		DECLARE @stcd CHAR(8);						-- 当前测站编码 
		DECLARE @tm DATETIME; 						-- 当前时间截
		DECLARE @z NUMERIC(7, 3); 				-- 当前库上水位
		DECLARE @last_z NUMERIC(7, 3); 		-- 上一次记录的库上水位
		DECLARE @wptn CHAR; 							-- 对比上一次记录的库水水势

		/* 触发器根据INSERT数据对比上一条记录生成河道水势 */
		SELECT @stcd = [STCD], @tm = [TM], @z = [Z] FROM deleted;
		SELECT TOP 1 @id = [id], @last_z = [Z] FROM [dbo].[ST_RIVER_R] WHERE [STCD] = @stcd AND [TM] > @tm ORDER BY [TM] DESC;
		IF(@z > @last_z)
			BEGIN
				SET @wptn = 4;
			END
		ELSE IF(@z < @last_z)
			BEGIN
				SET @wptn = 5;
			END
		ELSE
			BEGIN
				SET @wptn = 6;
			END
		UPDATE [dbo].[ST_RIVER_R] SET [WPTN] = @wptn WHERE [id] = @id;
		EXEC [dbo].[proc_set_rvav] @stcd, @tm;		-- 计算统计时段平均水位和平均蓄水量
		EXEC [dbo].[proc_set_rvevs] @stcd, @tm;	-- 根据统计时段, 计算水库水情极值
	END
GO