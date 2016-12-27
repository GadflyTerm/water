USE [master]
GO

/****** Object:  Table [dbo].[ST_SWSINF_B]    Script Date: 12/22/2016 12:40:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

-- =============================================
-- 地表水水质监测站信息表
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	用于存储地表水水质监测站的特定信息
-- =============================================
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ST_SWSINF_B')
	DROP TABLE [dbo].[ST_SWSINF_B]
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



USE [master]
GO

/****** Object:  Table [dbo].[ST_AWQMD_D]    Script Date: 12/22/2016 12:41:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

-- =============================================
-- 水质监测数据记录表
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
USE [master]
GO

/****** Object:  Table [dbo].[ST_AWQMD_D]    Script Date: 12/26/2016 12:44:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ST_AWQMD_D')
	DROP TABLE [dbo].[ST_AWQMD_D]
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