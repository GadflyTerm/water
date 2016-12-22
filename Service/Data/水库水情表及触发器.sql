USE [master]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

-- =============================================
-- 水库水情表
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ST_RSVR_R')
	DROP TABLE [dbo].[ST_RSVR_R]
GO

CREATE TABLE [dbo].[ST_RSVR_R](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[RZ] [numeric](7, 3) NULL,
	[INQ] [numeric](9, 3) NULL,
	[W] [numeric](9, 3) NULL,
	[BLRZ] [numeric](7, 3) NULL,
	[OTQ] [numeric](9, 3) NULL,
	[RWCHRCD] [char](1) NULL,
	[RWPTN] [char](1) NULL,
	[INQDR] [numeric](5, 2) NULL,
	[MSQMT] [char](1) NULL,
	CONSTRAINT [PK__ST_RSVR___952A629F16644E42] PRIMARY KEY CLUSTERED
		(
			[STCD] ASC,
			[TM] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO


-- =============================================
-- 根据统计时段, 计算水库平均水位和平均蓄水量
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'proc_set_rsvrav' AND [XTYPE] = 'P')
	DROP PROCEDURE [dbo].[proc_set_rsvrav]
GO
CREATE PROCEDURE [dbo].[proc_set_rsvrav]
		@stcd char(8),
		@now DATETIME = NULL
AS
	BEGIN
		DECLARE @frame INT; 							-- 统计时段
		DECLARE @begin DATETIME; 					-- 查询的开始时间截
		DECLARE @end DATETIME; 						-- 查询的结束时间截
		DECLARE @avrz NUMERIC(7, 3);			-- 当天及时平均水位
		DECLARE @avw NUMERIC(9, 3);				-- 当天及时平均蓄水量
		DECLARE @param VARCHAR(200);			-- 时间类型参数转字符串
		DECLARE @sql NVARCHAR(1000);			-- 动态生成SQL字符串
		DECLARE @count INT; 							-- 表单数据数
		SET @param = CONVERT(varchar(100), ISNULL(@now, GETDATE()), 20);
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
				SELECT @avrz= SUM([RZ])/COUNT(*), @avw = SUM([W])/COUNT(*) FROM [dbo].[ST_RSVR_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @begin AND @end;
				SELECT @count = COUNT(*) FROM [dbo].[ST_RSVRAV_R] WHERE [STCD] = @stcd AND CONVERT(varchar(100), [IDTM], 23) = CONVERT(varchar(100), @end, 23) AND [STTDRCD] = @frame;
				IF (@count > 0)
					BEGIN
						UPDATE [dbo].[ST_RSVRAV_R] SET [IDTM] = @now, [AVRZ] = @avrz, [AVW] = @avw
						WHERE [STCD] = @stcd AND CONVERT(varchar(100), [IDTM], 23) = CONVERT(varchar(100), @end, 23) AND [STTDRCD] = @frame;
					END
				ELSE
					BEGIN
						INSERT [dbo].[ST_RSVRAV_R] ([STCD], [IDTM], [STTDRCD], [AVRZ], [AVW]) VALUES (@stcd, @now, @frame, @avrz, @avw);
					END
				SET @frame = @frame + 1
			END
	END

-- =============================================
-- 根据统计时段, 计算水库水情极值
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'proc_set_rsvrevs' AND [XTYPE] = 'P')
		DROP PROCEDURE [dbo].[proc_set_rsvrevs]
GO
CREATE PROCEDURE [dbo].[proc_set_rsvrevs]
		@stcd char(8),
		@now DATETIME = NULL
AS
	BEGIN
		DECLARE @frame INT; 							-- 统计时段
		DECLARE @begin DATETIME; 					-- 查询的开始时间截
		DECLARE @end DATETIME; 						-- 查询的结束时间截
		DECLARE @htrz NUMERIC(7, 3);			-- 最高库水位
		DECLARE @htrztm DATETIME;					-- 最高库水位出现时间
		DECLARE @mxw NUMERIC(9, 3);				-- 最大蓄水量
		DECLARE @mxwtm DATETIME;					-- 最大蓄水量出现时间
		DECLARE @ltrz NUMERIC(7, 3);			-- 最低库水位
		DECLARE @ltrztm DATETIME;					-- 最低库水位出现时间
		DECLARE @mnw NUMERIC(9, 3);				-- 最小蓄水量
		DECLARE @mnwtm DATETIME;					-- 最小蓄水量出现时间
		DECLARE @param VARCHAR(200);			-- 时间类型参数转字符串
		DECLARE @sql NVARCHAR(1000);			-- 动态生成SQL字符串
		DECLARE @count INT; 							-- 表单数据数
		SET @param = CONVERT(varchar(100), ISNULL(@now, GETDATE()), 20);
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
				SELECT TOP 1 @htrztm = [TM], @htrz = [RZ] FROM [dbo].[ST_RSVR_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @begin AND @end ORDER BY [RZ] DESC;
				SELECT TOP 1 @mxwtm = [TM], @mxw = [W] FROM [dbo].[ST_RSVR_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @begin AND @end ORDER BY [W] DESC;
				SELECT TOP 1 @ltrztm = [TM], @ltrz = [RZ] FROM [dbo].[ST_RSVR_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @begin AND @end ORDER BY [RZ] ASC;
				SELECT TOP 1 @mnwtm = [TM], @mnw = [W] FROM [dbo].[ST_RSVR_R] WHERE [STCD] = @stcd AND [TM] BETWEEN @begin AND @end ORDER BY [W] ASC;
				SELECT @count = COUNT(*) FROM [dbo].[ST_RSVRAV_R] WHERE [STCD] = @stcd AND CONVERT(varchar(100), [IDTM], 23) = CONVERT(varchar(100), @end, 23) AND [STTDRCD] = @frame;
				IF (@count > 0)
					BEGIN
						UPDATE [dbo].[ST_RSVREVS_R] SET [IDTM] = @now, [HTRZ] = @htrz, [LTRZ] = @ltrz, [MXW] = @mxw, [MNW] = @mnw, [HTRZTM] = @htrztm, [LTRZTM] = @ltrztm, [MXWTM] = @mxwtm, [MNWTM] = @mnwtm
						WHERE [STCD] = @stcd AND CONVERT(varchar(100), [IDTM], 23) = CONVERT(varchar(100), @end, 23) AND [STTDRCD] = @frame;
					END
				ELSE
					BEGIN
						INSERT [dbo].[ST_RSVREVS_R] ([STCD], [IDTM], [STTDRCD], [HTRZ], [LTRZ], [MXW], [MNW], [HTRZTM], [LTRZTM], [MXWTM], [MNWTM])
						VALUES (@stcd, @now, @frame, @htrz, @ltrz, @mxw, @mnw, @htrztm, @ltrztm, @mxwtm, @mnwtm);
					END
				SET @frame = @frame + 1
			END
	END

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'ST_RSVR_R_INSERT_TR' AND [XTYPE] = 'TR')
	DROP TRIGGER ST_RSVR_R_INSERT_TR
GO

CREATE TRIGGER ST_RSVR_R_INSERT_TR
	ON  ST_RSVR_R
AFTER INSERT
AS
	BEGIN
		DECLARE @id int, 						-- 当前数据表pk
			@stcd char(8),						-- 当前测站编码 
			@now datetime, 						-- 当前时间截
			@rz numeric(7, 3), 				-- 当前库上水位
			@last_rz numeric(7, 3), 	-- 上一次记录的库上水位
			@rw CHAR, 								-- 对比上一次记录的库水水势
			@w NUMERIC(9, 3);					-- 当前库上水位所对应的蓄水量

		/* 触发器根据INSERT数据对比上一条记录生成库水水势；对照库容曲线表查询生成当前水位的蓄水量 */
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
		UPDATE [dbo].[ST_RSVR_R] SET [W] = @w, [RWPTN] = @rw WHERE [id] = @id;
		EXEC [dbo].[proc_set_rsvrav] @stcd, @now;		-- 计算统计时段平均水位和平均蓄水量
		EXEC [dbo].[proc_set_rsvrevs] @stcd, @now;	-- 根据统计时段, 计算水库水情极值
	END
GO

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'ST_RSVR_R_DELETE_TR' AND [XTYPE] = 'TR')
	DROP TRIGGER ST_RSVR_R_DELETE_TR
GO

CREATE TRIGGER ST_RSVR_R_DELETE_TR
	ON  ST_RSVR_R
AFTER DELETE
AS
	BEGIN
		DECLARE @id INT; 									-- 当前数据表pk
		DECLARE @stcd CHAR(8);						-- 当前测站编码 
		DECLARE @now DATETIME; 						-- 当前时间截
		DECLARE @rz NUMERIC(7, 3); 				-- 当前库上水位
		DECLARE @last_rz NUMERIC(7, 3); 	-- 上一次记录的库上水位
		DECLARE @rw INT; 									-- 对比上一次记录的库水水势

		/* 触发器根据INSERT数据对比上一条记录生成库水水势；对照库容曲线表查询生成当前水位的蓄水量 */
		SELECT @stcd = [STCD], @now = [TM], @rz = [RZ] FROM deleted;
		SELECT TOP 1 @id = [id], @last_rz = [RZ] FROM [dbo].[ST_RSVR_R] WHERE [STCD] = @stcd AND [TM] > @now ORDER BY [TM] DESC;
		IF(@rz > @last_rz)
			BEGIN
				SET @rw = 4;
			END
		ELSE IF(@rz < @last_rz)
			BEGIN
				SET @rw = 5;
			END
		ELSE
			BEGIN
				SET @rw = 6;
			END
		UPDATE [dbo].[ST_RSVR_R] SET [RWPTN] = @rw WHERE [id] = @id;
		EXEC [dbo].[proc_set_rsvrav] @stcd, @now;		-- 计算统计时段平均水位和平均蓄水量
		EXEC [dbo].[proc_set_rsvrevs] @stcd, @now;	-- 根据统计时段, 计算水库水情极值
	END
GO