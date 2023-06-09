USE [master]
GO
/****** Object:  Database [CP2296F02_Group2]    Script Date: 30/09/2022 12:18:39 PM ******/
CREATE DATABASE [CP2296F02_Group2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CP2296F02_Group2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\CP2296F02_Group2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CP2296F02_Group2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\CP2296F02_Group2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CP2296F02_Group2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CP2296F02_Group2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET ARITHABORT OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CP2296F02_Group2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CP2296F02_Group2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CP2296F02_Group2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CP2296F02_Group2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET RECOVERY FULL 
GO
ALTER DATABASE [CP2296F02_Group2] SET  MULTI_USER 
GO
ALTER DATABASE [CP2296F02_Group2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CP2296F02_Group2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CP2296F02_Group2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CP2296F02_Group2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CP2296F02_Group2', N'ON'
GO
USE [CP2296F02_Group2]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 30/09/2022 12:18:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](100) NOT NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 30/09/2022 12:18:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[image_product_Id] [int] IDENTITY(1,1) NOT NULL,
	[name_file] [nvarchar](1000) NOT NULL,
	[product_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[image_product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Product]    Script Date: 30/09/2022 12:18:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_price] [decimal](18, 0) NOT NULL,
	[status_review] [int] NULL,
 CONSTRAINT [PK__Order_Pr__3213E83F18A1F52A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 30/09/2022 12:18:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[delivery_date] [nvarchar](50) NULL,
	[address_receive] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[payform] [int] NOT NULL,
	[status] [int] NOT NULL,
	[customer_name] [nvarchar](50) NOT NULL,
	[total_price] [int] NOT NULL,
 CONSTRAINT [PK__Orders__46596229C00DB360] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 30/09/2022 12:18:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](100) NOT NULL,
	[product_price] [decimal](12, 2) NOT NULL,
	[description] [text] NOT NULL,
	[old_price] [decimal](12, 0) NOT NULL,
	[quantity] [int] NOT NULL,
	[update_date] [nvarchar](50) NOT NULL,
	[category_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[image_product] [nvarchar](1000) NOT NULL,
	[total_star] [float] NULL,
 CONSTRAINT [PK__Product__47027DF57EDA052F] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 30/09/2022 12:18:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[review_Id] [int] IDENTITY(1,1) NOT NULL,
	[content_review] [text] NOT NULL,
	[star] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[review_date] [date] NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[review_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 30/09/2022 12:18:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[sale_id] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[content_sale] [text] NOT NULL,
	[decrease_percent] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[sale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30/09/2022 12:18:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](1000) NULL,
	[user_type] [int] NULL,
	[birthday] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[gender] [int] NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[code] [nvarchar](1000) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__Users__3213E83F43825A7E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name], [status]) VALUES (1, N'Vegetable', 0)
INSERT [dbo].[Category] ([category_id], [category_name], [status]) VALUES (2, N'Nuts', 0)
INSERT [dbo].[Category] ([category_id], [category_name], [status]) VALUES (3, N'Fruit', 0)
INSERT [dbo].[Category] ([category_id], [category_name], [status]) VALUES (4, N'Honey & Essential Oils', 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Order_Product] ON 

INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1003, 1, 18, 1006, CAST(78 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1004, 1, 19, 1006, CAST(65 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1005, 1, 20, 1006, CAST(49 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1009, 1, 33, 1008, CAST(32 AS Decimal(18, 0)), 0)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1010, 2, 39, 1008, CAST(45 AS Decimal(18, 0)), 0)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1011, 1, 24, 1008, CAST(65 AS Decimal(18, 0)), 0)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1012, 2, 20, 1009, CAST(49 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1013, 2, 39, 1009, CAST(45 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1014, 2, 18, 1010, CAST(78 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1015, 2, 37, 1010, CAST(48 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1016, 1, 39, 1010, CAST(45 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1017, 2, 17, 1011, CAST(98 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1018, 2, 3, 1011, CAST(23 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1019, 1, 42, 1011, CAST(123 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1020, 1, 33, 1012, CAST(32 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1021, 1, 1, 1012, CAST(30 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1022, 2, 36, 1012, CAST(45 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1023, 2, 8, 1012, CAST(23 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1024, 1, 32, 1013, CAST(15 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1025, 2, 9, 1013, CAST(23 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1026, 2, 13, 1013, CAST(65 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1027, 1, 1, 1014, CAST(30 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1028, 2, 42, 1014, CAST(123 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1029, 1, 17, 1015, CAST(98 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1030, 1, 3, 1015, CAST(23 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1031, 1, 20, 1015, CAST(49 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1032, 1, 1, 1016, CAST(30 AS Decimal(18, 0)), 0)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1033, 2, 42, 1016, CAST(123 AS Decimal(18, 0)), 0)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1034, 1, 43, 1016, CAST(223 AS Decimal(18, 0)), 0)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1035, 1, 2, 1017, CAST(23 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1036, 1, 8, 1017, CAST(23 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1037, 1, 12, 1017, CAST(45 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1038, 1, 19, 1018, CAST(65 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1039, 2, 39, 1018, CAST(45 AS Decimal(18, 0)), 1)
INSERT [dbo].[Order_Product] ([id], [quantity], [product_id], [order_id], [product_price], [status_review]) VALUES (1040, 1, 24, 1018, CAST(65 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[Order_Product] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [delivery_date], [address_receive], [phone], [payform], [status], [customer_name], [total_price]) VALUES (1006, 1011, CAST(N'2022-09-24' AS Date), N'24/09/2022', N'Can Tho', N'0796725209', 0, 2, N'minh thuy', 299)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [delivery_date], [address_receive], [phone], [payform], [status], [customer_name], [total_price]) VALUES (1007, 1011, CAST(N'2021-09-01' AS Date), N'02/09/2022', N'Can Tho', N'0939974419', 1, 3, N'minhthuy', 200)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [delivery_date], [address_receive], [phone], [payform], [status], [customer_name], [total_price]) VALUES (1009, 1015, CAST(N'2022-09-28' AS Date), N'28/09/2022', N'Korea', N'0796725209', 0, 2, N'Park Jiyeon', 188)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [delivery_date], [address_receive], [phone], [payform], [status], [customer_name], [total_price]) VALUES (1010, 1016, CAST(N'2021-08-27' AS Date), N'27/08/2021', N'TL', N'0796725209', 1, 2, N'EF', 297)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [delivery_date], [address_receive], [phone], [payform], [status], [customer_name], [total_price]) VALUES (1011, 1017, CAST(N'2022-02-01' AS Date), N'01/02/2022', N'Korea', N'0796725209', 1, 2, N'Park Hyomin', 365)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [delivery_date], [address_receive], [phone], [payform], [status], [customer_name], [total_price]) VALUES (1012, 1018, CAST(N'2022-02-02' AS Date), N'02/02/2022', N'Can Tho', N'0796725209', 1, 2, N'MT', 198)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [delivery_date], [address_receive], [phone], [payform], [status], [customer_name], [total_price]) VALUES (1013, 1019, CAST(N'2022-01-28' AS Date), N'28/01/2022', N'VietNam', N'0939884933', 1, 2, N'Henie', 191)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [delivery_date], [address_receive], [phone], [payform], [status], [customer_name], [total_price]) VALUES (1014, 1011, CAST(N'2021-02-03' AS Date), N'02/02/2021', N'Can Tho', N'0939884933', 0, 2, N'MinhThuy', 276)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [delivery_date], [address_receive], [phone], [payform], [status], [customer_name], [total_price]) VALUES (1015, 1011, CAST(N'2022-05-07' AS Date), N'07/05/2022', N'Can Tho', N'0796725209', 0, 2, N'Minh ThÃ¹y', 170)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [delivery_date], [address_receive], [phone], [payform], [status], [customer_name], [total_price]) VALUES (1016, 1011, CAST(N'2022-01-30' AS Date), N'30/01/2022', N'Can Tho', N'0796725209', 1, 2, N'Minh Thuy', 499)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [delivery_date], [address_receive], [phone], [payform], [status], [customer_name], [total_price]) VALUES (1017, 1011, CAST(N'2021-02-15' AS Date), N'15/02/2021', N'Can Tho', N'0939884933', 0, 2, N'Minh Thuy', 91)
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [delivery_date], [address_receive], [phone], [payform], [status], [customer_name], [total_price]) VALUES (1018, 1011, CAST(N'2021-02-12' AS Date), N'12/02/2021', N'Can Tho', N'0796725209', 0, 2, N'Minh Thuy', 220)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (1, N'Cabbage', CAST(30.00 AS Decimal(12, 2)), N'Cabbage is a vegetable that is not very strange to Vietnamese people. Because it is used to make delicious and delicious dishes. But it is little known as a cure for many diseases. In addition to the name "spinach", it also has many other names such as: Spinach, Spinach, Temple Vegetable, Spinach... This is a plant belonging to the Amaranth family and is native to Central and Southwest Asia.', CAST(45 AS Decimal(12, 0)), 98, N'2022-09-12', 1, 0, N'rau_cai.jpg', 4)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (2, N'Water spinach', CAST(23.00 AS Decimal(12, 2)), N'Water spinach is a very cheap vegetable compared to other vegetables, but it provides abundant minerals and vitamins such as protein, iron, calcium, fiber, vitamin A... These substances are essential nutrients. for body.', CAST(65 AS Decimal(12, 0)), 99, N'2022-09-12', 1, 0, N'rau_muong.jpg', 5)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (3, N'Japanese beans', CAST(23.00 AS Decimal(12, 2)), N'Japanese soybeans also known as vegetable soybeans or hairy soybeans originated from Japan, are delicious and have high nutritional value, are very healthy and nutritious foods because of their high content of nutrients. minerals, vitamins, protein, fat, fiber, very good for the intestines, smoothing facial skin and also has the effect of preventing some cancers', CAST(56 AS Decimal(12, 0)), 120, N'2022-09-12', 1, 0, N'dau_nhat.jpg', 4.5)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (4, N'Onion baro', CAST(23.00 AS Decimal(12, 2)), N'Baro onion also known as leek. This is one of the indispensable ingredients in many dishes, creating an attractive and unforgettable taste. Not only that, leeks are also a rich source of nutrients for the body. To have more knowledge about  Onion Baro dont miss this article.', CAST(65 AS Decimal(12, 0)), 132, N'2022-09-12', 1, 0, N'hanh_baro.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (5, N'Celery', CAST(23.00 AS Decimal(12, 2)), N'Celery is one of the vegetables that are rated as "superfoods" with high nutritional content, and is extremely delicious when combining the special aroma of stir-fried celery with beef... In fresh form when processing food, you can also make celery juice for weight loss, cooling the body, and detoxifying the body very well.', CAST(32 AS Decimal(12, 0)), 11, N'2022-09-12', 1, 0, N'rau_can_tay.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (6, N'Coriander', CAST(23.00 AS Decimal(12, 2)), N'Coriander is also known by other names such as:   cilantro, cilantro, coriander, coriander, coriander, nguyen thu, lake Tuy, Huong Tuy, coriander, .... Coriander is a type of plant. herbs, this vegetable is native to the countries of Southwest Asia and Africa.', CAST(36 AS Decimal(12, 0)), 165, N'2022-09-12', 1, 0, N'rau_mui.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (7, N'American Lettuce - Green Roll', CAST(23.00 AS Decimal(12, 2)), N'American lettuce originated in the tropics and today it has become a plant of the whole world. In our country, lettuce likes cool climate, especially the climate in Da Lat', CAST(56 AS Decimal(12, 0)), 178, N'2022-09-12', 1, 0, N'xa_lach.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (8, N'Purple Cauliflower', CAST(23.00 AS Decimal(12, 2)), N'Purple cauliflower is also known as purple broccoli. This is one of the vegetables grown by housewives with high nutritional value. That is also the reason the price of purple cauliflower is higher than that of common vegetables.', CAST(48 AS Decimal(12, 0)), 134, N'2022-09-12', 1, 0, N'sup_lo.jpg', 5)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (9, N'Lotus seeds', CAST(23.00 AS Decimal(12, 2)), N'Dried lotus seeds are a kind of nutritious seed, bringing a lot of benefits to the health of users. Since ancient times, the lotus tree has been a familiar plant species and a symbol of the Vietnamese people. Dried lotus seeds are the product of fresh lotus seeds when ripe, collected, processed and preserved by farmers. Crispy dried lotus seeds (dried lotus seeds) will be preserved for a longer time than fresh lotus seeds. Dried lotus seeds have many different uses. In addition to being used as an indispensable medicine in Eastern medicine, dried lotus is also a raw material for processing many delicious and nutritious dishes such as: longan lotus seed tea, snow mushroom lotus seed tea, porridge. lotus seeds, crispy dried lotus seeds…', CAST(65 AS Decimal(12, 0)), 192, N'2022-09-12', 2, 0, N'hat_sen.jpg', 5)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (10, N'Sterculia lychonophora Hnce', CAST(23.00 AS Decimal(12, 2)), N'Sterculia lychonophora Hnce (Sterculia lychonophora Hnce) is also known as flying orangutan seed, orangutan seed, an Nam Tu, Dai Dong fruit, pang da hai,... This is one of the seeds that are mixed as a nutritious drink. in the summer, dispel the heat and fatigue. The fruiting cycle of the orangutan tree is every 4 years. Orangutan trees growing in the forest are often found in countries in Southeast Asia such as Thailand, Vietnam, Laos or Malaysia. In Vietnam, the orangutan grows in the Central Highlands and the Central Central region. After being harvested, forest orangutan seeds will be screened again to select the best quality seeds. Then preliminarily processed for retail and exported to a number of countries.', CAST(87 AS Decimal(12, 0)), 167, N'2022-09-12', 2, 0, N'hat_uoi.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (11, N'Hazelnut', CAST(65.00 AS Decimal(12, 2)), N'Hazelnut is also known as  Hazelnut, its botanical name is  Corylus avellana. Hazelnuts are grown in many countries such as:  Greece,  Georgia, Turkey,  Italy, England,  southern Spain and 2 states  Oregon  and  Washington  of the US. Turkey is the largest source of hazelnuts in the world, accounting for 75% of the world production. Hazelnuts are delicious, full of nutrients that are good for health. Not only that, the taste of hazelnuts is delicious and fatty, so it is often used for cooking, in cakes.', CAST(76 AS Decimal(12, 0)), 100, N'2022-09-12', 2, 0, N'hat_phi.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (12, N'Nuts', CAST(45.00 AS Decimal(12, 2)), N'Dried nut is also known as  abalone nut, horseshoe nut, the shape of the nut is rough, with a dark brown hard shell. The nut has a white inner core, covered with a thin brown membrane. The filling is fat, very fragrant. Nuts are selected to be large, not crushed, rotten, then dried with  modern technology. The nuts will be separated from the hard outer shell and then packed in safe,  hygienic packages. Nuts convenient packaging, easy to use, you just need to store it in a cool, dry place and use it every day, not necessarily in the refrigerator.', CAST(312 AS Decimal(12, 0)), 99, N'2022-09-12', 2, 0, N'hach_kho.jpg', 4)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (13, N'O Mai Kho', CAST(65.00 AS Decimal(12, 2)), N'O Mai is also known as black apricot, from ancient times O Mai is the name of a medicine made from dried apricots until black and wilted. In traditional medicine, ô mai  is a very popular flavor in Asian countries such as Vietnam and China. Today, apricot is often used as a snack made from different fruits such as plums, tamarinds, apricots, used as a snack rather than as medicine. The fruits to open need to be carefully selected and processed with many different flavorings and ingredients to make the most delicious dessert.', CAST(79 AS Decimal(12, 0)), 98, N'2022-09-12', 2, 0, N'o_mai.jpg', 4)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (14, N'Sa Nhan', CAST(32.00 AS Decimal(12, 2)), N'Sa Nhan also has another name in Tay language, its mach Dang, in its language is co compressionh,  sa human is a tree that grows wild a lot in mountainous areas, under the shade of shady sandalwood trees. The part that is often used as medicine of the wormwood is the fruit seed. The fruit is usually sung in the summer, peeled and then removed the seeds inside, dried and used gradually.', CAST(87 AS Decimal(12, 0)), 100, N'2022-09-12', 2, 0, N'sa_nhan.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (15, N'Cardamom', CAST(100.00 AS Decimal(12, 2)), N'Other Vietnamese names: Red Cardamom / Black Cardamom Two part nomenclature: Amomum tsao-ko Belongs to the family: Ginger (Zingiberaceae) Cardberry flowers usually bloom in summer (from May to July) and bear fruit in winter In Vietnam, cardamom grows mainly in the Northwest region and Hoang Lien Son mountain range, it grows most in the provinces of Lao Cai, Yen Bai, Ha Giang, Lai Chau  Card fruit is a kind of aromatic herb. Hot spicy, characteristic aroma, they are often used in cuisine and as medicine. It is also known as the "spice queen" in the processing of delicious and famous Vietnamese dishes.', CAST(86 AS Decimal(12, 0)), 100, N'2022-09-12', 2, 0, N'thao_qua.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (16, N'Cashew', CAST(64.00 AS Decimal(12, 2)), N'What is also known as nutrition, is an industrial plant belonging to the mango family. It is grown in tropical climates for food processing. Cashew nuts are very crunchy and have a characteristic aroma. Often people buy salt roasted cashews. This is a specialty of Vietnam, so the market for  exported cashew nuts  always leads the way.', CAST(654 AS Decimal(12, 0)), 100, N'2022-09-12', 2, 0, N'hat_dieu.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (17, N'Mango Statue of Binh Dinh', CAST(98.00 AS Decimal(12, 2)), N'Binh Dinh is famous for many kinds of mangoes such as:   Mango statue, mango Thanh ca, mango honey, mango ash, mango sawn...etc. Each type of mango has its own unique flavor. In which, the most delicious and impressive is the mango statue. In addition to the sweet and fragrant taste, the mango has the highest economic value and is very popular in the market. Tuong mango is grown in many places, but when mentioning Tuong mango, people immediately think of Dai An (Binh Dinh) because this place grows the most and most delicious mangoes today.', CAST(456 AS Decimal(12, 0)), 97, N'2022-09-12', 3, 0, N'xoai_tuong.jpg', 5)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (18, N'Oven Milk Breast', CAST(78.00 AS Decimal(12, 2)), N'Vinh Kim Forges Milkweed is a delicious fruit known to all people in the South and in the country and is now grown on an industrial scale, but the Vinh Kim Forges apple variety is still associated with this special land. preserved by the people, especially  Vinh Kim Forge Forges apple tree is grown from the seeds of the first milkweed tree. The flesh of the fruit is milky white, soft, milky juice, thick flesh, high percentage of fruit flesh, few seeds, very sweet, fatty, characteristic aroma. yummy. Everlasting Blacksmiths Milk Breast has a sweet taste and is eaten fresh or chilled. This is a fruit that has been loved and used by Vietnamese people for hundreds of years.', CAST(45 AS Decimal(12, 0)), 96, N'2022-09-12', 3, 0, N'vu_sua.jpg', 5)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (19, N'Sapodilla', CAST(65.00 AS Decimal(12, 2)), N'Persimmon fruit is the name in the North, people in the South call it  left sapoche, this is a precious, benign fruit that can be used for both healthy and sick people. In order for the quality of the fruit to be fragrant and sweet when ripe, it is necessary to get the old fruit and know how to make the right vinegar.', CAST(645 AS Decimal(12, 0)), 98, N'2022-09-12', 3, 0, N'hong_xiem.jpg', 4)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (20, N'Hung Yen Longan Longan', CAST(49.00 AS Decimal(12, 2)), N'Longan has the scientific name of Dimocarpus longan, called  "longan" in Chinese. This is a typical fruit of the tropics, woody, perennial. According to summarizing from localities, currently Hung Yen is the place with the largest growing area and the best quality of longan. Currently, Hung Yen has nearly 4 thousand hectares of longan, of which, the area for harvesting is about 3,000. ha.', CAST(45 AS Decimal(12, 0)), 94, N'2022-09-12', 3, 0, N'nhan_long.jpg', 5)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (21, N'Apricot Fruit', CAST(32.00 AS Decimal(12, 2)), N'Apricots have a good acid-sugar balance and are a very good source of thiamine, riboflavin, carotene, minerals, fiber, and vitamins. They are also a good source of the same antioxidants (e.g. anthocyanins) that have red wines health benefits. In addition to anthocyanins, bayberry also contains flavonols, ellagitannins and phenolic compounds such as gallic acid, quercetin hexoside,...', CAST(54 AS Decimal(12, 0)), 100, N'2022-09-12', 3, 0, N'thanh_mai.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (22, N'Orange', CAST(12.00 AS Decimal(12, 2)), N'Sanh orange is a fruit tree of the genus Citrus that is widely distributed throughout Vietnam from Tuyen Quang, Ha Giang, Yen Bai to Vinh Long, Tien Giang, and Can Tho. But in general, oranges are suitable for fertile ancient alluvial soil, cool and humid climate. Vietgap claypot oranges are the main planting and care standards of the people here', CAST(45 AS Decimal(12, 0)), 100, N'2022-09-12', 3, 0, N'cam_sanh.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (23, N'Na Lang Son', CAST(25.00 AS Decimal(12, 2)), N'Na, also known as  soursop ta, custard apple dai/giai, salsa, phan le chi, is a species of the genus Na (Annona) native to tropical America. The na  is one of the most delicious tropical fruits native to the Andean valleys of Peru and Ecuador. Today, this delicious and healthy fruit is grown in popularity all over the world.', CAST(23 AS Decimal(12, 0)), 100, N'2022-09-12', 3, 0, N'na.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (24, N'Dragon Fruit', CAST(65.00 AS Decimal(12, 2)), N'White flesh dragon fruit  belongs to the genus Hylocereus, the scientific name is Hylocereus undatus. The pods are pink or red. People call it white flesh dragon fruit because in Phan Thiet - Binh Thuan, there is another type of dragon fruit called red flesh dragon fruit.', CAST(46 AS Decimal(12, 0)), 98, N'2022-09-12', 3, 0, N'thanh_long.jpg', 4)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (25, N'Turmeric Essential Oil', CAST(56.00 AS Decimal(12, 2)), N'As a product extracted from turmeric, produced by steam distillation,  turmeric essential oil  has a watery, yellow color and a characteristic pungent, turmeric smell. In turmeric essential oil, there are more than 300 phenol compounds, of which the outstanding active ingredient is Curcumin, including molecules capable of increasing the amount of oxygen supplied to the brain. In addition,  Turmeric Oil  also contains antibacterial, anti-fungal, anti-viral, anti-worm, anti-allergic and anti-parasitic substances that bring great benefits to users not only in terms of health but also in working the beauty of women.', CAST(31 AS Decimal(12, 0)), 100, N'2022-09-12', 4, 0, N'tinh_dau_nghe.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (26, N'Rose Essential Oil', CAST(48.00 AS Decimal(12, 2)), N'Rose essential oil is a product extracted from rose petals by steam distillation. With a seductive scent and many special nutrients, rose essential oil is considered an endless source of inspiration by researchers and always has a strong foothold in the cosmetic industry. Not only that, in rose oil also contains many nutrients beneficial to health such as: Ethanol, Stearpoten, Citronelyl Acetate, Eugenol, Nonanol, Nonanal, Citronellol, Citral, Carvone, Nerol, Phenyl Acetaldehyde, Farnesol, Phenylmenthyl Acetate, Methyl Eugenol…', CAST(78 AS Decimal(12, 0)), 100, N'2022-09-12', 4, 0, N'tinh_dau_hoa_hong.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (27, N'Coconut Oil', CAST(98.00 AS Decimal(12, 2)), N'This is the finished product made, extracted from the amount of nutrients in the old coconut. Unlike hot pressed coconut oil products by conventional manual methods, cold pressed coconut oil is produced on modern production lines thanks to cold drying technology, separated into many different stages, requiring meticulous attention to detail. and be patient. Cold pressed coconut oil always ensures to keep the good, important and most necessary nutrients, bringing high efficiency to the user. Besides, 100% pure cold pressed coconut oil, without water or any impurities, helps you to preserve and use for a longer time than products made from traditional methods.', CAST(67 AS Decimal(12, 0)), 100, N'2022-09-12', 4, 0, N'tinh_dau_dua.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (28, N'Ginger Essential Oil', CAST(89.00 AS Decimal(12, 2)), N'Ginger essential oil is a finished product made from ginger root, so it contains the nutritional components found in ginger root and beneficial properties such as: laxative, antiseptic, providing vitamins, ... Ginger essential oil is used in the maintenance of good health such as: sore throat, nausea, abdominal pain, treatment of some diseases affecting the respiratory tract, menorrhagia, menstrual disorders, ... Not only that, ginger essential oil is used as a perfume to create fragrance, making us more confident.', CAST(67 AS Decimal(12, 0)), 100, N'2022-09-12', 4, 0, N'tinh_dau_gung.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (29, N'Forest honey', CAST(79.00 AS Decimal(12, 2)), N'Wild honey in Ha Giang has no human impact and is completely natural, wild honey is usually harvested only in a crisis season from March to June each year, wild honey has a strong flavor. Characteristic of forest flowers, sweet and delicate. Pure wild honey has a variety of colors, from dark brown to dark yellow, with relatively high adhesion.', CAST(78 AS Decimal(12, 0)), 100, N'2022-09-12', 4, 0, N'mat_ong.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (30, N'Mint Honey', CAST(45.00 AS Decimal(12, 2)), N'Mint flower honey, originating from Dong Van area - Ha Giang, is a wild flower. Mint flowers bloom the most from October to January. Therefore, mint honey on the market is relatively scarce because of its special effects on human health.', CAST(786 AS Decimal(12, 0)), 100, N'2022-09-12', 4, 0, N'mat_ong_bac_ha.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (31, N'Green Kiwi', CAST(65.00 AS Decimal(12, 2)), N'Green kiwi contains a lot of vitamin C, potassium, folic acid and fiber. Help foster health for children and women after giving birth. Vitamin C in green kiwi is twice as much as oranges (clay oranges, soup oranges, maple oranges, ... ). They help improve the function of the immune system, prevent the effects of hepatitis and the attack of viruses and bacteria, improve immunity, fight impotence. Eating Green Kiwi will prevent the formation of gelatin (glue) or clots when consuming dairy foods thanks to the actindin component.', CAST(67 AS Decimal(12, 0)), 100, N'2022-09-12', 3, 0, N'kiwi.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (32, N'Almond', CAST(15.00 AS Decimal(12, 2)), N'Almonds belong to the subgenus Amygdalus, another name for it is almonds. The shell of the almond is very hard (inner shell), wrinkled almonds wavy, surrounding the seed. Almonds are not a nut, this is a nut. You can roast or eat it raw, almonds are used in many dishes and are also part of the nutritional nut set for pregnant women. There are two types of almonds available today:  sweet almonds and  bitter almonds. . Bitter almonds have a bitter, warm, slightly toxic taste.', CAST(45 AS Decimal(12, 0)), 99, N'2022-09-12', 2, 0, N'hanh_nhan.jpg', 4)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (33, N'Broccoli', CAST(32.00 AS Decimal(12, 2)), N'Broccoli is also known as broccoli, it belongs to the species of wild cabbage, has large flowers at the top and is used as a vegetable. It is very good for health, they contain more vitamins A, C, and E than other green vegetables, helping to supplement nutrition and strengthen the bodys resistance. Scientific researchers have shown that soup Broccoli helps reduce the risk of cancer and many other diseases.', CAST(65 AS Decimal(12, 0)), 99, N'2022-09-12', 1, 0, N'sup_lo_xanh.jpg', 4)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (34, N'Pumpkin', CAST(26.00 AS Decimal(12, 2)), N'Pumpkin (Cucurbita pepo) is also known as pumpkin, pumpkin belongs to the family of cucurbits. This is a very good food with extremely useful uses. Almost all parts of the pumpkin plant can be used, from pumpkin flowers and pumpkin tops to pumpkin seeds and pumpkin seeds.', CAST(45 AS Decimal(12, 0)), 100, N'2022-09-12', 1, 0, N'bi_do.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (35, N'Roasted Salted Cashews', CAST(62.00 AS Decimal(12, 2)), N'What is also known as nutrition, is an industrial plant belonging to the mango family. It is grown in tropical climates for food processing. Cashew nuts are very crunchy and have a characteristic aroma. Often people buy salt roasted cashews. This is a specialty of Vietnam, so the market for  exported cashew nuts  always leads the way.', CAST(46 AS Decimal(12, 0)), 100, N'2022-09-12', 2, 0, N'hatdieu.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (36, N'Lettuce', CAST(45.00 AS Decimal(12, 2)), N'Lettuce is also known as cabbage and lettuce. The scientific name is Lactuca sativa, is a flowering plant belonging to the Asteraceae family, which originated quite a long time ago from European countries, and was first described scientifically in 1753. The name of the lettuce is derived from the From the stems of vegetables, after being cut, a milky juice like rubber will flow out. Lettuce is a leafy vegetable that is refreshing because of its purity and sedative properties.', CAST(94 AS Decimal(12, 0)), 100, N'2022-09-12', 1, 0, N'salach.jpg', 5)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (37, N'Honey', CAST(48.00 AS Decimal(12, 2)), N'Wild honey in Ha Giang has no human impact and is completely natural, wild honey is usually harvested only in a crisis season from March to June each year, wild honey has a strong flavor. Characteristic of forest flowers, sweet and delicate. Pure wild honey has a variety of colors, from dark brown to dark yellow, with relatively high adhesion.', CAST(94 AS Decimal(12, 0)), 98, N'2022-09-12', 4, 0, N'matong.jpg', 5)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (38, N'Ginger honey', CAST(45.00 AS Decimal(12, 2)), N'Ginger honey is a very familiar food for everyone, ginger honey is used a lot in daily life. When combining honey and ginger will bring what effect to human health. Many studies have shown that ginger honey has a very good effect in treating diseases and promoting health.', CAST(98 AS Decimal(12, 0)), 100, N'2022-09-12', 4, 0, N'mat_ong_gung.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (39, N'Cherry tomato', CAST(45.00 AS Decimal(12, 2)), N'Cherry tomatoes, in addition, this fruit is also called with a pretty name that is Cherry Tomato. This is a small tomato, round or long, red, all of which look very nice. Cherry tomatoes, though small, are sweeter than regular tomatoes. Cherry tomatoes are very easy to grow, the fruit is very wrong, can be grown all year round, wrong fruit, the price is 2-3 times higher than normal tomatoes.', CAST(99 AS Decimal(12, 0)), 93, N'2022-09-12', 3, 0, N'ca_chua.jpg', 3.6666666666666665)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (40, N'Fresh Artichoke Cotton', CAST(12.00 AS Decimal(12, 2)), N'Cotton artichoke is one of the most famous and typical specialties of Da Lat. In the artichoke flower contains high nutritional content that has many uses for the health of users.', CAST(97 AS Decimal(12, 0)), 100, N'2022-09-12', 1, 0, N'hoa_atiso.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (41, N'Asparagus', CAST(64.00 AS Decimal(12, 2)), N'Asparagus is no stranger to Vietnamese people, purple onion is an indispensable food in Vietnamese family meals. Onions make the taste of the dish much more appealing. Not only is it a food that makes dishes more attractive, onions also provide us with many healthy nutrients.', CAST(96 AS Decimal(12, 0)), 100, N'2022-09-12', 1, 0, N'mangtay.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (42, N'Melon', CAST(123.00 AS Decimal(12, 2)), N'Cantaloupe is a clean, round, rather large fruit with unique white veins. In addition, its taste is also very special, crispy and sweet taste. This is a fruit that helps to add many nutrients to the body and is often used to cool down. It consists of 2 types  yellow cantaloupe and  green cantaloupe.', CAST(453 AS Decimal(12, 0)), 94, N'2022-09-21', 3, 0, N'dua_luoi.jpg', 5)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (43, N'Cucumber', CAST(223.00 AS Decimal(12, 2)), N'Cucumber (cucumber) is a very familiar food every day, especially the health benefits of cucumbers. Cucumber  contains high water content (in cucumber contains up to 95% water), rich in vitamin C and fiber to help  white and healthy skin. In addition, cucumber also has the effect of reducing heat and anti-inflammatory. Cucumbers are a great summer snack.', CAST(354 AS Decimal(12, 0)), 99, N'2022-09-20', 1, 0, N'dua_chuot.jpg', NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [product_price], [description], [old_price], [quantity], [update_date], [category_id], [status], [image_product], [total_star]) VALUES (44, N'Macadamia nuts', CAST(46.00 AS Decimal(12, 2)), N'Macadamia nuts when compared with many other nutritious nuts such as almonds, walnuts, pine nuts.., in macadamia nuts contain a lot of fat but little protein content. The amount of monounsaturated fat in macadamia nuts is the highest compared to other nutritious nuts. Omega 7 fatty acids are about 22% in macadamia nuts biologically active as a monounsaturated fat. In addition, macadamia nuts contain  2% of nutrients, 9% of carbohydrates, 9% of protein as well as selenium, phosphorus, sodium, potassium, riboflavin, thiamin, iron and niacin.', CAST(354 AS Decimal(12, 0)), 100, N'2022-09-20', 2, 0, N'hat_mac_ca.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1010, N'sweet, delicious!', 5, 1011, 18, CAST(N'2022-09-24' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1012, N'delicious', 5, 1011, 20, CAST(N'2022-09-24' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1013, N'delicious', 5, 1011, 19, CAST(N'2022-09-24' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1014, N'So delicious! I will repurchase it.', 5, 1011, 20, CAST(N'2022-09-26' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1015, N'So delicious!', 5, 1015, 20, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1016, N'delicious!', 4, 1015, 39, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1017, N'So sweet!', 5, 1016, 18, CAST(N'2021-08-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1018, N'Honey so sweet! ', 5, 1016, 37, CAST(N'2021-08-29' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1019, N'normal
', 3, 1016, 39, CAST(N'2021-08-29' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1020, N'sweet and delicious!
', 5, 1017, 17, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1021, N'good', 4, 1017, 3, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1022, N'this fruit is so delicious! I will repurchase it.', 5, 1017, 42, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1023, N'good', 4, 1018, 33, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1024, N'good', 4, 1018, 1, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1025, N'so good', 5, 1018, 36, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1026, N'delicious!', 5, 1018, 8, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1027, N'delicious', 4, 1019, 32, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1028, N'so delicious', 5, 1019, 9, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1029, N'good', 4, 1019, 13, CAST(N'2022-09-28' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1030, N'normal', 3, 1011, 19, CAST(N'2022-09-29' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1031, N'good', 4, 1011, 39, CAST(N'2022-09-29' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1032, N'good', 4, 1011, 24, CAST(N'2022-09-29' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1033, N'so good', 5, 1011, 2, CAST(N'2022-09-29' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1034, N'delicious', 5, 1011, 8, CAST(N'2022-09-29' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1035, N'good', 4, 1011, 12, CAST(N'2022-09-29' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1036, N'so good', 5, 1011, 17, CAST(N'2022-09-29' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1037, N'so delicious', 5, 1011, 3, CAST(N'2022-09-29' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1038, N'so sweet and delicious!', 5, 1011, 20, CAST(N'2022-09-29' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1039, N'good', 4, 1011, 1, CAST(N'2022-09-29' AS Date))
INSERT [dbo].[Review] ([review_Id], [content_review], [star], [user_id], [product_id], [review_date]) VALUES (1040, N'I will repurchase it because it so delicious!', 5, 1011, 42, CAST(N'2022-09-29' AS Date))
SET IDENTITY_INSERT [dbo].[Review] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [user_type], [birthday], [address], [gender], [email], [phone], [code], [status]) VALUES (9, N'minhthuy', N'$2a$10$W88g1rSvvZLVvIgaa4OyauwT.oDKqzmEyuFtBVwo4mW9ELHdP39Ti', 1, N'2022-08-03', N'27', 0, N'sunflowermt278@gmail.com', N'0939884933', N'2dbf2c8a-b8ef-4fbb-9fac-b4cd570e4b31', 0)
INSERT [dbo].[Users] ([id], [username], [password], [user_type], [birthday], [address], [gender], [email], [phone], [code], [status]) VALUES (1011, N'sunflower', N'$2a$10$.LVyFO/CAJTqR7jIpUbg7u/PXbqEZoV6FiyjY9VRUsAFr5OjkckZm', 0, N'1995-08-27', N'VietNam1', 0, N'truongthiminhthuy01@gmail.com', N'0796725209', N'ef967067-83c8-4ef6-b8ff-b3a98573b88e', 0)
INSERT [dbo].[Users] ([id], [username], [password], [user_type], [birthday], [address], [gender], [email], [phone], [code], [status]) VALUES (1015, N'jiyeon', N'$2a$10$Ls4czr2a5RadqMK2pbA2WODZwr2RV3LlFDAVXRCDv7zg2cfeyURgq', 0, N'1993-06-07', N'Korean', 0, N'jiyeon@gmail.com', N'0796725209', N'code', 0)
INSERT [dbo].[Users] ([id], [username], [password], [user_type], [birthday], [address], [gender], [email], [phone], [code], [status]) VALUES (1016, N'EF', N'$2a$10$o4OP0h1.Ad6nNOf3bfn1new8i2MBtji5CrbxN81n1P4NukG6ml0qa', 0, N'1995-02-15', N'TL', 0, N'ef@gmail.com', N'0796725209', N'code', 0)
INSERT [dbo].[Users] ([id], [username], [password], [user_type], [birthday], [address], [gender], [email], [phone], [code], [status]) VALUES (1017, N'hyomin', N'$2a$10$498O/6BsvVKtd3D.IReJa.Zcjw8/Vx7kzuVlUCZNeYCj5fq0uQ1Jm', 0, N'1989-05-30', N'Korea', 0, N'hyomin@gmail.com', N'0796725209', N'code', 0)
INSERT [dbo].[Users] ([id], [username], [password], [user_type], [birthday], [address], [gender], [email], [phone], [code], [status]) VALUES (1018, N'MT', N'$2a$10$jJmfZlhXiqPqj4MYSDfRxOjR3q5hsXR/s.LZL4G/Rby7kqsUnNTom', 0, N'1995-08-27', N'Can Tho', 0, N'mt@gmail.com', N'0976725209', N'code', 0)
INSERT [dbo].[Users] ([id], [username], [password], [user_type], [birthday], [address], [gender], [email], [phone], [code], [status]) VALUES (1019, N'henie', N'$2a$10$FYqJJN535hyGOT5iMm.nBu5H0ez33idSUH6/goikyYlgDk9rtcqPy', 0, N'1992-05-15', N'VietNam', 0, N'henie@gmail.com', N'0939884933', N'code', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [CP2296F02_Group2] SET  READ_WRITE 
GO
