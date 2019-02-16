-- SQL Server script file
-- set to your database name
USE [<your database>]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

/****** sequence generator ******/
IF OBJECT_ID('dbo.ID_GEN', 'U') IS NOT NULL 
  DROP TABLE dbo.ID_GEN
GO

CREATE TABLE [dbo].[ID_GEN](
	[GEN_NAME] [nvarchar](16) NOT NULL,
	[GEN_VALUE] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GEN_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** sequence generator ******/
IF OBJECT_ID('dbo.JPA_SEQ', 'SO') IS NOT NULL 
    DROP SEQUENCE dbo.JPA_SEQ
GO

CREATE SEQUENCE [dbo].[JPA_SEQ] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 10
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO


/****** WORK_SCHEDULE table ******/
IF OBJECT_ID('dbo.WORK_SCHEDULE', 'U') IS NOT NULL 
  DROP TABLE dbo.WORK_SCHEDULE; 
GO

CREATE TABLE [dbo].[WORK_SCHEDULE](
	[WS_KEY] [bigint] NOT NULL,
	[NAME] [nvarchar](64) NULL,
	[DESCRIPTION] [nvarchar](512) NULL,
	[VERSION] [int] NULL
) ON [PRIMARY]
GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_NAME] ON [dbo].[WORK_SCHEDULE]
(
	[NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** SHIFT table ******/
IF OBJECT_ID('dbo.SHIFT', 'U') IS NOT NULL 
  DROP TABLE dbo.SHIFT; 
GO

CREATE TABLE [dbo].[SHIFT](
	[SHIFT_KEY] [bigint] NOT NULL,
	[NAME] [nvarchar](64) NULL,
	[DESCRIPTION] [nvarchar](128) NULL,
	[START_TIME] [time](7) NULL,
	[DURATION] [bigint] NULL,
	[WS_KEY] [int] NULL
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_NAME] ON [dbo].[SHIFT]
(
	[NAME] ASC,
	[WS_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** TEAM table ******/
IF OBJECT_ID('dbo.TEAM', 'U') IS NOT NULL 
  DROP TABLE dbo.TEAM; 
GO

CREATE TABLE [dbo].[TEAM](
	[TEAM_KEY] [bigint] NOT NULL,
	[NAME] [nvarchar](64) NULL,
	[DESCRIPTION] [nvarchar](128) NULL,
	[WS_KEY] [int] NULL,
	[ROTATION_KEY] [int] NULL,
	[ROTATION_START] [date] NULL
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_NAME] ON [dbo].[TEAM]
(
	[NAME] ASC,
	[WS_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** ROTATION table ******/
IF OBJECT_ID('dbo.ROTATION', 'U') IS NOT NULL 
  DROP TABLE dbo.ROTATION; 
GO

CREATE TABLE [dbo].[ROTATION](
	[ROTATION_KEY] [bigint] NOT NULL,
	[NAME] [nvarchar](64) NULL,
	[DESCRIPTION] [nvarchar](128) NULL,
	[WS_KEY] [int] NULL
) ON [PRIMARY]
GO

/****** ROTATION SEGMENT table ******/
IF OBJECT_ID('dbo.ROTATION_SEGMENT', 'U') IS NOT NULL 
  DROP TABLE dbo.ROTATION_SEGMENT; 
GO

CREATE TABLE [dbo].[ROTATION_SEGMENT](
	[SEGMENT_KEY] [bigint] NOT NULL,
	[ROTATION_KEY] [int] NULL,
	[SEQUENCE] [smallint] NULL,
	[SHIFT_KEY] [smallint] NULL,
	[DAYS_ON] [smallint] NULL,
	[DAYS_OFF] [smallint] NULL
) ON [PRIMARY]
GO

/****** NON-WORKING PERIOD table ******/
IF OBJECT_ID('dbo.NON_WORKING_PERIOD', 'U') IS NOT NULL 
  DROP TABLE dbo.NON_WORKING_PERIOD; 
GO

CREATE TABLE [dbo].[NON_WORKING_PERIOD](
	[PERIOD_KEY] [bigint] NOT NULL,
	[NAME] [nvarchar](64) NULL,
	[DESCRIPTION] [nvarchar](128) NULL,
	[START_DATE_TIME] [datetime] NULL,
	[DURATION] [bigint] NULL,
	[WS_KEY] [int] NULL
) ON [PRIMARY]
GO

