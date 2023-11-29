USE [master]
GO
/****** Object:  Database [Job_Outsourcer_Application]    Script Date: 11/29/2023 6:30:06 PM ******/
CREATE DATABASE [Job_Outsourcer_Application]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Job_Outsourcer_Application', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Job_Outsourcer_Application.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Job_Outsourcer_Application_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Job_Outsourcer_Application_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Job_Outsourcer_Application] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Job_Outsourcer_Application].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Job_Outsourcer_Application] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET ARITHABORT OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET  MULTI_USER 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Job_Outsourcer_Application] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Job_Outsourcer_Application] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Job_Outsourcer_Application] SET QUERY_STORE = OFF
GO
USE [Job_Outsourcer_Application]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[CountyId] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[County]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[County](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_County] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobItem]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[JobTypeId] [int] NOT NULL,
 CONSTRAINT [PK_JobItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobType]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_JobType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[JobItemId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[PartnerId] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHeader]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[OrderTotal] [float] NOT NULL,
	[PickUpTime] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[PaymentStatus] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[TransactionId] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrderHeader] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerRights]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerRights](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[JobTypeId] [int] NOT NULL,
 CONSTRAINT [PK_PartnerRights] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Value] [real] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 11/29/2023 6:30:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Document] [nvarchar](max) NULL,
	[RequestType] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210605093712_migration1', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210610161631_requestTable', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210613101858_addRatingToDb', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210616101631_InitialMigration', N'3.1.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210726122613_AddPartnerRights', N'3.1.15')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'28835a32-35cc-46a8-a4ae-09d3d3901cfb', N'Admin', N'ADMIN', N'd9f0b519-2afa-4346-adb5-94889ea5f923')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4ba62aaa-7347-447c-88e0-d4d23358b6c8', N'Partner', N'PARTNER', N'65ca8f7e-ab1c-4b0f-b8a0-ddcd94b2562c')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4c02b347-6458-4445-85bf-eb13bf842bb4', N'Customer', N'CUSTOMER', N'a2488e25-f238-4a98-bfc7-03057203daa3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0b0c2a02-76c8-4b27-a5b1-505fe804db7c', N'28835a32-35cc-46a8-a4ae-09d3d3901cfb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'41867aba-5f66-4dc7-97b6-f3582de2cdfb', N'28835a32-35cc-46a8-a4ae-09d3d3901cfb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4f3228c1-f4fe-406c-92be-8a77a2e4965c', N'28835a32-35cc-46a8-a4ae-09d3d3901cfb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd2ccff81-5d37-4cd6-95f6-98ab5bafc031', N'28835a32-35cc-46a8-a4ae-09d3d3901cfb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ffd287a7-3038-4b96-ba15-ab5b99419c91', N'28835a32-35cc-46a8-a4ae-09d3d3901cfb')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4ce2d303-0f62-47c3-92cd-4f8b82fd941a', N'4ba62aaa-7347-447c-88e0-d4d23358b6c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'652b92d6-0337-4d32-803c-4fbd2c612ece', N'4ba62aaa-7347-447c-88e0-d4d23358b6c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9343dbb0-86d7-4ef1-82e3-7710ecc57e6a', N'4ba62aaa-7347-447c-88e0-d4d23358b6c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9ad5b20f-9de2-48ca-9f2f-56dc3b11ab4a', N'4ba62aaa-7347-447c-88e0-d4d23358b6c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a646c59b-5032-4ea5-b144-b6111723de8b', N'4ba62aaa-7347-447c-88e0-d4d23358b6c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b8423b74-bf96-4427-8283-f42770471f9a', N'4ba62aaa-7347-447c-88e0-d4d23358b6c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b95b863c-1a0b-4d47-9fb9-43ccd1017a61', N'4ba62aaa-7347-447c-88e0-d4d23358b6c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'dd6943a1-1458-46bc-a121-51c6fe988500', N'4ba62aaa-7347-447c-88e0-d4d23358b6c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e662ca55-9459-4e1c-a0db-8906a78452cd', N'4ba62aaa-7347-447c-88e0-d4d23358b6c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f70bbcc2-57fb-4172-b0c7-f1068e3644c6', N'4ba62aaa-7347-447c-88e0-d4d23358b6c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fb4d87c9-b91e-4f85-9db0-351d866864af', N'4ba62aaa-7347-447c-88e0-d4d23358b6c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ff81db16-d35d-4068-8df2-f63ccf54db57', N'4ba62aaa-7347-447c-88e0-d4d23358b6c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4198799d-24e8-4ecb-9eee-55c4ec9f12c5', N'4c02b347-6458-4445-85bf-eb13bf842bb4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'599414f7-d39d-4f5a-b465-841bca7c53d9', N'4c02b347-6458-4445-85bf-eb13bf842bb4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5e26d104-3d9b-4380-8c34-31b2927586d5', N'4c02b347-6458-4445-85bf-eb13bf842bb4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'63c23079-a0c1-486c-8570-42014b3db025', N'4c02b347-6458-4445-85bf-eb13bf842bb4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'64942f95-f080-4c8c-a676-c6fc28cf47b6', N'4c02b347-6458-4445-85bf-eb13bf842bb4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'79aa9552-dc11-4226-aa49-abb18d027c0a', N'4c02b347-6458-4445-85bf-eb13bf842bb4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a1065fbd-66b3-48c6-9209-08d2b6faaaa7', N'4c02b347-6458-4445-85bf-eb13bf842bb4')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'0b0c2a02-76c8-4b27-a5b1-505fe804db7c', N'egwerg@gmail.com', N'EGWERG@GMAIL.COM', N'egwerg@gmail.com', N'EGWERG@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENJAUunlEEqRmDYgrHo6Q/qcXW5lRtmzyT4ftPDF3s6eBkmV2D4dA6lchIKPwPs/aQ==', N'KBNIVVDRW7QTBEF4A7WBUIKZ43L5OL3U', N'7df2efdf-bbb1-4669-9a36-de66ce16e7e3', N'4535432', 0, 0, NULL, 1, 0, N'ApplicationUser', N'admin44', N'admin44', N'x', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'41867aba-5f66-4dc7-97b6-f3582de2cdfb', N'admintest@gmail.com', N'ADMINTEST@GMAIL.COM', N'admintest@gmail.com', N'ADMINTEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAED8wgQXKcCtnLW3Pm5xoIaDiuX5sdcXQ2ybjT6AXdmdB/V7IyLJr1bK7JB1y13hwGw==', N'UOVWGBL5VTVRUBXOAPIOBG5IUUDDG7HX', N'aa024f48-a0e9-4183-baf6-7fc7560c7463', N'4545641', 0, 0, NULL, 1, 0, N'ApplicationUser', N'admintest', N'admintest', N'x', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'4198799d-24e8-4ecb-9eee-55c4ec9f12c5', N'customer4@gmail.com', N'CUSTOMER4@GMAIL.COM', N'customer4@gmail.com', N'CUSTOMER4@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBRIpmazi40TCm5+h79rfmWP0PwQ94SwksOW0+K4Hvo2JNWmXfK7TJ/3fSMsZwa+kQ==', N'XR6IYLZOH7HSCBOF2N6CC2OW4KZQHL45', N'7f23fb2d-a5fa-4e23-954c-8d79d7131cca', N'091456872', 0, 0, NULL, 1, 0, N'ApplicationUser', N'Slaven', N'Slavenić', N'10000 Zagreb, Sokolgradska ulica 80', 2)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'4ce2d303-0f62-47c3-92cd-4f8b82fd941a', N'partner4@gmail.com', N'PARTNER4@GMAIL.COM', N'partner4@gmail.com', N'PARTNER4@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMgyjgsWTlmMrBqicl0xY1158wgxxL/t+DTulW8/HDgabfPnKaXFzHoa85eNczkk7A==', N'7RT4P34PDTA5AYY4JGSFLPEMCQM6ARVD', N'7e1ecf58-8139-46ad-bb97-e9b8edd88e8f', N'0915375291', 0, 0, CAST(N'2021-08-13T19:27:23.3838072+02:00' AS DateTimeOffset), 1, 0, N'ApplicationUser', N'Stipe', N'Arsin', N'31000 Osijek, Plava ulica 8', 10)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'4f3228c1-f4fe-406c-92be-8a77a2e4965c', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAENPu3sDc8XwT1+pfZUq14CZ4Aj0zWAUFelDFMX+DykU5g+jcx7akcEynkEFL93SP9Q==', N'UCCO5JFC2MVEUO4ZJOMRBL5PG4ZQD223', N'5ec8e790-ba6b-4a2c-8a72-3ef811a9cf78', N'123456789', 0, 0, NULL, 1, 0, N'ApplicationUser', N'Mario', N'Brbot', N'x', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'599414f7-d39d-4f5a-b465-841bca7c53d9', N'customer@gmail.com', N'CUSTOMER@GMAIL.COM', N'customer@gmail.com', N'CUSTOMER@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEL+nMFojqLydVnuPKkXiMo98tJmf5/wylb64nx9ubqyGj5b/WEfZiCLv3qhcNVnoGw==', N'3D6OX5Q3HRZA5GOGWZHDJMYGZPAZOSDH', N'024cb703-c82a-4223-a6ee-ef67af0e78c7', N'456123789', 0, 0, CAST(N'2021-09-15T20:46:20.3056420+02:00' AS DateTimeOffset), 1, 0, N'ApplicationUser', N'Ivan', N'Ivić', N'33000 Virovitica, Ulica Matije Gupca 56', 20)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'5e26d104-3d9b-4380-8c34-31b2927586d5', N'customer5@gmail.com', N'CUSTOMER5@GMAIL.COM', N'customer5@gmail.com', N'CUSTOMER5@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEk0BTy/nxYhtdz3MQZ6ypskGll1lpI8zTpEViGla93FoUQUdE0krpwEUempKbD5Rw==', N'EHTM3JLLR5MIK4TSXWUCLZGNKFKDRIND', N'3a7eaf3f-7b13-416f-85b7-86aae1f76161', N'091531548', 0, 0, CAST(N'2021-09-17T10:01:09.4304242+02:00' AS DateTimeOffset), 1, 0, N'ApplicationUser', N'Jozo', N'Jozimirović', N'10000 Zagreb, Nova cesta 190', 2)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'63c23079-a0c1-486c-8570-42014b3db025', N'customer2@gmail.com', N'CUSTOMER2@GMAIL.COM', N'customer2@gmail.com', N'CUSTOMER2@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMj4NIO463CMOWqkueYSnJBAFTrcuYl0t95DhBn0d7WgFnbTBVwyF3SDzzN9VcgYtg==', N'JJ2AJEGE4TDBPPPLJTMX2UYUK23Q74HF', N'95c027a2-65e5-4105-ad04-8c10a04aa8c9', N'092343254', 0, 0, NULL, 1, 0, N'ApplicationUser', N'Milan', N'Milić', N'43000 Bjelovar, Ul.  adalberta Opptiza 16', 14)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'64942f95-f080-4c8c-a676-c6fc28cf47b6', N'customer3@gmail.com', N'CUSTOMER3@GMAIL.COM', N'customer3@gmail.com', N'CUSTOMER3@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJU06cu5NohdtLVxVFEeZ9xFhUZ/agWzZwz6nkWBc0HhvOlKCXWTaDzMexS3NfWm5g==', N'7QY2UMK75N7NY6EUEY7U2CDWHMEPOVN4', N'37da5515-0240-4c0a-b47c-421562257862', N'091568425', 0, 0, NULL, 1, 0, N'ApplicationUser', N'Mirko', N'Sova', N'31000 Osijek, Ul. Ivana Gundulića 80', 10)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'652b92d6-0337-4d32-803c-4fbd2c612ece', N'partner1@gmail.com', N'PARTNER1@GMAIL.COM', N'partner1@gmail.com', N'PARTNER1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJ5j5w+ZiCEmPjePDohAioIB1uty49sgLESzHPUxI23niz9EMc4Am9vZ3ocBQVT6tw==', N'65CPA3FLUBT7BEEQFRTU4LYWMNRONVHQ', N'b4c157e3-4edf-476a-9a7a-12b926050bd3', N'0995468254', 0, 0, CAST(N'2021-08-13T19:24:53.3640683+02:00' AS DateTimeOffset), 1, 0, N'ApplicationUser', N'Mariofil', N'Kos', N'33000 Virovitica, Radnička ulica 15', 20)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'767aa48e-c965-4130-827d-f2544b9ca53e', N'partner12@gmail.com', N'PARTNER12@GMAIL.COM', N'partner12@gmail.com', N'PARTNER12@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHoC5K531syw4Xjzmtl/ZBjYq+DMfCDAXQatw7Rn/6Bs3Pj7LU11nvj2g3JOxnFgrA==', N'U5YUOHM5YJDIKRG2QCKKG5KBLKOVTCOL', N'd323b54a-a3f8-47a0-85e8-76459cbc568c', N'0915317691', 0, 0, NULL, 1, 0, N'ApplicationUser', N'fdsgfd', N'dfsgfd', N'dsgfs', 15)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'79aa9552-dc11-4226-aa49-abb18d027c0a', N'customer7@gmail.com', N'CUSTOMER7@GMAIL.COM', N'customer7@gmail.com', N'CUSTOMER7@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECcbXQht8sBbPXw7WHve6auFOvNdSVHvjgJZl58DCN4pxPkCVoSDn/OWU/PKQ9D8qQ==', N'HM27FAS6PFYZGPFNO53Z6NAAPQBPAPWH', N'13551d22-604c-4012-931e-e3fe57e72eaf', N'095426521', 0, 0, NULL, 1, 0, N'ApplicationUser', N'Vinko', N'Vinković', N'33000 Virovitica, Ulica A.G.Matoša 14', 20)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'9343dbb0-86d7-4ef1-82e3-7710ecc57e6a', N'partner3@gmail.com', N'PARTNER3@GMAIL.COM', N'partner3@gmail.com', N'PARTNER3@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKkAsB3kRVTvzp4XuI1+BLlFVBpyZ+cTP1NNPi0tmhY27cIxHY9Wgf1leQHeyWX+tQ==', N'SNW3PBKXNZP4AQDOV4CLXEDQJYXUKCUH', N'ee8f120e-312c-4bc4-be93-9c446db42f1d', N'0985214563', 0, 0, CAST(N'2021-08-13T19:27:24.4136682+02:00' AS DateTimeOffset), 1, 0, N'ApplicationUser', N'Nenad', N'Kusac', N'33000 Virovitica, Mlinska ulica 25', 20)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'9ad5b20f-9de2-48ca-9f2f-56dc3b11ab4a', N'parner10@gmail.com', N'PARNER10@GMAIL.COM', N'parner10@gmail.com', N'PARNER10@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPt54xP2+u1WCq/8NPpfvnNxHpunFXGPJChjc4Ao+wmGm/+7z8BsoLRNZsmWvKCKIA==', N'KWMZMIKHP5W7NBBVP6CBG5U77YM3XHLH', N'448ac2f3-7e79-4696-b4c7-7b3c3af9d944', N'0915317451', 0, 0, NULL, 1, 0, N'ApplicationUser', N'Elena', N'Križek', N'33000 Virovitica, Mlinska ulica 34', 20)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'a1065fbd-66b3-48c6-9209-08d2b6faaaa7', N'customer6@gmail.com', N'CUSTOMER6@GMAIL.COM', N'customer6@gmail.com', N'CUSTOMER6@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDJIynUkygfB5foLjnm6LnfM1j8ziyAJCbZrD5OSbHOO/UKN12DFdyItKDtxRLtRhg==', N'OCF73PHPWWXAQ46VXTPFTKVMB5FGPWGY', N'cd6183a9-a9b8-45d8-8988-1e87687b4cbe', N'098452741', 0, 0, NULL, 1, 0, N'ApplicationUser', N'Matej', N'Matejić', N'33000 Virovitica, Ulica Franje Račkog 23A', 20)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'a646c59b-5032-4ea5-b144-b6111723de8b', N'partner@gmail.com', N'PARTNER@GMAIL.COM', N'partner@gmail.com', N'PARTNER@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEPRPwHMyo7snVreHe84ivJ6GT0XGm5lBjlLZ2mr932iJo3c00qSn/33KvpXb3AgO7A==', N'ALTFG7G4WJ23ALQIERBDH7ZKVQL7Y5S4', N'05c4863c-0617-402d-9611-aad8ff6f9314', N'0985123695', 0, 0, NULL, 1, 0, N'ApplicationUser', N'Ivan', N'Horvat', N'31000 Osijek, Ulica Domovine 1', 10)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'b8423b74-bf96-4427-8283-f42770471f9a', N'partner7@gmail.com', N'PARTNER7@GMAIL.COM', N'partner7@gmail.com', N'PARTNER7@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMc1/GfaSBOSTra+1nzbiRtditU/KFjW14SENQFRCbGYK0sxRzgFrhAFoyP/4SJZug==', N'EZDLWGBTUGNXA67HLASGUECNNWSJ35PO', N'0cb2fcd2-98f8-4be5-927e-57abc4b86d4e', N'0914256258', 0, 0, NULL, 1, 0, N'ApplicationUser', N'Sven', N'Bolić', N'10000 Zagreb, Ulica pravde 3', 2)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'b95b863c-1a0b-4d47-9fb9-43ccd1017a61', N'partner8@gmail.com', N'PARTNER8@GMAIL.COM', N'partner8@gmail.com', N'PARTNER8@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDo3ZHtHcRWrdyHbX+ynTqU3yX+EeHBm1f8pEHp12Uv8M+72biCRlPt8PKEb0Tauog==', N'ERF5KJUD7RUFEU7JGXXA57RYF4FKD5EY', N'134064da-94b0-42b3-acaa-94f240945aa6', N'0915317431', 0, 0, NULL, 1, 0, N'ApplicationUser', N'Sanjin', N'Kiš', N'33000 Virovitica, Zelena ulica 8', 20)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'd2ccff81-5d37-4cd6-95f6-98ab5bafc031', N'fsdgfs@gmail.com', N'FSDGFS@GMAIL.COM', N'fsdgfs@gmail.com', N'FSDGFS@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEO63JctgKEfKIAoBd7NsM9VY+Ha+S2Hv/zm3LCMT+rfneulKtnIxdu1e6+HklxigoQ==', N'FKRY27DICK4GD6ZPTDMHSS7JLF5PWQZA', N'dc5eef56-a242-4e91-b4dd-a30442a11a14', N'85454', 0, 0, NULL, 1, 0, N'ApplicationUser', N'testadmin3', N'testadmin3', N'x', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'd7c450e9-cb3c-416b-ac4c-a4ce7e8805e8', N'partner11@gmail.com', N'PARTNER11@GMAIL.COM', N'partner11@gmail.com', N'PARTNER11@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECAuR9XpG+1gjRsSrCJpFt9HwYYlbf52f/s6+GOWWsCbG9oHH8ic6UUZQh5BpG0Ydg==', N'OYAN4VWYBB55NF7AQTBTPSLYMVA6QR3F', N'91d56d7f-07aa-438d-916b-9f74afd74404', N'0915317691', 0, 0, NULL, 1, 0, N'ApplicationUser', N'hdhdh', N'dfhdfh', N'gsd', 20)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'dd6943a1-1458-46bc-a121-51c6fe988500', N'partner2@gmail.com', N'PARTNER2@GMAIL.COM', N'partner2@gmail.com', N'PARTNER2@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOUXaWq103GJVpmJMgDUjtrhouoCx/48ZpXxAafupnOzqRKWHIteP/taUPFKuJ5Z3A==', N'MV4CMEM3R6AXQB2J6ELNM7AQKT7BMHSJ', N'cd730d3f-3cfb-456d-9cd6-1b10e4e8d25c', N'0996253215', 0, 0, NULL, 1, 0, N'ApplicationUser', N'Dante', N'Budim', N'10000 Zagreb, Ilica 78', 2)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'e662ca55-9459-4e1c-a0db-8906a78452cd', N'partner13@gmail.com', N'PARTNER13@GMAIL.COM', N'partner13@gmail.com', N'PARTNER13@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAg1KNnQ0Dz1v1gqnYOcWr1k13NOUDzs3osXZPS1SzaMHHpn/GLbvJUcZ491ZXuFIw==', N'IM6D2OCU6UE4D5O3SZP246Q3JJIDXGLK', N'14dafd2e-900e-4430-8f6f-523357cb54dc', N'0915742659', 0, 0, CAST(N'2021-08-13T18:51:39.3708602+02:00' AS DateTimeOffset), 1, 0, N'ApplicationUser', N'Mauricij', N'Horvat', N'10000 Zagreb, Kolodovrska ulica 10', 2)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'f70bbcc2-57fb-4172-b0c7-f1068e3644c6', N'partner5@gmail.com', N'PARTNER5@GMAIL.COM', N'partner5@gmail.com', N'PARTNER5@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHdMxqJmnvWr8D0R0OdPU8dUelm34ONxbR0N0vEJNpCM6gQdTej9Ss8LAiykP/Kd8g==', N'YIDSKLXRXMEED7EE65ZNFYPMT6SPJI5T', N'8de2add4-51ca-40e3-8744-39551df917bd', N'0914258763', 0, 0, CAST(N'2021-09-13T14:45:26.8213319+02:00' AS DateTimeOffset), 1, 0, N'ApplicationUser', N'Nikica', N'Velić', N'31000 Osijek, Mlinska ulica 13', 10)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'fb4d87c9-b91e-4f85-9db0-351d866864af', N'partner14@gmail.com', N'PARTNER14@GMAIL.COM', N'partner14@gmail.com', N'PARTNER14@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHRYlFbzIVoN9j8crGJQ+ZLFitwx6wwL7/rapGvPmDMe8Rqo7qD6KpI95n0LUQ34gg==', N'RFBQJI3JA5C7OJAQBQ6UNSRVCWVT377L', N'fcd19411-482a-4788-b157-4b7c521675c2', N'0917536241', 0, 0, CAST(N'2021-08-25T12:17:56.9867848+02:00' AS DateTimeOffset), 1, 0, N'ApplicationUser', N'Ivan ', N'Ivanić', N'33000 Virovitica, Radnička ulica 5', 20)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'ff81db16-d35d-4068-8df2-f63ccf54db57', N'partner9@gmail.com', N'PARTNER9@GMAIL.COM', N'partner9@gmail.com', N'PARTNER9@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGjwJuWNEyn17yp3AmbzT9lYjOv4ymvNII2wZjrdw2W2fpczMeEMZs3ZT7q3sZUSBw==', N'5ADWHDWPIAXD72OXMHLQIQI3NTAGBDKX', N'01015192-3803-47aa-9392-f73d5986812d', N'0915314191', 0, 0, NULL, 1, 0, N'ApplicationUser', N'Pero', N'Žic', N'33000 Virovitica, Radnička ulica 54', 20)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Address], [CountyId]) VALUES (N'ffd287a7-3038-4b96-ba15-ab5b99419c91', N'dsgsdg@gmial.com', N'DSGSDG@GMIAL.COM', N'dsgsdg@gmial.com', N'DSGSDG@GMIAL.COM', 0, N'AQAAAAEAACcQAAAAELKlIR2bKZ8ldxoBvLnZdDK2vrd5w4P4eZ/2bjR4gJ8rmSy7PvgK9SCuOc9Le9CBRg==', N'OFDRRZASYV2FRM25UJHNTAEBDWWESF75', N'20758264-3f13-412b-bb5e-859e5c62f052', N'523523', 0, 0, NULL, 1, 0, N'ApplicationUser', N'admintest2', N'admintest2', N'x', 1)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [DisplayOrder]) VALUES (1, N'Podučavanje', 1)
