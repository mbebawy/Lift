USE [master]
GO
/****** Object:  Database [SaintsCore]    Script Date: 12/5/2015 9:16:22 PM ******/
CREATE DATABASE [SaintsCore] ON  PRIMARY 
( NAME = N'SaintsCore_tmp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MBMSSQLSERVER\MSSQL\DATA\SaintsCore_tmp.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SaintsCore_tmp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MBMSSQLSERVER\MSSQL\DATA\SaintsCore_tmp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SaintsCore] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaintsCore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaintsCore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaintsCore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaintsCore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaintsCore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaintsCore] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaintsCore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SaintsCore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaintsCore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaintsCore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaintsCore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaintsCore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaintsCore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaintsCore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaintsCore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaintsCore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SaintsCore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaintsCore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaintsCore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaintsCore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaintsCore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaintsCore] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SaintsCore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaintsCore] SET RECOVERY FULL 
GO
ALTER DATABASE [SaintsCore] SET  MULTI_USER 
GO
ALTER DATABASE [SaintsCore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaintsCore] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SaintsCore', N'ON'
GO
USE [SaintsCore]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [uniqueidentifier] NOT NULL,
	[Address1] [nvarchar](250) NOT NULL,
	[Address2] [nvarchar](250) NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Claims]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claims](
	[ClaimId] [int] NOT NULL,
	[Name] [nvarchar](250) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 12/5/2015 9:16:23 PM ******/
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
/****** Object:  Table [dbo].[CusomterConfigMapping]    Script Date: 12/5/2015 9:16:23 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 12/5/2015 9:16:23 PM ******/
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
/****** Object:  Table [dbo].[CustomerUserMapping]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerUserMapping](
	[CustomerId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Emails]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[EmailType] [nvarchar](50) NULL,
	[IsPrimaryEmail] [bit] NOT NULL,
 CONSTRAINT [PK_Emails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OccupationAddressMapping]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OccupationAddressMapping](
	[OccupationId] [uniqueidentifier] NOT NULL,
	[AddressId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Occupations]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occupations](
	[Id] [uniqueidentifier] NOT NULL,
	[CompnayName] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsCurrentJob] [bit] NULL,
 CONSTRAINT [PK_Occupations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phones]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[PhoneType] [nvarchar](50) NULL,
	[PhoneDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhoneTypes]    Script Date: 12/5/2015 9:16:23 PM ******/
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
/****** Object:  Table [dbo].[RoleClaimMapping]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaimMapping](
	[RoleId] [int] NOT NULL,
	[ClaimId] [int] NOT NULL,
 CONSTRAINT [PK_RoleClaimMapping] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[ClaimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/5/2015 9:16:23 PM ******/
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
/****** Object:  Table [dbo].[UserAddressMapping]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddressMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[AddressId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserFOCMapping]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFOCMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[FatherUserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserFOCMapping] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[FatherUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserOccupationMapping]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOccupationMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[OccupationId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRelationshipsMapping]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRelationshipsMapping](
	[ChildUserId] [uniqueidentifier] NULL,
	[ParentId] [uniqueidentifier] NULL,
	[UserTypeId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRolesMapping]    Script Date: 12/5/2015 9:16:23 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[PlaceOfBirth] [nvarchar](50) NULL,
	[CreateUserId] [uniqueidentifier] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateUserId] [uniqueidentifier] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersEmailsMapping]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersEmailsMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[EmailId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersPhoneMapping]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersPhoneMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[PhoneId] [int] NOT NULL,
 CONSTRAINT [PK_UsersPhoneMapping] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[PhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 12/5/2015 9:16:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201503180025137_InitialCreate', N'RESTService.DataAccess.AuthContext', 0x1F8B0800000000000400DD5CDD6EE3B815BE2FD0771074D52DB2567E7606D3C0DE45D693B4C14E7E30CE2C7A37A025DA2146A2B412954D50F4C97AD147EA2BF450A2645122654A56646731C020E2CF770E0F0FC9C3A34FFEDF7FFE3BFDE939F0AD271C2724A433FB64726C5B98BAA147E87A66A76CF5FD07FBA71FFFFCA7E9A5173C5BBF16EDCE783BE8499399FDC85874EE3889FB8803944C02E2C66112AED8C40D030779A1737A7CFC37E7E4C4C100610396654D3FA7949100670FF0380FA98B239622FF26F4B09F8872A85964A8D62D0A70122117CFECCF978B87058E9F888B271F114317AE8B93C4B62E7C82409B05F657B685280D1962A0EBF997042F581CD2F5228202E43FBC4418DAAD909F603186F34D73D3E11C9FF2E1389B8E05949B262C0C3A029E9C09FB38F5EEBDAC6C97F6030B5E82A5D90B1F7566C5997DEDE1ACE873E88301EA02CFE77ECC1BCFEC9B52C44512DD6236293A4E72C8AB18E07E0FE36F932AE29165DCEFA8F4A7D3C931FF7764CD539FA5319E519CB218F947D67DBAF489FB0B7E7908BF613A3B3B59AECE3EBC7B8FBCB3F73FE0B377D591C258A19D540045F77118E11874C3AB72FCB6E5C8FD9C7AC7B25BA54F6E15F025581AB675839E3F61BA668FB0684E3FD8D61579C65E51229CEB0B25B092A0138B5378BC4D7D1F2D7D5CD63BAD32F9FF2D524FDFBD1F44EA2D7A22EB6CEA6BF261E1C4B0AE3E633FAB4D1E49942F2F69BEBF8A66577118F067D9BFF2DAAF8B308D5D3E9850DBE401C56BCC64EDA6CEC6798D5C9A430DEFD605EAE1BB36D7B4E9DECAA67C407D56422162ECD550E8FBBA727B79DCF0DE76F89EF65636D1CB00117F805DD4400A04312B1207B81CE5CF21F82CA29D75BE47490253EBFD03258F2DAAC39F03A8BEC06E1A83432D180AA2579776FF18527C9B064BBE6AC69335D8D43CFC1E5E219785F125E5BD76C6FB14BADFC2945D520F4259FC85B905207F7C208139C020EAE4B1F4153833F6E621C4E805E0356567A79DE1F856B6EF2866EE2312B487315CCDAF45BB661C53A9D60632D536AA48A64DC34FE19A50030D8B761A0DF3EA760D459BAE1A7224030545338D7E596DBB7A7993C122C16C3E863F9C33D83FFA09AD5BF015332E601BC47FC714C7B05779F788311CD3CD0C986C0EFB8808B2E9E3425FFD00CA24FD8AFC746851BD5643B6F6875F0D19ECE1AF864C4D287E221E0F3D0C2E48456380376AAFBE7B6D5F7335CDC65E0ED230C7163ECE1EA05B2E174912BA245B058AD498486CC8FA43A0666DCF72E4A3A9674A6060E0E82402D78612189B5D77AA3BFA11FB9861EBC2CD53877394B8C86B9A1106E47550AC3851158A6D3226B2727F6DC8044FC731EF84F84D2781954A286B2E0B425D12217FAB956A3D0D8F303EF65246BDE6238E30E502B75AC244B83A41C21528E5D426659B85A64EC5E3CC1CB11A9A6E9B70659CAA9EF1915D51151D6B341331DBAB3AA3C250237AA3C21826D2B5A9BDD1DD51DC438C26BD7E29391C77AC5D85349A89A0E9F5DD5136D4D8EE281BE36DB9637EEB349AF3DA15F4709C51BEF8EEEF986E5A696C4F942C71608E984791D087410F1C1739B3943DF232FCCC14B72B504F5CB01211ABD61D82632E3093532D9B805519483AED2075AF6903DC78D61650F19EAF15A8936645C6AD1551C4031D608B34592BACD8D76BB095796F62575F76561AEA5F89D61DD2E8EE508EAC748586631B85FA151C8537D4F72979E01D8C22A54EF556D186B1C6816C653C620E0CECA28A3B358629C630AC650A5FDC62195544651C53F5B74C2D04D258A618C3B096118EB8C5308AB3DDF474EF6F16F9301E6821153988F2F428EBA64ECE711205534743869ADEA02822745D214789126B9133A3E6DF2FBAD385821CC37113056BA8D4B694C4C218AD71AD164483A657244E1867642D11CFC0CCBDA0D1AC7A566A76F44252F5386C4E5CB1B517ADF9DFA287921E269F9FCDB842E05CC1E0021E9964B96DC5D4ABBB5B9CA7867C142BD2E9F3D04F03AA0F94F4BDF33767D5FE79491361EAD4F46FC4420D8B350255D9FC4693D35C0F034E541997F49F2C3D84CEE445305935BA2EC0D4A31499A32A8A2E9BB4B7C9D3C5283B4DD88E9335D6CA12A4902A8028EA8851E11534C02A75E6A832F5A38A29D79823D6F81D55C85A55072DAB2C0E49C96A452F3C8D45D52DCC2534791B55F466AD39B282C151855654F7C056E85CAF334755903CAAC08A6A73EC0DE3A3BE851EF0D9A5BD98ECB417E637D7DD36440DC6EBEC8AC31C7E95D7EB55A04A71472CF102BD0126CA0FD2A3B417BA9D3C2A4F5AECE6511A0CFD0E24BD9C9637A0D637EA7A4CE98DB3B4C9B7BD71D7E375F3DB57F58EC62DAFDEA4945EDEF66AB7BAA9B8616DFF0EA671E5CA9BD856614638E05F128683CC9D268BDFFCB94F30DFCE8B06378892154E58CEB2B04F8F4F4E6B9FD11CCE272D4E92787E87EF5AE4391B8130459F50EC3EA2B8495FD8E1B38F0D6823B17C4D3DFC3CB3FF95F53ACFF218FCAFACF8C8BA4EBE50F25B0A150F718AAD7F373997C3D3E0FBDA7DF48F16CCAD7AFDCFAF79D723EB2E8615736E1DD76CD96786E54F193A699377DD419B7E1F38BCDDD524F1FF95A8B5D5D09FEEBF246C10AA7FA1E55F02F4FC5D57D59474FE9D101594FDA1F00631A18E92DF074B4BC7F7E0916574FC6E8355D3F3FBA8A6A5E613DA1DAC4ECC37DF838A9E7B3C671497A231B6A4CCCE5B39CF3B1120F77D3035A8D13B2DF426FDB903DC0E14E71E9EF1C6D8C1839D8E0AF2EF60D8FB74ED5767FC1E0AC977C3DED82FB7776C9E90B1CC37C9E23D246E9A20E0EC99AE3BB67FE992B7874C84ECC0CB3D24071354AC3D1370C776305D2EF7901DCC9C697B48FEB5EFE3711FDE657C3CEE9D3DDB240E695EB6A892BCDB68B279461C6EEFCB103C208F16F3CF13D5F42D9DB08DA768056E9AE885EA79636D82B7526EDB05761326CEF35689A24DBB580D9FB24DB6D8EA5B658B36EDB2358CC57DB07B95FC4115DD7ACBF6D5C66E7A036C5EED008CCD2039A6E63DF91B20EFEE6E086995685EEF1E3C577777330CB92C3A70739B6F67E144ACFC96219CCA09596F20F82F1B52EC4A6761D9E69AAEC2E248AE695434A9E5546E30431E2707C48CAC90CBA09A6785B3AFA6B34C1B7F37B1C4DE35BD4B59943218320E96BE94A2E2477B9BFC8C802CEB3CBD8BB2DFFD186208A026E1D9F43BFA734A7CAFD4FB4A91C5D140F09841E460F95C329E8B5DBF9448B721350412E62B439D071C443E80257774819E701FDDC0FD3EE135725F36393B1DC8F68990CD3EFD48D03A4641223036FDE1117CD80B9E7FFC3F3AA7A1DCD2530000, N'6.1.0-30225')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'b1c82a36-503c-4b65-879e-3e7ac4857492', N't', NULL, N't', N't', N't', N't')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'be626d46-734c-4185-859a-4b3a1ce3878a', N'355 south worcester syt', NULL, N'norton', N'ma', N'02766', N'02766')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'81b7e327-ac8d-4603-8189-6699bff78ffd', N'test', NULL, N'test', N'test', N'test', N'test')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'052e3fde-d951-4c89-8532-877c8f7138de', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'4f37c8d3-9f79-49ba-9626-4d055819917a', N'User')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 

INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'd6de0fb8-2a7e-4d1b-b9cc-f3c58faef686', N'Access', N'CanGetUsers')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (2, N'd6de0fb8-2a7e-4d1b-b9cc-f3c58faef686', N'Access', N'CanEditUsers')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd6de0fb8-2a7e-4d1b-b9cc-f3c58faef686', N'052e3fde-d951-4c89-8532-877c8f7138de')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', NULL, 0, N'AIHA6QwxL28dSGUF5caZnZA2Vk8nJhbrqscP0n6il/5nK3TmPEEsnxsor0n/BMXw0w==', N'fcabb1a4-7eea-418e-bc8b-6832f00731af', NULL, 0, 0, NULL, 0, 0, N'minabebawy')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd6de0fb8-2a7e-4d1b-b9cc-f3c58faef686', NULL, 0, N'ACA8XFsIQkSQrjK498iG+mwwEuhA3phmz74QMz0+eLV0JoiLqA1buIlRXfp3S5MiPA==', N'17587cfc-0064-4106-b26e-8203876d2b6c', NULL, 0, 0, NULL, 0, 0, N'mina2')
INSERT [dbo].[Customer] ([id], [Name], [Description], [Address1], [Address2], [City], [State], [Zip]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'holy family', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'ce44edbc-f3a8-4419-be12-9c724f97fe04')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'a446eb65-f23e-4c78-abf3-9fe006326ac6')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'ed715d36-6608-45b1-868d-0feae7ca842c')
SET IDENTITY_INSERT [dbo].[Emails] ON 

INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (1, N'mina.bebawy@gmail.com', N'personal', 1)
SET IDENTITY_INSERT [dbo].[Emails] OFF
SET IDENTITY_INSERT [dbo].[Phones] ON 

INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (1, N'4693949299', N'cellphone', NULL)
SET IDENTITY_INSERT [dbo].[Phones] OFF
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'ce44edbc-f3a8-4419-be12-9c724f97fe04', N'b1c82a36-503c-4b65-879e-3e7ac4857492')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'a446eb65-f23e-4c78-abf3-9fe006326ac6', N'be626d46-734c-4185-859a-4b3a1ce3878a')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'ed715d36-6608-45b1-868d-0feae7ca842c', N'81b7e327-ac8d-4603-8189-6699bff78ffd')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'57bf88e1-b8a0-4aa6-8e99-0cc3e02cd64e', N'Mina', N'Botros', N'Ackerman', CAST(N'1989-02-11' AS Date), N'Cairo, Egypt', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'ed715d36-6608-45b1-868d-0feae7ca842c', N'test 2', N'test 2', NULL, CAST(N'0001-01-01' AS Date), N'test', NULL, CAST(N'2015-12-05 21:05:36.820' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', N'Mina', N'Bebawy', NULL, CAST(N'1989-02-11' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-02-28 19:00:35.670' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'a692524f-8c4b-432b-8703-5609d09c809a', N'Michel', N'Botros', NULL, CAST(N'1989-02-11' AS Date), N'Cairo, Egypt', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'ce44edbc-f3a8-4419-be12-9c724f97fe04', N't', N't', NULL, CAST(N'0001-01-01' AS Date), N't', NULL, CAST(N'2015-12-05 18:43:09.440' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'a446eb65-f23e-4c78-abf3-9fe006326ac6', N'mina test', N'mina test', NULL, CAST(N'0001-01-01' AS Date), N'test', NULL, CAST(N'2015-12-05 18:44:46.030' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'5a41d407-6907-4331-ad36-ddb694e87861', N'Monika', N'Nashed', N'Ackerman', CAST(N'1989-02-11' AS Date), N'Cairo, Egypt', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (N'46e0386b-228c-4231-a20f-e7c1e6e5a756', N'Ward', N'Bowman', NULL, CAST(N'1989-02-11' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-03-01 20:36:59.317' AS DateTime), NULL, NULL)
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', 1)
INSERT [dbo].[UsersPhoneMapping] ([UserId], [PhoneId]) VALUES (N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', 1)
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (1, N'Husband')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (2, N'Wife')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (3, N'Descendant')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/5/2015 9:16:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/5/2015 9:16:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/5/2015 9:16:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/5/2015 9:16:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/5/2015 9:16:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/5/2015 9:16:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CustomerUserMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[CustomerUserMapping] CHECK CONSTRAINT [FK_CustomerId]
GO
ALTER TABLE [dbo].[CustomerUserMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CustomerUserMapping] CHECK CONSTRAINT [FK_UserId]
GO
ALTER TABLE [dbo].[UserAddressMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressMapping_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserAddressMapping] CHECK CONSTRAINT [FK_UserAddressMapping_Users]
GO
ALTER TABLE [dbo].[UserOccupationMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserOccupationMapping_Occupations] FOREIGN KEY([OccupationId])
REFERENCES [dbo].[Occupations] ([Id])
GO
ALTER TABLE [dbo].[UserOccupationMapping] CHECK CONSTRAINT [FK_UserOccupationMapping_Occupations]
GO
ALTER TABLE [dbo].[UserOccupationMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserOccupationMapping_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserOccupationMapping] CHECK CONSTRAINT [FK_UserOccupationMapping_Users]
GO
ALTER TABLE [dbo].[UsersEmailsMapping]  WITH CHECK ADD  CONSTRAINT [FK_UsersEmailsMapping_Emails] FOREIGN KEY([EmailId])
REFERENCES [dbo].[Emails] ([Id])
GO
ALTER TABLE [dbo].[UsersEmailsMapping] CHECK CONSTRAINT [FK_UsersEmailsMapping_Emails]
GO
ALTER TABLE [dbo].[UsersEmailsMapping]  WITH CHECK ADD  CONSTRAINT [FK_UsersEmailsMapping_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersEmailsMapping] CHECK CONSTRAINT [FK_UsersEmailsMapping_Users]
GO
/****** Object:  StoredProcedure [dbo].[Claims_Get_ByRole]    Script Date: 12/5/2015 9:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Claims_Get_ByRole]
	@roleId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Select c.* from Claims c
	right join [dbo].[RoleClaimMapping] rcm on rcm.claimId = c.ClaimId
	where rcm.roleId = @roleId

  


END


GO
/****** Object:  StoredProcedure [dbo].[GetCustomerIdByUserId]    Script Date: 12/5/2015 9:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomerIdByUserId]
	@userId uniqueidentifier,
	@CustomerId uniqueidentifier output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

	SELECT @CustomerId=  [CustomerId]     
	FROM [dbo].[CustomerUserMapping]
	where userid = @userId

	
END


GO
/****** Object:  StoredProcedure [dbo].[Phones_Add]    Script Date: 12/5/2015 9:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Phones_Add] 
	 @PhoneNumber nvarchar(50),
	@PhoneType nvarchar(50),
	@Description nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO [dbo].[Phones]
			   ([PhoneNumber]
			   ,[PhoneType]
			   ,[Description])
		 VALUES
			   (@PhoneNumber,
				@PhoneType,
				@Description)
END


GO
/****** Object:  StoredProcedure [dbo].[Roles_Get]    Script Date: 12/5/2015 9:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Roles_Get]
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from roles
END


GO
/****** Object:  StoredProcedure [dbo].[Session_Create]    Script Date: 12/5/2015 9:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Session_Create] 
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
    (@sessID, @UserId, N'true', N'false', SYSDATETIME(), @IP)
END


GO
/****** Object:  StoredProcedure [dbo].[Session_Edit]    Script Date: 12/5/2015 9:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Session_Edit] 
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


GO
/****** Object:  StoredProcedure [dbo].[User_Add]    Script Date: 12/5/2015 9:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[User_Add] 
    @Id uniqueidentifier,	
	@FName nvarchar(250),
	@LName nvarchar(250),
	@MName nvarchar(50),
	@DOB date,
	@POB nvarchar(50),
	@currentUserId uniqueidentifier,		
	@AddressID uniqueidentifier,
	@Address1 nvarchar(250),
    @Address2 nvarchar(250),
    @City nvarchar(50),
	@State nvarchar(50),
    @Zip nvarchar(50),
    @Country nvarchar(50)	
AS
BEGIN
    BEGIN TRAN T1;

		INSERT INTO [dbo].[Users]
			   ([Id]
			   ,[FirstName]           
			   ,[MiddleName]
			   ,[LastName]
			   ,[DOB]
			   ,[PlaceOfBirth]
			   ,[CreateDate])
		 VALUES
			   (@Id, 
			   @FName, 
			   @MName, 
			   @LName, 
			   @DOB, 
			   @POB, 
			   SYSDATETIME())		


		INSERT INTO [dbo].[Addresses]
			   ([Id]
			   ,[Address1]
			   ,[Address2]
			   ,[City]
			   ,[State]
			   ,[Zip]
			   ,[Country])
		 VALUES
			   (@AddressID
			   ,@Address1
			   ,@Address2
			   ,@City
			   ,@State
			   ,@Zip
			   ,@Country)


		INSERT INTO [dbo].[UserAddressMapping]
			   ([UserId]
			   ,[AddressId])
		 VALUES
			   (@Id
			   ,@AddressID)

	declare @customerId as uniqueidentifier
	
	execute GetCustomerIdByUserId @currentUserId, @customerId output


	INSERT INTO [dbo].[CustomerUserMapping]
           ([CustomerId]
           ,[UserId])
     VALUES
           (@customerId
           ,@Id)





	COMMIT TRAN T1;
END


GO
/****** Object:  StoredProcedure [dbo].[User_Add_Email]    Script Date: 12/5/2015 9:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[User_Add_Email] 
    @Id uniqueidentifier,	
	@currentUserId uniqueidentifier,		
	@Email nvarchar(250),
	@EmailType nvarchar(50),
	@IsPrimaryEmail bit
AS
BEGIN
    BEGIN TRAN T1;
			
			INSERT INTO [dbo].[Emails]
			   ([Email]
			   ,[EmailType]
			   ,[IsPrimaryEmail])
		 VALUES
			   (@Email,
				@EmailType,
				@IsPrimaryEmail)
		
		INSERT INTO [dbo].[UsersEmailsMapping]
			   ([UserId]
			   ,[EmailId])
		 VALUES
			   (@Id
			   ,@@IDENTITY)

	COMMIT TRAN T1;
END


GO
/****** Object:  StoredProcedure [dbo].[User_Add_Occupation]    Script Date: 12/5/2015 9:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[User_Add_Occupation] 
    @Id uniqueidentifier,
	@currentUserId uniqueidentifier,
	@OccupationID uniqueidentifier,
	@CompnayName nvarchar(50),
	@JobTitle nvarchar(50),
	@StartDate datetime,
	@EndDate datetime,
	@IsCurrentJob bit	
AS
BEGIN
    BEGIN TRAN T1;


		INSERT INTO [dbo].[Occupations]
			   ([Id]
			   ,[CompnayName]
			   ,[JobTitle]
			   ,[StartDate]
			   ,[EndDate]
			   ,[IsCurrentJob])
		 VALUES
			   (@OccupationID
			   ,@CompnayName
			   ,@JobTitle
			   ,@StartDate
			   ,@EndDate
			   ,@IsCurrentJob)


		INSERT INTO [dbo].[UserOccupationMapping]
			   ([UserId]
			   ,[OccupationId])
		 VALUES
			   (@Id
			   ,@OccupationID)

	COMMIT TRAN T1;
END


GO
/****** Object:  StoredProcedure [dbo].[User_Add_Phone]    Script Date: 12/5/2015 9:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[User_Add_Phone] 
    @Id uniqueidentifier,	
	@currentUserId uniqueidentifier,		
	@PhoneNumber nvarchar(50),
	@PhoneType nvarchar(50),
	@PhoneDescription nvarchar(50)
AS
BEGIN
    BEGIN TRAN T1;
			
		INSERT INTO [dbo].[Phones]
			   ([PhoneNumber]
			   ,[PhoneType]
			   ,[PhoneDescription])
		 VALUES
			   (@PhoneNumber,
				@PhoneType,
				@PhoneDescription)


		INSERT INTO [dbo].[UsersPhoneMapping]
				   ([UserId]
				   ,[PhoneId])
		VALUES
			(@Id
			,@@IDENTITY)

	COMMIT TRAN T1;
END


GO
/****** Object:  StoredProcedure [dbo].[User_Get]    Script Date: 12/5/2015 9:16:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[User_Get] 
	@FName nvarchar(250) = null,
    @LName nvarchar(250) = null,
    @DOB date = null,
    @POB nvarchar(50)  = null,
	@Email nvarchar(250)  = null,
    @PhoneNumber nvarchar(50)  = null,
	@UserId nvarchar(50) = null
AS
BEGIN
	SET NOCOUNT ON;
	
    SELECT sysUser.Id, sysUser.FirstName, sysUser.LastName, phone.PhoneNumber, email.Email ,sysUser.DOB, 
			sysUser.PlaceOfBirth
    FROM Users sysUser
    LEFT OUTER JOIN AspNetUsers aspUser ON aspUser.Id = sysUser.Id
	LEFT OUTER JOIN UsersPhoneMapping userPhone ON sysUser.Id = userPhone.UserId
	LEFT OUTER JOIN Phones phone ON userPhone.PhoneId = phone.Id
	LEFT OUTER JOIN UsersEmailsMapping userEmail ON sysUser.Id = userEmail.UserId
	LEFT OUTER JOIN Emails email ON userEmail.EmailId = email.Id
	LEFT OUTER JOIN UserAddressMapping userAddress ON sysUser.Id = userAddress.UserId
	--INNER JOIN Address address ON userAddress.AddressId = address.Id
    WHERE 
	    (@FName IS NULL OR (FirstName like '%' + @FName +'%'))
	AND (@LName  IS NULL OR (LastName  like  '%' + @LName + '%' ))
	AND (@DOB  IS NULL OR (DOB = @DOB ))
	AND (@POB  IS NULL OR (PlaceOfBirth = @POB ))
	AND (@Email  IS NULL OR (email.Email = @Email ))
	AND (@PhoneNumber  IS NULL OR (phone.PhoneNumber = @PhoneNumber ))
	AND (@UserId  IS NULL OR (aspUser.Id = @UserId ))
	
	OPTION (RECOMPILE) 
					   ---<<<< Use if on for SQL 2008 SP1 CU5 (10.0.2746) and later. 
					   ---<<<< The OPTION(RECOMPILE) will recompile your query, only 
					   ---<<<< the version listed will recompile it based on the current 
					   ---<<<< run time values of the local variables, which will give you
					   ---<<<< the best performance.
END


GO
USE [master]
GO
ALTER DATABASE [SaintsCore] SET  READ_WRITE 
GO
