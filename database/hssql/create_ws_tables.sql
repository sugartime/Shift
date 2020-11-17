-- HSQLDB schema creation script file
-- set to your schema
SET AUTOCOMMIT TRUE;

/****** WORK_SCHEDULE table ******/
DROP TABLE WORK_SCHEDULE IF EXISTS;

CREATE CACHED TABLE WORK_SCHEDULE (
	WS_KEY bigint GENERATED BY DEFAULT AS IDENTITY,
	VERSION int NULL,
	NAME nvarchar(64) NULL,
	DESCRIPTION nvarchar(512) NULL,
	PRIMARY KEY (WS_KEY)
);

/****** SHIFT table ******/
DROP TABLE SHIFT IF EXISTS;

CREATE CACHED TABLE SHIFT (
	SHIFT_KEY bigint GENERATED BY DEFAULT AS IDENTITY,
	NAME nvarchar(64) NULL,
	DESCRIPTION nvarchar(128) NULL,
	START_TIME time(3) NULL,
	DURATION bigint NULL,
	WS_KEY bigint NULL,
	PRIMARY KEY (SHIFT_KEY)
);

/****** TEAM table ******/
DROP TABLE TEAM IF EXISTS;

CREATE CACHED TABLE TEAM (
	TEAM_KEY bigint GENERATED BY DEFAULT AS IDENTITY,
	NAME nvarchar(64) NULL,
	DESCRIPTION nvarchar(128) NULL,
	WS_KEY bigint NULL,
	ROTATION_KEY bigint NULL,
	ROTATION_START date NULL,
	PRIMARY KEY (TEAM_KEY)
);

/****** ROTATION table ******/
DROP TABLE ROTATION IF EXISTS;

CREATE CACHED TABLE ROTATION (
	ROTATION_KEY bigint GENERATED BY DEFAULT AS IDENTITY,
	NAME nvarchar(64) NULL,
	DESCRIPTION nvarchar(128) NULL,
	WS_KEY bigint NULL,
	PRIMARY KEY (ROTATION_KEY)
);

/****** ROTATION_SEGMENT table ******/
DROP TABLE ROTATION_SEGMENT IF EXISTS;

CREATE CACHED TABLE ROTATION_SEGMENT (
	SEGMENT_KEY bigint GENERATED BY DEFAULT AS IDENTITY,
	ROTATION_KEY bigint NULL,
	SEQUENCE smallint NULL,
	SHIFT_KEY bigint NULL,
	DAYS_ON smallint NULL,
	DAYS_OFF smallint NULL,
	PRIMARY KEY (SEGMENT_KEY)
);

/****** NON_WORKING_PERIOD table ******/
DROP TABLE NON_WORKING_PERIOD IF EXISTS;

CREATE CACHED TABLE NON_WORKING_PERIOD (
	PERIOD_KEY bigint GENERATED BY DEFAULT AS IDENTITY,
	NAME nvarchar(64) NULL,
	DESCRIPTION nvarchar(128) NULL,
	START_DATE_TIME datetime(3) NULL,
	DURATION bigint NULL,
	WS_KEY bigint NULL,
	LOSS nvarchar(32) NULL,
	PRIMARY KEY (PERIOD_KEY)
);