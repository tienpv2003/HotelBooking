USE [master]
GO
/****** Object:  Database [Hotel]    Script Date: 5/22/2024 8:32:46 AM ******/
CREATE DATABASE [Hotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Hotel.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hotel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Hotel_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hotel] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Hotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hotel] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Hotel] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Hotel]
GO
/****** Object:  Table [Banner]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Banner](
	[banner_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
	[img] [text] NOT NULL,
	[description] [text] NOT NULL,
	[status] [nvarchar](255) NOT NULL,
 CONSTRAINT [banner_banner_id_primary] PRIMARY KEY CLUSTERED 
(
	[banner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Comment]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Comment](
	[comment_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[detai_new_id] [int] NOT NULL,
	[reply_id] [int] NOT NULL,
	[content] [text] NOT NULL,
	[comment_date] [date] NOT NULL,
	[status] [nvarchar](255) NOT NULL,
 CONSTRAINT [comment_comment_id_primary] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Customer]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer](
	[customer_id] [int] NOT NULL,
	[type_customer] [int] NOT NULL,
	[first_name] [nvarchar](255) NOT NULL,
	[last_name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[status] [nvarchar](255) NOT NULL,
 CONSTRAINT [customer_customer_id_primary] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Detail_news]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Detail_news](
	[detail_news_id] [int] NOT NULL,
	[news_id] [int] NOT NULL,
	[content] [text] NOT NULL,
 CONSTRAINT [detail_news_detail_news_id_primary] PRIMARY KEY CLUSTERED 
(
	[detail_news_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Event_id]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Event_id](
	[event_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[detail] [text] NOT NULL,
	[discount_percent] [float] NOT NULL,
	[description] [text] NOT NULL,
	[status] [nvarchar](255) NOT NULL,
 CONSTRAINT [event_id_event_id_primary] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Invoice_customer]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Invoice_customer](
	[invoice_customer_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[reservation_id] [int] NOT NULL,
	[invoice_amount] [float] NOT NULL,
	[ts_issued] [datetime] NULL,
	[ts_paid] [datetime] NULL,
 CONSTRAINT [invoice_customer_invoice_customer_id_primary] PRIMARY KEY CLUSTERED 
(
	[invoice_customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Level_customer]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Level_customer](
	[level_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[reservation_id] [int] NOT NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [level_customer_level_id_primary] PRIMARY KEY CLUSTERED 
(
	[level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [News]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [News](
	[news_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
	[img] [text] NOT NULL,
	[title] [text] NOT NULL,
	[create_date] [date] NOT NULL,
	[desccription] [text] NOT NULL,
	[status] [text] NOT NULL,
 CONSTRAINT [news_news_id_primary] PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Reply]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reply](
	[reply_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[comment_id] [int] NOT NULL,
	[content] [text] NOT NULL,
	[reply_date] [date] NOT NULL,
	[status] [nvarchar](255) NOT NULL,
 CONSTRAINT [reply_reply_id_primary] PRIMARY KEY CLUSTERED 
(
	[reply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Reservation]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reservation](
	[reservation_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[ts_created] [datetime] NOT NULL,
	[ts_updated] [datetime] NOT NULL,
	[discount_percent] [float] NOT NULL,
	[event_id] [int] NOT NULL,
	[total_price] [float] NOT NULL,
 CONSTRAINT [reservation_reservation_id_primary] PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Review]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Review](
	[review_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
	[description] [text] NOT NULL,
	[status] [nvarchar](255) NOT NULL,
 CONSTRAINT [review_review_id_primary] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Role]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Role](
	[staff_type_id] [int] NOT NULL,
	[type] [nvarchar](255) NOT NULL,
 CONSTRAINT [role_staff_type_id_primary] PRIMARY KEY CLUSTERED 
(
	[staff_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Room]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Room](
	[room_id] [int] NOT NULL,
	[room_type_id] [int] NOT NULL,
	[room_name] [nvarchar](255) NOT NULL,
	[descripsion] [text] NOT NULL,
	[current_price] [float] NOT NULL,
	[status] [nvarchar](255) NULL,
 CONSTRAINT [room_room_id_primary] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Room_reserved]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Room_reserved](
	[reservation_id] [int] NOT NULL,
	[room_id] [int] NOT NULL,
	[price] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Room_service]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Room_service](
	[service_id] [int] NOT NULL,
	[room_type_id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Room_type]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Room_type](
	[room_type_id] [int] NOT NULL,
	[type_name] [nvarchar](255) NOT NULL,
	[status] [nvarchar](255) NULL,
 CONSTRAINT [room_type_room_type_id_primary] PRIMARY KEY CLUSTERED 
(
	[room_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Service]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Service](
	[service_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
	[name_service] [text] NOT NULL,
	[title_service] [text] NULL,
	[description] [text] NULL,
	[img] [text] NULL,
	[status] [text] NOT NULL,
 CONSTRAINT [service_service_id_primary] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staff]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staff](
	[staff_id] [int] NOT NULL,
	[staff_type_id] [int] NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[status] [nvarchar](255) NOT NULL,
 CONSTRAINT [staff_staff_id_primary] PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Type_customer]    Script Date: 5/22/2024 8:32:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Type_customer](
	[type_customer] [int] NOT NULL,
	[type_customer_name] [nvarchar](255) NOT NULL,
	[money level] [float] NOT NULL,
	[discount] [float] NOT NULL,
 CONSTRAINT [type_customer_type_customer_primary] PRIMARY KEY CLUSTERED 
(
	[type_customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [Banner] ([banner_id], [staff_id], [img], [description], [status]) VALUES (1, 1, N'img1.jpg', N'N?i dung banner 1', N'active')
INSERT [Banner] ([banner_id], [staff_id], [img], [description], [status]) VALUES (2, 2, N'img1.jpg', N'N?i dung banner 2', N'inactive')
INSERT [Banner] ([banner_id], [staff_id], [img], [description], [status]) VALUES (3, 3, N'img1.jpg', N'N?i dung banner 3', N'active')
INSERT [Comment] ([comment_id], [customer_id], [detai_new_id], [reply_id], [content], [comment_date], [status]) VALUES (1, 1, 1, 0, N'N?i dung bình lu?n 1', CAST(N'2024-05-10' AS Date), N'active')
INSERT [Comment] ([comment_id], [customer_id], [detai_new_id], [reply_id], [content], [comment_date], [status]) VALUES (2, 2, 2, 0, N'N?i dung bình lu?n 2', CAST(N'2024-05-11' AS Date), N'inactive')
INSERT [Comment] ([comment_id], [customer_id], [detai_new_id], [reply_id], [content], [comment_date], [status]) VALUES (3, 3, 3, 0, N'N?i dung bình lu?n 3', CAST(N'2024-05-12' AS Date), N'active')
INSERT [Customer] ([customer_id], [type_customer], [first_name], [last_name], [email], [password], [phone], [address], [status]) VALUES (1, 1, N'Nguyễn', N'Văn A', N'nguyenvana@gmail.com', N'password123', N'0909123456', N'123 Đường A, Quận 1, TP.HCM', N'active')
INSERT [Customer] ([customer_id], [type_customer], [first_name], [last_name], [email], [password], [phone], [address], [status]) VALUES (2, 2, N'Trần', N'Thị B', N'tranthib@gmail.com', N'password456', N'0912345678', N'456 Đường B, Quận 2, TP.HCM', N'inactive')
INSERT [Customer] ([customer_id], [type_customer], [first_name], [last_name], [email], [password], [phone], [address], [status]) VALUES (3, 3, N'Lê', N'Văn C', N'levanc@gmail.com', N'password789', N'0923456789', N'789 Đường C, Quận 3, TP.HCM', N'active')
INSERT [Detail_news] ([detail_news_id], [news_id], [content]) VALUES (1, 1, N'N?i dung chi ti?t tin t?c 1')
INSERT [Detail_news] ([detail_news_id], [news_id], [content]) VALUES (2, 2, N'N?i dung chi ti?t tin t?c 2')
INSERT [Detail_news] ([detail_news_id], [news_id], [content]) VALUES (3, 3, N'N?i dung chi ti?t tin t?c 3')
INSERT [Event_id] ([event_id], [staff_id], [start_date], [end_date], [detail], [discount_percent], [description], [status]) VALUES (1, 1, CAST(N'2024-06-01 00:00:00.000' AS DateTime), CAST(N'2024-06-10 00:00:00.000' AS DateTime), N'S? ki?n mùa hè', 20, N'Gi?m giá mùa hè', N'active')
INSERT [Event_id] ([event_id], [staff_id], [start_date], [end_date], [detail], [discount_percent], [description], [status]) VALUES (2, 2, CAST(N'2024-07-01 00:00:00.000' AS DateTime), CAST(N'2024-07-15 00:00:00.000' AS DateTime), N'S? ki?n qu?c t? thi?u nhi', 15, N'Gi?m giá cho tr? em', N'inactive')
INSERT [Event_id] ([event_id], [staff_id], [start_date], [end_date], [detail], [discount_percent], [description], [status]) VALUES (3, 3, CAST(N'2024-08-01 00:00:00.000' AS DateTime), CAST(N'2024-08-10 00:00:00.000' AS DateTime), N'S? ki?n l? h?i', 25, N'Gi?m giá l? h?i', N'active')
INSERT [Invoice_customer] ([invoice_customer_id], [customer_id], [reservation_id], [invoice_amount], [ts_issued], [ts_paid]) VALUES (1, 1, 1, 2000000, CAST(N'2024-05-20 13:00:00.000' AS DateTime), CAST(N'2024-05-20 15:00:00.000' AS DateTime))
INSERT [Invoice_customer] ([invoice_customer_id], [customer_id], [reservation_id], [invoice_amount], [ts_issued], [ts_paid]) VALUES (2, 2, 2, 3000000, CAST(N'2024-06-20 13:00:00.000' AS DateTime), CAST(N'2024-06-20 15:00:00.000' AS DateTime))
INSERT [Invoice_customer] ([invoice_customer_id], [customer_id], [reservation_id], [invoice_amount], [ts_issued], [ts_paid]) VALUES (3, 3, 3, 4000000, CAST(N'2024-07-20 13:00:00.000' AS DateTime), CAST(N'2024-07-20 15:00:00.000' AS DateTime))
INSERT [Level_customer] ([level_id], [customer_id], [reservation_id], [total]) VALUES (1, 1, 1, 2000000)
INSERT [Level_customer] ([level_id], [customer_id], [reservation_id], [total]) VALUES (2, 2, 2, 3000000)
INSERT [Level_customer] ([level_id], [customer_id], [reservation_id], [total]) VALUES (3, 3, 3, 4000000)
INSERT [News] ([news_id], [staff_id], [img], [title], [create_date], [desccription], [status]) VALUES (1, 1, N'img1.jpg', N'Tin t?c 1', CAST(N'2024-05-01' AS Date), N'N?i dung tin t?c 1', N'active')
INSERT [News] ([news_id], [staff_id], [img], [title], [create_date], [desccription], [status]) VALUES (2, 2, N'img1.jpg', N'Tin t?c 2', CAST(N'2024-05-02' AS Date), N'N?i dung tin t?c 2', N'inactive')
INSERT [News] ([news_id], [staff_id], [img], [title], [create_date], [desccription], [status]) VALUES (3, 3, N'img1.jpg', N'Tin t?c 3', CAST(N'2024-05-03' AS Date), N'N?i dung tin t?c 3', N'active')
INSERT [Reply] ([reply_id], [customer_id], [comment_id], [content], [reply_date], [status]) VALUES (1, 1, 1, N'N?i dung tr? l?i 1', CAST(N'2024-05-13' AS Date), N'active')
INSERT [Reply] ([reply_id], [customer_id], [comment_id], [content], [reply_date], [status]) VALUES (2, 2, 2, N'N?i dung tr? l?i 2', CAST(N'2024-05-14' AS Date), N'inactive')
INSERT [Reply] ([reply_id], [customer_id], [comment_id], [content], [reply_date], [status]) VALUES (3, 3, 3, N'N?i dung tr? l?i 3', CAST(N'2024-05-15' AS Date), N'active')
INSERT [Reservation] ([reservation_id], [customer_id], [start_date], [end_date], [ts_created], [ts_updated], [discount_percent], [event_id], [total_price]) VALUES (1, 1, CAST(N'2024-06-01' AS Date), CAST(N'2024-06-05' AS Date), CAST(N'2024-05-20 10:00:00.000' AS DateTime), CAST(N'2024-05-20 12:00:00.000' AS DateTime), 20, 1, 2000000)
INSERT [Reservation] ([reservation_id], [customer_id], [start_date], [end_date], [ts_created], [ts_updated], [discount_percent], [event_id], [total_price]) VALUES (2, 2, CAST(N'2024-07-01' AS Date), CAST(N'2024-07-05' AS Date), CAST(N'2024-06-20 10:00:00.000' AS DateTime), CAST(N'2024-06-20 12:00:00.000' AS DateTime), 15, 2, 3000000)
INSERT [Reservation] ([reservation_id], [customer_id], [start_date], [end_date], [ts_created], [ts_updated], [discount_percent], [event_id], [total_price]) VALUES (3, 3, CAST(N'2024-08-01' AS Date), CAST(N'2024-08-05' AS Date), CAST(N'2024-07-20 10:00:00.000' AS DateTime), CAST(N'2024-07-20 12:00:00.000' AS DateTime), 25, 3, 4000000)
INSERT [Review] ([review_id], [customer_id], [staff_id], [description], [status]) VALUES (1, 1, 1, N'N?i dung dánh giá 1', N'active')
INSERT [Review] ([review_id], [customer_id], [staff_id], [description], [status]) VALUES (2, 2, 2, N'N?i dung dánh giá 2', N'inactive')
INSERT [Review] ([review_id], [customer_id], [staff_id], [description], [status]) VALUES (3, 3, 3, N'N?i dung dánh giá 3', N'active')
INSERT [Role] ([staff_type_id], [type]) VALUES (1, N'Admin')
INSERT [Role] ([staff_type_id], [type]) VALUES (2, N'Staff Events')
INSERT [Role] ([staff_type_id], [type]) VALUES (3, N'Staff Service')
INSERT [Role] ([staff_type_id], [type]) VALUES (4, N'Staff News')
INSERT [Role] ([staff_type_id], [type]) VALUES (5, N'Staff Comments')
INSERT [Room] ([room_id], [room_type_id], [room_name], [descripsion], [current_price], [status]) VALUES (1, 1, N'Phòng 101', N'Phòng don v?i giu?ng don', 500000, N'active')
INSERT [Room] ([room_id], [room_type_id], [room_name], [descripsion], [current_price], [status]) VALUES (2, 2, N'Phòng 102', N'Phòng dôi v?i giu?ng dôi', 800000, N'active')
INSERT [Room] ([room_id], [room_type_id], [room_name], [descripsion], [current_price], [status]) VALUES (3, 3, N'Phòng 103', N'Phòng gia dình v?i 2 giu?ng dôi', 1200000, N'active')
INSERT [Room_reserved] ([reservation_id], [room_id], [price]) VALUES (1, 1, 500000)
INSERT [Room_reserved] ([reservation_id], [room_id], [price]) VALUES (2, 2, 800000)
INSERT [Room_reserved] ([reservation_id], [room_id], [price]) VALUES (3, 3, 1200000)
INSERT [Room_service] ([service_id], [room_type_id]) VALUES (1, 1)
INSERT [Room_service] ([service_id], [room_type_id]) VALUES (1, 2)
INSERT [Room_service] ([service_id], [room_type_id]) VALUES (2, 1)
INSERT [Room_service] ([service_id], [room_type_id]) VALUES (2, 2)
INSERT [Room_service] ([service_id], [room_type_id]) VALUES (2, 3)
INSERT [Room_service] ([service_id], [room_type_id]) VALUES (3, 1)
INSERT [Room_service] ([service_id], [room_type_id]) VALUES (3, 2)
INSERT [Room_service] ([service_id], [room_type_id]) VALUES (3, 3)
INSERT [Room_service] ([service_id], [room_type_id]) VALUES (3, 4)
INSERT [Room_service] ([service_id], [room_type_id]) VALUES (4, 1)
INSERT [Room_service] ([service_id], [room_type_id]) VALUES (4, 2)
INSERT [Room_service] ([service_id], [room_type_id]) VALUES (4, 3)
INSERT [Room_type] ([room_type_id], [type_name], [status]) VALUES (1, N'Phòng đơn', N'active')
INSERT [Room_type] ([room_type_id], [type_name], [status]) VALUES (2, N'Phòng đôi', N'active')
INSERT [Room_type] ([room_type_id], [type_name], [status]) VALUES (3, N'Phòng VIP', N'active')
INSERT [Room_type] ([room_type_id], [type_name], [status]) VALUES (4, N'Phòng gia đình', N'active')
INSERT [Service] ([service_id], [staff_id], [name_service], [title_service], [description], [img], [status]) VALUES (1, 2, N'Nhà hàng', N'Nhà hàng và ti?c', N'Khách s?n c?a chúng tôi t? hào cung c?p d?ch v? nhà hàng và ti?c tùng d?ng c?p, mang d?n cho quý khách nh?ng tr?i nghi?m ?m th?c tuy?t v?i và không gian t? ch?c s? ki?n hoàn h?o. Nhà hàng c?a khách s?n ph?c v? da d?ng các món an t? ?m th?c Vi?t Nam truy?n th?ng d?n các món an qu?c t?, du?c ch? bi?n b?i d?i ngu d?u b?p chuyên nghi?p và giàu kinh nghi?m. Không ch? d?ng l?i ? dó, chúng tôi còn mang d?n các d?ch v? ti?c tùng linh ho?t, t? ti?c cu?i sang tr?ng, ti?c công ty, d?n các bu?i h?p m?t thân m?t, d?m b?o không gian lý tu?ng và d?ch v? chuyên nghi?p nh?t. Hãy d? khách s?n c?a chúng tôi làm nên di?m nh?n d?c bi?t cho m?i s? ki?n quan tr?ng c?a b?n, mang l?i nh?ng k? ni?m khó quên v?i th?c don phong phú và không gian ?m cúng, tinh t?.', N'image1.png', N'active')
INSERT [Service] ([service_id], [staff_id], [name_service], [title_service], [description], [img], [status]) VALUES (2, 2, N'Th? thao', N'Th? thao m?i ngày', N'Khách s?n c?a chúng tôi t? hào gi?i thi?u d?ch v? câu l?c b? th? thao d?ng c?p, du?c thi?t k? d? mang l?i tr?i nghi?m rèn luy?n s?c kh?e và thu giãn t?i uu cho quý khách. Câu l?c b? th? thao c?a chúng tôi cung c?p d?y d? các trang thi?t b? hi?n d?i. Ð?i ngu hu?n luy?n viên chuyên nghi?p s?n sàng h? tr? b?n trong m?i ho?t d?ng th? thao, t? t?p luy?n cá nhân d?n các l?p nhóm. Bên c?nh dó, khách hàng có th? thu giãn, hòa mình vào không gian yên bình và tái t?o nang lu?ng. Hãy d?n v?i câu l?c b? th? thao c?a chúng tôi d? khám phá s? k?t h?p hoàn h?o gi?a th? thao và s?c kh?e, nâng cao ch?t lu?ng cu?c s?ng m?i ngày.', N'image2.png', N'active')
INSERT [Service] ([service_id], [staff_id], [name_service], [title_service], [description], [img], [status]) VALUES (3, 2, N'Bar', N'Không Gian Sang Tr?ng T?i Bar Khách S?n', N'Khách s?n c?a chúng tôi mang d?n không gian bar sang tr?ng và quy?n ru, noi quý khách có th? thu?ng th?c nh?ng lo?i cocktail d?c dáo và các lo?i ru?u vang tuy?n ch?n t? kh?p noi trên th? gi?i. V?i thi?t k? hi?n d?i, không gian bar t?o nên m?t b?u không khí lý tu?ng d? thu giãn sau m?t ngày dài, ho?c t? h?p b?n bè và d?ng nghi?p trong không gian ?m cúng và thân m?t. Ð?i ngu nhân viên chuyên nghi?p và thân thi?n s? giúp quý khách tìm th?y d? u?ng phù h?p v?i kh?u v? cá nhân, d?ng th?i gi?i thi?u nh?ng món an nh? tinh t? d? tang thêm tr?i nghi?m ?m th?c. Hãy ghé tham bar c?a chúng tôi d? t?n hu?ng nh?ng giây phút th?nh thoi, khám phá s? phong phú trong t?ng ly cocktail và chìm d?m trong giai di?u du duong t? âm nh?c s?ng d?ng.', N'image2.png', N'active')
INSERT [Service] ([service_id], [staff_id], [name_service], [title_service], [description], [img], [status]) VALUES (4, 2, N'Gym', N'Hành Trình Th? Thao V?i Gym', N'DGym c?a chúng tôi là di?m d?n lý tu?ng cho nh?ng ai dam mê th? d?c và mu?n duy trì l?i s?ng nang d?ng ngay c? khi dang di du l?ch ho?c công tác. V?i trang thi?t b? t?p luy?n hi?n d?i, da d?ng t? máy ch?y b?, máy t?p co b?ng, d?n các thi?t b? t?p t? và yoga, phòng gym c?a chúng tôi ph?c v? m?i nhu c?u rèn luy?n th? ch?t c?a quý khách. Ð?i ngu hu?n luy?n viên chuyên nghi?p s?n sàng h? tr? và tu v?n d? b?n có th? t?p luy?n hi?u qu?, an toàn. Không ch? là noi t?p luy?n, gym còn là không gian thu giãn, giúp b?n x? stress và tang cu?ng s?c kh?e. Hãy d?n v?i gym c?a chúng tôi d? kh?i d?ng m?t ngày m?i tràn d?y nang lu?ng và s?n sàng cho m?i ho?t d?ng.', N'image2.png', N'active')
INSERT [Staff] ([staff_id], [staff_type_id], [email], [password], [status]) VALUES (1, 1, N'vinhtienoffice@gmail.com', N'123456', N'active')
INSERT [Staff] ([staff_id], [staff_type_id], [email], [password], [status]) VALUES (2, 2, N'dinhtu@gmail.com', N'123456', N'active')
INSERT [Staff] ([staff_id], [staff_type_id], [email], [password], [status]) VALUES (3, 3, N'haiduong@gmail.com', N'123456', N'active')
INSERT [Staff] ([staff_id], [staff_type_id], [email], [password], [status]) VALUES (4, 4, N'thanhcong@gmail.com', N'123456', N'active')
INSERT [Staff] ([staff_id], [staff_type_id], [email], [password], [status]) VALUES (5, 5, N'minhlong@gmail.com', N'123456', N'active')
INSERT [Type_customer] ([type_customer], [type_customer_name], [money level], [discount]) VALUES (1, N'new', 1000000, 0.5)
INSERT [Type_customer] ([type_customer], [type_customer_name], [money level], [discount]) VALUES (2, N'nomal', 5000000, 1)
INSERT [Type_customer] ([type_customer], [type_customer_name], [money level], [discount]) VALUES (3, N'vip', 10000000, 1.5)
/****** Object:  Index [room_reserved_reservation_id_unique]    Script Date: 5/22/2024 8:32:46 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [room_reserved_reservation_id_unique] ON [Room_reserved]
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [room_reserved_room_id_unique]    Script Date: 5/22/2024 8:32:46 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [room_reserved_room_id_unique] ON [Room_reserved]
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [room_service_room_type_id_index]    Script Date: 5/22/2024 8:32:46 AM ******/
CREATE NONCLUSTERED INDEX [room_service_room_type_id_index] ON [Room_service]
(
	[room_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [room_service_service_id_index]    Script Date: 5/22/2024 8:32:46 AM ******/
CREATE NONCLUSTERED INDEX [room_service_service_id_index] ON [Room_service]
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Banner]  WITH CHECK ADD  CONSTRAINT [banner_staff_id_foreign] FOREIGN KEY([staff_id])
REFERENCES [Staff] ([staff_id])
GO
ALTER TABLE [Banner] CHECK CONSTRAINT [banner_staff_id_foreign]
GO
ALTER TABLE [Comment]  WITH CHECK ADD  CONSTRAINT [comment_customer_id_foreign] FOREIGN KEY([customer_id])
REFERENCES [Customer] ([customer_id])
GO
ALTER TABLE [Comment] CHECK CONSTRAINT [comment_customer_id_foreign]
GO
ALTER TABLE [Comment]  WITH CHECK ADD  CONSTRAINT [comment_detai_new_id_foreign] FOREIGN KEY([detai_new_id])
REFERENCES [Detail_news] ([detail_news_id])
GO
ALTER TABLE [Comment] CHECK CONSTRAINT [comment_detai_new_id_foreign]
GO
ALTER TABLE [Customer]  WITH CHECK ADD  CONSTRAINT [customer_type_customer_foreign] FOREIGN KEY([type_customer])
REFERENCES [Type_customer] ([type_customer])
GO
ALTER TABLE [Customer] CHECK CONSTRAINT [customer_type_customer_foreign]
GO
ALTER TABLE [Detail_news]  WITH CHECK ADD  CONSTRAINT [detail_news_news_id_foreign] FOREIGN KEY([news_id])
REFERENCES [News] ([news_id])
GO
ALTER TABLE [Detail_news] CHECK CONSTRAINT [detail_news_news_id_foreign]
GO
ALTER TABLE [Event_id]  WITH CHECK ADD  CONSTRAINT [event_id_staff_id_foreign] FOREIGN KEY([staff_id])
REFERENCES [Staff] ([staff_id])
GO
ALTER TABLE [Event_id] CHECK CONSTRAINT [event_id_staff_id_foreign]
GO
ALTER TABLE [Invoice_customer]  WITH CHECK ADD  CONSTRAINT [invoice_customer_customer_id_foreign] FOREIGN KEY([customer_id])
REFERENCES [Customer] ([customer_id])
GO
ALTER TABLE [Invoice_customer] CHECK CONSTRAINT [invoice_customer_customer_id_foreign]
GO
ALTER TABLE [Invoice_customer]  WITH CHECK ADD  CONSTRAINT [invoice_customer_reservation_id_foreign] FOREIGN KEY([reservation_id])
REFERENCES [Reservation] ([reservation_id])
GO
ALTER TABLE [Invoice_customer] CHECK CONSTRAINT [invoice_customer_reservation_id_foreign]
GO
ALTER TABLE [Level_customer]  WITH CHECK ADD  CONSTRAINT [level_customer_customer_id_foreign] FOREIGN KEY([customer_id])
REFERENCES [Customer] ([customer_id])
GO
ALTER TABLE [Level_customer] CHECK CONSTRAINT [level_customer_customer_id_foreign]
GO
ALTER TABLE [Level_customer]  WITH CHECK ADD  CONSTRAINT [level_customer_reservation_id_foreign] FOREIGN KEY([reservation_id])
REFERENCES [Reservation] ([reservation_id])
GO
ALTER TABLE [Level_customer] CHECK CONSTRAINT [level_customer_reservation_id_foreign]
GO
ALTER TABLE [News]  WITH CHECK ADD  CONSTRAINT [news_staff_id_foreign] FOREIGN KEY([staff_id])
REFERENCES [Staff] ([staff_id])
GO
ALTER TABLE [News] CHECK CONSTRAINT [news_staff_id_foreign]
GO
ALTER TABLE [Reply]  WITH CHECK ADD  CONSTRAINT [reply_comment_id_foreign] FOREIGN KEY([comment_id])
REFERENCES [Comment] ([comment_id])
GO
ALTER TABLE [Reply] CHECK CONSTRAINT [reply_comment_id_foreign]
GO
ALTER TABLE [Reply]  WITH CHECK ADD  CONSTRAINT [reply_customer_id_foreign] FOREIGN KEY([customer_id])
REFERENCES [Customer] ([customer_id])
GO
ALTER TABLE [Reply] CHECK CONSTRAINT [reply_customer_id_foreign]
GO
ALTER TABLE [Reservation]  WITH CHECK ADD  CONSTRAINT [reservation_customer_id_foreign] FOREIGN KEY([customer_id])
REFERENCES [Customer] ([customer_id])
GO
ALTER TABLE [Reservation] CHECK CONSTRAINT [reservation_customer_id_foreign]
GO
ALTER TABLE [Reservation]  WITH CHECK ADD  CONSTRAINT [reservation_event_id_foreign] FOREIGN KEY([event_id])
REFERENCES [Event_id] ([event_id])
GO
ALTER TABLE [Reservation] CHECK CONSTRAINT [reservation_event_id_foreign]
GO
ALTER TABLE [Review]  WITH CHECK ADD  CONSTRAINT [review_customer_id_foreign] FOREIGN KEY([customer_id])
REFERENCES [Customer] ([customer_id])
GO
ALTER TABLE [Review] CHECK CONSTRAINT [review_customer_id_foreign]
GO
ALTER TABLE [Review]  WITH CHECK ADD  CONSTRAINT [review_staff_id_foreign] FOREIGN KEY([staff_id])
REFERENCES [Staff] ([staff_id])
GO
ALTER TABLE [Review] CHECK CONSTRAINT [review_staff_id_foreign]
GO
ALTER TABLE [Room]  WITH CHECK ADD  CONSTRAINT [room_room_type_id_foreign] FOREIGN KEY([room_type_id])
REFERENCES [Room_type] ([room_type_id])
GO
ALTER TABLE [Room] CHECK CONSTRAINT [room_room_type_id_foreign]
GO
ALTER TABLE [Room_reserved]  WITH CHECK ADD  CONSTRAINT [room_reserved_reservation_id_foreign] FOREIGN KEY([reservation_id])
REFERENCES [Reservation] ([reservation_id])
GO
ALTER TABLE [Room_reserved] CHECK CONSTRAINT [room_reserved_reservation_id_foreign]
GO
ALTER TABLE [Room_reserved]  WITH CHECK ADD  CONSTRAINT [room_reserved_room_id_foreign] FOREIGN KEY([room_id])
REFERENCES [Room] ([room_id])
GO
ALTER TABLE [Room_reserved] CHECK CONSTRAINT [room_reserved_room_id_foreign]
GO
ALTER TABLE [Room_service]  WITH CHECK ADD  CONSTRAINT [room_service_room_type_id_foreign] FOREIGN KEY([room_type_id])
REFERENCES [Room_type] ([room_type_id])
GO
ALTER TABLE [Room_service] CHECK CONSTRAINT [room_service_room_type_id_foreign]
GO
ALTER TABLE [Room_service]  WITH CHECK ADD  CONSTRAINT [room_service_service_id_foreign] FOREIGN KEY([service_id])
REFERENCES [Service] ([service_id])
GO
ALTER TABLE [Room_service] CHECK CONSTRAINT [room_service_service_id_foreign]
GO
ALTER TABLE [Service]  WITH CHECK ADD  CONSTRAINT [service_staff_id_foreign] FOREIGN KEY([staff_id])
REFERENCES [Staff] ([staff_id])
GO
ALTER TABLE [Service] CHECK CONSTRAINT [service_staff_id_foreign]
GO
ALTER TABLE [Staff]  WITH CHECK ADD  CONSTRAINT [staff_staff_type_id_foreign] FOREIGN KEY([staff_type_id])
REFERENCES [Role] ([staff_type_id])
GO
ALTER TABLE [Staff] CHECK CONSTRAINT [staff_staff_type_id_foreign]
GO
USE [master]
GO
ALTER DATABASE [Hotel] SET  READ_WRITE 
GO
