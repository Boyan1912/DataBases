USE [master]
GO
/****** Object:  Database [Task2]    Script Date: 10/8/2015 7:24:55 AM ******/
CREATE DATABASE [Task2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Task2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Task2.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Task2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Task2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Task2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Task2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Task2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Task2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Task2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Task2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Task2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Task2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Task2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Task2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Task2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Task2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Task2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Task2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Task2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Task2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Task2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Task2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Task2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Task2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Task2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Task2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Task2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Task2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Task2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Task2] SET  MULTI_USER 
GO
ALTER DATABASE [Task2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Task2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Task2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Task2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Task2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Task2]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/8/2015 7:24:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[idCourse] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[idProffessor] [int] NOT NULL,
	[idDepartment] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[idCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CoursesStudents]    Script Date: 10/8/2015 7:24:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoursesStudents](
	[idStudent] [int] NOT NULL,
	[idCourse] [int] NOT NULL,
 CONSTRAINT [PK_CoursesStudents] PRIMARY KEY CLUSTERED 
(
	[idStudent] ASC,
	[idCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/8/2015 7:24:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[idDepartment] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[idFaculty] [int] NULL,
	[idUniversity] [int] NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[idDepartment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 10/8/2015 7:24:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[idFaculty] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[idUniversity] [int] NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[idFaculty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors]    Script Date: 10/8/2015 7:24:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[idProffessor] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[idDepartment] [int] NOT NULL,
 CONSTRAINT [PK_Professors] PRIMARY KEY CLUSTERED 
(
	[idProffessor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 10/8/2015 7:24:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[idStudeent] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[idFaculty] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[idStudeent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Titles]    Script Date: 10/8/2015 7:24:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[idTitle] [int] IDENTITY(1,1) NOT NULL,
	[TitleName] [nvarchar](50) NOT NULL,
	[idProffessor] [int] NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[idTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Universities]    Script Date: 10/8/2015 7:24:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universities](
	[idUniversity] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Universities] PRIMARY KEY CLUSTERED 
(
	[idUniversity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Departments] FOREIGN KEY([idDepartment])
REFERENCES [dbo].[Departments] ([idDepartment])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Departments]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Professors] FOREIGN KEY([idProffessor])
REFERENCES [dbo].[Professors] ([idProffessor])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Professors]
GO
ALTER TABLE [dbo].[CoursesStudents]  WITH CHECK ADD  CONSTRAINT [FK_CoursesStudents_Courses] FOREIGN KEY([idCourse])
REFERENCES [dbo].[Courses] ([idCourse])
GO
ALTER TABLE [dbo].[CoursesStudents] CHECK CONSTRAINT [FK_CoursesStudents_Courses]
GO
ALTER TABLE [dbo].[CoursesStudents]  WITH CHECK ADD  CONSTRAINT [FK_CoursesStudents_Students] FOREIGN KEY([idStudent])
REFERENCES [dbo].[Students] ([idStudeent])
GO
ALTER TABLE [dbo].[CoursesStudents] CHECK CONSTRAINT [FK_CoursesStudents_Students]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Faculties] FOREIGN KEY([idFaculty])
REFERENCES [dbo].[Faculties] ([idFaculty])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Faculties]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Universities] FOREIGN KEY([idUniversity])
REFERENCES [dbo].[Universities] ([idUniversity])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Universities]
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD  CONSTRAINT [FK_Faculties_Universities] FOREIGN KEY([idUniversity])
REFERENCES [dbo].[Universities] ([idUniversity])
GO
ALTER TABLE [dbo].[Faculties] CHECK CONSTRAINT [FK_Faculties_Universities]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Departments] FOREIGN KEY([idDepartment])
REFERENCES [dbo].[Departments] ([idDepartment])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Departments]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Faculties] FOREIGN KEY([idFaculty])
REFERENCES [dbo].[Faculties] ([idFaculty])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Faculties]
GO
ALTER TABLE [dbo].[Titles]  WITH CHECK ADD  CONSTRAINT [FK_Titles_Professors] FOREIGN KEY([idProffessor])
REFERENCES [dbo].[Professors] ([idProffessor])
GO
ALTER TABLE [dbo].[Titles] CHECK CONSTRAINT [FK_Titles_Professors]
GO
USE [master]
GO
ALTER DATABASE [Task2] SET  READ_WRITE 
GO
