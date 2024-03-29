USE [master]
GO
/****** Object:  Database [Gshop]    Script Date: 14/02/2023 3:37:37 CH ******/
CREATE DATABASE [Gshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Gem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Gem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Gshop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gshop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gshop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gshop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Gshop] SET  MULTI_USER 
GO
ALTER DATABASE [Gshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gshop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gshop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Gshop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Gshop] SET QUERY_STORE = OFF
GO
USE [Gshop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 14/02/2023 3:37:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Numberphone] [varchar](10) NOT NULL,
	[Email] [nvarchar](80) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 14/02/2023 3:37:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adress](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Adress] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 14/02/2023 3:37:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 14/02/2023 3:37:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14/02/2023 3:37:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [bit] NULL,
	[Adress] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Oders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14/02/2023 3:37:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Image] [nvarchar](150) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [bigint] NOT NULL,
	[Sale] [float] NOT NULL,
	[Description] [nvarchar](150) NULL,
	[Quantity] [int] NOT NULL,
	[QuantiId] [bigint] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quantitatives]    Script Date: 14/02/2023 3:37:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quantitatives](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Quantitative] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'admin', N'admin', N'0849675545', N'locttpc01615@fpt.edu.vn', N'Gemlove nè', N'none-photo.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'admin123', N'123', N'0899675543', N'locbkafc1233@gmail.com', N'Hoàng Long', N'none-photo.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'admin1234', N'123', N'0981231234', N'nguyenvong123@gmail.com', N'Nguyễn Linh', N'none-photo.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'adminne', N'1234', N'0893456789', N'admin1@gmail.com', N'Nguyễn võ admin', N'none-photo.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'lelong123', N'123456', N'0899765545', N'locbkafc123@gmail.com', N'Lê Hoàng Long', N'none-photo.jpg', 0, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'lelonglinh123', N'123456', N'0899675544', N'locbkafc1234@gmail.com', N'Lê Long Linh', N'none-photo.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'ngandu123', N'123456', N'0797979797', N'ngandu123@gmail.com', N'Nguyễn Bích Ngân', N'none-photo.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'thuytrang123', N'123456', N'0865954743', N'trangbkafc123@gmail.com', N'Nguyễn Thùy Trang', N'none-photo.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'thuytrang1234', N'123456', N'0865954733', N'trangbkafc1234@gmail.com', N'Nguyễn Thùy Trang', N'none-photo.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'user1', N'123', N'0891324567', N'nguoidung123@gmail.com', N'Nguyễn Thị Người Dùng', N'none-photo.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'user2', N'123', N'0891236537', N'nguoidung2@gmail.com', N'Nguyễn Thị Người Dùng 2', N'none-photo.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'user3', N'123', N'0891233213', N'nguoidung3@gmail.com', N'Hoàng Long', N'none-photo.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'user4', N'123', N'0899675345', N'hoanglong132@gmail.com', N'Hoàng Long', N'none-photo.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'user5', N'123', N'0899675541', N'locttpc01612225@fpt.edu.vn', N'Người dùng 5', N'none-photo.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Numberphone], [Email], [Fullname], [Photo], [Active], [Admin]) VALUES (N'user7', N'123', N'0899677382', N'locttpc016215@fpt.edu.vn', N'Hoàng Long', N'none-photo.jpg', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Adress] ON 

