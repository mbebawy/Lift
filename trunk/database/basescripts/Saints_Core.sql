USE [master]
GO
/****** Object:  Database [SaintsCore]    Script Date: 12/6/2015 5:39:32 PM ******/
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
ALTER DATABASE [SaintsCore] SET AUTO_CREATE_STATISTICS ON 
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
/****** Object:  StoredProcedure [dbo].[Claims_Get_ByRole]    Script Date: 12/6/2015 5:39:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetCustomerIdByUserId]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Phones_Add]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Roles_Get]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Session_Create]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Session_Edit]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[User_Add]    Script Date: 12/6/2015 5:39:35 PM ******/
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
    @Country nvarchar(50),
	@PhoneID uniqueidentifier,
	@PhoneNumber nvarchar(250),	
	@EmailID uniqueidentifier,
	@EmailAddress nvarchar(250)	
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


		INSERT INTO [dbo].[Phones]
			   ([Id]
			   ,[PhoneNumber])
		 VALUES
			   (@PhoneID
			   ,@PhoneNumber)


		INSERT INTO [dbo].[UsersPhoneMapping]
			   ([UserId]
			   ,[PhoneId])
		 VALUES
			   (@Id
			   ,@PhoneID)

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
			   (@Id
			   ,@EmailID)


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
/****** Object:  StoredProcedure [dbo].[User_Add_Email]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[User_Add_Occupation]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[User_Add_Phone]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  StoredProcedure [dbo].[User_Get]    Script Date: 12/6/2015 5:39:35 PM ******/
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
			sysUser.PlaceOfBirth, address.Address1, address.Address2, address.City, address.State, address.Zip, address.Country
    FROM Users sysUser
    LEFT OUTER JOIN AspNetUsers aspUser ON aspUser.Id = sysUser.Id
	LEFT OUTER JOIN UsersPhoneMapping userPhone ON sysUser.Id = userPhone.UserId
	LEFT OUTER JOIN Phones phone ON userPhone.PhoneId = phone.Id
	LEFT OUTER JOIN UsersEmailsMapping userEmail ON sysUser.Id = userEmail.UserId
	LEFT OUTER JOIN Emails email ON userEmail.EmailId = email.Id
	LEFT OUTER JOIN UserAddressMapping userAddress ON sysUser.Id = userAddress.UserId
	LEFT OUTER JOIN Addresses address ON userAddress.AddressId = address.Id
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[Addresses]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[Claims]    Script Date: 12/6/2015 5:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claims](
	[ClaimId] [int] NOT NULL,
	[Name] [nvarchar](250) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[CusomterConfigMapping]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[CustomerUserMapping]    Script Date: 12/6/2015 5:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerUserMapping](
	[CustomerId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Emails]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[OccupationAddressMapping]    Script Date: 12/6/2015 5:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OccupationAddressMapping](
	[OccupationId] [uniqueidentifier] NOT NULL,
	[AddressId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Occupations]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[Phones]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[PhoneTypes]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[RoleClaimMapping]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[UserAddressMapping]    Script Date: 12/6/2015 5:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddressMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[AddressId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserFOCMapping]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[UserOccupationMapping]    Script Date: 12/6/2015 5:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOccupationMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[OccupationId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRelationshipsMapping]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[UserRolesMapping]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[UsersEmailsMapping]    Script Date: 12/6/2015 5:39:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersEmailsMapping](
	[UserId] [uniqueidentifier] NOT NULL,
	[EmailId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersPhoneMapping]    Script Date: 12/6/2015 5:39:35 PM ******/
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
/****** Object:  Table [dbo].[UserTypes]    Script Date: 12/6/2015 5:39:35 PM ******/
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
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/6/2015 5:39:35 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/6/2015 5:39:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/6/2015 5:39:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/6/2015 5:39:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 12/6/2015 5:39:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/6/2015 5:39:35 PM ******/
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
USE [master]
GO
ALTER DATABASE [SaintsCore] SET  READ_WRITE 
GO
