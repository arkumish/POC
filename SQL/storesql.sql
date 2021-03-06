USE [master]
GO
/****** Object:  Database [storesql]    Script Date: 02-Mar-21 16:21:57 PM ******/
CREATE DATABASE [storesql]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'storesql', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\storesql.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'storesql_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\storesql_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [storesql] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [storesql].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [storesql] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [storesql] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [storesql] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [storesql] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [storesql] SET ARITHABORT OFF 
GO
ALTER DATABASE [storesql] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [storesql] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [storesql] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [storesql] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [storesql] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [storesql] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [storesql] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [storesql] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [storesql] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [storesql] SET  ENABLE_BROKER 
GO
ALTER DATABASE [storesql] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [storesql] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [storesql] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [storesql] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [storesql] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [storesql] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [storesql] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [storesql] SET RECOVERY FULL 
GO
ALTER DATABASE [storesql] SET  MULTI_USER 
GO
ALTER DATABASE [storesql] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [storesql] SET DB_CHAINING OFF 
GO
ALTER DATABASE [storesql] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [storesql] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [storesql] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [storesql] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'storesql', N'ON'
GO
ALTER DATABASE [storesql] SET QUERY_STORE = OFF
GO
USE [storesql]
GO
/****** Object:  Table [dbo].[addressTable]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addressTable](
	[ID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Line1] [varchar](70) NOT NULL,
	[Line2] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Pincode] [varchar](6) NOT NULL,
	[MobileNumber] [varchar](13) NOT NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoryTable]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoryTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[billing]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billing](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[AddressID] [int] NULL,
	[TransactionID] [varchar](20) NULL,
	[PaymentSuccess] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_billing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ProductID] [int] NULL,
	[OrderTotal] [money] NULL,
	[Status] [money] NULL,
	[ValidFrom] [datetime2](2) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](2) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[ID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ImageName] [varchar](30) NULL,
	[Src] [varchar](70) NOT NULL,
 CONSTRAINT [PK_image] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[ID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[ImageID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userInfo]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userInfo](
	[ID] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[FirstName] [varchar](40) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[AddressID] [int] NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [def_ValidFrom]  DEFAULT (sysutcdatetime()) FOR [ValidFrom]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [def_ValidTo]  DEFAULT (CONVERT([datetime2](2),'9999-12-31 23:59:59')) FOR [ValidTo]
GO
ALTER TABLE [dbo].[addressTable]  WITH NOCHECK ADD  CONSTRAINT [FK_address_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[userInfo] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[addressTable] CHECK CONSTRAINT [FK_address_UserID]
GO
ALTER TABLE [dbo].[categoryTable]  WITH NOCHECK ADD  CONSTRAINT [FK_category] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[categoryTable] CHECK CONSTRAINT [FK_category]
GO
ALTER TABLE [dbo].[billing]  WITH NOCHECK ADD  CONSTRAINT [FK_billing] FOREIGN KEY([OrderID])
REFERENCES [dbo].[order] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[billing] CHECK CONSTRAINT [FK_billing]
GO
ALTER TABLE [dbo].[billing]  WITH NOCHECK ADD  CONSTRAINT [FK_billing_Addr] FOREIGN KEY([AddressID])
REFERENCES [dbo].[addressTable] ([ID])
GO
ALTER TABLE [dbo].[billing] CHECK CONSTRAINT [FK_billing_Addr]
GO
ALTER TABLE [dbo].[billing]  WITH NOCHECK ADD  CONSTRAINT [FK_billing_user] FOREIGN KEY([UserID])
REFERENCES [dbo].[userInfo] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[billing] CHECK CONSTRAINT [FK_billing_user]
GO
ALTER TABLE [dbo].[order]  WITH NOCHECK ADD  CONSTRAINT [FK_order] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order]
GO
ALTER TABLE [dbo].[image]  WITH NOCHECK ADD  CONSTRAINT [FK_image_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK_image_ProductID]
GO
/****** Object:  StoredProcedure [dbo].[_all_Address]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[_all_Address] as
begin
	select *
	from addressTable
end
GO
/****** Object:  StoredProcedure [dbo].[_all_Category]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[_all_Category] as
begin
	select *
	from categoryTable
end
GO
/****** Object:  StoredProcedure [dbo].[_all_Billing]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[_all_Billing] as
begin
	select *
	from billing
end
GO
/****** Object:  StoredProcedure [dbo].[_all_Order]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[_all_Order] as
begin
	select *
	from order
end
GO
/****** Object:  StoredProcedure [dbo].[_all_Product]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[_all_Product] as
begin
	select *
	from product
end
GO
/****** Object:  StoredProcedure [dbo].[FindByAddress]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[FindByAddress](@AddressID int) as
begin
	if exists (Select * from addressTable where ID = @AddressID)
	begin
		select *
		from addressTable
		where ID = @AddressID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[FindByCategory]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[FindByCategory](@CategoryID int) as
begin
	if exists (Select * from categoryTable where ID = @CategoryID)
	begin
		select *
		from categoryTable
		where ID = @CategoryID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[FindByBilling]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[FindByBilling](@BillingID int) as
begin
	if exists (Select * from billing where ID = @BillingID)
	begin
		select *
		from billing
		where ID = @BillingID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[FindByOrder]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[FindByOrder](@OrderID int) as
begin
	if exists (Select * from order where ID = @OrderID)
	begin
		select *
		from order
		where ID = @OrderID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[FindByProduct]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[FindByProduct](@ProductID int) as
begin
	if exists (Select * from product where ID = @ProductID)
	begin
		select *
		from product
		where ID = @ProductID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[FindByUser]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[FindByUser](@UserID int) as
begin
	if exists (Select * from userInfo where ID = @UserID)
	begin
		select *
		from userInfo
		where ID = @UserID
	end
end
GO
/****** Object:  StoredProcedure [dbo].[_all_User]    Script Date: 02-Mar-21 16:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[_all_User] as
begin
	select *
	from userInfo
end
GO
USE [master]
GO
ALTER DATABASE [storesql] SET  READ_WRITE 
GO