INSERT [dbo].[Category] ([Id], [Name], [DisplayOrder]) VALUES (2, N'Kućanski Poslovi', 2)
INSERT [dbo].[Category] ([Id], [Name], [DisplayOrder]) VALUES (3, N'Dvorišni poslovi', 3)
INSERT [dbo].[Category] ([Id], [Name], [DisplayOrder]) VALUES (4, N'Popravci', 4)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[County] ON 

INSERT [dbo].[County] ([Id], [Name]) VALUES (1, N'Zagrebačka')
INSERT [dbo].[County] ([Id], [Name]) VALUES (2, N'Grad Zagreb')
INSERT [dbo].[County] ([Id], [Name]) VALUES (3, N'Međimurska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (4, N'Dubrovačko-neretvanska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (5, N'Istarska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (6, N'Vukovarsko-srijemska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (7, N'Šibensko-kninska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (8, N'Zadarska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (9, N'Brodsko-posavska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (10, N'Osječko-baranjska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (11, N'Požeško-slavonska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (12, N'Ličko-senjska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (13, N'Primorsko-goranska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (14, N'Bjelovarsko-bilogorska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (15, N'Koprivničko-križevačka')
INSERT [dbo].[County] ([Id], [Name]) VALUES (16, N'Varaždinska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (17, N'Karlovačka')
INSERT [dbo].[County] ([Id], [Name]) VALUES (18, N'Sisačko-moslavačka')
INSERT [dbo].[County] ([Id], [Name]) VALUES (19, N'Krapinsko-zagorska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (20, N'Virovitičko-podravska')
INSERT [dbo].[County] ([Id], [Name]) VALUES (21, N'Splitsko-dalmatinska')
SET IDENTITY_INSERT [dbo].[County] OFF
GO
SET IDENTITY_INSERT [dbo].[JobItem] ON 

INSERT [dbo].[JobItem] ([Id], [Name], [Description], [Image], [Price], [JobTypeId]) VALUES (1, N'Instrukcije iz matematike za razrede 5-8', N'<p>Instrukcije iz matematike, Osnovna &scaron;kola razredi 5-8.</p>', N'\images\jobItems\f039dfac-0c00-4475-af43-9cfd9c3055fa.webp', 50, 1)
INSERT [dbo].[JobItem] ([Id], [Name], [Description], [Image], [Price], [JobTypeId]) VALUES (2, N'Obično pospremanje', N'<p>Obično pospremanje poput usisavanje, brisnja pra&scaron;ine, či&scaron;ćenja stakla,...</p>', N'\images\jobItems\db5994f8-9380-45b1-a093-7031a894e616.jpg', 35, 10)
INSERT [dbo].[JobItem] ([Id], [Name], [Description], [Image], [Price], [JobTypeId]) VALUES (3, N'Instrukcije iz matematike - fakultetska razina', N'<p>Instrukcije iz matematike za studente srodnih fakulteta.</p>', N'\images\jobItems\8fef93e3-35ec-4227-9667-3e4098828258.jpg', 120, 3)
INSERT [dbo].[JobItem] ([Id], [Name], [Description], [Image], [Price], [JobTypeId]) VALUES (4, N'Košnja travnjaka kosilicom', N'<p>Ko&scaron;nja travnjaka s Va&scaron;om kosilicom - cijena se odnosi na sat</p>', N'\images\jobItems\c1a127b7-e055-43f5-9ce3-d209aae598b9.jpg', 30, 4)
INSERT [dbo].[JobItem] ([Id], [Name], [Description], [Image], [Price], [JobTypeId]) VALUES (5, N'Obrezivanje stabla', N'<p>Obrezivanje voćaka</p>', N'\images\jobItems\4eef9ec7-1f4e-4ecc-a0c8-9aad46bc2429.jpg', 40, 5)
INSERT [dbo].[JobItem] ([Id], [Name], [Description], [Image], [Price], [JobTypeId]) VALUES (6, N'Jednostavno kuhanje', N'<p>Spremanje jednostavnih jela s va&scaron;im sastojcima.</p>', N'\images\jobItems\4465f99a-d794-43d9-91e6-3d9656adda07.jpg', 40, 9)
INSERT [dbo].[JobItem] ([Id], [Name], [Description], [Image], [Price], [JobTypeId]) VALUES (7, N'Jednostavni popravak vodoinstalacija', N'<p>Jednostavni popravak vodoinstalacija</p>', N'\images\jobItems\8062932f-f4a0-4fa4-aee9-6b2b757de12b.jpg', 100, 8)
INSERT [dbo].[JobItem] ([Id], [Name], [Description], [Image], [Price], [JobTypeId]) VALUES (8, N'Jednostavni popravak elektroinstalacija', N'<p>Jednostavni popravak vodoinstalacija</p>', N'\images\jobItems\5ba0148e-505f-47f1-a430-9093e815c6a1.jpg', 120, 7)
INSERT [dbo].[JobItem] ([Id], [Name], [Description], [Image], [Price], [JobTypeId]) VALUES (9, N'Instrukcije iz matematike - razredi 1-4', N'<p>Instrukcije iz matematike za razrede 1-4.</p>', N'\images\jobItems\2206e7fb-e1f2-4283-999c-cd038365cdf9.jpg', 40, 1)
INSERT [dbo].[JobItem] ([Id], [Name], [Description], [Image], [Price], [JobTypeId]) VALUES (10, N'Instrukcije iz povijesti za razrede 5-8', N'<p>Instrukcije iz povijesti za razrede 5-8.</p>', N'\images\jobItems\e728c4b7-a3ce-4d06-a2a1-4a82ac8558f0.webp', 45, 1)
SET IDENTITY_INSERT [dbo].[JobItem] OFF
GO
SET IDENTITY_INSERT [dbo].[JobType] ON 

INSERT [dbo].[JobType] ([Id], [Name], [CategoryId]) VALUES (1, N'Instrukcije Osnovna Razina', 1)
INSERT [dbo].[JobType] ([Id], [Name], [CategoryId]) VALUES (2, N'Instrukcije Srednja Razina', 1)
INSERT [dbo].[JobType] ([Id], [Name], [CategoryId]) VALUES (3, N'Instrukcije Visoka Razina', 1)
INSERT [dbo].[JobType] ([Id], [Name], [CategoryId]) VALUES (4, N'Travnjak', 3)
INSERT [dbo].[JobType] ([Id], [Name], [CategoryId]) VALUES (5, N'Stabla', 3)
INSERT [dbo].[JobType] ([Id], [Name], [CategoryId]) VALUES (6, N'Vrt', 3)
INSERT [dbo].[JobType] ([Id], [Name], [CategoryId]) VALUES (7, N'Elektroinstalacije', 4)
INSERT [dbo].[JobType] ([Id], [Name], [CategoryId]) VALUES (8, N'Vodoinstalacije', 4)
INSERT [dbo].[JobType] ([Id], [Name], [CategoryId]) VALUES (9, N'Kuhanje', 2)
INSERT [dbo].[JobType] ([Id], [Name], [CategoryId]) VALUES (10, N'Pospremanje', 2)
SET IDENTITY_INSERT [dbo].[JobType] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (1, 1, 3, 2, N'Instrukcije iz matematike - fakultetska razina', N'<p>Instrukcije iz matematike za studente srodnih fakulteta.</p>', 120, N'a646c59b-5032-4ea5-b144-b6111723de8b', NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (2, 2, 4, 3, N'Košnja travnjaka kosilicom', N'<p>Ko&scaron;nja travnjaka s Va&scaron;om kosilicom - cijena se odnosi na sat</p>', 30, N'a646c59b-5032-4ea5-b144-b6111723de8b', NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (3, 3, 1, 2, N'Instrukcije iz matematike za razrede 5-8', N'<p>Instrukcije iz matematike, Osnovna &scaron;kola razredi 5-8.</p>', 50, N'a646c59b-5032-4ea5-b144-b6111723de8b', NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (4, 4, 3, 1, N'Instrukcije iz matematike - fakultetska razina', N'<p>Instrukcije iz matematike za studente srodnih fakulteta.</p>', 120, N'', NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (5, 5, 4, 1, N'Košnja travnjaka kosilicom', N'<p>Ko&scaron;nja travnjaka s Va&scaron;om kosilicom - cijena se odnosi na sat</p>', 30, N'fb4d87c9-b91e-4f85-9db0-351d866864af', NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (6, 6, 1, 2, N'Instrukcije iz matematike za razrede 5-8', N'<p>Instrukcije iz matematike, Osnovna &scaron;kola razredi 5-8.</p>', 50, N'a646c59b-5032-4ea5-b144-b6111723de8b', NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (7, 7, 6, 1, N'Jednostavno kuhanje', N'<p>Spremanje jednostavnih jela s va&scaron;im sastojcima.</p>', 40, N'a646c59b-5032-4ea5-b144-b6111723de8b', NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (8, 8, 1, 1, N'Instrukcije iz matematike za razrede 5-8', N'<p>Instrukcije iz matematike, Osnovna &scaron;kola razredi 5-8.</p>', 50, N'a646c59b-5032-4ea5-b144-b6111723de8b', NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (9, 9, 6, 1, N'Jednostavno kuhanje', N'<p>Spremanje jednostavnih jela s va&scaron;im sastojcima.</p>', 40, N'ff81db16-d35d-4068-8df2-f63ccf54db57', NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (10, 10, 2, 1, N'Obično pospremanje', N'<p>Obično pospremanje poput usisavanje, brisnja pra&scaron;ine, či&scaron;ćenja stakla,...</p>', 35, N'652b92d6-0337-4d32-803c-4fbd2c612ece', NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (11, 11, 1, 1, N'Instrukcije iz matematike za razrede 5-8', N'<p>Instrukcije iz matematike, Osnovna &scaron;kola razredi 5-8.</p>', 50, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (12, 12, 8, 2, N'Jednostavni popravak elektroinstalacija', N'<p>Jednostavni popravak vodoinstalacija</p>', 120, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (13, 13, 4, 4, N'Košnja travnjaka kosilicom', N'<p>Ko&scaron;nja travnjaka s Va&scaron;om kosilicom - cijena se odnosi na sat</p>', 30, N'a646c59b-5032-4ea5-b144-b6111723de8b', NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (14, 14, 9, 1, N'Instrukcije iz matematike - razredi 1-4', N'<p>Instrukcije iz matematike za razrede 1-4.</p>', 40, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (15, 15, 7, 3, N'Jednostavni popravak vodoinstalacija', N'<p>Jednostavni popravak vodoinstalacija</p>', 100, N'652b92d6-0337-4d32-803c-4fbd2c612ece', NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (16, 16, 5, 1, N'Obrezivanje stabla', N'<p>Obrezivanje voćaka</p>', 40, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (17, 17, 10, 1, N'Instrukcije iz povijesti za razrede 5-8', N'<p>Instrukcije iz povijesti za razrede 5-8.</p>', 45, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (18, 18, 6, 2, N'Jednostavno kuhanje', N'<p>Spremanje jednostavnih jela s va&scaron;im sastojcima.</p>', 40, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (19, 19, 4, 3, N'Košnja travnjaka kosilicom', N'<p>Ko&scaron;nja travnjaka s Va&scaron;om kosilicom - cijena se odnosi na sat</p>', 30, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (20, 20, 2, 5, N'Obično pospremanje', N'<p>Obično pospremanje poput usisavanje, brisnja pra&scaron;ine, či&scaron;ćenja stakla,...</p>', 35, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (21, 21, 6, 1, N'Jednostavno kuhanje', N'<p>Spremanje jednostavnih jela s va&scaron;im sastojcima.</p>', 40, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [JobItemId], [Count], [Name], [Description], [Price], [PartnerId], [UserId]) VALUES (22, 22, 4, 1, N'Košnja travnjaka kosilicom', N'<p>Ko&scaron;nja travnjaka s Va&scaron;om kosilicom - cijena se odnosi na sat</p>', 30, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderHeader] ON 

INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (1, N'599414f7-d39d-4f5a-b465-841bca7c53d9', CAST(N'2021-06-17T00:13:43.4283868' AS DateTime2), 240, CAST(N'2021-06-22T08:30:00.0000000' AS DateTime2), N'Obavljen', N'Approved', N'Trigonometrija.', N'ch_1J36zVBD29flmWwE3L2ywZwJ')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (2, N'599414f7-d39d-4f5a-b465-841bca7c53d9', CAST(N'2021-06-17T00:15:20.4422209' AS DateTime2), 90, CAST(N'2021-10-23T08:30:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Ravna površina.', N'ch_1J3713BD29flmWwE6rZ38ZcZ')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (3, N'599414f7-d39d-4f5a-b465-841bca7c53d9', CAST(N'2021-06-17T07:20:20.7289956' AS DateTime2), 100, CAST(N'2021-10-21T08:30:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Algebra.', N'ch_1J3DeMBD29flmWwEvrA20zyq')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (4, N'599414f7-d39d-4f5a-b465-841bca7c53d9', CAST(N'2021-06-17T07:21:51.2084689' AS DateTime2), 120, CAST(N'2021-06-24T09:00:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Neki opis.', N'ch_1J3DfoBD29flmWwEjGXQp2rW')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (5, N'63c23079-a0c1-486c-8570-42014b3db025', CAST(N'2021-06-17T07:22:46.0598302' AS DateTime2), 30, CAST(N'2021-06-24T09:00:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Ravna površina, 200m2.', N'ch_1J3DghBD29flmWwE3YjAGAYU')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (6, N'63c23079-a0c1-486c-8570-42014b3db025', CAST(N'2021-06-17T07:36:51.6078222' AS DateTime2), 100, CAST(N'2021-06-22T08:30:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Zbrajanje i oduzimanje.', N'ch_1J3DuKBD29flmWwEq1k4QtXK')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (7, N'599414f7-d39d-4f5a-b465-841bca7c53d9', CAST(N'2021-06-17T07:37:52.0075149' AS DateTime2), 40, CAST(N'2021-06-21T08:30:00.0000000' AS DateTime2), N'Obavljen', N'Approved', N'Kuhanje tijestenine sa sirom za večeru.', N'ch_1J3DvJBD29flmWwEOfkNFAhb')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (8, N'599414f7-d39d-4f5a-b465-841bca7c53d9', CAST(N'2021-06-17T13:53:22.5812327' AS DateTime2), 50, CAST(N'2021-06-24T08:00:00.0000000' AS DateTime2), N'Obavljen', N'Approved', N'napomena', N'ch_1J3JmiBD29flmWwEik35C5yt')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (9, N'599414f7-d39d-4f5a-b465-841bca7c53d9', CAST(N'2021-09-13T19:44:05.8636497' AS DateTime2), 40, CAST(N'2021-09-20T11:00:00.0000000' AS DateTime2), N'Preuzet', N'Approved', N'Kuhanje tjestenine sa sirom za 6 osoba.', N'ch_3JZJCOBD29flmWwE1cUhukma')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (10, N'599414f7-d39d-4f5a-b465-841bca7c53d9', CAST(N'2021-09-13T19:50:33.6374172' AS DateTime2), 35, CAST(N'2021-09-19T14:30:00.0000000' AS DateTime2), N'Preuzet', N'Approved', N'Pospremanje kuhinje 10m2', N'ch_3JZJIdBD29flmWwE1Yy425ji')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (11, N'63c23079-a0c1-486c-8570-42014b3db025', CAST(N'2021-09-13T20:26:05.3466363' AS DateTime2), 50, CAST(N'2021-09-20T11:00:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Geometrija.', N'ch_3JZJr0BD29flmWwE02JqIS9g')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (12, N'63c23079-a0c1-486c-8570-42014b3db025', CAST(N'2021-09-13T20:31:12.6956428' AS DateTime2), 240, CAST(N'2021-09-20T11:30:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Popravak utičnice.', N'ch_3JZJvxBD29flmWwE1yPBbXZr')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (13, N'63c23079-a0c1-486c-8570-42014b3db025', CAST(N'2021-09-13T20:32:05.5570053' AS DateTime2), 120, CAST(N'2021-09-19T08:30:00.0000000' AS DateTime2), N'Preuzet', N'Approved', N'Košnja većeg dvorišta.', N'ch_3JZJwoBD29flmWwE0DRwbV8Z')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (14, N'64942f95-f080-4c8c-a676-c6fc28cf47b6', CAST(N'2021-09-13T20:54:31.8817147' AS DateTime2), 40, CAST(N'2021-09-20T10:30:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Algebra.', N'ch_3JZKIXBD29flmWwE0S9vKvEg')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (15, N'64942f95-f080-4c8c-a676-c6fc28cf47b6', CAST(N'2021-09-13T20:55:17.9657485' AS DateTime2), 300, CAST(N'2021-09-20T09:30:00.0000000' AS DateTime2), N'Preuzet', N'Approved', N'Popravak cijevi.', N'ch_3JZKJGBD29flmWwE1GZ2hKJf')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (16, N'64942f95-f080-4c8c-a676-c6fc28cf47b6', CAST(N'2021-09-13T20:55:54.8368281' AS DateTime2), 40, CAST(N'2021-09-20T08:30:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'2 kruške.', N'ch_3JZKJrBD29flmWwE0cul27oA')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (17, N'4198799d-24e8-4ecb-9eee-55c4ec9f12c5', CAST(N'2021-09-13T21:30:50.2266227' AS DateTime2), 45, CAST(N'2021-09-20T09:00:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Rim.', N'ch_3JZKrgBD29flmWwE1NOZiwy1')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (18, N'4198799d-24e8-4ecb-9eee-55c4ec9f12c5', CAST(N'2021-09-13T21:31:58.5571108' AS DateTime2), 80, CAST(N'2021-09-20T11:30:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Gulaš za 8 ljudi.', N'ch_3JZKslBD29flmWwE1iD3OqPw')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (19, N'5e26d104-3d9b-4380-8c34-31b2927586d5', CAST(N'2021-09-13T22:05:20.2162510' AS DateTime2), 90, CAST(N'2021-09-20T08:30:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Srednje dvorište.', N'ch_3JZLP3BD29flmWwE1l30G69b')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (20, N'5e26d104-3d9b-4380-8c34-31b2927586d5', CAST(N'2021-09-13T22:06:15.9127599' AS DateTime2), 175, CAST(N'2021-09-20T08:00:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Spremanje 4 prostorije od cca 4 kvadrata.', N'ch_3JZLPwBD29flmWwE0yPpuTgA')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (21, N'64942f95-f080-4c8c-a676-c6fc28cf47b6', CAST(N'2021-09-13T22:30:24.3947113' AS DateTime2), 40, CAST(N'2021-09-20T08:00:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Nema napomena.', N'ch_3JZLnJBD29flmWwE1PBWNZWi')
INSERT [dbo].[OrderHeader] ([Id], [UserId], [OrderDate], [OrderTotal], [PickUpTime], [Status], [PaymentStatus], [Comments], [TransactionId]) VALUES (22, N'64942f95-f080-4c8c-a676-c6fc28cf47b6', CAST(N'2021-09-13T22:31:06.3408399' AS DateTime2), 30, CAST(N'2021-09-19T11:00:00.0000000' AS DateTime2), N'Refundiran', N'Approved', N'Mali travnjak.', N'ch_3JZLnzBD29flmWwE1LvVW3Xy')
SET IDENTITY_INSERT [dbo].[OrderHeader] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerRights] ON 

INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (1, N'e662ca55-9459-4e1c-a0db-8906a78452cd', 4)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (7, N'fb4d87c9-b91e-4f85-9db0-351d866864af', 7)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (11, N'fb4d87c9-b91e-4f85-9db0-351d866864af', 4)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (12, N'a646c59b-5032-4ea5-b144-b6111723de8b', 7)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (13, N'a646c59b-5032-4ea5-b144-b6111723de8b', 1)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (16, N'a646c59b-5032-4ea5-b144-b6111723de8b', 9)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (19, N'a646c59b-5032-4ea5-b144-b6111723de8b', 5)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (20, N'a646c59b-5032-4ea5-b144-b6111723de8b', 4)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (21, N'a646c59b-5032-4ea5-b144-b6111723de8b', 8)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (23, N'a646c59b-5032-4ea5-b144-b6111723de8b', 6)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (24, N'652b92d6-0337-4d32-803c-4fbd2c612ece', 7)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (25, N'652b92d6-0337-4d32-803c-4fbd2c612ece', 1)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (26, N'652b92d6-0337-4d32-803c-4fbd2c612ece', 10)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (27, N'652b92d6-0337-4d32-803c-4fbd2c612ece', 5)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (28, N'652b92d6-0337-4d32-803c-4fbd2c612ece', 4)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (29, N'652b92d6-0337-4d32-803c-4fbd2c612ece', 8)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (31, N'652b92d6-0337-4d32-803c-4fbd2c612ece', 2)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (32, N'9ad5b20f-9de2-48ca-9f2f-56dc3b11ab4a', 2)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (33, N'a646c59b-5032-4ea5-b144-b6111723de8b', 10)
INSERT [dbo].[PartnerRights] ([Id], [UserId], [JobTypeId]) VALUES (35, N'9ad5b20f-9de2-48ca-9f2f-56dc3b11ab4a', 9)
SET IDENTITY_INSERT [dbo].[PartnerRights] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([Id], [UserId], [Value]) VALUES (1, N'a646c59b-5032-4ea5-b144-b6111723de8b', 4)
INSERT [dbo].[Rating] ([Id], [UserId], [Value]) VALUES (2, N'a646c59b-5032-4ea5-b144-b6111723de8b', 3)
INSERT [dbo].[Rating] ([Id], [UserId], [Value]) VALUES (3, N'a646c59b-5032-4ea5-b144-b6111723de8b', 5)
INSERT [dbo].[Rating] ([Id], [UserId], [Value]) VALUES (4, N'a646c59b-5032-4ea5-b144-b6111723de8b', 3)
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id], [UserId], [Title], [Content], [Document], [RequestType], [Status]) VALUES (1, N'599414f7-d39d-4f5a-b465-841bca7c53d9', N'Zahtjev refundacije ID67', N'<p>Neki zahtjev.</p>', NULL, N'Customer', N'Nepročitano')
INSERT [dbo].[Request] ([Id], [UserId], [Title], [Content], [Document], [RequestType], [Status]) VALUES (2, N'63c23079-a0c1-486c-8570-42014b3db025', N'Pitanje', N'<p>Neka poruka adminu.</p>', NULL, N'Customer', N'Nepročitano')
INSERT [dbo].[Request] ([Id], [UserId], [Title], [Content], [Document], [RequestType], [Status]) VALUES (3, N'599414f7-d39d-4f5a-b465-841bca7c53d9', N'Važna obavijest', N'<p>neki tekst</p>', NULL, N'Customer', N'Pročitano')
INSERT [dbo].[Request] ([Id], [UserId], [Title], [Content], [Document], [RequestType], [Status]) VALUES (4, N'fb4d87c9-b91e-4f85-9db0-351d866864af', N'Testni naslov 1', N'<p>nesto</p>', N'\documents\be3aac40-f4c5-44a5-8db3-83f04b0270e2.doc', N'Partner', N'Pročitano')
INSERT [dbo].[Request] ([Id], [UserId], [Title], [Content], [Document], [RequestType], [Status]) VALUES (5, N'63c23079-a0c1-486c-8570-42014b3db025', N'Zahtjev o predmetu.', N'<p>Ovdje Vas obavje&scaron;tavam o predmetu.</p>', NULL, N'Customer', N'Nepročitano')
INSERT [dbo].[Request] ([Id], [UserId], [Title], [Content], [Document], [RequestType], [Status]) VALUES (6, N'64942f95-f080-4c8c-a676-c6fc28cf47b6', N'Zahtjev o predmetu.', N'<p>Neki tekst.</p>', NULL, N'Customer', N'Nepročitano')
INSERT [dbo].[Request] ([Id], [UserId], [Title], [Content], [Document], [RequestType], [Status]) VALUES (7, N'a646c59b-5032-4ea5-b144-b6111723de8b', N'Zahtjev za neku ovlast', N'<p>Neki dokazi o znanju.</p>', N'\documents\b861b8fe-f0ad-4776-a572-873e864ce573.pdf', N'Partner', N'Nepročitano')
INSERT [dbo].[Request] ([Id], [UserId], [Title], [Content], [Document], [RequestType], [Status]) VALUES (8, N'652b92d6-0337-4d32-803c-4fbd2c612ece', N'Tražim pravo na xy', N'<p>Dokazi za xy</p>', N'\documents\52ea95f7-7a70-40f6-ac59-50cfc357a850.pdf', N'Partner', N'Nepročitano')
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_CountyId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_CountyId] ON [dbo].[AspNetUsers]
(
	[CountyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobItem_JobTypeId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_JobItem_JobTypeId] ON [dbo].[JobItem]
(
	[JobTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobType_CategoryId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_JobType_CategoryId] ON [dbo].[JobType]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_JobItemId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_JobItemId] ON [dbo].[OrderDetails]
(
	[JobItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_OrderId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrderDetails_UserId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_UserId] ON [dbo].[OrderDetails]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrderHeader_UserId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderHeader_UserId] ON [dbo].[OrderHeader]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PartnerRights_JobTypeId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_PartnerRights_JobTypeId] ON [dbo].[PartnerRights]
(
	[JobTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PartnerRights_UserId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_PartnerRights_UserId] ON [dbo].[PartnerRights]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Rating_UserId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Rating_UserId] ON [dbo].[Rating]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Request_UserId]    Script Date: 11/29/2023 6:30:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Request_UserId] ON [dbo].[Request]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_County_CountyId] FOREIGN KEY([CountyId])
REFERENCES [dbo].[County] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_County_CountyId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[JobItem]  WITH CHECK ADD  CONSTRAINT [FK_JobItem_JobType_JobTypeId] FOREIGN KEY([JobTypeId])
REFERENCES [dbo].[JobType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobItem] CHECK CONSTRAINT [FK_JobItem_JobType_JobTypeId]
GO
ALTER TABLE [dbo].[JobType]  WITH CHECK ADD  CONSTRAINT [FK_JobType_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobType] CHECK CONSTRAINT [FK_JobType_Category_CategoryId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_JobItem_JobItemId] FOREIGN KEY([JobItemId])
REFERENCES [dbo].[JobItem] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_JobItem_JobItemId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderHeader_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderHeader] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderHeader_OrderId]
GO
ALTER TABLE [dbo].[OrderHeader]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeader_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderHeader] CHECK CONSTRAINT [FK_OrderHeader_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[PartnerRights]  WITH CHECK ADD  CONSTRAINT [FK_PartnerRights_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PartnerRights] CHECK CONSTRAINT [FK_PartnerRights_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[PartnerRights]  WITH CHECK ADD  CONSTRAINT [FK_PartnerRights_JobType_JobTypeId] FOREIGN KEY([JobTypeId])
REFERENCES [dbo].[JobType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PartnerRights] CHECK CONSTRAINT [FK_PartnerRights_JobType_JobTypeId]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [Job_Outsourcer_Application] SET  READ_WRITE 
GO
