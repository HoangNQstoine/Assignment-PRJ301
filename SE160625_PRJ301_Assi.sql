USE [master]
GO
drop database UserManagement
go

CREATE DATABASE [UserManagement] 

USE [UserManagement]
GO

delete tblUsers  where 1=1
go


CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE150443', N'LE MINH KHOA', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE160625', N'NGUYỄN QUỐC HOÀNG', N'1', N'US', 1)

DROP TABLE tblOrder
-- Tạo bảng tblOrder
CREATE TABLE tblOrder (
    orderID NVARCHAR(50) PRIMARY KEY,
    userID NVARCHAR(50) FOREIGN KEY REFERENCES tblUsers(userID),
    [date] DATE,
    total DOUBLE PRECISION
);


-- Tạo bảng tblProduct
CREATE TABLE tblProduct (
    productID NVARCHAR(50) NOT NULL,
    productName NVARCHAR(50),
    productPrice DECIMAL(10, 2),
    productQuantity INT,
    CONSTRAINT PK_tblProduct PRIMARY KEY CLUSTERED ([productID] ASC)
) ON [PRIMARY];

-- Tạo bảng tblOrderDetail
CREATE TABLE tblOrderDetail (
    orderDetailID NVARCHAR(50) NOT NULL,
    orderID NVARCHAR(50),
    productID NVARCHAR(50),
    producPrice DOUBLE PRECISION,
    productQuantity INT,
    CONSTRAINT PK_tblOrderDetail PRIMARY KEY CLUSTERED ([orderDetailID] ASC),
    CONSTRAINT FK_OrderDetail_Order FOREIGN KEY (orderID) REFERENCES tblOrder(orderID),
    CONSTRAINT FK_OrderDetail_Product FOREIGN KEY (productID) REFERENCES tblProduct(productID)
) ON [PRIMARY];
	


INSERT INTO tblProduct (productID, productName, productPrice, productQuantity) VALUES ( N'C01', N'Lipstink', 100, 15);
INSERT INTO tblProduct (productID, productName, productPrice, productQuantity) VALUES ( N'C02', N'Body Mis', 200, 55);
INSERT INTO tblProduct (productID, productName, productPrice, productQuantity) VALUES ( N'C03', N'Perfume', 350, 45);
INSERT INTO tblProduct (productID, productName, productPrice, productQuantity) VALUES ( N'C04', N'Sun Cream', 50, 35);

DROP TABLE tblOrder;

SELECT * from tblOrderDetail