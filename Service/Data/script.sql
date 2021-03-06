USE [master]
GO
/****** Object:  Database [Hydrology_pygq]    Script Date: 01/19/2017 16:51:28 ******/
CREATE DATABASE [Hydrology_pygq] ON  PRIMARY 
( NAME = N'Hydrology_pygq', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Hydrology_pygq.mdf' , SIZE = 30720KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'Hydrology_pygq_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Hydrology_pygq_log.ldf' , SIZE = 6272KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hydrology_pygq] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hydrology_pygq].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hydrology_pygq] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Hydrology_pygq] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Hydrology_pygq] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Hydrology_pygq] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Hydrology_pygq] SET ARITHABORT OFF
GO
ALTER DATABASE [Hydrology_pygq] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Hydrology_pygq] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Hydrology_pygq] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Hydrology_pygq] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Hydrology_pygq] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Hydrology_pygq] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Hydrology_pygq] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Hydrology_pygq] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Hydrology_pygq] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Hydrology_pygq] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Hydrology_pygq] SET  DISABLE_BROKER
GO
ALTER DATABASE [Hydrology_pygq] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Hydrology_pygq] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Hydrology_pygq] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Hydrology_pygq] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Hydrology_pygq] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Hydrology_pygq] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Hydrology_pygq] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Hydrology_pygq] SET  READ_WRITE
GO
ALTER DATABASE [Hydrology_pygq] SET RECOVERY FULL
GO
ALTER DATABASE [Hydrology_pygq] SET  MULTI_USER
GO
ALTER DATABASE [Hydrology_pygq] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Hydrology_pygq] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hydrology_pygq', N'ON'
GO
USE [Hydrology_pygq]
GO
/****** Object:  User [PYGQ]    Script Date: 01/19/2017 16:51:28 ******/
CREATE USER [PYGQ] FOR LOGIN [PYGQ] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ST_SNOW_R]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SNOW_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[SNOWDEP] [numeric](3, 0) NULL,
	[SNOWDEN] [numeric](3, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_SENDWAIT_E]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SENDWAIT_E](
	[SLSH] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[STCD] [varchar](8) NOT NULL,
	[TABID] [varchar](30) NOT NULL,
	[TM] [datetime] NULL,
	[EXCKEY] [varchar](200) NOT NULL,
	[OPERATION] [varchar](1) NOT NULL,
	[EXCINF] [varchar](4000) NOT NULL,
	[POLLSTATUS] [varchar](1) NOT NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SLSH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_SENDTO_E]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SENDTO_E](
	[INSTCD] [varchar](10) NOT NULL,
	[SLSH] [numeric](18, 0) NOT NULL,
	[SFNUM] [numeric](18, 0) NOT NULL,
	[TM] [datetime] NULL,
	[SENDSTATUS] [varchar](1) NULL,
	[STAT] [varchar](1) NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[INSTCD] ASC,
	[SLSH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_SENDSTAT_E]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SENDSTAT_E](
	[INSTCD] [varchar](10) NOT NULL,
	[COUNTDAY] [datetime] NOT NULL,
	[STTDRCD] [varchar](1) NOT NULL,
	[FRGRD] [varchar](1) NOT NULL,
	[OPERATION] [varchar](1) NOT NULL,
	[INFTYPE] [varchar](1) NOT NULL,
	[STCDNUM] [numeric](6, 0) NULL,
	[INFNUM] [numeric](9, 0) NULL,
	[COUNTL30] [numeric](9, 0) NULL,
	[COUNTB60] [numeric](9, 0) NULL,
	[COUNTT60] [numeric](9, 0) NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[INSTCD] ASC,
	[COUNTDAY] ASC,
	[STTDRCD] ASC,
	[FRGRD] ASC,
	[OPERATION] ASC,
	[INFTYPE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_SENDFILE_E]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SENDFILE_E](
	[SFNUM] [numeric](18, 0) NOT NULL,
	[INSTCD] [varchar](10) NOT NULL,
	[SENDTYPE] [varchar](1) NULL,
	[SENDSTATUS] [varchar](1) NOT NULL,
	[SFILENAME] [varchar](32) NOT NULL,
	[SENDTM] [datetime] NULL,
	[SENDCOUNT] [numeric](18, 0) NULL,
	[ERRLINE] [numeric](18, 0) NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SFNUM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_SENDDO_E]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SENDDO_E](
	[SLSH] [numeric](18, 0) NOT NULL,
	[STCD] [varchar](8) NOT NULL,
	[TABID] [varchar](30) NOT NULL,
	[TM] [datetime] NULL,
	[EXCKEY] [varchar](200) NOT NULL,
	[OPERATION] [varchar](1) NOT NULL,
	[EXCINF] [varchar](4000) NOT NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SLSH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_SEDRF_R]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SEDRF_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[WRNF] [numeric](11, 3) NULL,
	[STW] [numeric](11, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_SEDFR_F]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SEDFR_F](
	[STCD] [char](8) NOT NULL,
	[UNITNAME] [char](30) NOT NULL,
	[PLCD] [char](20) NOT NULL,
	[FYMDH] [datetime] NOT NULL,
	[IYMDH] [datetime] NOT NULL,
	[YMDH] [datetime] NOT NULL,
	[FS] [numeric](9, 3) NULL,
	[SCHRCD] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[UNITNAME] ASC,
	[PLCD] ASC,
	[FYMDH] ASC,
	[IYMDH] ASC,
	[YMDH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_SED_R]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SED_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[S] [numeric](9, 3) NULL,
	[SCHRCD] [char](1) NULL,
	[SMT] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RVYEVSQ_S]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RVYEVSQ_S](
	[STCD] [char](8) NOT NULL,
	[YR] [numeric](4, 0) NOT NULL,
	[HTZ] [numeric](7, 3) NULL,
	[HTZTM] [datetime] NULL,
	[MXQ] [numeric](9, 3) NULL,
	[MXQTM] [datetime] NULL,
	[LTZ] [numeric](7, 3) NULL,
	[LTZTM] [datetime] NULL,
	[MNQ] [numeric](9, 3) NULL,
	[MNQTM] [datetime] NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YR] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RVSECT_B]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RVSECT_B](
	[STCD] [char](8) NOT NULL,
	[MSTM] [datetime] NOT NULL,
	[BGBK] [char](1) NOT NULL,
	[VTNO] [numeric](4, 0) NOT NULL,
	[DI] [numeric](8, 3) NOT NULL,
	[ZB] [numeric](8, 3) NOT NULL,
	[COMMENTS] [char](200) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[MSTM] ASC,
	[VTNO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RVFCCH_B]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RVFCCH_B](
	[STCD] [char](8) NOT NULL,
	[LDKEL] [numeric](7, 3) NULL,
	[RDKEL] [numeric](7, 3) NULL,
	[WRZ] [numeric](7, 3) NULL,
	[WRQ] [numeric](9, 3) NULL,
	[GRZ] [numeric](7, 3) NULL,
	[GRQ] [numeric](9, 3) NULL,
	[FLPQ] [numeric](9, 3) NULL,
	[OBHTZ] [numeric](7, 3) NULL,
	[OBHTZTM] [datetime] NULL,
	[IVHZ] [numeric](7, 3) NULL,
	[IVHZTM] [datetime] NULL,
	[OBMXQ] [numeric](9, 3) NULL,
	[OBMXQTM] [datetime] NULL,
	[IVMXQ] [numeric](9, 3) NULL,
	[IVMXQTM] [datetime] NULL,
	[HMXS] [numeric](9, 3) NULL,
	[HMXSTM] [datetime] NULL,
	[HMXAVV] [numeric](9, 3) NULL,
	[HMXAVVTM] [datetime] NULL,
	[HLZ] [numeric](7, 3) NULL,
	[HLZTM] [datetime] NULL,
	[HMNQ] [numeric](9, 3) NULL,
	[HMNQTM] [datetime] NULL,
	[TAZ] [numeric](7, 3) NULL,
	[TAQ] [numeric](9, 3) NULL,
	[LAZ] [numeric](7, 3) NULL,
	[LAQ] [numeric](9, 3) NULL,
	[SFZ] [numeric](7, 3) NULL,
	[SFQ] [numeric](9, 3) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RVEVS_R]    Script Date: 01/19/2017 16:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RVEVS_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[HTZ] [numeric](7, 3) NULL,
	[LTZ] [numeric](7, 3) NULL,
	[MXQ] [numeric](9, 3) NULL,
	[MNQ] [numeric](9, 3) NULL,
	[HTZTM] [datetime] NULL,
	[LTZTM] [datetime] NULL,
	[MXQTM] [datetime] NULL,
	[MNQTM] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[proc_set_rvevs]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
		SET @sql = 'insert INTO #Tb_frame SELECT * FROM openrowset(''sqloledb'',''Trusted_Connection=yes'',''exec [Hydrology_pygq].[dbo].[proc_get_time_frame] @getdate="' + @param + '"'')';
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
/****** Object:  Table [dbo].[ST_RVDMMYSQ_S]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RVDMMYSQ_S](
	[STCD] [char](8) NOT NULL,
	[YR] [numeric](4, 0) NOT NULL,
	[MNTH] [numeric](2, 0) NOT NULL,
	[PRDTP] [numeric](1, 0) NOT NULL,
	[AVZ] [numeric](7, 3) NULL,
	[AVQ] [numeric](9, 3) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YR] ASC,
	[MNTH] ASC,
	[PRDTP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RVDMMYAV_S]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RVDMMYAV_S](
	[STCD] [char](8) NOT NULL,
	[MNTH] [numeric](2, 0) NOT NULL,
	[PRDTP] [numeric](1, 0) NOT NULL,
	[MYMAVZ] [numeric](7, 3) NULL,
	[MYMAVQ] [numeric](9, 3) NULL,
	[BGYR] [numeric](4, 0) NULL,
	[EDYR] [numeric](4, 0) NULL,
	[STTYRNUM] [numeric](4, 0) NULL,
	[COMMENTS] [varchar](200) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[MNTH] ASC,
	[PRDTP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RVDMEVSQ_S]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RVDMEVSQ_S](
	[STCD] [char](8) NOT NULL,
	[YR] [numeric](4, 0) NOT NULL,
	[MNTH] [numeric](2, 0) NOT NULL,
	[PRDTP] [numeric](1, 0) NOT NULL,
	[HTZ] [numeric](7, 3) NULL,
	[HTZTM] [datetime] NULL,
	[MXQ] [numeric](9, 3) NULL,
	[MXQTM] [datetime] NULL,
	[LTZ] [numeric](7, 3) NULL,
	[LTZTM] [datetime] NULL,
	[MNQ] [numeric](9, 3) NULL,
	[MNQTM] [datetime] NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YR] ASC,
	[MNTH] ASC,
	[PRDTP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RVDAYMYAV_S]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RVDAYMYAV_S](
	[STCD] [char](8) NOT NULL,
	[MNTH] [numeric](2, 0) NOT NULL,
	[DAY] [numeric](2, 0) NOT NULL,
	[MYDAVZ] [numeric](7, 3) NULL,
	[MYDAVQ] [numeric](9, 3) NULL,
	[BGYR] [numeric](4, 0) NULL,
	[EDYR] [numeric](4, 0) NULL,
	[STTYRNUM] [numeric](4, 0) NULL,
	[COMMENTS] [varchar](200) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[MNTH] ASC,
	[DAY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RVAV_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RVAV_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[AVZ] [numeric](7, 3) NULL,
	[AVQ] [numeric](9, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[proc_set_rvav]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
		SET @sql = 'insert INTO #Tb_frame SELECT * FROM openrowset(''sqloledb'',''Trusted_Connection=yes'',''exec [Hydrology_pygq].[dbo].[proc_get_time_frame] @getdate="' + @param + '"'')';
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
/****** Object:  Table [dbo].[ST_RSVRSTRL_B]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RSVRSTRL_B](
	[STCD] [char](8) NOT NULL,
	[RLSTCD] [char](8) NOT NULL,
	[IOMRK] [char](1) NOT NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[RLSTCD] ASC,
	[IOMRK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RSVRMYAV_S]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RSVRMYAV_S](
	[STCD] [char](8) NOT NULL,
	[MNTH] [numeric](2, 0) NOT NULL,
	[DAY] [numeric](2, 0) NOT NULL,
	[MYDAVW] [numeric](9, 3) NULL,
	[BGYR] [numeric](4, 0) NULL,
	[EDYR] [numeric](4, 0) NULL,
	[STTYRNUM] [numeric](4, 0) NULL,
	[COMMENTS] [varchar](200) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[MNTH] ASC,
	[DAY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RSVRFSR_B]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RSVRFSR_B](
	[STCD] [char](8) NOT NULL,
	[BGMD] [char](4) NOT NULL,
	[EDMD] [char](4) NOT NULL,
	[FSLTDZ] [numeric](7, 3) NULL,
	[FSLTDW] [numeric](9, 3) NULL,
	[FSTP] [char](1) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[BGMD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RSVRFCCH_B]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RSVRFCCH_B](
	[STCD] [char](8) NOT NULL,
	[RSVRTP] [char](1) NULL,
	[DAMEL] [numeric](7, 3) NULL,
	[CKFLZ] [numeric](7, 3) NULL,
	[DSFLZ] [numeric](7, 3) NULL,
	[NORMZ] [numeric](7, 3) NULL,
	[DDZ] [numeric](7, 3) NULL,
	[ACTZ] [numeric](7, 3) NULL,
	[TTCP] [numeric](9, 3) NULL,
	[FLDCP] [numeric](9, 3) NULL,
	[ACTCP] [numeric](9, 3) NULL,
	[DDCP] [numeric](9, 3) NULL,
	[HHRZ] [numeric](7, 3) NULL,
	[HMXW] [numeric](9, 3) NULL,
	[HHRZTM] [datetime] NULL,
	[HMXINQ] [numeric](9, 3) NULL,
	[RSTDR] [numeric](5, 2) NULL,
	[HMXINQTM] [datetime] NULL,
	[HMXOTQ] [numeric](9, 3) NULL,
	[HMXOTQTM] [datetime] NULL,
	[HLRZ] [numeric](7, 3) NULL,
	[HLRZTM] [datetime] NULL,
	[HMNINQ] [numeric](9, 3) NULL,
	[HMNINQTM] [datetime] NULL,
	[LAZ] [numeric](7, 3) NULL,
	[SFQ] [numeric](9, 3) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RSVREVS_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RSVREVS_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[HTRZ] [numeric](7, 3) NULL,
	[LTRZ] [numeric](7, 3) NULL,
	[MXINQ] [numeric](9, 3) NULL,
	[MNINQ] [numeric](9, 3) NULL,
	[MXOTQ] [numeric](9, 3) NULL,
	[MNOTQ] [numeric](9, 3) NULL,
	[MXW] [numeric](9, 3) NULL,
	[MNW] [numeric](9, 3) NULL,
	[HTRZTM] [datetime] NULL,
	[LTRZTM] [datetime] NULL,
	[MXINQTM] [datetime] NULL,
	[MNINQTM] [datetime] NULL,
	[MXOTQTM] [datetime] NULL,
	[MNOTQTM] [datetime] NULL,
	[MXWTM] [datetime] NULL,
	[MNWTM] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RSVRAV_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RSVRAV_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[AVRZ] [numeric](7, 3) NULL,
	[AVINQ] [numeric](9, 3) NULL,
	[AVOTQ] [numeric](9, 3) NULL,
	[AVW] [numeric](9, 3) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_PMEVS_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_PMEVS_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[PPUPHTZ] [numeric](7, 3) NULL,
	[PPUPLTZ] [numeric](7, 3) NULL,
	[PPDWHTZ] [numeric](7, 3) NULL,
	[PPDWLTZ] [numeric](7, 3) NULL,
	[MXPPQ] [numeric](9, 3) NULL,
	[MNPPQ] [numeric](9, 3) NULL,
	[MXDNQ] [numeric](9, 3) NULL,
	[MNDNQ] [numeric](9, 3) NULL,
	[PPUPHTZTM] [datetime] NULL,
	[PPUPLTZTM] [datetime] NULL,
	[PPDWHTZTM] [datetime] NULL,
	[PPDWLTZTM] [datetime] NULL,
	[MXPPQTM] [datetime] NULL,
	[MNPPQTM] [datetime] NULL,
	[MXDNQTM] [datetime] NULL,
	[MNDNQTM] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_PDMMYSQ_S]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_PDMMYSQ_S](
	[STCD] [char](8) NOT NULL,
	[YR] [numeric](4, 0) NOT NULL,
	[MNTH] [numeric](2, 0) NOT NULL,
	[PRDTP] [numeric](1, 0) NOT NULL,
	[ACCP] [numeric](5, 1) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YR] ASC,
	[MNTH] ASC,
	[PRDTP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_PDMMYAV_S]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_PDMMYAV_S](
	[STCD] [char](8) NOT NULL,
	[MNTH] [numeric](2, 0) NOT NULL,
	[PRDTP] [numeric](1, 0) NOT NULL,
	[MYMAVP] [numeric](5, 1) NULL,
	[BGYR] [numeric](4, 0) NULL,
	[EDYR] [numeric](4, 0) NULL,
	[STTYRNUM] [numeric](4, 0) NULL,
	[COMMENTS] [varchar](200) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[MNTH] ASC,
	[PRDTP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_PDDMYAV_S]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_PDDMYAV_S](
	[STCD] [char](8) NOT NULL,
	[MNTH] [numeric](2, 0) NOT NULL,
	[DAY] [numeric](2, 0) NOT NULL,
	[MYDAVP] [numeric](5, 1) NULL,
	[BGYR] [numeric](4, 0) NULL,
	[EDYR] [numeric](4, 0) NULL,
	[STTYRNUM] [numeric](4, 0) NULL,
	[COMMENTS] [varchar](200) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[MNTH] ASC,
	[DAY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_NETSTAT_E]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_NETSTAT_E](
	[INSTCD] [varchar](10) NOT NULL,
	[CHANGETIME] [datetime] NOT NULL,
	[NETTYPE] [varchar](1) NULL,
	[NETSTATUS] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[INSTCD] ASC,
	[CHANGETIME] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_IRRIGATED_AREA]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ST_IRRIGATED_AREA](
	[GID] [int] NOT NULL,
	[GPID] [int] NOT NULL,
	[NAME] [nvarchar](50) NOT NULL,
	[REMARK] [nchar](10) NOT NULL,
	[CREATE_TIME] [date] NOT NULL,
	[UPDATE_TIME] [date] NOT NULL,
 CONSTRAINT [PK_ST_IRRIGATED_AREA] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ST_INSTCD_E]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_INSTCD_E](
	[INSTCD] [varchar](10) NOT NULL,
	[INSTNM] [varchar](40) NOT NULL,
	[EXCTYPE] [varchar](1) NOT NULL,
	[EXCIP] [varchar](39) NOT NULL,
	[EXCPORT] [numeric](5, 0) NOT NULL,
	[EXCSRV] [varchar](32) NOT NULL,
	[WEBURL] [varchar](50) NULL,
	[PASSWORD] [varchar](32) NULL,
	[TRFL] [char](4) NULL,
	[ISSTARTS] [varchar](1) NOT NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[INSTCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_INSTCD_B]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_INSTCD_B](
	[INSTCD] [char](10) NOT NULL,
	[INSTNM] [char](60) NULL,
	[LOCALITY] [char](10) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[INSTCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_ICEFR_F]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_ICEFR_F](
	[STCD] [char](8) NOT NULL,
	[UNITNAME] [char](30) NOT NULL,
	[PLCD] [char](20) NOT NULL,
	[FYMDH] [datetime] NOT NULL,
	[IYMDH] [datetime] NOT NULL,
	[YMDH] [datetime] NOT NULL,
	[EXKEY] [char](1) NOT NULL,
	[FICD] [char](2) NULL,
	[FIRPSTN] [char](1) NULL,
	[FRLDSTN] [numeric](3, 1) NULL,
	[FITHK] [numeric](4, 1) NULL,
	[ITHKCD] [char](1) NULL,
	[FIQ] [numeric](9, 3) NULL,
	[IQPROP] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[UNITNAME] ASC,
	[PLCD] ASC,
	[FYMDH] ASC,
	[IYMDH] ASC,
	[YMDH] ASC,
	[EXKEY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_HAIL_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_HAIL_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[HPD] [numeric](3, 0) NULL,
	[HLDR] [numeric](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_GRWEVS_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_GRWEVS_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[MXBD] [numeric](7, 3) NULL,
	[MNBD] [numeric](7, 3) NULL,
	[MXSPQ] [numeric](9, 3) NULL,
	[MNSPQ] [numeric](9, 3) NULL,
	[MXGWTMP] [numeric](4, 2) NULL,
	[MNGWTMP] [numeric](4, 2) NULL,
	[MXBDTM] [datetime] NULL,
	[MNBDTM] [datetime] NULL,
	[MXSPQTM] [datetime] NULL,
	[MNSPQTM] [datetime] NULL,
	[MXGWTMPTM] [datetime] NULL,
	[MNGWTMPTM] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_GRWAV_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_GRWAV_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[AVGWBD] [numeric](7, 3) NULL,
	[AVSPQ] [numeric](7, 3) NULL,
	[AVGWTMP] [numeric](3, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_GRW_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_GRW_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[GWBD] [numeric](6, 2) NULL,
	[GWBDRMK] [char](1) NULL,
	[SPQ] [numeric](9, 3) NULL,
	[GWTMP] [numeric](4, 1) NULL,
	[GWPTN] [char](1) NULL,
	[SPQMMT] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[proc_get_time_with_zero]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_get_time_with_zero]
	@getdate DATETIME ,
	@idtm INT,
	@out_st VARCHAR(100) OUTPUT,
	@out_et VARCHAR(100) OUTPUT
AS
BEGIN
	--DECLARE @w NUMERIC(9, 3)
	--EXECUTE [dbo].[proc_get_water_storage] 'Gadfly14',22,@w OUTPUT
	--SELECT @w as W
	DECLARE @st DATETIME; 
	DECLARE @et DATETIME;

  SET @getdate = CONVERT(varchar(100), ISNULL(@getdate, GETDATE()), 20);
	--保存当前截至时间
	SET @et = convert(varchar(10),@getdate,120)+' 23:59:59.000'
	--YEAR(date)
	IF (@idtm = 6)
		BEGIN
			SET @getdate =DATEADD(YEAR, -1, @getdate)
			SET @st = convert(varchar(10),@getdate,120)+' 00:00:00.000'
		END
	--[MONTH](date)
	ELSE IF (@idtm = 5)
		BEGIN
			SET @getdate =DATEADD(MONTH, -1, @getdate)
			SET @st = convert(varchar(10),@getdate,120)+' 00:00:00.000'
		END
	--[MONTH/3](date)
	ELSE IF (@idtm = 4)
		BEGIN
			SET @getdate =DATEADD(DAY, -15, @getdate)
			SET @st = convert(varchar(10),@getdate,120)+' 00:00:00.000'
		END
	--[MONTH*3](date)
	ELSE IF (@idtm = 3)
		BEGIN
			SET @getdate =DATEADD(MONTH, -3, @getdate)
			SET @st = convert(varchar(10),@getdate,120)+' 00:00:00.000'
		END
	--[DAY*3](date)
	ELSE IF (@idtm = 2)
		BEGIN
			SET @getdate =DATEADD(DAY, -3, @getdate)
			SET @st = convert(varchar(10),@getdate,120)+' 00:00:00.000'
		END
	--[DAY](date)
	ELSE 
		BEGIN
			SET @st = convert(varchar(10),@getdate,120)+' 00:00:00.000'
		END
	SET @out_st =convert(varchar(100),@st,120)
  SET @out_et =convert(varchar(100),@et,120)
	--SELECT @getdate ,@idtm,@st ,@et,@condition
END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_time_frame]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_get_time_frame]
		@getdate datetime = NULL,
		@frame INT = 0
		
AS
	BEGIN
		SET NOCOUNT ON;
		DECLARE @day int, 				-- 当前天数
		@year VARCHAR(4), 				-- 当前年份数
		@month VARCHAR(2), 				-- 当前月份数
		@today datetime, 					-- 今天的时间截
		@day_last DATETIME,				-- 统计时段的开始时间截
		@param VARCHAR(200),			-- 时间类型参数转字符串
		@sql NVARCHAR(1000),			-- 动态生成SQL字符串
		@tomorrow datetime; 			-- 明天的时间截
		
		IF OBJECT_ID('#Tb_datetime') IS NOT NULL
			DROP TABLE #Tb_datetime
		CREATE TABLE #Tb_datetime(
			today DATETIME,
			yestday DATETIME,
			tomorrow DATETIME,
			year INT,
			month INT,
			day INT,
			hour INT,
			minute INT,
			second INT,
			month_lastday INT
		)
		SET @param = CONVERT(varchar(100), ISNULL(@getdate, GETDATE()), 20);
		SET @sql = 'INSERT INTO #Tb_datetime SELECT * FROM openrowset(''sqloledb'',''Trusted_Connection=yes'',''exec [Hydrology_pygq].[dbo].[proc_get_datetime] @getdate="' + @param + '"'')';
		
		EXECUTE sp_executesql @sql;
		SELECT @today = today, @tomorrow = tomorrow, @year = year, @month = month, @day = day FROM #Tb_datetime;
		IF(@frame = 0 OR @frame = 4)
			BEGIN
				IF(@day <= 10)	--上旬
					BEGIN
						SET @day_last = CONVERT(datetime, @year + '-' + @month + '-01 08:00:00');
					END
				ELSE IF(@day > 10 AND @day <= 20)		--中旬
					BEGIN
						SET @day_last = CONVERT(datetime, @year + '-' + @month + '-11 08:00:00');
					END
				ELSE	--下旬
					BEGIN
						SET @day_last = CONVERT(datetime, @year + '-' + @month + '-21 08:00:00');
					END
			END
		IF (@frame = 0)
			BEGIN
				SELECT 1 AS 'frame', @today AS 'begin', dateadd(second, -1, @tomorrow) AS 'end', '一天' AS 'lable'
				UNION ALL
				SELECT 2 AS 'frame', CONVERT(datetime, CONVERT(varchar(100), @today-3, 23) + ' 08:00:00') AS 'begin', dateadd(second, -1, @tomorrow) AS 'end', '三天' AS 'lable'
				UNION ALL
				SELECT 3 AS 'frame', CONVERT(datetime, CONVERT(varchar(100), @today-5, 23) + ' 08:00:00') AS 'begin', dateadd(second, -1, @tomorrow) AS 'end', '一侯' AS 'lable'
				UNION ALL
				SELECT 4 AS 'frame', @day_last AS 'begin', dateadd(second, -1, @tomorrow) AS 'end', '一旬' AS 'lable'
				UNION ALL
				SELECT 5 AS 'frame', CONVERT(datetime, @year + '-' + @month + '-01 08:00:00') AS 'begin', dateadd(second, -1, @tomorrow) AS 'end', '一月' AS 'lable'
				UNION ALL
				SELECT 6 AS 'frame', CONVERT(datetime, @year + '-01-01 08:00:00') AS 'begin', dateadd(second, -1, @tomorrow) AS 'end', '一年' AS 'lable'
			END
		ELSE IF (@frame = 1)
			BEGIN
				SELECT @today AS 'begin', @tomorrow AS 'end', '一天' AS 'lable'
			END
		ELSE IF (@frame = 2)
			BEGIN
				SELECT CONVERT(datetime, CONVERT(varchar(100), @today-3, 23) + ' 08:00:00') AS 'begin', dateadd(second, -1, @tomorrow) AS 'end', '三天' AS 'lable'
			END
		ELSE IF (@frame = 3)
			BEGIN
				SELECT CONVERT(datetime, CONVERT(varchar(100), @today-5, 23) + ' 08:00:00') AS 'begin', dateadd(second, -1, @tomorrow) AS 'end', '一侯' AS 'lable'
			END
		ELSE IF (@frame = 4)
			BEGIN
				SELECT @day_last AS 'begin', dateadd(second, -1, @tomorrow) AS 'end', '一旬' AS 'lable'
			END
		ELSE IF (@frame = 5)
			BEGIN
				SELECT CONVERT(datetime, @year + '-' + @month + '-01 08:00:00') AS 'begin', dateadd(second, -1, @tomorrow) AS 'end', '一月' AS 'lable'
			END
		ELSE IF (@frame = 6)
			BEGIN
				SELECT CONVERT(datetime, @year + '-01-01 08:00:00') AS 'begin', dateadd(second, -1, @tomorrow) AS 'end', '一年' AS 'lable'
			END
	END
GO
/****** Object:  StoredProcedure [dbo].[proc_get_datetime]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_get_datetime] 
	@getdate DATETIME = NULL
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @today DATETIME;		-- 给定时间的当天的时间截
	DECLARE @yestday DATETIME;				-- 给定时间的昨天的时间截
	DECLARE @tomorrow DATETIME; 			-- 给定时间的明天的时间截
	DECLARE @hour INT; 								-- 给定时间的小时数
	DECLARE @minute INT;							-- 给定时间的分钟数
	DECLARE @second INT;							-- 给定时间的秒数
	DECLARE @year INT; 								-- 给定时间的年份数
	DECLARE @month INT; 							-- 给定时间的月份数
	DECLARE @day INT; 								-- 给定时间的天数
	DECLARE @lastday VARCHAR(20);			-- 给定时间当月的最后一天天数
	SET @getdate = ISNULL(@getdate, GETDATE())
	SET @hour = DATENAME(hour, @getdate);
	SET @minute = DATENAME(minute, @getdate);
	SET @second = DATENAME(second, @getdate);
  IF(@hour > 8)
		BEGIN
			SET @yestday = CONVERT(varchar(100), @getdate-1, 23) + ' 08:00:00';
			SET @today = CONVERT(varchar(100), @getdate, 23) + ' 08:00:00';
			SET @tomorrow = CONVERT(varchar(100), @getdate+1, 23) + ' 08:00:00';
		END
	ELSE
		BEGIN
			SET @yestday = CONVERT(varchar(100), @getdate-2, 23) + ' 08:00:00';
			SET @today = CONVERT(varchar(100), @getdate-1, 23) + ' 08:00:00';
			SET @tomorrow = CONVERT(varchar(100), @getdate, 23) + ' 08:00:00';
		END
	SET @year = DATENAME(year, @today);
	SET @month = DATENAME(month, @today);
	SET @day = DATENAME(day, @today);
	SELECT @lastday = convert(VARCHAR(20), dateadd(d, -1, dateadd(m, 1, rtrim(@year) + '-' + rtrim(@month) + '-01')), 111);
	SELECT @today AS today, 
		@yestday AS yestday,
		@tomorrow AS tomorrow,
		@year AS year,
		@month AS month,
		@day AS day,
		@hour AS hour,
		@minute AS minute,
		@second AS second,
		DATENAME(day, @lastday) AS 'month_lastday'
END
GO
/****** Object:  Table [dbo].[ST_FSDR_B]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_FSDR_B](
	[UPSTCD] [char](8) NOT NULL,
	[DWSTCD] [char](8) NOT NULL,
	[RCHLEN] [numeric](3, 0) NULL,
	[SFTQ] [numeric](9, 3) NULL,
	[QMGN] [numeric](5, 0) NOT NULL,
	[MNTRTM] [numeric](5, 2) NULL,
	[MXTRTM] [numeric](5, 2) NULL,
	[AVTRTM] [numeric](5, 2) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UPSTCD] ASC,
	[DWSTCD] ASC,
	[QMGN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_FRAPAR_B]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_FRAPAR_B](
	[STCD] [char](8) NOT NULL,
	[TPCYR] [numeric](4, 0) NOT NULL,
	[VARTP] [char](3) NOT NULL,
	[AVRG] [numeric](11, 4) NOT NULL,
	[CV] [numeric](5, 3) NOT NULL,
	[CS] [numeric](5, 3) NOT NULL,
	[BGYR] [numeric](4, 0) NOT NULL,
	[EDYR] [numeric](4, 0) NOT NULL,
	[SPNUM] [numeric](4, 0) NOT NULL,
	[COMMENTS] [varchar](200) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TPCYR] ASC,
	[VARTP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_FORECASTC_F]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_FORECASTC_F](
	[STCD] [char](8) NOT NULL,
	[UNITNAME] [char](30) NOT NULL,
	[PLCD] [char](20) NOT NULL,
	[FYMDH] [datetime] NOT NULL,
	[IYMDH] [datetime] NOT NULL,
	[WNSTATUS] [char](1) NULL,
	[COMMENTS] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[UNITNAME] ASC,
	[PLCD] ASC,
	[FYMDH] ASC,
	[IYMDH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_FORECAST_F]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_FORECAST_F](
	[STCD] [char](8) NOT NULL,
	[UNITNAME] [char](30) NOT NULL,
	[PLCD] [char](20) NOT NULL,
	[FYMDH] [datetime] NOT NULL,
	[IYMDH] [datetime] NOT NULL,
	[YMDH] [datetime] NOT NULL,
	[Z] [numeric](7, 3) NULL,
	[Q] [numeric](9, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[UNITNAME] ASC,
	[PLCD] ASC,
	[FYMDH] ASC,
	[IYMDH] ASC,
	[YMDH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_FIELD_D]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_FIELD_D](
	[TABID] [char](20) NOT NULL,
	[FLID] [char](20) NOT NULL,
	[FLSID] [numeric](2, 0) NOT NULL,
	[FLCN] [varchar](40) NOT NULL,
	[FLEN] [varchar](200) NULL,
	[FLTL] [varchar](20) NULL,
	[NLAT] [char](1) NULL,
	[UNNM] [varchar](30) NULL,
	[FCHSC] [char](20) NULL,
	[EUFL] [char](1) NULL,
	[PKAT] [char](1) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TABID] ASC,
	[FLID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_FFRAR_B]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_FFRAR_B](
	[STCD] [char](8) NOT NULL,
	[TPCYR] [numeric](4, 0) NOT NULL,
	[RCINT] [numeric](5, 0) NOT NULL,
	[Q] [numeric](9, 3) NULL,
	[Z] [numeric](7, 3) NULL,
	[W1] [numeric](11, 4) NULL,
	[W3] [numeric](11, 4) NULL,
	[W5] [numeric](11, 4) NULL,
	[W7] [numeric](11, 4) NULL,
	[W10] [numeric](11, 4) NULL,
	[W15] [numeric](11, 4) NULL,
	[W30] [numeric](11, 4) NULL,
	[W60] [numeric](11, 4) NULL,
	[COMMENTS] [varchar](200) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TPCYR] ASC,
	[RCINT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_EUNTLANG_D]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_EUNTLANG_D](
	[FLID] [varchar](20) NOT NULL,
	[EUCD] [varchar](10) NOT NULL,
	[NTLANG] [varchar](200) NOT NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FLID] ASC,
	[EUCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_ESTAT_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_ESTAT_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[ACCE] [numeric](6, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_ENNMCD_D]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_ENNMCD_D](
	[ENNMCD] [char](12) NOT NULL,
	[BSNM] [varchar](30) NOT NULL,
	[COMMENTS] [varchar](200) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ENNMCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_DAYEV_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_DAYEV_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[EPTP] [char](1) NULL,
	[DYE] [numeric](5, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_WASRL_B]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_WASRL_B](
	[STCD] [char](8) NOT NULL,
	[RLSTCD] [char](8) NOT NULL,
	[RLMRK] [char](1) NOT NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[RLSTCD] ASC,
	[RLMRK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_WASEVS_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_WASEVS_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[HTUPZ] [numeric](7, 3) NULL,
	[LTUPZ] [numeric](7, 3) NULL,
	[MXGTQ] [numeric](9, 3) NULL,
	[MNGTQ] [numeric](9, 3) NULL,
	[HTDWZ] [numeric](7, 3) NULL,
	[LTDWZ] [numeric](7, 3) NULL,
	[HTUPZTM] [datetime] NULL,
	[LTUPZTM] [datetime] NULL,
	[MXGTQTM] [datetime] NULL,
	[MNGTQTM] [datetime] NULL,
	[HTDWZTM] [datetime] NULL,
	[LTDWZTM] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_WASAV_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_WASAV_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[AVUPZ] [numeric](7, 3) NULL,
	[AVDWZ] [numeric](7, 3) NULL,
	[AVGTQ] [numeric](9, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_WAS_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_WAS_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[UPZ] [numeric](7, 3) NULL,
	[DWZ] [numeric](7, 3) NULL,
	[TGTQ] [numeric](9, 3) NULL,
	[SWCHRCD] [char](1) NULL,
	[SUPWPTN] [char](1) NULL,
	[SDWWPTN] [char](1) NULL,
	[MSQMT] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_TMPEVS_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_TMPEVS_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[MXATMP] [numeric](3, 1) NULL,
	[MNATMP] [numeric](3, 1) NULL,
	[MXWTMP] [numeric](3, 1) NULL,
	[MNWTMP] [numeric](3, 1) NULL,
	[MXATMPTM] [datetime] NULL,
	[MNATMPTM] [datetime] NULL,
	[MXWTMPTM] [datetime] NULL,
	[MNWTMPTM] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_TMPAV_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_TMPAV_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[AVATMP] [numeric](3, 1) NULL,
	[AVWTMP] [numeric](3, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_TMP_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_TMP_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[ATMP] [numeric](3, 1) NULL,
	[WTMP] [numeric](3, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_TIDEEVS_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_TIDEEVS_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[HTTDZ] [numeric](7, 3) NULL,
	[LTTDZ] [numeric](7, 3) NULL,
	[MXWNDV] [numeric](4, 1) NULL,
	[HTTDZTM] [datetime] NULL,
	[LTTDZTM] [datetime] NULL,
	[MXWNDVTM] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_TIDEAV_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_TIDEAV_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[AVHTDZ] [numeric](7, 3) NULL,
	[AVLTDZ] [numeric](7, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_TIDE_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_TIDE_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[TDZ] [numeric](7, 3) NULL,
	[AIRP] [numeric](5, 0) NULL,
	[TDCHRCD] [char](1) NULL,
	[TDPTN] [char](1) NULL,
	[HLTDMK] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_TDFR_F]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_TDFR_F](
	[STCD] [char](8) NOT NULL,
	[UNITNAME] [char](30) NOT NULL,
	[PLCD] [char](20) NOT NULL,
	[FYMDH] [datetime] NOT NULL,
	[IYMDH] [datetime] NOT NULL,
	[YMDH] [datetime] NOT NULL,
	[TDZ] [numeric](7, 3) NULL,
	[STRMSRG] [numeric](7, 3) NULL,
	[HLTDMK] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[UNITNAME] ASC,
	[PLCD] ASC,
	[FYMDH] ASC,
	[IYMDH] ASC,
	[YMDH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_TASKLIST_D]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_TASKLIST_D](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RELATED] [char](30) NOT NULL,
	[PK] [int] NOT NULL,
	[STCD] [char](8) NOT NULL,
	[STNM] [char](30) NOT NULL,
	[STTP] [char](2) NOT NULL,
	[TKTP] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[STLC] [varchar](50) NULL,
 CONSTRAINT [PK_ST_TASKLIST_D] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测站关联数据表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_TASKLIST_D', @level2type=N'COLUMN',@level2name=N'RELATED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联数据表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_TASKLIST_D', @level2type=N'COLUMN',@level2name=N'PK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测站代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_TASKLIST_D', @level2type=N'COLUMN',@level2name=N'STCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测站名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_TASKLIST_D', @level2type=N'COLUMN',@level2name=N'STNM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测站类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_TASKLIST_D', @level2type=N'COLUMN',@level2name=N'STTP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据报送类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_TASKLIST_D', @level2type=N'COLUMN',@level2name=N'TKTP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_TASKLIST_D', @level2type=N'COLUMN',@level2name=N'TM'
GO
/****** Object:  Table [dbo].[ST_TABLE_E]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_TABLE_E](
	[INSTCD] [varchar](10) NOT NULL,
	[TABID] [varchar](20) NOT NULL,
	[ISSTARTS] [varchar](1) NOT NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[INSTCD] ASC,
	[TABID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_TABLE_D]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_TABLE_D](
	[TABID] [char](20) NOT NULL,
	[TABNO] [char](11) NOT NULL,
	[TABCN] [varchar](30) NOT NULL,
	[TABEN] [varchar](200) NULL,
	[EXCHFL] [char](1) NOT NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TABID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_SYSLOG_E]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SYSLOG_E](
	[LOGLSH] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[LOGTYPE] [varchar](1) NOT NULL,
	[LOGCONTENT] [varchar](512) NOT NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LOGLSH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_SYNCSET_E]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SYNCSET_E](
	[SYSNAME] [varchar](32) NOT NULL,
	[SYSVALUE] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SYSNAME] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_SWSINF_B]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SWSINF_B](
	[STCD] [char](8) NOT NULL,
	[STNM] [char](30) NOT NULL,
	[STCT] [char](1) NOT NULL,
	[WATP] [char](1) NOT NULL,
	[BSNM] [char](30) NULL,
	[HNNM] [char](30) NULL,
	[RVNM] [char](30) NULL,
	[LGTD] [numeric](12, 9) NULL,
	[LTTD] [numeric](12, 9) NULL,
	[WRRCD] [char](7) NULL,
	[ADAG] [char](40) NULL,
	[MNAG] [char](40) NULL,
	[ASRL] [numeric](5, 1) NULL,
	[ASAR] [numeric](9, 2) NULL,
	[ASRC] [numeric](10, 3) NULL,
	[DSTRVM] [numeric](6, 1) NULL,
	[WSFL] [char](1) NULL,
 CONSTRAINT [PK_ST_SWSINF_B] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测站代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'STCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测站名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'STNM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测站类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'STCT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'水域类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'WATP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流域名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'BSNM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'水系名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'HNNM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'河流名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'RVNM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'LGTD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'纬度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'LTTD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'水资源分区代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'WRRCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'ADAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监测单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'MNAG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代表河长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'ASRL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代表面积' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'ASAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代表库容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'ASRC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'距河口距离' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'DSTRVM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'水源地站标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B', @level2type=N'COLUMN',@level2name=N'WSFL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地表水水质监测站信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_SWSINF_B'
GO
/****** Object:  Table [dbo].[ST_STSMTASK_B]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_STSMTASK_B](
	[STCD] [char](8) NOT NULL,
	[DFRTMS] [numeric](2, 0) NULL,
	[PFL] [char](1) NULL,
	[EFL] [char](1) NULL,
	[ZFL] [char](1) NULL,
	[QFL] [char](1) NULL,
	[WFL] [char](1) NULL,
	[INQFL] [char](1) NULL,
	[DAMFL] [char](1) NULL,
	[OTQFL] [char](1) NULL,
	[WDWVFL] [char](1) NULL,
	[SEDFL] [char](1) NULL,
	[ICEFL] [char](1) NULL,
	[PPFL] [char](1) NULL,
	[DRNFL] [char](1) NULL,
	[SOILFL] [char](1) NULL,
	[GRWFL] [char](1) NULL,
	[STATFL] [char](1) NULL,
	[OFFICER] [char](12) NOT NULL,
	[MPHONE] [char](11) NOT NULL,
	[SPHONE] [char](12) NOT NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_STSMCNT_E]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_STSMCNT_E](
	[INSTCD] [varchar](10) NOT NULL,
	[STCD] [varchar](8) NOT NULL,
	[COUNTDAY] [datetime] NOT NULL,
	[INFSTATUS] [varchar](1) NOT NULL,
	[INFTYPE] [varchar](1) NOT NULL,
	[FRGRD] [varchar](1) NOT NULL,
	[ICNT] [numeric](9, 0) NOT NULL,
	[UCNT] [numeric](9, 0) NOT NULL,
	[DCNT] [numeric](9, 0) NOT NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[INSTCD] ASC,
	[STCD] ASC,
	[COUNTDAY] ASC,
	[INFSTATUS] ASC,
	[INFTYPE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_STORM_R]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_STORM_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[STRMDR] [numeric](5, 2) NULL,
	[STRMP] [numeric](4, 1) NULL,
	[WTH] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_STCD_E]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_STCD_E](
	[INSTCD] [varchar](10) NOT NULL,
	[STCD] [varchar](8) NOT NULL,
	[SCFL] [char](4) NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[INSTCD] ASC,
	[STCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RIVER_R]    Script Date: 01/19/2017 16:51:32 ******/
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
	[MSQMT] [char](6) NULL,
	[MSAMT] [char](6) NULL,
	[MSVMT] [char](6) NULL,
	[TKTP] [char](10) NULL,
 CONSTRAINT [PK_ST_RIVER_R] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_STBPRP_B]    Script Date: 01/19/2017 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_STBPRP_B](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[STCD] [char](8) NOT NULL,
	[STNM] [char](30) NULL,
	[RVNM] [char](30) NULL,
	[HNNM] [char](30) NOT NULL,
	[BSNM] [char](30) NULL,
	[LGTD] [numeric](10, 6) NULL,
	[LTTD] [numeric](10, 6) NULL,
	[STLC] [char](50) NULL,
	[ADDVCD] [char](6) NULL,
	[DTMNM] [char](16) NULL,
	[DTMEL] [numeric](7, 3) NULL,
	[DTPR] [numeric](7, 3) NULL,
	[STTP] [char](2) NULL,
	[FRGRD] [char](1) NULL,
	[ESSTYM] [char](6) NULL,
	[BGFRYM] [char](6) NULL,
	[ATCUNIT] [char](20) NULL,
	[ADMAUTH] [char](20) NULL,
	[LOCALITY] [char](10) NOT NULL,
	[STBK] [char](1) NULL,
	[STAZT] [numeric](3, 0) NULL,
	[DSTRVM] [numeric](6, 1) NULL,
	[DRNA] [numeric](7, 0) NULL,
	[PHCD] [char](6) NULL,
	[USFL] [char](1) NULL,
	[COMMENTS] [varchar](200) NULL,
	[MODITIME] [datetime] NULL,
 CONSTRAINT [PK__ST_STBPR__A60B2CDF7F60ED59] PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ST_MONITOR_LL_VIEW]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ST_MONITOR_LL_VIEW] AS 
