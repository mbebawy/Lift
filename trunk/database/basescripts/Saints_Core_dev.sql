USE [master]
GO
/****** Object:  Database [SaintsCore]    Script Date: 12/29/2015 3:40:31 PM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/29/2015 3:40:31 PM ******/
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
/****** Object:  Table [dbo].[Addresses]    Script Date: 12/29/2015 3:40:32 PM ******/
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
	[Country] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[Claims]    Script Date: 12/29/2015 3:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claims](
	[ClaimId] [int] NOT NULL,
	[Name] [nvarchar](250) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[CusomterConfigMapping]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[CustomerUserMapping]    Script Date: 12/29/2015 3:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerUserMapping](
	[CustomerId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Emails]    Script Date: 12/29/2015 3:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[EmailType] [nvarchar](50) NULL,
	[IsPrimaryEmail] [bit] NULL,
 CONSTRAINT [PK_Emails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OccupationAddressMapping]    Script Date: 12/29/2015 3:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OccupationAddressMapping](
	[OccupationId] [uniqueidentifier] NOT NULL,
	[AddressId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Occupations]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[Phones]    Script Date: 12/29/2015 3:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[Id] [uniqueidentifier] NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[PhoneType] [nvarchar](50) NULL,
	[PhoneDescription] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhoneTypes]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[RelationType]    Script Date: 12/29/2015 3:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationType](
	[RelationType] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[FromLabel] [nvarchar](50) NULL,
	[ToLabel] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleClaimMapping]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[UserAddressMapping]    Script Date: 12/29/2015 3:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddressMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[AddressId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserFOCMapping]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[UserOccupationMapping]    Script Date: 12/29/2015 3:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOccupationMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[OccupationId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRelations]    Script Date: 12/29/2015 3:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRelations](
	[FromUserId] [uniqueidentifier] NOT NULL,
	[ToUserId] [uniqueidentifier] NOT NULL,
	[RelationType] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRolesMapping]    Script Date: 12/29/2015 3:40:32 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 12/29/2015 3:40:32 PM ******/
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
	[Gender] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersEmailsMapping]    Script Date: 12/29/2015 3:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersEmailsMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[EmailId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersPhoneMapping]    Script Date: 12/29/2015 3:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersPhoneMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[PhoneId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UsersPhoneMapping] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[PhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 12/29/2015 3:40:32 PM ******/
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
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'0d466494-71bd-4e74-9dee-420cc9232afb', N'6 MinaBebawy Steert', NULL, N'Norton', N'MA', N'01555', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'be626d46-734c-4185-859a-4b3a1ce3878a', N'355 south worcester syt', NULL, N'norton', N'ma', N'02766', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'81b7e327-ac8d-4603-8189-6699bff78ffd', N'test', NULL, N'test', N'test', N'test', N'test')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'66e7ea14-ac2a-4efb-989e-722b1a226773', N'46 Buttercup Ln.', NULL, N'South Grafton', N'MA', N'01560', N'United States')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'2cbb05c2-be3b-4472-af63-735e11a95e5f', N'1620 Worcester Rd.', NULL, N'Framingham', N'MA', NULL, NULL)
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'c5d41e13-353e-4d76-acb0-7624e6ed5bed', N'6 Adel Street', NULL, N'Framingham', N'MA', N'01555', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'acb5806b-e182-4aca-869d-7c6b796572fe', N'7 blackberry ln', NULL, N'Grafton', N'Massachusetts', N'01519', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'7337d66d-c355-43c1-9b47-7dd0b8318221', N'1620 Worcester Rd.', NULL, N'Framingham', N'MA', NULL, N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'49d75b17-4ce3-4580-8dac-8050db016e94', N'Test address', NULL, N'Test city', N'Ma', N'02766', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'126a555c-d90d-4cab-9f8f-8d355acdff24', N'46 Buttercup Ln.', NULL, N'South Grafton', N'MA', N'01560', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'9288ec0f-da13-4e7b-846e-8e1805925fe6', N'7 blackberry ln', NULL, N'Grafton', N'Massachusetts', N'01519', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'febfc3a7-80b1-4a5e-8804-95d30117f22d', N'7 blackberry ln', NULL, N'Grafton', N'Massachusetts', N'01519', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'b61d88c7-d47a-4471-8991-c1ea988a40bd', N'Test address', NULL, N'Test city', N'Ma', N'02766', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'c1d380ae-9098-4da1-b7fa-d5452c8b8675', N'6 Adel Street', NULL, N'Framingham', N'MA', N'01555', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'727f9487-ba81-48d1-8432-bd90071377ef', N'42 Main Street', N'', N'Upton', N'MA', N'01655', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'727f9487-ba81-48d1-8432-bd90071377ef', N'42 Main Street', N'', N'Upton', N'MA', N'01655', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'727f9487-ba81-48d1-8432-bd90071377ef', N'42 Main Street', N'', N'Upton', N'MA', N'01655', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'727f9487-ba81-48d1-8432-bd90071377e2', N'42 Main Street', N'', N'Upton', N'MA', N'01655', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'8300aece-70dd-486b-9f5b-827d6ceae9a7', N'123 Main Street', N'', N'Braintree ', N'MA', N'01877', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'8300aece-70dd-486b-9f5b-827d6ceae9a7', N'123 Main Street', N'', N'Braintree ', N'MA', N'01877', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'8300aece-70dd-486b-9f5b-827d6ceae9a7', N'123 Main Street', N'', N'Braintree ', N'MA', N'01877', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'3a9979e5-6298-4850-8b37-52e4cfcc59ea', N'111', NULL, N'Cairo', N'USA', N'01670', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'3a9979e5-6298-4850-8b37-52e4cfcc59ea', N'111', NULL, N'Cairo', N'USA', N'01670', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'0d251a90-577f-45c8-95b3-a6621c3fdd9d', N'123 Main Street', NULL, N'Braintree ', N'MA', N'01877', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'59f4302c-0c31-431d-9848-4cb04b2a82e5', N'123 Main Street', NULL, N'Braintree ', N'MA', N'01877', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'e74f4bf7-066e-4e77-8c68-7291542c87c5', N'address2', NULL, N'address2', N'address2', N'address2', N'address2')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d8', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d9', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d0', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d5', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1c5', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'84d4e526-ed04-43da-9433-5d822a2532da', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'84d4e526-ed04-43da-9433-5d822a2532da', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'85d4e526-ed04-43da-9433-5d822a2532dd', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'85d4e526-ed04-43da-9433-5d822a2532dd', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'85d4e526-ed04-43da-9433-5d822a2532dc', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'85d4e526-ed04-43da-9433-5d822a2532dc', N'111', NULL, N'Cairo', N'MA', N'01770', N'USA')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'f01052c0-a4b8-415e-900a-d5b0c04ab329', N'address', NULL, N'address', N'address', N'address', N'address')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'd8e3af95-eb6b-4a4b-bebd-d01622553add', N'customer user add', NULL, N'customer user add', N'customer user add', N'customer user add', N'customer user add')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'46a7e78c-72ce-4433-8753-283effdee3bb', N'address1', NULL, N'city', N'state', N'zip', N'country')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'19796441-fa96-45ca-8925-4c05c1c9c125', N'address2', NULL, N'address2', N'address2', N'address2', N'address2')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'29778048-2114-4d6c-88fe-c21e27805d71', N'test', NULL, N'test', N'test', N'test', N'test')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'd4bf6587-b9b2-46d0-a876-fcaa4637a883', N'address test1', NULL, N'address test1', N'address test1', N'address test1', N'address test1')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'75150f44-33ea-4d14-aab4-9c005f2694f8', N'33', NULL, N'33', N'33', N'33', N'33')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'605b6f1d-0450-4456-a6ef-33d165292f67', N'33', NULL, N'33', N'33', N'33', N'33')
INSERT [dbo].[Addresses] ([Id], [Address1], [Address2], [City], [State], [Zip], [Country]) VALUES (N'263caa77-2579-4503-8e25-82525dac1394', N'33', NULL, N'33', N'33', N'33', N'33')
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
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'6931d233-e926-4387-8e36-bc5ac1ce50fb')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'c10be7a6-7074-4972-9f5b-a1e3827a4c1d')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d0')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d1')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'45cebcd0-b19a-48e3-a1a2-fece9a70771c')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'45c8a241-a9dc-4b06-b50f-b08a6e662bf5')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'84f9448b-6019-448a-9a79-3c192cda7ff7')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'631b7531-c870-4022-8a95-54781f0dc036')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'4dcb4db6-1745-4c17-94ab-b820e1ad7e8d')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d9')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d0')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d5')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1c5')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d5')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1e5')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'49310ddc-8e6b-4c35-b2a4-dcb632575d87')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'3e7153cd-49f0-4804-adcf-a4e0ca4eca07')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'bed32b55-9cae-4135-866b-963f483fd307')
INSERT [dbo].[CustomerUserMapping] ([CustomerId], [UserId]) VALUES (N'a10e62a5-7df6-4158-a63b-dde8ee3dfa23', N'35d0967e-bfcf-4b8a-b207-8f16a49e3ffb')
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'a2448a84-637a-4875-8858-0a028fc98b1f', N'd.leidig@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'4aa4ee15-0ba0-4882-a19b-1132819d848d', N'test user3', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'97328cfb-5cc9-4d17-9421-19fd5d156651', N'mina.bebawy@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'7497434d-3dbe-41f8-9f67-1c40fc30119a', N'test email2', NULL, 1)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'5c2dd965-06bc-412c-8477-200c04d0fb86', N'address test', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'96c274c6-0b0a-4b50-b5e4-53898dcf7499', N'customer user add', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'84d4e526-ed04-43da-9433-5d822a2532bc', N'mina.botros@ge.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'84d4e526-ed04-43da-9433-5d822a2532dc', N'mina.botros@ge.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'84d4e526-ed04-43da-9433-5d822a2532dd', N'mina.botros@ge.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'dfdb37e6-6d12-4f2d-8027-6815bc201a9f', N'address', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d0', N'mina.botros@ge.com', NULL, 1)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d5', N'mina.botros@ge.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7', N'mina.botros@ge.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d8', N'mina.botros@ge.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d9', N'mina.botros@ge.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'9865c82c-7423-441a-a9a4-8f094d57b2a2', N'd.leidig@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'b0efddaa-56c2-4175-8b48-995290f8961b', N'test user3', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'f9465cc6-03ff-4b66-99ba-9f5719fdbacb', N'address2', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'e4063c32-87c1-43bf-b2be-a21e45c18b6f', N'mina.botros@ge.com', NULL, 1)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'7151e6f7-1f0b-43ab-9feb-a2e3c93020b2', N'address2', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'8b2b027d-93a7-4084-83f0-c50cbaa36cdb', N'd.leidig@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'1fb3d13c-d307-400b-8b15-cadc01db74f1', N'michaelsaid@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'1fb3d13c-d307-400b-8b15-cadc01db74f2', N'michaelsaid@gmail.com', NULL, NULL)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'c57188b7-a754-4117-82f2-e2221d2e1f2c', N'mina.bebawy@gmail.com', NULL, 1)
INSERT [dbo].[Emails] ([Id], [Email], [EmailType], [IsPrimaryEmail]) VALUES (N'92791641-48c5-4462-8a13-eb1bf63484d8', N'test user4', NULL, NULL)
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'9f7f2df9-97fe-4b9c-ab5f-cbd3d9834404', N'5082223245', NULL, NULL)
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'9f7f2df9-97fe-4b9c-ab5f-cbd3d9834404', N'5082223245', NULL, NULL)
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'9f7f2df9-97fe-4b9c-ab5f-cbd3d9834404', N'5082223245', NULL, NULL)
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'9f7f2df9-97fe-4b9c-ab5f-cbd3d9834405', N'5082223245', NULL, NULL)
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'c7dab730-ff91-4c5f-8a9c-de16c9f91d0b', N'469-394-9299', N'Cell phone', N'available')
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'64d2c8f8-d043-4bab-95ca-501023100206', N'508-414-4233', N'cell phone', NULL)
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'cfa3fee3-d47e-48c9-a9e4-21e60d45ed02', N'508-414-4233', N'cell phone', NULL)
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'd13f6f3e-6004-4455-b3d4-3b11cbf4312c', N'1111', NULL, NULL)
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', N'44444', NULL, NULL)
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'5322d802-4a87-41b1-a574-fed61272b2d6', N'555555', NULL, NULL)
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', N'333', NULL, NULL)
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'b45376a7-ea56-46a5-9dee-2a2480e17834', N'333', NULL, NULL)
INSERT [dbo].[Phones] ([Id], [PhoneNumber], [PhoneType], [PhoneDescription]) VALUES (N'32c82ece-f36e-4fd4-add9-1b73fd065ee6', N'333', NULL, NULL)
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'ce44edbc-f3a8-4419-be12-9c724f97fe04', N'b1c82a36-503c-4b65-879e-3e7ac4857492')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'a446eb65-f23e-4c78-abf3-9fe006326ac6', N'be626d46-734c-4185-859a-4b3a1ce3878a')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'3cf5d2fb-f522-499e-8615-de4a425dcaf9', N'2cbb05c2-be3b-4472-af63-735e11a95e5f')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', N'0d466494-71bd-4e74-9dee-420cc9232afb')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'c10be7a6-7074-4972-9f5b-a1e3827a4c1d', N'8300aece-70dd-486b-9f5b-827d6ceae9a7')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'c10be7a6-7074-4972-9f5b-a1e3827a4c1d', N'8300aece-70dd-486b-9f5b-827d6ceae9a7')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'c10be7a6-7074-4972-9f5b-a1e3827a4c1d', N'8300aece-70dd-486b-9f5b-827d6ceae9a7')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d0', N'3a9979e5-6298-4850-8b37-52e4cfcc59ea')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d1', N'3a9979e5-6298-4850-8b37-52e4cfcc59ea')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'c4ff170b-f78a-48a2-b96e-40e788bffed1', N'0d251a90-577f-45c8-95b3-a6621c3fdd9d')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'04aa01f4-85f4-448b-8448-9f48501e6360', N'59f4302c-0c31-431d-9848-4cb04b2a82e5')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'0f31b7c1-521c-45da-a210-9760f2aa0831', N'e74f4bf7-066e-4e77-8c68-7291542c87c5')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'ed715d36-6608-45b1-868d-0feae7ca842c', N'81b7e327-ac8d-4603-8189-6699bff78ffd')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'a33ffc44-cb73-40cc-a1bf-eca0244b8d16', N'febfc3a7-80b1-4a5e-8804-95d30117f22d')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'ff94e8b1-5cef-49c4-af2a-9dd06df97681', N'acb5806b-e182-4aca-869d-7c6b796572fe')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'6d78ef21-67ea-4c41-84fd-fe1f1542d561', N'9288ec0f-da13-4e7b-846e-8e1805925fe6')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'84d4e526-ed04-43da-9433-5d822a2532da', N'126a555c-d90d-4cab-9f8f-8d355acdff24')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'c3495900-dff1-4bb9-83fc-600406267a63', N'49d75b17-4ce3-4580-8dac-8050db016e94')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'fe6c8e6d-f6c2-4a61-851c-dcb7c938358e', N'b61d88c7-d47a-4471-8991-c1ea988a40bd')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'6931d233-e926-4387-8e36-bc5ac1ce50fb', N'7337d66d-c355-43c1-9b47-7dd0b8318221')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'e8c40fa9-eed2-40bc-9369-319ff5f470b5', N'c5d41e13-353e-4d76-acb0-7624e6ed5bed')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'631b7531-c870-4022-8a95-54781f0dc036', N'c1d380ae-9098-4da1-b7fa-d5452c8b8675')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'4dcb4db6-1745-4c17-94ab-b820e1ad7e8d', N'66e7ea14-ac2a-4efb-989e-722b1a226773')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'060121b3-59cc-4354-962b-2cdc81a761e6', N'727f9487-ba81-48d1-8432-bd90071377ef')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'060121b3-59cc-4354-962b-2cdc81a761e6', N'727f9487-ba81-48d1-8432-bd90071377ef')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'060121b3-59cc-4354-962b-2cdc81a761e6', N'727f9487-ba81-48d1-8432-bd90071377ef')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'060121b3-59cc-4354-962b-2cdc81a761e7', N'727f9487-ba81-48d1-8432-bd90071377e2')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'35c50873-bc46-4285-8f8a-8afd8bc9cefa', N'f01052c0-a4b8-415e-900a-d5b0c04ab329')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'45cebcd0-b19a-48e3-a1a2-fece9a70771c', N'd8e3af95-eb6b-4a4b-bebd-d01622553add')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'45c8a241-a9dc-4b06-b50f-b08a6e662bf5', N'46a7e78c-72ce-4433-8753-283effdee3bb')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d8', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d8')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d9', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d9')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d0', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d0')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d5', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d5')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1c5', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1c5')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d5', N'84d4e526-ed04-43da-9433-5d822a2532da')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1e5', N'84d4e526-ed04-43da-9433-5d822a2532da')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1a5', N'85d4e526-ed04-43da-9433-5d822a2532dd')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1b5', N'85d4e526-ed04-43da-9433-5d822a2532dd')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c2b5', N'85d4e526-ed04-43da-9433-5d822a2532dc')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c2a6', N'85d4e526-ed04-43da-9433-5d822a2532dc')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'84f9448b-6019-448a-9a79-3c192cda7ff7', N'29778048-2114-4d6c-88fe-c21e27805d71')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'66b15097-84df-404f-989d-1c0ec4987533', N'19796441-fa96-45ca-8925-4c05c1c9c125')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'49310ddc-8e6b-4c35-b2a4-dcb632575d87', N'd4bf6587-b9b2-46d0-a876-fcaa4637a883')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'3e7153cd-49f0-4804-adcf-a4e0ca4eca07', N'75150f44-33ea-4d14-aab4-9c005f2694f8')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'bed32b55-9cae-4135-866b-963f483fd307', N'605b6f1d-0450-4456-a6ef-33d165292f67')
INSERT [dbo].[UserAddressMapping] ([UserId], [AddressId]) VALUES (N'35d0967e-bfcf-4b8a-b207-8f16a49e3ffb', N'263caa77-2579-4503-8e25-82525dac1394')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'57bf88e1-b8a0-4aa6-8e99-0cc3e02cd64e', N'Mina', N'Botros', N'Ackerman', CAST(N'1989-02-11' AS Date), N'Cairo, Egypt', NULL, NULL, NULL, NULL, N'male')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'ed715d36-6608-45b1-868d-0feae7ca842c', N'test 2', N'test 2', NULL, CAST(N'0001-01-01' AS Date), N'test', NULL, CAST(N'2015-12-05 21:05:36.820' AS DateTime), NULL, NULL, N'female')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', N'Mina', N'Bebawy', NULL, CAST(N'0001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-02-28 19:00:35.670' AS DateTime), N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', CAST(N'2015-12-27 21:04:41.390' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'66b15097-84df-404f-989d-1c0ec4987533', N'address2', N'address2', NULL, CAST(N'0001-01-01' AS Date), N'address2', NULL, CAST(N'2015-12-26 20:45:14.673' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'060121b3-59cc-4354-962b-2cdc81a761e6', N'Michael', N'Botros', N'Said', CAST(N'1971-11-11' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-06 17:14:57.880' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'060121b3-59cc-4354-962b-2cdc81a761e7', N'Daniel', N'Botros', N'Said', CAST(N'1971-11-11' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-06 17:16:57.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'e8c40fa9-eed2-40bc-9369-319ff5f470b5', N'Adel2', N'Arteen2', NULL, CAST(N'1975-02-11' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-06 15:58:56.207' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'84f9448b-6019-448a-9a79-3c192cda7ff7', N'test all', N'test all', NULL, CAST(N'0001-01-01' AS Date), N'test', NULL, CAST(N'2015-12-26 23:03:44.263' AS DateTime), N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', CAST(N'2015-12-26 23:05:08.073' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'c4ff170b-f78a-48a2-b96e-40e788bffed1', N'Dy', N'Leidig', NULL, CAST(N'1989-11-11' AS Date), N'longisland, NY', NULL, CAST(N'2015-12-26 19:38:05.377' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'631b7531-c870-4022-8a95-54781f0dc036', N'Adel2', N'Arteen2', NULL, CAST(N'1975-02-11' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-06 15:58:59.047' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'a692524f-8c4b-432b-8703-5609d09c809a', N'Michel', N'Botros', NULL, CAST(N'1989-02-11' AS Date), N'Cairo, Egypt', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'84d4e526-ed04-43da-9433-5d822a2532da', N'Mina', N'Botros', NULL, CAST(N'1989-02-11' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-06 06:11:55.090' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'c3495900-dff1-4bb9-83fc-600406267a63', N'Hanan', N'Hanna', NULL, CAST(N'0001-01-01' AS Date), N'1/ 1/2015', NULL, CAST(N'2015-12-06 10:56:53.353' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'df930ed8-0ff9-4592-8e95-7be1c009769c', N'mian', N'bebawy test add', NULL, CAST(N'0001-01-01' AS Date), N'test', NULL, CAST(N'2015-12-26 20:23:08.197' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1a5', N'Mariam', N'Mina', N'Mina', CAST(N'2001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-11 21:00:44.027' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1b5', N'Mariam', N'Mina', N'Mina', CAST(N'2001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-11 21:00:58.300' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1c5', N'Mariam', N'Mina', N'Mina', CAST(N'2001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-11 20:58:29.507' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d0', N'Mina', N'Mina', NULL, CAST(N'2001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-11 20:15:53.133' AS DateTime), N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', CAST(N'2015-12-28 20:10:36.833' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d1', N'Mina', N'Mina', N'Mina', CAST(N'2001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-11 20:17:26.670' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d5', N'Mariam', N'Mina', N'Mina', CAST(N'2001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-11 20:58:05.280' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7', N'Mariam', N'Mina', N'Mina', CAST(N'2001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-11 20:52:47.760' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d8', N'Mariam', N'Mina', N'Mina', CAST(N'2001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-11 20:53:53.077' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d9', N'Mariam', N'Mina', N'Mina', CAST(N'2001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-11 20:56:33.087' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1e5', N'Mariam', N'Mina', N'Mina', CAST(N'2001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-11 21:00:19.487' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c2a6', N'Hany', N'Seif', N'Mina', CAST(N'2001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-11 21:01:40.983' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c2b5', N'Hany', N'Seif', N'Mina', CAST(N'2001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-11 21:01:23.713' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'35c50873-bc46-4285-8f8a-8afd8bc9cefa', N'address', N'address', NULL, CAST(N'0001-01-01' AS Date), N'address', NULL, CAST(N'2015-12-26 20:59:17.287' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'35d0967e-bfcf-4b8a-b207-8f16a49e3ffb', N'333', N'33', NULL, CAST(N'0001-01-01' AS Date), N'33', NULL, CAST(N'2015-12-26 23:11:48.347' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'bed32b55-9cae-4135-866b-963f483fd307', N'333', N'33', NULL, CAST(N'0001-01-01' AS Date), N'33', NULL, CAST(N'2015-12-26 23:11:30.823' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'0f31b7c1-521c-45da-a210-9760f2aa0831', N'address2', N'address2', NULL, CAST(N'0001-01-01' AS Date), N'address2', NULL, CAST(N'2015-12-26 20:43:35.613' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'ce44edbc-f3a8-4419-be12-9c724f97fe04', N't', N't', NULL, CAST(N'0001-01-01' AS Date), N't', NULL, CAST(N'2015-12-05 18:43:09.440' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'ff94e8b1-5cef-49c4-af2a-9dd06df97681', N'Nagwa', N'Ibrahim', NULL, CAST(N'1922-11-30' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-06 06:04:47.947' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'04aa01f4-85f4-448b-8448-9f48501e6360', N'Dy', N'Leidig', NULL, CAST(N'1989-11-11' AS Date), N'longisland, NY', NULL, CAST(N'2015-12-26 19:38:31.570' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'a446eb65-f23e-4c78-abf3-9fe006326ac6', N'mina test', N'mina test', NULL, CAST(N'0001-01-01' AS Date), N'test', NULL, CAST(N'2015-12-05 18:44:46.030' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'c10be7a6-7074-4972-9f5b-a1e3827a4c1d', N'Dy', N'Leidig', N'', CAST(N'1989-11-11' AS Date), N'longisland, NY', NULL, CAST(N'2015-12-09 18:49:01.377' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'3e7153cd-49f0-4804-adcf-a4e0ca4eca07', N'333', N'33', NULL, CAST(N'0001-01-01' AS Date), N'33', NULL, CAST(N'2015-12-26 23:05:44.553' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'45c8a241-a9dc-4b06-b50f-b08a6e662bf5', N'address test1', N'address test1', NULL, CAST(N'0001-01-01' AS Date), N'address test1', NULL, CAST(N'2015-12-26 21:50:48.973' AS DateTime), N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', CAST(N'2015-12-26 23:02:56.057' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'4dcb4db6-1745-4c17-94ab-b820e1ad7e8d', N'Monika', N'Nashed', NULL, CAST(N'1989-04-07' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-06 16:11:25.577' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'6931d233-e926-4387-8e36-bc5ac1ce50fb', N'Adel', N'Arteen', NULL, CAST(N'0001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-06 15:47:23.937' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'49310ddc-8e6b-4c35-b2a4-dcb632575d87', N'address test1', N'address test1', NULL, CAST(N'0001-01-01' AS Date), N'address test1', NULL, CAST(N'2015-12-26 21:25:34.203' AS DateTime), N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a', CAST(N'2015-12-26 22:08:03.830' AS DateTime), NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'fe6c8e6d-f6c2-4a61-851c-dcb7c938358e', N'Hanan', N'Hanna', NULL, CAST(N'0001-01-01' AS Date), N'1/ 1/2015', NULL, CAST(N'2015-12-06 10:56:58.553' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'5a41d407-6907-4331-ad36-ddb694e87861', N'Monika', N'Nashed', N'Ackerman', CAST(N'1989-02-11' AS Date), N'Cairo, Egypt', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'3cf5d2fb-f522-499e-8615-de4a425dcaf9', N'Adel', N'Arteen', NULL, CAST(N'0001-01-01' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-06 15:33:55.840' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'46e0386b-228c-4231-a20f-e7c1e6e5a756', N'Ward', N'Bowman', NULL, CAST(N'1989-02-11' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-03-01 20:36:59.317' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'a33ffc44-cb73-40cc-a1bf-eca0244b8d16', N'Nagwa', N'Ibrahim', NULL, CAST(N'1922-11-30' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-06 06:04:33.513' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'6d78ef21-67ea-4c41-84fd-fe1f1542d561', N'Nagwa', N'Ibrahim', NULL, CAST(N'1922-11-30' AS Date), N'Cairo, Egypt', NULL, CAST(N'2015-12-06 06:04:51.577' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [MiddleName], [DOB], [PlaceOfBirth], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate], [Gender]) VALUES (N'45cebcd0-b19a-48e3-a1a2-fece9a70771c', N'customer user add', N'customer user add', NULL, CAST(N'0001-01-01' AS Date), N'customer user add', NULL, CAST(N'2015-12-26 21:22:31.680' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'060121b3-59cc-4354-962b-2cdc81a761e6', N'1fb3d13c-d307-400b-8b15-cadc01db74f2')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'060121b3-59cc-4354-962b-2cdc81a761e6', N'1fb3d13c-d307-400b-8b15-cadc01db74f2')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'060121b3-59cc-4354-962b-2cdc81a761e7', N'1fb3d13c-d307-400b-8b15-cadc01db74f1')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'c10be7a6-7074-4972-9f5b-a1e3827a4c1d', N'9865c82c-7423-441a-a9a4-8f094d57b2a2')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'c10be7a6-7074-4972-9f5b-a1e3827a4c1d', N'9865c82c-7423-441a-a9a4-8f094d57b2a2')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'c10be7a6-7074-4972-9f5b-a1e3827a4c1d', N'9865c82c-7423-441a-a9a4-8f094d57b2a2')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d0', N'e4063c32-87c1-43bf-b2be-a21e45c18b6f')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d1', N'e4063c32-87c1-43bf-b2be-a21e45c18b6f')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'c4ff170b-f78a-48a2-b96e-40e788bffed1', N'8b2b027d-93a7-4084-83f0-c50cbaa36cdb')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'04aa01f4-85f4-448b-8448-9f48501e6360', N'a2448a84-637a-4875-8858-0a028fc98b1f')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d8', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d8')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d9', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d9')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d0', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d0')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d7')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d5', N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d5')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1c5', N'84d4e526-ed04-43da-9433-5d822a2532dd')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1d5', N'84d4e526-ed04-43da-9433-5d822a2532dd')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1e5', N'84d4e526-ed04-43da-9433-5d822a2532dd')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1a5', N'84d4e526-ed04-43da-9433-5d822a2532dd')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c1b5', N'84d4e526-ed04-43da-9433-5d822a2532dc')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c2b5', N'84d4e526-ed04-43da-9433-5d822a2532dc')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c2a6', N'84d4e526-ed04-43da-9433-5d822a2532bc')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'df930ed8-0ff9-4592-8e95-7be1c009769c', N'97328cfb-5cc9-4d17-9421-19fd5d156651')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'35c50873-bc46-4285-8f8a-8afd8bc9cefa', N'dfdb37e6-6d12-4f2d-8027-6815bc201a9f')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'45cebcd0-b19a-48e3-a1a2-fece9a70771c', N'96c274c6-0b0a-4b50-b5e4-53898dcf7499')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'45c8a241-a9dc-4b06-b50f-b08a6e662bf5', N'c57188b7-a754-4117-82f2-e2221d2e1f2c')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'84f9448b-6019-448a-9a79-3c192cda7ff7', N'7497434d-3dbe-41f8-9f67-1c40fc30119a')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'0f31b7c1-521c-45da-a210-9760f2aa0831', N'7151e6f7-1f0b-43ab-9feb-a2e3c93020b2')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'66b15097-84df-404f-989d-1c0ec4987533', N'f9465cc6-03ff-4b66-99ba-9f5719fdbacb')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'49310ddc-8e6b-4c35-b2a4-dcb632575d87', N'5c2dd965-06bc-412c-8477-200c04d0fb86')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'3e7153cd-49f0-4804-adcf-a4e0ca4eca07', N'4aa4ee15-0ba0-4882-a19b-1132819d848d')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'bed32b55-9cae-4135-866b-963f483fd307', N'b0efddaa-56c2-4175-8b48-995290f8961b')
INSERT [dbo].[UsersEmailsMapping] ([UserId], [EmailId]) VALUES (N'35d0967e-bfcf-4b8a-b207-8f16a49e3ffb', N'92791641-48c5-4462-8a13-eb1bf63484d8')
INSERT [dbo].[UsersPhoneMapping] ([UserId], [PhoneId]) VALUES (N'060121b3-59cc-4354-962b-2cdc81a761e6', N'9f7f2df9-97fe-4b9c-ab5f-cbd3d9834404')
INSERT [dbo].[UsersPhoneMapping] ([UserId], [PhoneId]) VALUES (N'060121b3-59cc-4354-962b-2cdc81a761e7', N'9f7f2df9-97fe-4b9c-ab5f-cbd3d9834405')
INSERT [dbo].[UsersPhoneMapping] ([UserId], [PhoneId]) VALUES (N'84f9448b-6019-448a-9a79-3c192cda7ff7', N'5322d802-4a87-41b1-a574-fed61272b2d6')
INSERT [dbo].[UsersPhoneMapping] ([UserId], [PhoneId]) VALUES (N'688307ee-aff1-4c4f-bdd9-85fea3c4c2a6', N'cfa3fee3-d47e-48c9-a9e4-21e60d45ed02')
INSERT [dbo].[UsersPhoneMapping] ([UserId], [PhoneId]) VALUES (N'35d0967e-bfcf-4b8a-b207-8f16a49e3ffb', N'32c82ece-f36e-4fd4-add9-1b73fd065ee6')
INSERT [dbo].[UsersPhoneMapping] ([UserId], [PhoneId]) VALUES (N'bed32b55-9cae-4135-866b-963f483fd307', N'b45376a7-ea56-46a5-9dee-2a2480e17834')
INSERT [dbo].[UsersPhoneMapping] ([UserId], [PhoneId]) VALUES (N'45c8a241-a9dc-4b06-b50f-b08a6e662bf5', N'd13f6f3e-6004-4455-b3d4-3b11cbf4312c')
INSERT [dbo].[UsersPhoneMapping] ([UserId], [PhoneId]) VALUES (N'b9b36101-69f2-4fef-b4f7-d7a75f5665f3', N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a')
INSERT [dbo].[UsersPhoneMapping] ([UserId], [PhoneId]) VALUES (N'f3e10e7b-0054-4841-9940-eb8137deef6a', N'b81f21cc-22ee-4f03-ba9b-1ac18e446a0a')
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (1, N'Husband')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (2, N'Wife')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (3, N'Descendant')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/29/2015 3:40:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/29/2015 3:40:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/29/2015 3:40:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/29/2015 3:40:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/29/2015 3:40:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/29/2015 3:40:34 PM ******/
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
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Gender] CHECK  (([Gender]='Female' OR [Gender]='Male'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Gender]
GO
/****** Object:  StoredProcedure [dbo].[Address_Add]    Script Date: 12/29/2015 3:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Address_Add]
	@UserId uniqueidentifier,
	@AddressID uniqueidentifier,
	@Address1 nvarchar(250),
    @Address2 nvarchar(250),
    @City nvarchar(50),
	@State nvarchar(50),
    @Zip nvarchar(50),
    @Country nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



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
			   (@UserId
			   ,@AddressID)	


END

GO
/****** Object:  StoredProcedure [dbo].[Address_Update]    Script Date: 12/29/2015 3:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[Address_Update]
	@AddressId uniqueidentifier,
	@Address1 nvarchar(250),
    @Address2 nvarchar(250),
    @City nvarchar(50),
	@State nvarchar(50),
    @Zip nvarchar(50),
    @Country nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	UPDATE [dbo].[Addresses]
	   SET
		  [Address1] = @Address1
		  ,[Address2] = @Address2
		  ,[City] = @City
		  ,[State] = @State
		  ,[Zip] = @Zip
		  ,[Country] = @Country
	 WHERE  [Id] = @AddressId


END

GO
/****** Object:  StoredProcedure [dbo].[Claims_Get_ByRole]    Script Date: 12/29/2015 3:40:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Email_Add]    Script Date: 12/29/2015 3:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Email_Add]
	-- Add the parameters for the stored procedure here
	@UserId uniqueidentifier,
	@EmailID uniqueidentifier,
	@EmailAddress nvarchar(250)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Emails]
			   ([Id]
			   ,[Email])
		 VALUES
			   (@EmailID
			   ,@EmailAddress)

		INSERT INTO [dbo].[UsersEmailsMapping]
			   ([UserId]
			   ,[EmailId])
		 VALUES
			   (@UserId
			   ,@EmailID)
END

GO
/****** Object:  StoredProcedure [dbo].[Email_Get]    Script Date: 12/29/2015 3:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Email_Get]
	@UserId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



	SELECT email.*
  FROM [dbo].[Emails] email
  right join [dbo].[UsersEmailsMapping] uem on uem.[EmailId] = email.Id
  where uem.userId = @userId

  



END

GO
/****** Object:  StoredProcedure [dbo].[Email_Update]    Script Date: 12/29/2015 3:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Email_Update]
	 @Id uniqueidentifier, 
     @Email nvarchar(250), 
     @EmailType nvarchar(50), 
     @IsPrimaryEmail bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


UPDATE [dbo].[Emails]
   SET 
      [Email] = @Email
      ,[EmailType] = @EmailType
      ,[IsPrimaryEmail] = @IsPrimaryEmail
 WHERE [Id] = @Id


END

GO
/****** Object:  StoredProcedure [dbo].[GetCustomerIdByUserId]    Script Date: 12/29/2015 3:40:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Phone_Get]    Script Date: 12/29/2015 3:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Phone_Get] 
	@UserId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT phone.*
		  FROM [dbo].[Phones] phone
		  right join [UsersPhoneMapping] upm on upm.phoneId = phone.id
		  where upm.userid = @userId



END

GO
/****** Object:  StoredProcedure [dbo].[Phone_Update]    Script Date: 12/29/2015 3:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Phone_Update]
	@phoneId uniqueidentifier,
	@PhoneNumber nvarchar(50),
	@PhoneDescription nvarchar(50),
	@PhoneType nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	UPDATE [dbo].[Phones]
	   SET 
		  [PhoneNumber] = @PhoneNumber
		  ,[PhoneType] = @PhoneType
		  ,[PhoneDescription] = @PhoneDescription
	 WHERE 
		[Id] =@phoneid



END

GO
/****** Object:  StoredProcedure [dbo].[Roles_Get]    Script Date: 12/29/2015 3:40:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Session_Create]    Script Date: 12/29/2015 3:40:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Session_Edit]    Script Date: 12/29/2015 3:40:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[User_Add]    Script Date: 12/29/2015 3:40:34 PM ******/
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
	@currentUserId uniqueidentifier			

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
/****** Object:  StoredProcedure [dbo].[User_Add_Email]    Script Date: 12/29/2015 3:40:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[User_Add_Occupation]    Script Date: 12/29/2015 3:40:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[User_Add_Phone]    Script Date: 12/29/2015 3:40:34 PM ******/
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
    @UserId uniqueidentifier,		
	@currentUserId uniqueidentifier,		
	@PhoneId uniqueidentifier,	
	@PhoneNumber nvarchar(50),
	@PhoneType nvarchar(50),
	@PhoneDescription nvarchar(50)
AS
BEGIN
    BEGIN TRAN T1;
			
		INSERT INTO [dbo].[Phones]
			   ([Id]
			   ,[PhoneNumber]
			   ,[PhoneType]
			   ,[PhoneDescription])
		 VALUES
			   (@PhoneId,
			    @PhoneNumber,
				@PhoneType,
				@PhoneDescription)


		INSERT INTO [dbo].[UsersPhoneMapping]
				   ([UserId]
				   ,[PhoneId])
		VALUES
			(@UserId
			,@PhoneId)

	COMMIT TRAN T1;
END


GO
/****** Object:  StoredProcedure [dbo].[User_Get]    Script Date: 12/29/2015 3:40:34 PM ******/
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
	@UserId uniqueidentifier = null,
	@currentUserId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @customerId as uniqueidentifier
	
	execute GetCustomerIdByUserId @currentUserId, @customerId output


    SELECT distinct sysUser.Id, sysUser.FirstName, sysUser.LastName, phone.PhoneNumber, email.Email ,sysUser.DOB,
			sysUser.PlaceOfBirth
    FROM Users sysUser
    LEFT OUTER JOIN AspNetUsers aspUser ON aspUser.Id = sysUser.Id
	LEFT OUTER JOIN UsersPhoneMapping userPhone ON sysUser.Id = userPhone.UserId
	LEFT OUTER JOIN Phones phone ON userPhone.PhoneId = phone.Id
	LEFT OUTER JOIN UsersEmailsMapping userEmail ON sysUser.Id = userEmail.UserId
	LEFT OUTER JOIN Emails email ON userEmail.EmailId = email.Id
	right join CustomerUserMapping cum on cum.UserId = sysUser.id
	--LEFT OUTER JOIN UserAddressMapping userAddress ON sysUser.Id = userAddress.UserId
	--LEFT OUTER JOIN Addresses address ON userAddress.AddressId = address.Id
    WHERE 
	    (@FName IS NULL OR (FirstName like '%' + @FName +'%'))
	AND (@LName  IS NULL OR (LastName  like  '%' + @LName + '%' ))
	AND (@DOB  IS NULL OR (DOB = @DOB ))
	AND (@POB  IS NULL OR (PlaceOfBirth = @POB ))
	AND (@Email  IS NULL OR (email.Email = @Email ))
	AND (@PhoneNumber  IS NULL OR (phone.PhoneNumber = @PhoneNumber ))
	AND (@UserId  IS NULL OR (aspUser.Id = @UserId ))
	AND cum.CustomerId = @customerId
	
	OPTION (RECOMPILE) 
					   ---<<<< Use if on for SQL 2008 SP1 CU5 (10.0.2746) and later. 
					   ---<<<< The OPTION(RECOMPILE) will recompile your query, only 
					   ---<<<< the version listed will recompile it based on the current 
					   ---<<<< run time values of the local variables, which will give you
					   ---<<<< the best performance.
END


GO
/****** Object:  StoredProcedure [dbo].[User_Update]    Script Date: 12/29/2015 3:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[User_Update]
	
	@Id uniqueidentifier,	
	@FirstName nvarchar(250),
	@LastName nvarchar(250),
	@MiddleName nvarchar(50),
	@DOB date,
	@PlaceOfBirth nvarchar(50),
	@currentUserId uniqueidentifier
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 

	UPDATE [dbo].[Users]
	   SET 
		   [FirstName] = @FirstName
		  ,[LastName] = @LastName
		  ,[MiddleName] = @MiddleName
		  ,[DOB] = @DOB
		  ,[PlaceOfBirth] = @PlaceOfBirth
		  ,[UpdateUserId] = @currentUserId
		  ,[UpdateDate] = SYSDATETIME()
	 WHERE Id = @id



	
END

GO
/****** Object:  StoredProcedure [dbo].[UserAddress_GET]    Script Date: 12/29/2015 3:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserAddress_GET]
	@UserId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select address.* from Addresses address 
	right  join userAddressMapping userAddress ON address.Id = userAddress.Addressid
	where userAddress.userId = @userId
  
END



GO
/****** Object:  StoredProcedure [dbo].[UserRelation_Add]    Script Date: 12/29/2015 3:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserRelation_Add]
	@fromUserId uniqueidentifier,
	@toUserId uniqueidentifier,
	@relationType  nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 

	INSERT INTO [dbo].[UserRelations] 
           (FromUserId
           ,ToUserId
           ,[RelationType])
     VALUES
           (@fromUserId
           ,@toUserId
           ,@relationType)



END

GO
/****** Object:  StoredProcedure [dbo].[UserRelations_Get]    Script Date: 12/29/2015 3:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserRelations_Get]
	@fromUserId uniqueidentifier = null,
	@toUserId uniqueidentifier = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[UserRelations] 
	where (FromUserId = @fromUserId or @fromUserId is null)
	and (ToUserId = @toUserId or @toUserId is null)


END

GO
USE [master]
GO
ALTER DATABASE [SaintsCore] SET  READ_WRITE 
GO