INSERT [dbo].[Adress] ([Id], [Username], [Adress]) VALUES (1, N'admin', N'306C Nguyễn Văn Linh, phường An Khánh, quận Ninh Kiều Cần Thơ')
INSERT [dbo].[Adress] ([Id], [Username], [Adress]) VALUES (5, N'admin', N'Cần Thơ')
INSERT [dbo].[Adress] ([Id], [Username], [Adress]) VALUES (7, N'admin', N'Cầu tre')
INSERT [dbo].[Adress] ([Id], [Username], [Adress]) VALUES (8, N'admin', N'Trà nóc
')
INSERT [dbo].[Adress] ([Id], [Username], [Adress]) VALUES (9, N'user1', N'Cà Mau')
INSERT [dbo].[Adress] ([Id], [Username], [Adress]) VALUES (10, N'user1', N'Cà Mau 1')
INSERT [dbo].[Adress] ([Id], [Username], [Adress]) VALUES (11, N'user2', N'Đài loan')
INSERT [dbo].[Adress] ([Id], [Username], [Adress]) VALUES (12, N'user2', N'Cần Thơ')
INSERT [dbo].[Adress] ([Id], [Username], [Adress]) VALUES (13, N'user3', N'Trà Nóc')
SET IDENTITY_INSERT [dbo].[Adress] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Trái cây')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Rau củ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Rau lá')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Thịt')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1, 1, 2, 25000, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (2, 2, 11, 13000, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (3, 2, 12, 16000, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (4, 2, 30, 5000, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (5, 3, 4, 80000, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (6, 4, 3, 6000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (7, 7, 7, 90000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (8, 8, 29, 18000, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (9, 9, 32, 15000, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (10, 9, 34, 10000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (11, 9, 3, 6000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (12, 9, 11, 13000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (13, 10, 4, 72000, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (14, 11, 4, 72000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (15, 12, 3, 6000, 4)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Adress]) VALUES (1, N'admin', CAST(N'2022-06-29T00:00:00.000' AS DateTime), 0, N'Cần Thơ')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Adress]) VALUES (2, N'user1', CAST(N'2022-06-29T00:00:00.000' AS DateTime), 0, N'Cà Mau')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Adress]) VALUES (3, N'user1', CAST(N'2022-06-29T00:00:00.000' AS DateTime), 0, N'Cà Mau 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Adress]) VALUES (4, N'user1', CAST(N'2022-06-29T00:00:00.000' AS DateTime), 0, N'Cà Mau 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Adress]) VALUES (5, N'user2', CAST(N'2022-06-29T00:00:00.000' AS DateTime), 0, N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Adress]) VALUES (6, N'user3', CAST(N'2022-06-29T00:00:00.000' AS DateTime), 0, N'Trà Nóc')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Adress]) VALUES (7, N'admin', CAST(N'2022-06-29T00:00:00.000' AS DateTime), 0, N'Cầu tre')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Adress]) VALUES (8, N'admin', CAST(N'2022-07-01T00:00:00.000' AS DateTime), 0, N'Trà nóc
')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Adress]) VALUES (9, N'admin', CAST(N'2022-07-01T00:00:00.000' AS DateTime), 0, N'306C Nguyễn Văn Linh, phường An Khánh, quận Ninh Kiều Cần Thơ')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Adress]) VALUES (10, N'admin', CAST(N'2022-07-01T00:00:00.000' AS DateTime), 0, N'306C Nguyễn Văn Linh, phường An Khánh, quận Ninh Kiều Cần Thơ')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Adress]) VALUES (11, N'admin', CAST(N'2022-07-17T00:00:00.000' AS DateTime), 0, N'306C Nguyễn Văn Linh, phường An Khánh, quận Ninh Kiều Cần Thơ')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Adress]) VALUES (12, N'admin', CAST(N'2023-02-14T00:00:00.000' AS DateTime), 0, N'Cầu tre')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (1, N'Cà chua ', N'product-1.jpg', 30000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 1, 0, NULL, 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (2, N'Dứa ', N'product-2.jpg', 25000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 1, 0, NULL, 1, 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (3, N'Ớt hiểm', N'product-3.jpg', 6000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 1, 0, NULL, 50, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (4, N'Dâu tây Đà Lạt', N'product-1676362942923.jpg', 80000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 1, 10, N'', 300, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (5, N'Dưa leo', N'product-5.jpg', 25000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 1, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (6, N'Cà chua bi', N'product-6.jpg', 15000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 1, 0, NULL, 1, 3)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (7, N'Nho đỏ không hạt', N'product-7.jpg', 90000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 1, 10, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (8, N'Chuối cau', N'product-8.jpg', 90000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 1, 0, NULL, 1, 4)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (9, N'Cà rốt Đà lạt', N'product-9.jpg', 13000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (10, N'Củ cải trắng', N'product-10.jpg', 9000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (11, N'Khoai tây', N'product-11.jpg', 13000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (12, N'Khổ qua', N'product-12.jpg', 16000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (13, N'Su su ', N'product-13.jpg', 10000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (14, N'Củ dền ', N'product-14.jpg', 11000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (15, N'Bí đỏ', N'product-15.jpg', 8000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (16, N'Bí đỏ hồ lô', N'product-16.jpg', 11000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 19, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (17, N'Khoai lang', N'product-17.jpg', 26000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (18, N'Bắp cải trắng', N'product-18.jpg', 9000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (19, N'Bắp cải tím', N'product-19.jpg', 26000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (20, N'Bông cải xanh', N'product-20.jpg', 15000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, N'Rau xanh tươi ngon mời bạn ăn nha', 300, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (21, N'Bắp cải thảo', N'product-21.jpg', 10000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 30, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (22, N'Đậu cô ve lâm đồng', N'product-22.jpg', 18000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (23, N'Đậu bắp ', N'product-23.jpg', 8000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 250, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (24, N'Bông cải trắng', N'product-24.jpg', 30000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 10, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (25, N'Hành tây', N'product-25.jpg', 7000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 2, 0, NULL, 300, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (26, N'Táo Envy Mỹ', N'product-26.jpg', 80000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 1, 10, NULL, 1, 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (27, N'Xà lách lô lô xanh', N'product-27.jpg', 15000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 3, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (28, N'Xà lách búp mỡ', N'product-28.jpg', 15000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 3, 12, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (29, N'Xà lách xoong Đà lạt', N'product-29.jpg', 18000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 3, 15, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (30, N'Rau răm lá', N'product-30.jpg', 5000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 3, 0, NULL, 100, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (31, N'Rau thơm các loại', N'product-31.jpg', 12000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 3, 28, NULL, 200, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (32, N'Rau đay', N'product-32.jpg', 15000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 3, 0, NULL, 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (33, N'Giá sống gói', N'product-33.jpg', 6000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 3, 10, NULL, 200, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (34, N'Ngò gai, rau om ', N'product-34.jpg', 10000, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 1, 3, 0, N'', 100, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (35, N'Rau Muống lol', N'product-1656647573382.jpg', 15000, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 0, 3, 10, N'Rau muống không thơm ngon', 500, 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId], [Sale], [Description], [Quantity], [QuantiId]) VALUES (36, N'Rau Muống lol', N'product-1656647573382.jpg', 15000, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 0, 4, 10, N'Rau muống không thơm ngon', 500, 6)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Quantitatives] ON 

INSERT [dbo].[Quantitatives] ([Id], [Name]) VALUES (1, N'Kg')
INSERT [dbo].[Quantitatives] ([Id], [Name]) VALUES (2, N'Trái')
INSERT [dbo].[Quantitatives] ([Id], [Name]) VALUES (3, N'Hộp')
INSERT [dbo].[Quantitatives] ([Id], [Name]) VALUES (4, N'Nải')
INSERT [dbo].[Quantitatives] ([Id], [Name]) VALUES (5, N'Vỉ')
INSERT [dbo].[Quantitatives] ([Id], [Name]) VALUES (6, N'Gram')
INSERT [dbo].[Quantitatives] ([Id], [Name]) VALUES (7, N'Túi')
INSERT [dbo].[Quantitatives] ([Id], [Name]) VALUES (8, N'Thùng')
SET IDENTITY_INSERT [dbo].[Quantitatives] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UniqueKey_Email]    Script Date: 14/02/2023 3:37:37 CH ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [UniqueKey_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UniqueKey_SDT]    Script Date: 14/02/2023 3:37:37 CH ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [UniqueKey_SDT] UNIQUE NONCLUSTERED 
(
	[Numberphone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Account]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Oders1] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Oders1]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Oders_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Oders_Account]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Quantitatives] FOREIGN KEY([QuantiId])
REFERENCES [dbo].[Quantitatives] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Quantitatives]
GO
USE [master]
GO
ALTER DATABASE [Gshop] SET  READ_WRITE 
GO