SELECT
dbo.ST_STBPRP_B.STCD,
dbo.ST_STBPRP_B.STNM,
dbo.ST_RIVER_R.TM,
dbo.ST_RIVER_R.Z,
dbo.ST_RIVER_R.Q

FROM
dbo.ST_STBPRP_B ,
dbo.ST_RIVER_R
WHERE
dbo.ST_STBPRP_B.STTP = 'ZZ' OR
dbo.ST_STBPRP_B.STTP = 'ZQ' AND
dbo.ST_STBPRP_B.STCD = dbo.ST_RIVER_R.STCD
GO
/****** Object:  Table [dbo].[ST_SOILCH_B]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SOILCH_B](
	[STCD] [char](8) NOT NULL,
	[SLTP] [char](1) NULL,
	[SLTX] [char](2) NULL,
	[SFBR] [char](20) NULL,
	[SSPG] [numeric](4, 2) NULL,
	[DSD] [numeric](4, 2) NULL,
	[SPOR] [numeric](4, 2) NULL,
	[SHWC] [numeric](4, 2) NULL,
	[FDCP] [numeric](4, 2) NULL,
	[WLCP] [numeric](4, 2) NULL,
	[COMMENTS] [varchar](200) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_REGLAT_F]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_REGLAT_F](
	[STCD] [char](8) NOT NULL,
	[UNITNAME] [char](30) NOT NULL,
	[PLCD] [char](20) NOT NULL,
	[FYMDH] [datetime] NOT NULL,
	[IYMDH] [datetime] NOT NULL,
	[YMDH] [datetime] NOT NULL,
	[Z] [numeric](7, 3) NULL,
	[W] [numeric](9, 3) NULL,
	[OTQ] [numeric](9, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[UNITNAME] ASC,
	[PLCD] ASC,
	[FYMDH] ASC,
	[IYMDH] ASC,
	[YMDH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RECVSTAT_E]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RECVSTAT_E](
	[INSTCD] [varchar](10) NOT NULL,
	[COUNTDAY] [datetime] NOT NULL,
	[STTDRCD] [varchar](1) NOT NULL,
	[FRGRD] [varchar](1) NOT NULL,
	[OPERATION] [varchar](1) NOT NULL,
	[INFTYPE] [varchar](1) NOT NULL,
	[STCDNUM] [numeric](6, 0) NULL,
	[INFNUM] [numeric](9, 0) NULL,
	[COUNTL30] [numeric](9, 0) NULL,
	[COUNTB60] [numeric](9, 0) NULL,
	[COUNTT60] [numeric](9, 0) NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[INSTCD] ASC,
	[COUNTDAY] ASC,
	[STTDRCD] ASC,
	[FRGRD] ASC,
	[OPERATION] ASC,
	[INFTYPE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RECVINF_E]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RECVINF_E](
	[RLSH] [numeric](18, 0) NOT NULL,
	[RFNUM] [numeric](18, 0) NOT NULL,
	[INSTCD] [varchar](10) NOT NULL,
	[SLSH] [numeric](18, 0) NOT NULL,
	[STCD] [varchar](8) NOT NULL,
	[TABID] [varchar](30) NOT NULL,
	[TM] [datetime] NOT NULL,
	[EXCKEY] [varchar](200) NOT NULL,
	[OPERATION] [varchar](1) NOT NULL,
	[EXCINF] [varchar](4000) NOT NULL,
	[INSTOSTATUS] [varchar](1) NOT NULL,
	[INSTOTM] [datetime] NULL,
	[ERRINF] [varchar](4000) NULL,
	[MANUALTM] [datetime] NULL,
	[STAT] [varchar](1) NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RLSH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RECVFILE_E]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_RECVFILE_E](
	[RFNUM] [numeric](18, 0) NOT NULL,
	[INSTCD] [varchar](10) NOT NULL,
	[RECVTYPE] [varchar](1) NOT NULL,
	[RECVSTATUS] [varchar](1) NOT NULL,
	[RFILENAME] [varchar](200) NOT NULL,
	[RECVTM] [datetime] NOT NULL,
	[MODITIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RFNUM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_QTICEINF_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_QTICEINF_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[EXKEY] [char](1) NOT NULL,
	[QNTICD] [char](1) NULL,
	[RLPSTN] [char](4) NULL,
	[RLDSTN] [numeric](3, 1) NULL,
	[LBDIWD] [numeric](1, 0) NULL,
	[RBDIWD] [numeric](1, 0) NULL,
	[BDITHK] [numeric](4, 1) NULL,
	[IRCON] [numeric](1, 0) NULL,
	[DITHK] [numeric](4, 1) NULL,
	[MXIA] [numeric](4, 0) NULL,
	[MXIV] [numeric](3, 1) NULL,
	[IQ] [numeric](9, 3) NULL,
	[FRZPROP] [char](1) NULL,
	[BRKPROP] [char](1) NULL,
	[DIPCK] [numeric](1, 0) NULL,
	[IDAMGRW] [char](1) NULL,
	[IDAMHGT] [numeric](3, 1) NULL,
	[IDAMWD] [numeric](7, 3) NULL,
	[IDAMUPZ] [numeric](7, 3) NULL,
	[IDAMUPWPTN] [char](1) NULL,
	[ELTY] [char](1) NULL,
	[IQPROP] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC,
	[EXKEY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_QLICEINF_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_QLICEINF_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[EXKEY] [char](1) NOT NULL,
	[QLTICD] [char](2) NULL,
	[RLPSTN] [char](4) NULL,
	[RLDSTN] [numeric](3, 1) NULL,
	[QLTITHK] [numeric](4, 1) NULL,
	[IOSNDP] [numeric](2, 0) NULL,
	[IUDFSTHK] [numeric](2, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC,
	[EXKEY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_PUMP_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_PUMP_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[PPUPZ] [numeric](7, 3) NULL,
	[PPDWZ] [numeric](7, 3) NULL,
	[OMCN] [numeric](3, 0) NULL,
	[OMPWR] [numeric](5, 0) NULL,
	[PMPQ] [numeric](7, 3) NULL,
	[PPWCHRCD] [char](1) NULL,
	[PPUPWPTN] [char](1) NULL,
	[PPDWWPTN] [char](1) NULL,
	[MSQMT] [char](1) NULL,
	[PDCHCD] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_PSTAT_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_PSTAT_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[ACCP] [numeric](6, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_AWQMD_D]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_AWQMD_D](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[WT] [numeric](3, 1) NULL,
	[PH] [numeric](4, 2) NULL,
	[BOD5] [numeric](5, 1) NULL,
	[CODCR] [numeric](7, 1) NULL,
	[SS] [numeric](8, 2) NULL,
	[LAS] [numeric](6, 3) NULL,
	[SO] [numeric](7, 2) NULL,
	[CL] [numeric](7, 2) NULL,
	[S2] [numeric](5, 2) NULL,
	[HG] [numeric](9, 7) NULL,
	[CD] [numeric](7, 5) NULL,
	[ARS] [numeric](8, 6) NULL,
	[CR6] [numeric](5, 3) NULL,
	[PB] [numeric](7, 5) NULL,
	[CU] [numeric](7, 4) NULL,
	[ZN] [numeric](6, 4) NULL,
	[SE] [numeric](7, 5) NULL,
	[F] [numeric](5, 2) NULL,
	[CN] [numeric](8, 6) NULL,
	[OIL] [numeric](6, 3) NULL,
	[VLPH] [numeric](10, 6) NULL,
	[BEN] [numeric](7, 5) NULL,
	[SLYQ] [numeric](5, 3) NULL,
	[BXQ] [numeric](5, 3) NULL,
	[B] [numeric](4, 2) NULL,
	[FCG] [numeric](10, 0) NULL,
	[AO] [numeric](10, 0) NULL,
	[ANOMALY] [text] NULL,
 CONSTRAINT [PK_ST_AWQMD_D] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测站代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'STCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采样时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'TM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'水温' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'WT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五日生化需氧量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'BOD5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'化学需氧量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'CODCR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'悬浮物' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'SS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阴离子表面活性剂' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'LAS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'全盐量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'SO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'氯化物' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'CL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'硫化物' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'S2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总汞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'HG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总镉' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'CD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总砷' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'ARS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'六价铬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'CR6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总铅' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'PB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总铜' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'CU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总锌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'ZN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总硒' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'SE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'氟化物' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'F'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'氰化物' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'CN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'石油类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'OIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挥发酚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'VLPH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'苯' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'BEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'三氯乙醛' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'SLYQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'丙烯醛' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'BXQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'硼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'B'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'粪大肠菌群数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'FCG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'蛔虫卵数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'AO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'水质异常分析' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D', @level2type=N'COLUMN',@level2name=N'ANOMALY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'水质监测数据记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ST_AWQMD_D'
GO
/****** Object:  Table [dbo].[ST_ASTROTD_F]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_ASTROTD_F](
	[STCD] [char](8) NOT NULL,
	[YMDH] [datetime] NOT NULL,
	[TDZ] [numeric](7, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[YMDH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_ADDVCD_D]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_ADDVCD_D](
	[ADDVCD] [char](6) NOT NULL,
	[ADDVNM] [varchar](50) NOT NULL,
	[COMMENTS] [varchar](200) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ADDVCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test]
AS
BEGIN
	--DECLARE @w NUMERIC(9, 3)
	--EXECUTE [dbo].[proc_get_water_storage] 'Gadfly14',22,@w OUTPUT
	--SELECT @w as W
	
	--DECLARE @st VARCHAR(100)
	--DECLARE @et VARCHAR(100)
	--DECLARE @times datetime
	--SET @times = '2017-01-17 10:26:26.900'
	--SET @times = CONVERT(datetime,@times)
	--EXECUTE [dbo].[proc_get_time_with_zero] @times,1,@st OUTPUT,@et OUTPUT
	--SELECT @st,@et
	
	DECLARE @temp VARCHAR(100)
		
END
GO
/****** Object:  Table [dbo].[ST_ZVARL_B]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_ZVARL_B](
	[STCD] [char](8) NOT NULL,
	[MSTM] [datetime] NOT NULL,
	[PTNO] [numeric](4, 0) NOT NULL,
	[RZ] [numeric](7, 3) NOT NULL,
	[W] [numeric](9, 3) NULL,
	[WSFA] [numeric](7, 0) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[MSTM] ASC,
	[PTNO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_ZQRL_B]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_ZQRL_B](
	[STCD] [char](8) NOT NULL,
	[LNNM] [char](30) NOT NULL,
	[BGTM] [datetime] NOT NULL,
	[PTNO] [numeric](4, 0) NOT NULL,
	[Z] [numeric](7, 3) NOT NULL,
	[Q] [numeric](9, 3) NOT NULL,
	[COMMENTS] [char](200) NULL,
	[MODITIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[LNNM] ASC,
	[BGTM] ASC,
	[PTNO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_WSPAVSD_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_WSPAVSD_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDR] [numeric](5, 2) NULL,
	[DRAVZ] [numeric](7, 3) NULL,
	[DRAVQ] [numeric](9, 3) NULL,
	[DRPW] [numeric](11, 3) NULL,
	[DRDW] [numeric](11, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_WGRWSTAT_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_WGRWSTAT_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[ACCGDW] [numeric](5, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_WGRW_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_WGRW_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[WLMIN] [numeric](11, 4) NULL,
	[WLMINMT] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_WDWV_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_WDWV_R](
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[WNDV] [numeric](4, 1) NULL,
	[WNDPWR] [numeric](2, 0) NULL,
	[WNDDIR] [char](2) NULL,
	[WVHGT] [numeric](4, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_WDPSTAT_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_WDPSTAT_R](
	[STCD] [char](8) NOT NULL,
	[IDTM] [datetime] NOT NULL,
	[STTDRCD] [char](1) NOT NULL,
	[PPTMS] [numeric](4, 0) NULL,
	[ACCPW] [numeric](11, 3) NULL,
	[PPHRS] [numeric](6, 2) NULL,
	[DRNTMS] [numeric](4, 0) NULL,
	[ACCDW] [numeric](11, 3) NULL,
	[DRNHRS] [numeric](6, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[STCD] ASC,
	[IDTM] ASC,
	[STTDRCD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[proc_get_water_storage]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_get_water_storage]
	@stcd char(8), --测站编码
	@high NUMERIC(16,4),--库上水位值
	@storage NUMERIC(9, 3) OUTPUT
AS
--xdll 最强线性流量或库容插补算法2007/04/13
--hydrology专用算法
--@yCheckTableType为是库容1水文站2是引水渠、输水渠
--EDCB_NEW 是库容查算表EDCB_NEW 是水文站、引水渠、输水渠流量查算表
BEGIN
	--DECLARE @storage NUMERIC(9, 3)
	--上界下界变量
	DECLARE @yWLUp	numeric (6, 2),	@yWLDown numeric (6, 2)
	DECLARE @yNumUp numeric (16, 4),@yNumDown numeric (16, 4)

	--初始化     //上下水位边界，上下水位对应库容
	SET @yWLUp=-1 set @yWLDown=-1 set @yNumUp=-1 set @yNumDown=-1
	
	--合并后的算法
	SELECT @yWLUp = [RZ],@yNumUp=[W] FROM  [dbo].[ST_ZVARL_B] WHERE [STCD]=@stcd 	AND [W]  =(SELECT max([W]) FROM [dbo].[ST_ZVARL_B] WHERE [STCD]=@stcd  And [W]<= @high) 
	SELECT @yWLUp = [RZ],@yNumUp=[W] FROM  [dbo].[ST_ZVARL_B] WHERE [STCD]=@stcd 	AND [W]  =(SELECT max([W]) FROM [dbo].[ST_ZVARL_B] WHERE [STCD]=@stcd  And [W]>= @high) 
	/*线性插值算法*/
	IF (@yWLUp < @high ) AND (@yWLDown > @high )  BEGIN
	   SET @storage =(@yNumDown-@yNumUp)*(@high-@yWLUp)/(@yWLDown-@yWLUp)+@yNumUp
	END ELSE IF (@yWLup > @high ) AND (@yWLdown < @high ) BEGIN
	   SET @storage = (@yNumUp-@yNumDown)*(@high-@yWLDown)/(@yWLUp-@yWLDown)+@yNumDown
	END ELSE BEGIN
		SELECT @storage =[W] FROM [dbo].[ST_ZVARL_B] WHERE [STCD]=@stcd AND [RZ]=@high
	END 
	--SELECT @stcd AS STCD,@high AS RZ ,@storage AS W
