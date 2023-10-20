USE [master]
GO
CREATE DATABASE [BreweryApp_LogDB]
GO
USE [BreweryApp_LogDB]
GO
CREATE TABLE [T_Log](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [nvarchar](350) NOT NULL,
	[RequestId] [uniqueidentifier] NULL,
	[Path] [nvarchar](150) NOT NULL,
	[Parameters] [nvarchar](500) NOT NULL,
	[StartAction] [datetime] NOT NULL,
	[EndAction] [datetime] NOT NULL,
	[ResponseStatusCode] [int] NULL,
	[Result] [nvarchar](max) NULL,
	[Exeption] [nvarchar](max) NULL,
 CONSTRAINT [PK_T_Log] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [proc_LogInsert]
	@RequestId uniqueidentifier = NULL,
	@ApplicationName nvarchar(350),
	@Path nvarchar(150),
	@Parameters nvarchar(500),
	@StartAction datetime,
	@EndAction datetime,
	@ResponseStatusCode int = NULL,
	@Result nvarchar(max) = NULL,
	@Exeption nvarchar(max) = NULL
AS
	--Begin Try

	INSERT INTO T_Log
	(
		[RequestId],
		[ApplicationName],
		[Path],
		[Parameters],
		[StartAction],
		[EndAction],
		[ResponseStatusCode],
		[Result],
		[Exeption]
	)
     VALUES
	(
		@RequestId,
		@ApplicationName,
		@Path,
		@Parameters,
		@StartAction,
		@EndAction,
		@ResponseStatusCode,
		@Result,
		@Exeption
	)

	--select SCOPE_IDENTITY() as Id, '' as Error

	--End Try

	--Begin Catch

	--	select NULL as Id, ERROR_MESSAGE() as Error

	--End Catch
GO

