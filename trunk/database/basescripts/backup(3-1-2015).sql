/****** Object:  ForeignKey [FK_CustomerId]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUserMapping]'))
ALTER TABLE [dbo].[CustomerUserMapping] DROP CONSTRAINT [FK_CustomerId]
GO
/****** Object:  ForeignKey [FK_UserId]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUserMapping]'))
ALTER TABLE [dbo].[CustomerUserMapping] DROP CONSTRAINT [FK_UserId]
GO
/****** Object:  ForeignKey [FK_UserAccess_UserId]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAccess_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAccess]'))
ALTER TABLE [dbo].[UserAccess] DROP CONSTRAINT [FK_UserAccess_UserId]
GO
/****** Object:  ForeignKey [FK_UserRolesMapping_RoleId]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRolesMapping_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRolesMapping]'))
ALTER TABLE [dbo].[UserRolesMapping] DROP CONSTRAINT [FK_UserRolesMapping_RoleId]
GO
/****** Object:  ForeignKey [FK_UserRolesMapping_UserId]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRolesMapping_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRolesMapping]'))
ALTER TABLE [dbo].[UserRolesMapping] DROP CONSTRAINT [FK_UserRolesMapping_UserId]
GO
/****** Object:  ForeignKey [FK_UserTypeMapping_TypeId]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserTypeMapping_TypeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserTypeMapping]'))
ALTER TABLE [dbo].[UserTypeMapping] DROP CONSTRAINT [FK_UserTypeMapping_TypeId]
GO
/****** Object:  ForeignKey [FK_UserTypeMapping_UserId]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserTypeMapping_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserTypeMapping]'))
ALTER TABLE [dbo].[UserTypeMapping] DROP CONSTRAINT [FK_UserTypeMapping_UserId]
GO
/****** Object:  Table [dbo].[CustomerUserMapping]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerUserMapping]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerUserMapping]
GO
/****** Object:  StoredProcedure [dbo].[EditSession]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EditSession]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[EditSession]
GO
/****** Object:  StoredProcedure [dbo].[FindUser]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FindUser]
GO
/****** Object:  StoredProcedure [dbo].[GetUserByID]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserByID]
GO
/****** Object:  StoredProcedure [dbo].[CreateSession]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateSession]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateSession]
GO
/****** Object:  Table [dbo].[UserAccess]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAccess]') AND type in (N'U'))
DROP TABLE [dbo].[UserAccess]
GO
/****** Object:  Table [dbo].[UserRolesMapping]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRolesMapping]') AND type in (N'U'))
DROP TABLE [dbo].[UserRolesMapping]
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddUser]
GO
/****** Object:  Table [dbo].[UserTypeMapping]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserTypeMapping]') AND type in (N'U'))
DROP TABLE [dbo].[UserTypeMapping]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserTypes]') AND type in (N'U'))
DROP TABLE [dbo].[UserTypes]
GO
/****** Object:  Table [dbo].[Claims]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claims]') AND type in (N'U'))
DROP TABLE [dbo].[Claims]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Config]') AND type in (N'U'))
DROP TABLE [dbo].[Config]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
DROP TABLE [dbo].[Address]
GO
/****** Object:  Table [dbo].[UserSession]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSession]') AND type in (N'U'))
DROP TABLE [dbo].[UserSession]
GO
/****** Object:  Table [dbo].[CusomterConfigMapping]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CusomterConfigMapping]') AND type in (N'U'))
DROP TABLE [dbo].[CusomterConfigMapping]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Phone]') AND type in (N'U'))
DROP TABLE [dbo].[Phone]
GO
/****** Object:  Table [dbo].[PhoneTypes]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhoneTypes]') AND type in (N'U'))
DROP TABLE [dbo].[PhoneTypes]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 03/01/2015 21:10:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type in (N'U'))
DROP TABLE [dbo].[SystemUser]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemUser](
	[id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MiddleName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DOB] [date] NULL,
	[PlaceOfBirth] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateUserId] [uniqueidentifier] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateUserId] [uniqueidentifier] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[SystemUser] ([id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'57bf88e1-b8a0-4aa6-8e99-0cc3e02cd64e', N'Pilar', NULL, N'Ackerman', CAST(0x7F140B00 AS Date), N'Cairo, Egypt', NULL, NULL, NULL, NULL)
INSERT [dbo].[SystemUser] ([id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', N'Pilar', N'Ackerman', NULL, CAST(0x7F140B00 AS Date), N'Cairo, Egypt', NULL, CAST(0x0000A44D0139460D AS DateTime), NULL, NULL)
INSERT [dbo].[SystemUser] ([id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'a692524f-8c4b-432b-8703-5609d09c809a', N'Pilar', N'Ackerman', NULL, CAST(0x7F140B00 AS Date), N'Cairo, Egypt', NULL, NULL, NULL, NULL)
INSERT [dbo].[SystemUser] ([id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'5a41d407-6907-4331-ad36-ddb694e87861', N'Pilar', NULL, N'Ackerman', CAST(0x7F140B00 AS Date), N'Cairo, Egypt', NULL, NULL, NULL, NULL)
INSERT [dbo].[SystemUser] ([id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'46e0386b-228c-4231-a20f-e7c1e6e5a756', N'Pilar', N'Ackerman', NULL, CAST(0x7F140B00 AS Date), N'Cairo, Egypt', NULL, CAST(0x0000A44E0153BFC3 AS DateTime), NULL, NULL)
/****** Object:  Table [dbo].[Roles]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[Name] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[PhoneTypes]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhoneTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PhoneTypes](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_PhoneTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Phone]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Phone](
	[id] [uniqueidentifier] NOT NULL,
	[PhoneNumber] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Churches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[CusomterConfigMapping]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CusomterConfigMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CusomterConfigMapping](
	[ConfigId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CusomterConfigMapping] PRIMARY KEY CLUSTERED 
(
	[ConfigId] ASC,
	[CustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[UserSession]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSession]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[IsLogged] [bit] NOT NULL,
	[IsExpired] [bit] NOT NULL,
	[LoginDateTime] [datetime] NOT NULL,
	[IpAddress] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_UserSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[UserSession] ON
INSERT [dbo].[UserSession] ([Id], [SessionId], [UserId], [IsLogged], [IsExpired], [LoginDateTime], [IpAddress]) VALUES (5, N'E0660BDD-D286-4298-B09B-59D06370B6FD', N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', 1, 0, CAST(0x0000A44E014D24C3 AS DateTime), N'3.26.62.66')
INSERT [dbo].[UserSession] ([Id], [SessionId], [UserId], [IsLogged], [IsExpired], [LoginDateTime], [IpAddress]) VALUES (6, N'8A7EB51F-7255-4F06-BE6A-25C0E99ACDEF', N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', 1, 0, CAST(0x0000A44E014EFB33 AS DateTime), N'3.26.62.66')
INSERT [dbo].[UserSession] ([Id], [SessionId], [UserId], [IsLogged], [IsExpired], [LoginDateTime], [IpAddress]) VALUES (7, N'771E3460-DA00-4840-8856-BBA18B7AB2A5', N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', 1, 0, CAST(0x0000A44E014EFDCC AS DateTime), N'3.26.62.66')
INSERT [dbo].[UserSession] ([Id], [SessionId], [UserId], [IsLogged], [IsExpired], [LoginDateTime], [IpAddress]) VALUES (8, N'6DFB8816-A7F4-4C71-B1C2-FF1CB309F011', N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', 1, 0, CAST(0x0000A44E014EFEC9 AS DateTime), N'3.26.62.66')
INSERT [dbo].[UserSession] ([Id], [SessionId], [UserId], [IsLogged], [IsExpired], [LoginDateTime], [IpAddress]) VALUES (9, N'702292B8-627B-4385-A69A-650D35CC180B', N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', 1, 0, CAST(0x0000A44E015305A0 AS DateTime), N'3.26.62.66')
INSERT [dbo].[UserSession] ([Id], [SessionId], [UserId], [IsLogged], [IsExpired], [LoginDateTime], [IpAddress]) VALUES (10, N'73BB72EE-6817-4EA2-A21D-39F4A108AC2B', N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', 1, 0, CAST(0x0000A44E0153BFD1 AS DateTime), N'3.26.62.66')
INSERT [dbo].[UserSession] ([Id], [SessionId], [UserId], [IsLogged], [IsExpired], [LoginDateTime], [IpAddress]) VALUES (11, N'66DC28DB-444F-433A-AC92-A25D533EA79A', N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', 1, 0, CAST(0x0000A44E0153C48E AS DateTime), N'3.26.62.66')
INSERT [dbo].[UserSession] ([Id], [SessionId], [UserId], [IsLogged], [IsExpired], [LoginDateTime], [IpAddress]) VALUES (12, N'9E2FF29A-C3CC-4A62-8F03-072CEB673DFB', N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', 1, 0, CAST(0x0000A44E0153C6BC AS DateTime), N'3.26.62.66')
INSERT [dbo].[UserSession] ([Id], [SessionId], [UserId], [IsLogged], [IsExpired], [LoginDateTime], [IpAddress]) VALUES (13, N'F18DD558-6D16-4C27-8AA3-4D9D61C0E65B', N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', 1, 0, CAST(0x0000A44E0153ED11 AS DateTime), N'3.26.62.66')
SET IDENTITY_INSERT [dbo].[UserSession] OFF
/****** Object:  Table [dbo].[Address]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Address](
	[id] [uniqueidentifier] NOT NULL,
	[Address1] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Config]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Config]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Config](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Value] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Claims]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Claims](
	[ClaimId] [int] NOT NULL,
	[Name] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserTypes](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[UserTypeMapping]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserTypeMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserTypeMapping](
	[TypeId] [int] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserTypeMapping] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddUser] 
	@FName nvarchar(250),
	@LName nvarchar(250),
	@MName nvarchar(50),
	@DOB date,
	@POB nvarchar(50)
AS
BEGIN
	INSERT INTO SystemUser 
	(id, FirstName, MiddleName, LastName, DOB, PlaceOfBirth, CreateDate) VALUES
	(NEWID(), @FName, @MName, @LName, @DOB, @POB, SYSDATETIME())	
END
' 
END
GO
/****** Object:  Table [dbo].[UserRolesMapping]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRolesMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserRolesMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRolesMapping] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[UserAccess]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserAccess]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserAccess](
	[id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UserName] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LoginAttemps] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsPasswordExpired] [bit] NOT NULL,
 CONSTRAINT [PK_UserAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  StoredProcedure [dbo].[CreateSession]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateSession]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateSession] 
	@UserId nvarchar(250),
	@IP nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sessID varchar(500) = NEWID();
	
    INSERT INTO UserSession
    (SessionId, UserId, IsLogged, IsExpired, LoginDateTime, IpAddress) 
    OUTPUT @sessID
    VALUES    
    (@sessID, @UserId, N''true'', N''false'', SYSDATETIME(), @IP)
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByID]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetUserByID] 
    @UserId nvarchar(50)
AS 
    SET NOCOUNT ON;
    SELECT *
    FROM SystemUser
    WHERE Id = @UserId;
' 
END
GO
/****** Object:  StoredProcedure [dbo].[FindUser]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FindUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindUser] 
	@FName nvarchar(250) = null,
    @MName nvarchar(250) = null,
    @LName nvarchar(250) = null,
    @DOB date = null 
AS
BEGIN
	 SET NOCOUNT ON;
    SELECT *
    FROM SystemUser sysuser
    WHERE 
	    (@FName IS NULL OR (FirstName = @FName))
	AND (@MName  IS NULL OR (MiddleName  = @MName ))
	AND (@LName  IS NULL OR (LastName  = @LName ))
	AND (@DOB  IS NULL OR (DOB = @DOB ))
	OPTION (RECOMPILE) 
					   ---<<<< Use if on for SQL 2008 SP1 CU5 (10.0.2746) and later. 
					   ---<<<< The OPTION(RECOMPILE) will recompile your query, only 
					   ---<<<< the version listed will recompile it based on the current 
					   ---<<<< run time values of the local variables, which will give you
					   ---<<<< the best performance.
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[EditSession]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EditSession]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EditSession] 
	@SessionId nvarchar(250),
	@isLogged bit = 1,
	@isExpired bit = 0
AS
BEGIN	
    UPDATE UserSession
    SET IsLogged = @isLogged,
		IsExpired = @isExpired 
    WHERE SessionId = @SessionId
END
' 
END
GO
/****** Object:  Table [dbo].[CustomerUserMapping]    Script Date: 03/01/2015 21:10:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerUserMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerUserMapping](
	[CustomerId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CustomerUserMapping] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  ForeignKey [FK_CustomerId]    Script Date: 03/01/2015 21:10:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUserMapping]'))
ALTER TABLE [dbo].[CustomerUserMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUserMapping]'))
ALTER TABLE [dbo].[CustomerUserMapping] CHECK CONSTRAINT [FK_CustomerId]
GO
/****** Object:  ForeignKey [FK_UserId]    Script Date: 03/01/2015 21:10:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUserMapping]'))
ALTER TABLE [dbo].[CustomerUserMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[SystemUser] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUserMapping]'))
ALTER TABLE [dbo].[CustomerUserMapping] CHECK CONSTRAINT [FK_UserId]
GO
/****** Object:  ForeignKey [FK_UserAccess_UserId]    Script Date: 03/01/2015 21:10:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAccess_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAccess]'))
ALTER TABLE [dbo].[UserAccess]  WITH CHECK ADD  CONSTRAINT [FK_UserAccess_UserId] FOREIGN KEY([id])
REFERENCES [dbo].[SystemUser] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserAccess_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserAccess]'))
ALTER TABLE [dbo].[UserAccess] CHECK CONSTRAINT [FK_UserAccess_UserId]
GO
/****** Object:  ForeignKey [FK_UserRolesMapping_RoleId]    Script Date: 03/01/2015 21:10:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRolesMapping_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRolesMapping]'))
ALTER TABLE [dbo].[UserRolesMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserRolesMapping_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRolesMapping_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRolesMapping]'))
ALTER TABLE [dbo].[UserRolesMapping] CHECK CONSTRAINT [FK_UserRolesMapping_RoleId]
GO
/****** Object:  ForeignKey [FK_UserRolesMapping_UserId]    Script Date: 03/01/2015 21:10:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRolesMapping_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRolesMapping]'))
ALTER TABLE [dbo].[UserRolesMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserRolesMapping_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[SystemUser] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRolesMapping_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRolesMapping]'))
ALTER TABLE [dbo].[UserRolesMapping] CHECK CONSTRAINT [FK_UserRolesMapping_UserId]
GO
/****** Object:  ForeignKey [FK_UserTypeMapping_TypeId]    Script Date: 03/01/2015 21:10:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserTypeMapping_TypeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserTypeMapping]'))
ALTER TABLE [dbo].[UserTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserTypeMapping_TypeId] FOREIGN KEY([UserId])
REFERENCES [dbo].[SystemUser] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserTypeMapping_TypeId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserTypeMapping]'))
ALTER TABLE [dbo].[UserTypeMapping] CHECK CONSTRAINT [FK_UserTypeMapping_TypeId]
GO
/****** Object:  ForeignKey [FK_UserTypeMapping_UserId]    Script Date: 03/01/2015 21:10:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserTypeMapping_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserTypeMapping]'))
ALTER TABLE [dbo].[UserTypeMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserTypeMapping_UserId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[UserTypes] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserTypeMapping_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserTypeMapping]'))
ALTER TABLE [dbo].[UserTypeMapping] CHECK CONSTRAINT [FK_UserTypeMapping_UserId]
GO