END
GO
/****** Object:  View [dbo].[ST_WATER_SAMPLING_VIEW]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ST_WATER_SAMPLING_VIEW] AS
	SELECT [AWQMD].STCD,
		[AWQMD].TM,
		[AWQMD].WT,
		[AWQMD].PH,
		[AWQMD].BOD5,
		[AWQMD].CODCR,
		[AWQMD].SS,
		[AWQMD].LAS,
		[AWQMD].SO,
		[AWQMD].id,
		[AWQMD].CL,
		[AWQMD].S2,
		[AWQMD].HG,
		[AWQMD].CD,
		[AWQMD].ARS,
		[AWQMD].CR6,
		[AWQMD].PB,
		[AWQMD].CU,
		[AWQMD].ZN,
		[AWQMD].SE,
		[AWQMD].F,
		[AWQMD].CN,
		[AWQMD].OIL,
		[AWQMD].VLPH,
		[AWQMD].BEN,
		[AWQMD].SLYQ,
		[AWQMD].BXQ,
		[AWQMD].B,
		[AWQMD].FCG,
		[AWQMD].ANOMALY,
		[AWQMD].AO, 
		[SWSINF].STNM, 
		[SWSINF].STCT, 
		[SWSINF].WATP, 
		[SWSINF].WSFL
	FROM [dbo].[ST_AWQMD_D] AS AWQMD,  [dbo].[ST_SWSINF_B] AS SWSINF
	WHERE [AWQMD].[STCD] = [SWSINF].[STCD]
GO
/****** Object:  View [dbo].[ST_REPORT_SK_VIEW]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ST_REPORT_SK_VIEW] AS 
SELECT
dbo.ST_STBPRP_B.id AS SID,
dbo.ST_STBPRP_B.STCD AS STCD,
dbo.ST_STBPRP_B.STNM AS STNM,
dbo.ST_RSVRAV_R.AVRZ AS AVRZ,
dbo.ST_RSVRAV_R.AVW AS AVW,
dbo.ST_RSVRAV_R.STTDRCD AS STTDRCD,
dbo.ST_RSVRAV_R.IDTM AS IDTM,
dbo.ST_RSVRAV_R.AVINQ AS AVINQ,
dbo.ST_RSVRAV_R.AVOTQ AS AVOTQ,
dbo.ST_RSVRFCCH_B.RSVRTP AS RSVRTP,
dbo.ST_RSVRFCCH_B.TTCP AS TTCP,
dbo.ST_RSVRFCCH_B.DDCP AS DDCP


FROM
dbo.ST_STBPRP_B ,
dbo.ST_RSVRAV_R ,
dbo.ST_RSVRFCCH_B
WHERE
dbo.ST_STBPRP_B.STTP = 'RR' AND
dbo.ST_STBPRP_B.STCD = dbo.ST_RSVRAV_R.STCD AND
dbo.ST_RSVRAV_R.STCD = dbo.ST_RSVRFCCH_B.STCD
GO
/****** Object:  Table [dbo].[ST_PPTN_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
 CONSTRAINT [PK_ST_PPTN_R] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_SOIL_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_SOIL_R](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[EXKEY] [char](1) NOT NULL,
	[VTAVSLM] [numeric](4, 1) NULL,
	[SRLSLM] [numeric](4, 1) NULL,
	[SLM10] [numeric](4, 1) NULL,
	[SLM20] [numeric](4, 1) NULL,
	[SLM30] [numeric](4, 1) NULL,
	[SLM40] [numeric](4, 1) NULL,
	[SLM60] [numeric](4, 1) NULL,
	[SLM80] [numeric](4, 1) NULL,
	[SLM100] [numeric](4, 1) NULL,
	[CRPTY] [char](1) NULL,
	[CRPGRWPRD] [char](1) NULL,
	[HITRSN] [char](1) NULL,
	[SLMMMT] [char](1) NULL,
	[TKTP] [char](10) NULL,
 CONSTRAINT [PK_ST_SOIL_R] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[STCD] ASC,
	[TM] ASC,
	[EXKEY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ST_DAILY_LIST_VIEW]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ST_DAILY_LIST_VIEW] AS 
SELECT
dbo.ST_STBPRP_B.id AS ID,
dbo.ST_STBPRP_B.STCD AS STCD,
dbo.ST_STBPRP_B.STNM AS STNM,
dbo.ST_RSVRAV_R.AVRZ AS AVRZ,
dbo.ST_RSVRAV_R.AVW AS AVW

FROM
dbo.ST_STBPRP_B ,
dbo.ST_RSVRAV_R
WHERE
dbo.ST_STBPRP_B.STTP = 'RR' AND
dbo.ST_STBPRP_B.STCD = dbo.ST_RSVRAV_R.STCD
GO
/****** Object:  Table [dbo].[ST_GATE_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ST_GATE_R](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[STCD] [char](8) NOT NULL,
	[TM] [datetime] NOT NULL,
	[EXKEY] [char](1) NOT NULL,
	[EQPTP] [char](2) NULL,
	[EQPNO] [char](2) NULL,
	[GTOPNUM] [numeric](3, 0) NULL,
	[GTOPHGT] [numeric](5, 2) NULL,
	[GTQ] [numeric](9, 3) NULL,
	[MSQMT] [char](1) NULL,
	[TKTP] [char](10) NULL,
 CONSTRAINT [PK_ST_GATE_R] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[STCD] ASC,
	[TM] ASC,
	[EXKEY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ST_RSVR_R]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[TKTP] [char](10) NULL,
 CONSTRAINT [PK_ST_RSVR_R] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[STCD] ASC,
	[TM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ST_MONITOR_YZ_VIEW]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ST_MONITOR_YZ_VIEW] AS 
SELECT
dbo.ST_STBPRP_B.STCD,
dbo.ST_STBPRP_B.STNM,
dbo.ST_STBPRP_B.STTP,
dbo.ST_GATE_R.GTOPNUM,
dbo.ST_GATE_R.GTOPHGT,
dbo.ST_GATE_R.GTQ,
dbo.ST_WAS_R.TGTQ,
dbo.ST_WAS_R.TM,
dbo.ST_WAS_R.UPZ,
dbo.ST_WAS_R.DWZ

FROM
dbo.ST_STBPRP_B ,
dbo.ST_GATE_R ,
dbo.ST_WAS_R
WHERE
dbo.ST_STBPRP_B.STTP = 'DD' AND
dbo.ST_STBPRP_B.STCD = dbo.ST_GATE_R.STCD AND
dbo.ST_GATE_R.STCD = dbo.ST_WAS_R.STCD
GO
/****** Object:  View [dbo].[ST_MONITOR_YL_VIEW]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ST_MONITOR_YL_VIEW] AS 
SELECT
dbo.ST_STBPRP_B.id AS ID,
dbo.ST_STBPRP_B.STCD AS STCD,
dbo.ST_STBPRP_B.STNM AS STNM,
dbo.ST_PPTN_R.TM AS TM,
dbo.ST_PPTN_R.DRP AS DRP,
dbo.ST_PPTN_R.DYP AS DYP

FROM
dbo.ST_PPTN_R ,
dbo.ST_STBPRP_B
WHERE
dbo.ST_PPTN_R.STCD = dbo.ST_STBPRP_B.STCD
GO
/****** Object:  View [dbo].[ST_MONITOR_SQ_VIEW]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ST_MONITOR_SQ_VIEW] AS 
SELECT
dbo.ST_STBPRP_B.STCD,
dbo.ST_STBPRP_B.STNM,
dbo.ST_SOIL_R.TM,
dbo.ST_SOIL_R.SLM20,
dbo.ST_SOIL_R.SLM40,
dbo.ST_SOIL_R.SLM60

FROM
dbo.ST_STBPRP_B ,
dbo.ST_SOIL_R
WHERE
dbo.ST_STBPRP_B.STTP = 'SS' AND
dbo.ST_STBPRP_B.STCD = dbo.ST_SOIL_R.STCD
GO
/****** Object:  View [dbo].[ST_MONITOR_SK_VIEW]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ST_MONITOR_SK_VIEW] AS 
SELECT
dbo.ST_STBPRP_B.id  AS SID,
dbo.ST_STBPRP_B.STCD AS STCD,
dbo.ST_STBPRP_B.STNM AS STNM,
dbo.ST_RSVR_R.TM AS TM,
dbo.ST_RSVR_R.RZ AS RZ,
dbo.ST_RSVR_R.W AS W
FROM
dbo.ST_STBPRP_B ,
dbo.ST_RSVR_R
WHERE
dbo.ST_STBPRP_B.STCD = dbo.ST_RSVR_R.STCD AND
dbo.ST_STBPRP_B.STTP = 'RR'
GO
/****** Object:  StoredProcedure [dbo].[proc_set_rsvrevs]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[proc_set_rsvrav]    Script Date: 01/19/2017 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
		SET @sql = 'insert INTO #Tb_frame SELECT * FROM openrowset(''sqloledb'',''Trusted_Connection=yes'',''exec [Hydrology_pygq].[dbo].[proc_get_time_frame] @getdate="' + @param + '"'')';
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
/****** Object:  Default [DF_Table_1_pid]    Script Date: 01/19/2017 16:51:32 ******/
ALTER TABLE [dbo].[ST_IRRIGATED_AREA] ADD  CONSTRAINT [DF_Table_1_pid]  DEFAULT ((0)) FOR [GPID]
GO
/****** Object:  Default [DF_ST_IRRIGATED_AREA_CREATE_TIME]    Script Date: 01/19/2017 16:51:32 ******/
ALTER TABLE [dbo].[ST_IRRIGATED_AREA] ADD  CONSTRAINT [DF_ST_IRRIGATED_AREA_CREATE_TIME]  DEFAULT (getdate()) FOR [CREATE_TIME]
GO
/****** Object:  Default [DF_ST_IRRIGATED_AREA_UPDATE_TIME]    Script Date: 01/19/2017 16:51:32 ******/
ALTER TABLE [dbo].[ST_IRRIGATED_AREA] ADD  CONSTRAINT [DF_ST_IRRIGATED_AREA_UPDATE_TIME]  DEFAULT (getdate()) FOR [UPDATE_TIME]
GO
/****** Object:  Default [DF__ST_TASKLIS__STLC__65C116E7]    Script Date: 01/19/2017 16:51:32 ******/
ALTER TABLE [dbo].[ST_TASKLIST_D] ADD  DEFAULT ('UNDEFINED') FOR [STLC]
GO
/****** Object:  Default [DF_ST_RIVER_R_TM]    Script Date: 01/19/2017 16:51:32 ******/
ALTER TABLE [dbo].[ST_RIVER_R] ADD  CONSTRAINT [DF_ST_RIVER_R_TM]  DEFAULT (getdate()) FOR [TM]
GO
/****** Object:  Default [DF_ST_RIVER_R_TKTP]    Script Date: 01/19/2017 16:51:32 ******/
ALTER TABLE [dbo].[ST_RIVER_R] ADD  CONSTRAINT [DF_ST_RIVER_R_TKTP]  DEFAULT ('auto') FOR [TKTP]
GO
/****** Object:  Default [DF_ST_PPTN_R_TM]    Script Date: 01/19/2017 16:51:34 ******/
ALTER TABLE [dbo].[ST_PPTN_R] ADD  CONSTRAINT [DF_ST_PPTN_R_TM]  DEFAULT (getdate()) FOR [TM]
GO
/****** Object:  Default [DF_ST_PPTN_R_TKTP]    Script Date: 01/19/2017 16:51:34 ******/
ALTER TABLE [dbo].[ST_PPTN_R] ADD  CONSTRAINT [DF_ST_PPTN_R_TKTP]  DEFAULT ('auto') FOR [TKTP]
GO
/****** Object:  Default [DF_ST_SOIL_R_TM]    Script Date: 01/19/2017 16:51:34 ******/
ALTER TABLE [dbo].[ST_SOIL_R] ADD  CONSTRAINT [DF_ST_SOIL_R_TM]  DEFAULT (getdate()) FOR [TM]
GO
/****** Object:  Default [DF_ST_SOIL_R_TKTP]    Script Date: 01/19/2017 16:51:34 ******/
ALTER TABLE [dbo].[ST_SOIL_R] ADD  CONSTRAINT [DF_ST_SOIL_R_TKTP]  DEFAULT ('auto') FOR [TKTP]
GO
/****** Object:  Default [DF_ST_GATE_R_TM]    Script Date: 01/19/2017 16:51:34 ******/
ALTER TABLE [dbo].[ST_GATE_R] ADD  CONSTRAINT [DF_ST_GATE_R_TM]  DEFAULT (getdate()) FOR [TM]
GO
/****** Object:  Default [DF_ST_GATE_R_TKTP]    Script Date: 01/19/2017 16:51:34 ******/
ALTER TABLE [dbo].[ST_GATE_R] ADD  CONSTRAINT [DF_ST_GATE_R_TKTP]  DEFAULT ('auto') FOR [TKTP]
GO
/****** Object:  Default [DF_ST_RSVR_R_TM]    Script Date: 01/19/2017 16:51:34 ******/
ALTER TABLE [dbo].[ST_RSVR_R] ADD  CONSTRAINT [DF_ST_RSVR_R_TM]  DEFAULT (getdate()) FOR [TM]
GO
/****** Object:  Default [DF_ST_RSVR_R_TKTP]    Script Date: 01/19/2017 16:51:34 ******/
ALTER TABLE [dbo].[ST_RSVR_R] ADD  CONSTRAINT [DF_ST_RSVR_R_TKTP]  DEFAULT ('auto') FOR [TKTP]
GO
