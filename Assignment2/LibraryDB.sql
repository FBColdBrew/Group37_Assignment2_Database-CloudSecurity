USE [master]
GO
/****** Object:  Database [LibraryDB]    Script Date: 20/6/2026 6:03:07 PM ******/
CREATE DATABASE [LibraryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryDB', FILENAME = N'D:\Database and Cloud Security\MSSQL17.MSSQLSERVER01\MSSQL\DATA\LibraryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryDB_log', FILENAME = N'D:\Database and Cloud Security\MSSQL17.MSSQLSERVER01\MSSQL\DATA\LibraryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LibraryDB] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryDB] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [LibraryDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LibraryDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [LibraryDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LibraryDB]
GO
/****** Object:  User [TestUser]    Script Date: 20/6/2026 6:03:07 PM ******/
CREATE USER [TestUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [fahmi]    Script Date: 20/6/2026 6:03:07 PM ******/
CREATE USER [fahmi] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 20/6/2026 6:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Status] [nvarchar](20) NULL,
	[Genre] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 20/6/2026 6:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[BookID] [int] NULL,
	[BorrowDate] [date] NULL,
	[DueDate] [date] NOT NULL,
	[ReturnDate] [date] NULL,
	[Fine] [decimal](10, 2) NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginLogs]    Script Date: 20/6/2026 6:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginLogs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[AttemptTime] [datetime] NULL,
	[Status] [varchar](20) NULL,
	[Reason] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasswordChangeLogs]    Script Date: 20/6/2026 6:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordChangeLogs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[ChangeType] [nvarchar](50) NOT NULL,
	[ChangeTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 20/6/2026 6:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Name] [nvarchar](50) NOT NULL,
	[Value] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20/6/2026 6:03:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](20) NULL,
	[Wallet] [decimal](10, 2) NULL,
	[ICNumber] [varchar](12) MASKED WITH (FUNCTION = 'partial(2, "********", 2)') NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (3, N'TopGun', N'Borrowed', N'Action')
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (6, N'Ghost House', N'Available', N'Horror')
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (8, N'Love Story', N'Borrowed', N'Romance')
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (9, N'Deep Sea', N'Available', N'Thriller')
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (10, N'Star War', N'Available', N'Space')
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (11, N'Time Ship', N'Available', N'Fiction')
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (12, N'Jungle Run', N'Available', N'Adventure')
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (13, N'Magic Wand', N'Available', N'Fantasy')
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (14, N'Kamen Rider', N'Available', N'Action')
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (15, N'Murder Case', N'Borrowed', N'Mystery')
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (16, N'Lost Island', N'Available', N'Adventure')
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (19, N'Mr Bean', N'Available', N'Comedy')
GO
INSERT [dbo].[Books] ([ID], [Title], [Status], [Genre]) VALUES (20, N'Spongebob', N'Available', N'Horror')
GO
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Loans] ON 
GO
INSERT [dbo].[Loans] ([ID], [UserID], [BookID], [BorrowDate], [DueDate], [ReturnDate], [Fine], [Status]) VALUES (10, 11, 3, CAST(N'2026-05-21' AS Date), CAST(N'2026-05-23' AS Date), CAST(N'2026-05-21' AS Date), CAST(0.00 AS Decimal(10, 2)), N'Returned')
GO
INSERT [dbo].[Loans] ([ID], [UserID], [BookID], [BorrowDate], [DueDate], [ReturnDate], [Fine], [Status]) VALUES (11, 11, 3, CAST(N'2026-05-21' AS Date), CAST(N'2026-05-23' AS Date), CAST(N'2026-05-21' AS Date), CAST(0.00 AS Decimal(10, 2)), N'Returned')
GO
INSERT [dbo].[Loans] ([ID], [UserID], [BookID], [BorrowDate], [DueDate], [ReturnDate], [Fine], [Status]) VALUES (12, 11, 3, CAST(N'2026-05-21' AS Date), CAST(N'2026-05-22' AS Date), NULL, CAST(0.00 AS Decimal(10, 2)), N'Active')
GO
INSERT [dbo].[Loans] ([ID], [UserID], [BookID], [BorrowDate], [DueDate], [ReturnDate], [Fine], [Status]) VALUES (13, 12, 15, CAST(N'2026-05-21' AS Date), CAST(N'2026-05-20' AS Date), NULL, CAST(0.00 AS Decimal(10, 2)), N'Active')
GO
INSERT [dbo].[Loans] ([ID], [UserID], [BookID], [BorrowDate], [DueDate], [ReturnDate], [Fine], [Status]) VALUES (14, 13, 8, CAST(N'2026-05-22' AS Date), CAST(N'2026-05-23' AS Date), NULL, CAST(0.00 AS Decimal(10, 2)), N'Active')
GO
SET IDENTITY_INSERT [dbo].[Loans] OFF
GO
SET IDENTITY_INSERT [dbo].[LoginLogs] ON 
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (1, N'fahmi', CAST(N'2026-05-18T18:29:53.367' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (2, N'fahmi2', CAST(N'2026-05-18T18:30:13.000' AS DateTime), N'Failed', N'Unknown Username')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (3, N'fahmi1', CAST(N'2026-05-18T18:30:27.457' AS DateTime), N'Failed', N'Unknown Username')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (4, N'fahmi', CAST(N'2026-05-18T18:30:33.860' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (5, N'adam', CAST(N'2026-05-18T18:30:43.520' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (6, N'adam', CAST(N'2026-05-18T19:46:38.160' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (7, N'admin', CAST(N'2026-05-20T23:00:09.493' AS DateTime), N'Failed', N'Unknown Username')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (8, N'admin', CAST(N'2026-05-20T23:00:17.827' AS DateTime), N'Failed', N'Unknown Username')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (9, N'admin', CAST(N'2026-05-20T23:09:00.013' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (10, N'admin', CAST(N'2026-05-20T23:09:06.180' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (11, N'adama', CAST(N'2026-05-20T23:13:13.337' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (12, N'adama', CAST(N'2026-05-20T23:15:17.700' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (13, N'adama', CAST(N'2026-05-20T23:15:23.873' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (14, N'admin', CAST(N'2026-05-21T00:54:55.920' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (15, N'belinda', CAST(N'2026-05-21T00:56:21.070' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (16, N'belinda', CAST(N'2026-05-21T00:56:29.747' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (17, N'belinda', CAST(N'2026-05-21T00:56:52.403' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (18, N'fahmi', CAST(N'2026-05-21T00:57:18.023' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (19, N'belinda', CAST(N'2026-05-21T00:57:58.747' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (20, N'admin', CAST(N'2026-05-21T00:58:28.533' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (21, N'admin', CAST(N'2026-05-21T01:05:34.570' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (22, N'damia', CAST(N'2026-05-21T01:09:03.947' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (23, N'admin', CAST(N'2026-05-21T01:09:24.410' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (24, N'adama', CAST(N'2026-05-21T01:10:18.063' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (25, N'adama', CAST(N'2026-05-21T01:10:44.360' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (26, N'adama', CAST(N'2026-05-21T01:43:27.937' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (27, N'dania', CAST(N'2026-05-21T01:54:45.520' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (28, N'damia', CAST(N'2026-05-21T03:13:16.520' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (29, N'damia', CAST(N'2026-05-21T03:15:29.240' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (30, N'admin', CAST(N'2026-05-21T03:19:14.477' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (31, N'damia', CAST(N'2026-05-21T03:23:02.800' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (32, N'admin', CAST(N'2026-05-21T03:23:54.130' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (33, N'damia', CAST(N'2026-05-21T22:14:00.757' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (34, N'damia', CAST(N'2026-05-21T22:14:13.927' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (35, N'damia', CAST(N'2026-05-21T22:14:22.627' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (36, N'aron', CAST(N'2026-05-21T22:28:55.920' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (37, N'admin', CAST(N'2026-05-21T22:44:43.570' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (38, N'pepper', CAST(N'2026-05-22T00:45:29.480' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (39, N'pepper', CAST(N'2026-05-22T00:45:41.083' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (40, N'peper', CAST(N'2026-05-22T00:45:47.693' AS DateTime), N'Failed', N'Unknown Username')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (41, N'pepper', CAST(N'2026-05-22T00:45:58.360' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (42, N'pepper', CAST(N'2026-05-22T00:49:23.973' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (43, N'admin', CAST(N'2026-05-22T00:52:30.997' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (44, N'admin', CAST(N'2026-05-24T15:47:18.913' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (45, N'fahmi', CAST(N'2026-05-24T16:01:55.700' AS DateTime), N'Failed', N'Unknown Username')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (46, N'damia', CAST(N'2026-05-24T16:02:13.297' AS DateTime), N'Failed', N'Incorrect Password')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (47, N'damia', CAST(N'2026-05-24T16:02:19.847' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (48, N'admin', CAST(N'2026-05-24T19:03:39.963' AS DateTime), N'Success', N'Valid Login')
GO
INSERT [dbo].[LoginLogs] ([ID], [Username], [AttemptTime], [Status], [Reason]) VALUES (49, N'damia', CAST(N'2026-05-24T23:45:42.827' AS DateTime), N'Success', N'Valid Login')
GO
SET IDENTITY_INSERT [dbo].[LoginLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[PasswordChangeLogs] ON 
GO
INSERT [dbo].[PasswordChangeLogs] ([ID], [UserID], [Username], [ChangeType], [ChangeTime]) VALUES (4, 11, N'damia', N'Forgot Password Reset', CAST(N'2026-05-21T03:12:28.703' AS DateTime))
GO
INSERT [dbo].[PasswordChangeLogs] ([ID], [UserID], [Username], [ChangeType], [ChangeTime]) VALUES (5, 11, N'damia', N'Forgot Password Reset', CAST(N'2026-05-24T18:51:21.120' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PasswordChangeLogs] OFF
GO
INSERT [dbo].[Settings] ([Name], [Value]) VALUES (N'LateFee', CAST(5.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([ID], [Name], [Email], [Username], [Password], [Role], [Wallet], [ICNumber]) VALUES (6, N'System Admin', N'admin@mmu.edu.my', N'admin', N'scrypt:32768:8:1$ReYnt2LO1mudWyix$68060ebaca7c3c78fa26e18843075f9ed899fa3eae79f364cbc4c3e4afd24ce5f11d3e2ad713b39cc6cf946cc3c66b954061b0e827e52d4b60d4e8fcafb48f98', N'Admin', CAST(0.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[Users] ([ID], [Name], [Email], [Username], [Password], [Role], [Wallet], [ICNumber]) VALUES (11, N'Damia', N'damia@gmail.com', N'damia', N'scrypt:32768:8:1$VcjtMd5QCSrFaESE$29d4f72619e4b13c23daefe90fc8f3b075a8ff56f1edaa9b1e9acec25aa0afee68a44e39477eacba56aed95d08d31afa5e0b8460e20c5b5967b10261317e5ff0', N'Member', CAST(0.00 AS Decimal(10, 2)), N'101010121010')
GO
INSERT [dbo].[Users] ([ID], [Name], [Email], [Username], [Password], [Role], [Wallet], [ICNumber]) VALUES (12, N'Aron', N'aron@gmail.com', N'aron', N'scrypt:32768:8:1$zFdu9uO2dY1GO3th$15b97aa170b6633e6aa306bf8fc62c0c68bdb6a1e4daeb893d1b1921f89491613afa5f395ed5e51df47470508aab6de85d4e80583d797264ba3cc9bce625f942', N'Member', CAST(0.00 AS Decimal(10, 2)), N'040303122323')
GO
INSERT [dbo].[Users] ([ID], [Name], [Email], [Username], [Password], [Role], [Wallet], [ICNumber]) VALUES (13, N'Pepper Potts', N'pepper@gmail.com', N'pepper', N'scrypt:32768:8:1$ZJqUztf73p4RX0Ig$2656f5ea28e2ff9a6a3a38cce94e014117fa938405036da9f4dcd9d3e1ed3fc6c64b5cd5be674c32f582a5c39b8ce0e53b27b93f4d22df213ae2a2cfb32bedbd', N'Member', CAST(0.00 AS Decimal(10, 2)), N'121212101234')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4F928AC2A]    Script Date: 20/6/2026 6:03:08 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534AA15E4D1]    Script Date: 20/6/2026 6:03:08 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT ('Available') FOR [Status]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT ('Uncategorized') FOR [Genre]
GO
ALTER TABLE [dbo].[Loans] ADD  DEFAULT (getdate()) FOR [BorrowDate]
GO
ALTER TABLE [dbo].[Loans] ADD  DEFAULT ((0.00)) FOR [Fine]
GO
ALTER TABLE [dbo].[Loans] ADD  DEFAULT ('Clear') FOR [Status]
GO
ALTER TABLE [dbo].[LoginLogs] ADD  DEFAULT (getdate()) FOR [AttemptTime]
GO
ALTER TABLE [dbo].[PasswordChangeLogs] ADD  DEFAULT (getdate()) FOR [ChangeTime]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('Member') FOR [Role]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0.00)) FOR [Wallet]
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([ID])
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Loans_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([ID])
GO
ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Loans_Books]
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Loans_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Loans_Users]
GO
ALTER TABLE [dbo].[PasswordChangeLogs]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [LibraryDB] SET  READ_WRITE 
GO
