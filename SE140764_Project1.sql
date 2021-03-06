USE [SE140764_NguyenPhuThinh_Project1]
GO
/****** Object:  Table [dbo].[tbl_Accounts]    Script Date: 23/09/2021 12:54:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Accounts](
	[userID] [nvarchar](10) NOT NULL,
	[userName] [char](20) NOT NULL,
	[phone] [int] NOT NULL,
	[address] [char](50) NOT NULL,
	[password] [char](10) NOT NULL,
	[role] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Catagory]    Script Date: 23/09/2021 12:54:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Catagory](
	[catagoryID] [nvarchar](5) NOT NULL,
	[catagoryName] [char](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[catagoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OrderDetail]    Script Date: 23/09/2021 12:54:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderDetail](
	[orderDetailId] [char](10) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[orderID] [char](10) NOT NULL,
	[productID] [nvarchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Orders]    Script Date: 23/09/2021 12:54:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Orders](
	[orderID] [char](10) NOT NULL,
	[orderDate] [date] NULL,
	[totalPrice] [float] NULL,
	[userID] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Products]    Script Date: 23/09/2021 12:54:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Products](
	[productID] [nvarchar](5) NOT NULL,
	[productName] [char](50) NOT NULL,
	[image] [char](300) NOT NULL,
	[description] [char](300) NOT NULL,
	[createDate] [date] NULL,
	[expirationDate] [date] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[catagoryID] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 23/09/2021 12:54:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[roleID] [nvarchar](2) NOT NULL,
	[roleName] [char](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Accounts] ([userID], [userName], [phone], [address], [password], [role]) VALUES (N'admin', N'Phu Thinh', 964564543, N'TP HCM', N'123', N'AD')
INSERT [dbo].[tbl_Accounts] ([userID], [userName], [phone], [address], [password], [role]) VALUES (N'thinh', N'Phu Thinh', 964564543, N'Long An', N'123', N'US')
INSERT [dbo].[tbl_Accounts] ([userID], [userName], [phone], [address], [password], [role]) VALUES (N'user', N'Nguyen Phu Thinh', 4324325, N'Long AN', N'123', N'US')
GO
INSERT [dbo].[tbl_Catagory] ([catagoryID], [catagoryName]) VALUES (N'BD', N'Banh Deo')
INSERT [dbo].[tbl_Catagory] ([catagoryID], [catagoryName]) VALUES (N'BN', N'Banh Nuong')
INSERT [dbo].[tbl_Catagory] ([catagoryID], [catagoryName]) VALUES (N'HD', N'Hien Dai')
INSERT [dbo].[tbl_Catagory] ([catagoryID], [catagoryName]) VALUES (N'RC', N'Rau Cau ')
GO
INSERT [dbo].[tbl_Products] ([productID], [productName], [image], [description], [createDate], [expirationDate], [quantity], [price], [catagoryID]) VALUES (N'D1', N'Traditional green bean paste cake', N'https://cdn.tgdd.vn/2021/09/content/4d61c30d468d7a4c005ef8b3f3747329-800x500.jpg', N'The soft cake is characterized by the smell of finely ground roasted glutinous rice flour, sugar water, and passionate grapefruit perfume.', CAST(N'2021-07-17' AS Date), CAST(N'2021-09-10' AS Date), 15, 220, N'BD')
INSERT [dbo].[tbl_Products] ([productID], [productName], [image], [description], [createDate], [expirationDate], [quantity], [price], [catagoryID]) VALUES (N'D2', N'Mixed sticky rice cake', N'https://cdn.tgdd.vn/2021/09/content/Cach-lam-Banh-Deo-Truyen-Thong-Nhan-Thap-Cam-don-gian-tai-nha-4-55-screenshot-800x500.jpg', N'This type of cake is both easy to eat and extremely easy to make, without too much time and special kitchen tools', CAST(N'2021-08-20' AS Date), CAST(N'2021-09-19' AS Date), 20, 215, N'BD')
INSERT [dbo].[tbl_Products] ([productID], [productName], [image], [description], [createDate], [expirationDate], [quantity], [price], [catagoryID]) VALUES (N'D3', N'Carp moon cake', N'https://huubinh.com.vn/wp-content/uploads/2018/08/b%C3%A1nh-tt-c%C3%A1-%C4%91%C3%B4i.jpg', N'Carp shaped mooncakes are a symbol of unity, strength and nobility. The image of a carp turning into a dragon represents steadfastness and unremitting efforts.', CAST(N'2021-09-15' AS Date), CAST(N'2021-12-14' AS Date), 25, 185, N'BD')
INSERT [dbo].[tbl_Products] ([productID], [productName], [image], [description], [createDate], [expirationDate], [quantity], [price], [catagoryID]) VALUES (N'D4', N'Pig moon cake', N'https://scontent.subi.vn/cmsmedia/banh-hinh-heo1-c7b9213e4616dd11c308def59f09e85d.jpg', N'In addition to the beautiful and funny appearance, moon cakes shaped like animals also have many flavors such as pandan leaves, green beans, taro, chocolate, green tea.', CAST(N'2021-08-25' AS Date), CAST(N'2021-10-19' AS Date), 25, 165, N'BD')
INSERT [dbo].[tbl_Products] ([productID], [productName], [image], [description], [createDate], [expirationDate], [quantity], [price], [catagoryID]) VALUES (N'H1', N'Fresh bread ', N'https://cdn.tgdd.vn/2021/09/content/11859535835899384543497916068050881688531005n-800x500.jpg', N'This type of cake still ensures the variety of the filling as well as the shape of the cake. Salty fillings such as roasted chicken, char siu or sweet fillings such as green beans, red beans, taro', CAST(N'2021-07-22' AS Date), CAST(N'2021-11-28' AS Date), 35, 179, N'HD')
INSERT [dbo].[tbl_Products] ([productID], [productName], [image], [description], [createDate], [expirationDate], [quantity], [price], [catagoryID]) VALUES (N'H2', N'Floating flower cake ', N'https://cdn.tgdd.vn/2021/09/content/cach-lam-banh-trung-thu-hoa-noi-1-800x500.jpg', N'Floating flower moon cake is a cake that will make you admire at first sight with its colorful and colorful cake crust decorated with extremely impressive and sophisticated 3D.', CAST(N'2021-08-22' AS Date), CAST(N'2021-12-12' AS Date), 40, 190, N'HD')
INSERT [dbo].[tbl_Products] ([productID], [productName], [image], [description], [createDate], [expirationDate], [quantity], [price], [catagoryID]) VALUES (N'M1', N'Jelly cake', N'https://cdn.tgdd.vn/2021/09/content/Cach-Do-RAU-CAU-TRUNG-THU-Banh-trung-thu-rau-cau-gion---Mon-An-Ngon-Moi-Ngay-9-56-screenshot-800x500.jpg', N'This type of cake is both easy to eat and extremely easy to make, without too much time and special kitchen tools. You can also make your own jelly moon cake at home', CAST(N'2021-07-11' AS Date), CAST(N'2021-11-17' AS Date), 30, 170, N'RC')
INSERT [dbo].[tbl_Products] ([productID], [productName], [image], [description], [createDate], [expirationDate], [quantity], [price], [catagoryID]) VALUES (N'N1', N'Baked moon cake with green bean paste', N'https://cdn.eva.vn/upload/3-2020/images/2020-09-08/image14-1599556447-517-width602height396.png', N'The common point of these fish cakes is that the crust is baked until soft and crispy, combined with a wonderfully fragrant green bean paste', CAST(N'2021-07-11' AS Date), CAST(N'2021-11-23' AS Date), 10, 150, N'BN')
INSERT [dbo].[tbl_Products] ([productID], [productName], [image], [description], [createDate], [expirationDate], [quantity], [price], [catagoryID]) VALUES (N'N2', N'Baked moon cake with roasted chicken', N'https://cdn.tgdd.vn/2021/09/content/banh-trung-thu-givral-thap-cam-ga-quay-bao-ngu-800x500.jpg', N'Similar to the traditional mixed cake, this moon cake has a savory filling made from chicken breast marinated in spices, then rimmed and shredded instead of cotton and char siu.', CAST(N'2021-06-15' AS Date), CAST(N'2021-12-17' AS Date), 20, 250, N'BN')
INSERT [dbo].[tbl_Products] ([productID], [productName], [image], [description], [createDate], [expirationDate], [quantity], [price], [catagoryID]) VALUES (N'N3', N'Baked moon cake with lotus seed kernels', N'https://cdn.tgdd.vn/2021/09/content/banh-trung-thu-hat-sen-kinh-do-1-trung-800x500.jpg', N'Mooncakes filled with green tea are one of the recent "hot" cakes with a typical taste from Japanese matcha powder, besides the slight bitterness also helps to balance the deliciousness of moon cakes. makes you less bored when eating.', CAST(N'2021-06-18' AS Date), CAST(N'2021-10-25' AS Date), 25, 180, N'BN')
GO
INSERT [dbo].[tbl_Role] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tbl_Role] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
ALTER TABLE [dbo].[tbl_Accounts]  WITH CHECK ADD FOREIGN KEY([role])
REFERENCES [dbo].[tbl_Role] ([roleID])
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tbl_Orders] ([orderID])
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tbl_Products] ([productID])
GO
ALTER TABLE [dbo].[tbl_Orders]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tbl_Accounts] ([userID])
GO
ALTER TABLE [dbo].[tbl_Products]  WITH CHECK ADD FOREIGN KEY([catagoryID])
REFERENCES [dbo].[tbl_Catagory] ([catagoryID])
GO
