USE [OnlineExams]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TestForms', @level2type=N'COLUMN',@level2name=N'VisibilityType'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FormsQuestions', @level2type=N'COLUMN',@level2name=N'VisibilityType'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FormsQuestions', @level2type=N'COLUMN',@level2name=N'AnswerType'
GO
ALTER TABLE [dbo].[TestForms] DROP CONSTRAINT [FK_TestForms_Categories]
GO
ALTER TABLE [dbo].[QuestionAnswers] DROP CONSTRAINT [FK_QuestionAnswers_FormsQuestions]
GO
ALTER TABLE [dbo].[FormsQuestions] DROP CONSTRAINT [FK_FormsQuestions_TestForms]
GO
/****** Object:  Index [IX_FormsQuestions]    Script Date: 02-09-2022 03:53:36 ******/
DROP INDEX [IX_FormsQuestions] ON [dbo].[FormsQuestions]
GO
/****** Object:  Table [dbo].[TestForms]    Script Date: 02-09-2022 03:53:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestForms]') AND type in (N'U'))
DROP TABLE [dbo].[TestForms]
GO
/****** Object:  Table [dbo].[QuestionAnswers]    Script Date: 02-09-2022 03:53:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionAnswers]') AND type in (N'U'))
DROP TABLE [dbo].[QuestionAnswers]
GO
/****** Object:  Table [dbo].[FormsQuestions]    Script Date: 02-09-2022 03:53:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormsQuestions]') AND type in (N'U'))
DROP TABLE [dbo].[FormsQuestions]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 02-09-2022 03:53:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Categories]
GO
USE [master]
GO
/****** Object:  Database [OnlineExams]    Script Date: 02-09-2022 03:53:36 ******/
DROP DATABASE [OnlineExams]
GO
/****** Object:  Database [OnlineExams]    Script Date: 02-09-2022 03:53:36 ******/
CREATE DATABASE [OnlineExams]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineExams', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OnlineExams.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ),
( NAME = N'OnlineExams_mdf', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OnlineExams_mdf.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineExams_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OnlineExams_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineExams].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineExams] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineExams] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineExams] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineExams] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineExams] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineExams] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineExams] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineExams] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineExams] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineExams] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineExams] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineExams] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineExams] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineExams] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineExams] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineExams] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineExams] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineExams] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineExams] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineExams] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineExams] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineExams] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineExams] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineExams] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineExams] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineExams] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineExams] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineExams] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineExams', N'ON'
GO
USE [OnlineExams]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 02-09-2022 03:53:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormsQuestions]    Script Date: 02-09-2022 03:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormsQuestions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FormID] [bigint] NOT NULL,
	[QuestionText] [varchar](500) NOT NULL,
	[QuestionDesc] [varchar](2000) NULL,
	[AnswerType] [varchar](50) NOT NULL,
	[AnswerIdRandomUnique] [bigint] NOT NULL,
	[URL] [varchar](250) NULL,
	[RequiredAnswer] [bit] NOT NULL,
	[VisibilityType] [varchar](10) NOT NULL,
	[VisibilityValue] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [varchar](50) NULL,
 CONSTRAINT [PK_FormsQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionAnswers]    Script Date: 02-09-2022 03:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionAnswers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AnswerIdRandomUnique] [bigint] NOT NULL,
	[AnswerText] [varchar](250) NOT NULL,
	[IsCorrect] [bit] NOT NULL,
 CONSTRAINT [PK_QuestionAnswers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestForms]    Script Date: 02-09-2022 03:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestForms](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[FormTitle] [varchar](150) NOT NULL,
	[FormDescription] [varchar](500) NULL,
	[VisibilityType] [varchar](10) NOT NULL,
	[VisibilityValue] [varchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [varchar](50) NULL,
 CONSTRAINT [PK_TestForms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [CategoryName]) VALUES (1, N'Category 1')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[FormsQuestions] ON 

INSERT [dbo].[FormsQuestions] ([ID], [FormID], [QuestionText], [QuestionDesc], [AnswerType], [AnswerIdRandomUnique], [URL], [RequiredAnswer], [VisibilityType], [VisibilityValue], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy]) VALUES (1, 2, N'Demo Question 1', N'', N'radio', 101, N'', 1, N'vertical', N'demo vertical 1', CAST(N'2022-09-02T00:00:00.000' AS DateTime), N'admin', CAST(N'1970-01-01T00:00:00.000' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[FormsQuestions] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionAnswers] ON 

INSERT [dbo].[QuestionAnswers] ([ID], [AnswerIdRandomUnique], [AnswerText], [IsCorrect]) VALUES (1, 101, N'Answer 1', 0)
INSERT [dbo].[QuestionAnswers] ([ID], [AnswerIdRandomUnique], [AnswerText], [IsCorrect]) VALUES (2, 101, N'Answer 2', 1)
INSERT [dbo].[QuestionAnswers] ([ID], [AnswerIdRandomUnique], [AnswerText], [IsCorrect]) VALUES (3, 101, N'Answer 3', 0)
SET IDENTITY_INSERT [dbo].[QuestionAnswers] OFF
GO
SET IDENTITY_INSERT [dbo].[TestForms] ON 

INSERT [dbo].[TestForms] ([ID], [CategoryID], [FormTitle], [FormDescription], [VisibilityType], [VisibilityValue], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy]) VALUES (2, 1, N'Form 1', N'Form Desc', N'global', N'yes', CAST(N'2022-09-02T00:00:00.000' AS DateTime), N'admin', CAST(N'1970-01-01T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[TestForms] ([ID], [CategoryID], [FormTitle], [FormDescription], [VisibilityType], [VisibilityValue], [CreatedDate], [CreatedBy], [ModifyDate], [ModifyBy]) VALUES (3, 1, N'Form 2', N'Form 2 Desc', N'vertical', N'demo vertical 1', CAST(N'2022-09-02T00:00:00.000' AS DateTime), N'admin', CAST(N'1970-01-01T00:00:00.000' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[TestForms] OFF
GO
/****** Object:  Index [IX_FormsQuestions]    Script Date: 02-09-2022 03:53:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FormsQuestions] ON [dbo].[FormsQuestions]
(
	[AnswerIdRandomUnique] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FormsQuestions]  WITH CHECK ADD  CONSTRAINT [FK_FormsQuestions_TestForms] FOREIGN KEY([FormID])
REFERENCES [dbo].[TestForms] ([ID])
GO
ALTER TABLE [dbo].[FormsQuestions] CHECK CONSTRAINT [FK_FormsQuestions_TestForms]
GO
ALTER TABLE [dbo].[QuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK_QuestionAnswers_FormsQuestions] FOREIGN KEY([AnswerIdRandomUnique])
REFERENCES [dbo].[FormsQuestions] ([AnswerIdRandomUnique])
GO
ALTER TABLE [dbo].[QuestionAnswers] CHECK CONSTRAINT [FK_QuestionAnswers_FormsQuestions]
GO
ALTER TABLE [dbo].[TestForms]  WITH CHECK ADD  CONSTRAINT [FK_TestForms_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[TestForms] CHECK CONSTRAINT [FK_TestForms_Categories]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'value can be : radio, check, dropdown, textbox' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FormsQuestions', @level2type=N'COLUMN',@level2name=N'AnswerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'can have value : global, vertical, company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FormsQuestions', @level2type=N'COLUMN',@level2name=N'VisibilityType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'can have value : global, vertical, company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TestForms', @level2type=N'COLUMN',@level2name=N'VisibilityType'
GO
USE [master]
GO
ALTER DATABASE [OnlineExams] SET  READ_WRITE 
GO
