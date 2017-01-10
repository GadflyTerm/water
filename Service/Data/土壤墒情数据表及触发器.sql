USE [Hydrology_pygq]
GO

/****** Object:  Table [dbo].[ST_SOIL_R]    Script Date: 01/07/2017 12:38:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

-- =============================================
-- 土壤墒情表
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ST_SOIL_R')
  DROP TABLE [dbo].[ST_SOIL_R]
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

ALTER TABLE [dbo].[ST_SOIL_R] ADD  CONSTRAINT [DF_ST_SOIL_R_TM]  DEFAULT (getdate()) FOR [TM]
GO

ALTER TABLE [dbo].[ST_SOIL_R] ADD  CONSTRAINT [DF_ST_SOIL_R_TKTP]  DEFAULT ('auto') FOR [TKTP]
GO

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'ST_SOIL_R_INSERT_TR' AND [XTYPE] = 'TR')
  DROP TRIGGER ST_SOIL_R_INSERT_TR
GO

CREATE TRIGGER ST_SOIL_R_INSERT_TR
  ON  [dbo].[ST_SOIL_R]
AFTER INSERT
AS
  BEGIN
    DECLARE @id INT; 									-- 当前数据表pk
    DECLARE @stcd CHAR(8);						-- 当前测站编码 
    DECLARE @stnm CHAR(30);
    DECLARE @sttp CHAR(2);
    DECLARE @tktp CHAR(10);
    DECLARE @tm DATETIME;
    /* 触发添加报送任务数据 */
    SELECT @id = [id], @stcd = [STCD], @tm = [TM], @tktp = [TKTP] FROM inserted;
    SELECT @stnm = [STNM], @sttp = [STTP] FROM [dbo].[ST_STBPRP_B] WHERE [STCD] = @stcd;
    INSERT [dbo].[ST_TASKLIST_D] ([RELATED], [PK], [STCD], [STNM], [STTP], [TKTP], [TM])
    VALUES ('ST_SOIL_R', @id, @stcd, @stnm, @sttp, @tktp, @tm);
  END
GO