USE [Hydrology_pygq]
GO

/****** Object:  Table [dbo].[ST_GATE_R]    Script Date: 01/07/2017 13:08:52 ******/
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
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ST_GATE_R')
  DROP TABLE [dbo].[ST_GATE_R]
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

ALTER TABLE [dbo].[ST_GATE_R] ADD  CONSTRAINT [DF_ST_GATE_R_TM]  DEFAULT (getdate()) FOR [TM]
GO

ALTER TABLE [dbo].[ST_GATE_R] ADD  CONSTRAINT [DF_ST_GATE_R_TKTP]  DEFAULT ('auto') FOR [TKTP]
GO

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE [NAME] = 'ST_GATE_R_INSERT_TR' AND [XTYPE] = 'TR')
  DROP TRIGGER ST_GATE_R_INSERT_TR
GO

CREATE TRIGGER ST_GATE_R_INSERT_TR
  ON  [dbo].[ST_GATE_R]
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
    VALUES ('ST_GATE_R', @id, @stcd, @stnm, @sttp, @tktp, @tm);
  END
GO