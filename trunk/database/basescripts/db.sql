USE [master]
GO
/****** Object:  Database [Saints_Core]    Script Date: 2/22/2015 9:14:32 PM ******/
CREATE DATABASE [Saints_Core]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Saints_Core', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Saints_Core.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Saints_Core_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Saints_Core_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Saints_Core] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Saints_Core].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Saints_Core] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Saints_Core] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Saints_Core] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Saints_Core] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Saints_Core] SET ARITHABORT OFF 
GO
ALTER DATABASE [Saints_Core] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Saints_Core] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Saints_Core] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Saints_Core] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Saints_Core] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Saints_Core] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Saints_Core] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Saints_Core] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Saints_Core] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Saints_Core] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Saints_Core] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Saints_Core] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Saints_Core] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Saints_Core] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Saints_Core] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Saints_Core] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Saints_Core] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Saints_Core] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Saints_Core] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Saints_Core] SET  MULTI_USER 
GO
ALTER DATABASE [Saints_Core] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Saints_Core] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Saints_Core] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Saints_Core] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Saints_Core', N'ON'
GO
USE [Saints_Core]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [uniqueidentifier] NOT NULL,
	[Address1] [nvarchar](250) NULL,
	[Address2] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Claims]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claims](
	[ClaimId] [int] NOT NULL,
	[Name] [nvarchar](250) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [nvarchar](500) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CusomterConfigMapping]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CusomterConfigMapping](
	[ConfigId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CusomterConfigMapping] PRIMARY KEY CLUSTERED 
(
	[ConfigId] ASC,
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Address1] [nvarchar](250) NULL,
	[Address2] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
 CONSTRAINT [PK_Churches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerUserMapping]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerUserMapping](
	[CustomerId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CustomerUserMapping] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phone]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[id] [uniqueidentifier] NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[Type] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhoneTypes]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneTypes](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhoneTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[PlaceOfBirth] [nvarchar](50) NULL,
	[CreateUserId] [uniqueidentifier] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateUserId] [uniqueidentifier] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAccess]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccess](
	[id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [varchar](500) NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[LoginAttemps] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsPasswordExpired] [bit] NOT NULL,
 CONSTRAINT [PK_UserAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRolesMapping]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRolesMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRolesMapping] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserSession]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserSession](
	[Id] [int] NOT NULL,
	[SessionId] [varchar](500) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[IsLogged] [bit] NOT NULL,
	[IsExpired] [bit] NOT NULL,
	[LoginDateTime] [datetime] NOT NULL,
	[IpAddress] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTypeMapping]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeMapping](
	[TypeId] [int] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserTypeMapping] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 2/22/2015 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[CustomerUserMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[CustomerUserMapping] CHECK CONSTRAINT [FK_CustomerId]
GO
ALTER TABLE [dbo].[CustomerUserMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[CustomerUserMapping] CHECK CONSTRAINT [FK_UserId]
GO
ALTER TABLE [dbo].[UserAccess]  WITH CHECK ADD  CONSTRAINT [FK_UserAccess_UserId] FOREIGN KEY([id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[UserAccess] CHECK CONSTRAINT [FK_UserAccess_UserId]
GO
ALTER TABLE [dbo].[UserRolesMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserRolesMapping_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserRolesMapping] CHECK CONSTRAINT [FK_UserRolesMapping_RoleId]
GO
ALTER TABLE [dbo].[UserRolesMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserRolesMapping_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[UserRolesMapping] CHECK CONSTRAINT [FK_UserRolesMapping_UserId]
GO
ALTER TABLE [dbo].[UserTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserTypeMapping_TypeId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[UserTypeMapping] CHECK CONSTRAINT [FK_UserTypeMapping_TypeId]
GO
ALTER TABLE [dbo].[UserTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserTypeMapping_UserId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[UserTypes] ([Id])
GO
ALTER TABLE [dbo].[UserTypeMapping] CHECK CONSTRAINT [FK_UserTypeMapping_UserId]
GO
USE [master]
GO
ALTER DATABASE [Saints_Core] SET  READ_WRITE 
GO
