USE [master]
GO
/****** Object:  Database [KnowledgeStore]    Script Date: 14/11/2018 7:12:24 PM ******/
CREATE DATABASE [KnowledgeStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KnowledgeStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\KnowledgeStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KnowledgeStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\KnowledgeStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [KnowledgeStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KnowledgeStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KnowledgeStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KnowledgeStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KnowledgeStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KnowledgeStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KnowledgeStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [KnowledgeStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KnowledgeStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KnowledgeStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KnowledgeStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KnowledgeStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KnowledgeStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KnowledgeStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KnowledgeStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KnowledgeStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KnowledgeStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KnowledgeStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KnowledgeStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KnowledgeStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KnowledgeStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KnowledgeStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KnowledgeStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KnowledgeStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KnowledgeStore] SET RECOVERY FULL 
GO
ALTER DATABASE [KnowledgeStore] SET  MULTI_USER 
GO
ALTER DATABASE [KnowledgeStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KnowledgeStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KnowledgeStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KnowledgeStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KnowledgeStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KnowledgeStore', N'ON'
GO
ALTER DATABASE [KnowledgeStore] SET QUERY_STORE = OFF
GO
USE [KnowledgeStore]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 14/11/2018 7:12:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[TenHienThi] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaiDang]    Script Date: 14/11/2018 7:12:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiDang](
	[MaBaiDang] [int] IDENTITY(1,1) NOT NULL,
	[MaMer] [int] NULL,
	[ViTri] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBaiDang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 14/11/2018 7:12:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[ChiTietDonHangID] [int] IDENTITY(1,1) NOT NULL,
	[DonHangID] [int] NOT NULL,
	[SachID] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[ThanhTien] [money] NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ChiTietDonHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSachMerchant]    Script Date: 14/11/2018 7:12:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSachMerchant](
	[KhoSachMerchantID] [int] IDENTITY(1,1) NOT NULL,
	[SachID] [int] NULL,
	[MerchantID] [int] NULL,
	[DonGia] [money] NOT NULL,
	[GiaKhuyenMai] [money] NULL,
	[SoLuong] [int] NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[TrangThai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KhoSachMerchantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTBaiDang]    Script Date: 14/11/2018 7:12:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTBaiDang](
	[MaCTBD] [int] IDENTITY(1,1) NOT NULL,
	[MaBaiDang] [int] NULL,
	[TieuDe] [nvarchar](50) NULL,
	[HinhAnh] [varchar](100) NULL,
	[NoiDung] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCTBD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 14/11/2018 7:12:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SoDienThoai] [varchar](20) NULL,
	[MatKhauMaHoa] [varchar](256) NULL,
	[IDFacebook] [varchar](256) NULL,
	[IDGoogle] [varchar](256) NULL,
	[NgayDangKy] [datetime] NOT NULL,
	[GioiTinhID] [int] NULL,
	[DanhGia] [int] NULL,
	[TrangThai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGiaCuaCustomer]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaCuaCustomer](
	[DanhGiaCusID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[DonHangID] [int] NOT NULL,
	[SoSao] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DanhGiaCusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGiaCuaMerchant]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaCuaMerchant](
	[DanhGiaMerID] [int] IDENTITY(1,1) NOT NULL,
	[MerchantID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[SoSao] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DanhGiaMerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[DonHangID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[MerchantID] [int] NULL,
	[NgayXuat] [datetime] NULL,
	[TongTien] [money] NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[TinhTrangDonHangID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DonHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioiTinh]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioiTinh](
	[GioiTinhID] [int] IDENTITY(1,1) NOT NULL,
	[TenGioiTinh] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GioiTinhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuCus]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuCus](
	[LichSuCusID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[DonHangID] [int] NOT NULL,
	[TongTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[LichSuCusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuMer]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuMer](
	[LichSuMerID] [int] IDENTITY(1,1) NOT NULL,
	[MerchantID] [int] NOT NULL,
	[DonHangID] [int] NOT NULL,
	[TongTien] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[LichSuMerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiBia]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiBia](
	[LoaiBiaID] [int] IDENTITY(1,1) NOT NULL,
	[LoaiBia] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LoaiBiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Merchant]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Merchant](
	[MerchantID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[GioiTinhID] [int] NOT NULL,
	[DiemTichLuy] [int] NOT NULL,
	[NgayTao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MerchantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NangTin]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NangTin](
	[MaLuotNang] [int] IDENTITY(1,1) NOT NULL,
	[MaBaiDang] [int] NOT NULL,
	[MaMer] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLuotNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[NhaXuatBanID] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NhaXuatBanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[SachID] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](50) NOT NULL,
	[TacGia] [nvarchar](50) NOT NULL,
	[NhaXuatBanID] [int] NOT NULL,
	[NgayXuatBan] [date] NOT NULL,
	[SoTrang] [int] NOT NULL,
	[LoaiBiaID] [int] NULL,
	[TheLoaiID] [int] NOT NULL,
 CONSTRAINT [PK__Sach__F3005E3A46F17B4D] PRIMARY KEY CLUSTERED 
(
	[SachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[TheLoaiID] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TheLoaiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhTrangDonHang]    Script Date: 14/11/2018 7:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrangDonHang](
	[TinhTrangDonHangID] [int] IDENTITY(1,1) NOT NULL,
	[TenTinhTrangDonHang] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TinhTrangDonHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [Email], [HoTen], [DiaChi], [SoDienThoai], [MatKhauMaHoa], [IDFacebook], [IDGoogle], [NgayDangKy], [GioiTinhID], [DanhGia], [TrangThai]) VALUES (1, NULL, N'Trung Nguyen', NULL, NULL, NULL, N'1041867416021297', NULL, CAST(N'2018-11-10T13:34:09.567' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Customer] ([CustomerID], [Email], [HoTen], [DiaChi], [SoDienThoai], [MatKhauMaHoa], [IDFacebook], [IDGoogle], [NgayDangKy], [GioiTinhID], [DanhGia], [TrangThai]) VALUES (2, N'trungnguyen.1997270710@gmail.com', N'nguyen Trung', NULL, NULL, NULL, NULL, N'110711004994766166222', CAST(N'2018-11-10T14:37:12.063' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[GioiTinh] ON 

INSERT [dbo].[GioiTinh] ([GioiTinhID], [TenGioiTinh]) VALUES (1, N'Nam')
INSERT [dbo].[GioiTinh] ([GioiTinhID], [TenGioiTinh]) VALUES (2, N'Nữ')
INSERT [dbo].[GioiTinh] ([GioiTinhID], [TenGioiTinh]) VALUES (3, N'Bí mật')
SET IDENTITY_INSERT [dbo].[GioiTinh] OFF
SET IDENTITY_INSERT [dbo].[LoaiBia] ON 

INSERT [dbo].[LoaiBia] ([LoaiBiaID], [LoaiBia]) VALUES (1, N'Bìa Cứng')
INSERT [dbo].[LoaiBia] ([LoaiBiaID], [LoaiBia]) VALUES (2, N'Bìa Mềm')
SET IDENTITY_INSERT [dbo].[LoaiBia] OFF
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([NhaXuatBanID], [TenNXB], [DiaChi]) VALUES (1, N'NXB Lao Động', N'175 Giảng Võ, Q. Đống Đa, Hà Nội')
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([SachID], [TenSach], [TacGia], [NhaXuatBanID], [NgayXuatBan], [SoTrang], [LoaiBiaID], [TheLoaiID]) VALUES (2, N'Phi Lý Trí', N'Dan Ariely', 1, CAST(N'2018-04-01' AS Date), 404, 2, 2)
SET IDENTITY_INSERT [dbo].[Sach] OFF
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([TheLoaiID], [TenTheLoai]) VALUES (1, N'Sách văn học')
INSERT [dbo].[TheLoai] ([TheLoaiID], [TenTheLoai]) VALUES (2, N'Sách Tâm lý - Giới tính')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
ALTER TABLE [dbo].[ChiTietSachMerchant] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([DonHangID])
REFERENCES [dbo].[DonHang] ([DonHangID])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietDo__SachI__5CD6CB2B] FOREIGN KEY([SachID])
REFERENCES [dbo].[Sach] ([SachID])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK__ChiTietDo__SachI__5CD6CB2B]
GO
ALTER TABLE [dbo].[ChiTietSachMerchant]  WITH CHECK ADD FOREIGN KEY([MerchantID])
REFERENCES [dbo].[Merchant] ([MerchantID])
GO
ALTER TABLE [dbo].[ChiTietSachMerchant]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietSa__SachI__5EBF139D] FOREIGN KEY([SachID])
REFERENCES [dbo].[Sach] ([SachID])
GO
ALTER TABLE [dbo].[ChiTietSachMerchant] CHECK CONSTRAINT [FK__ChiTietSa__SachI__5EBF139D]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([GioiTinhID])
REFERENCES [dbo].[GioiTinh] ([GioiTinhID])
GO
ALTER TABLE [dbo].[DanhGiaCuaCustomer]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[DanhGiaCuaCustomer]  WITH CHECK ADD FOREIGN KEY([DonHangID])
REFERENCES [dbo].[DonHang] ([DonHangID])
GO
ALTER TABLE [dbo].[DanhGiaCuaMerchant]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[DanhGiaCuaMerchant]  WITH CHECK ADD FOREIGN KEY([MerchantID])
REFERENCES [dbo].[Merchant] ([MerchantID])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MerchantID])
REFERENCES [dbo].[Merchant] ([MerchantID])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([TinhTrangDonHangID])
REFERENCES [dbo].[TinhTrangDonHang] ([TinhTrangDonHangID])
GO
ALTER TABLE [dbo].[LichSuCus]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[LichSuCus]  WITH CHECK ADD FOREIGN KEY([DonHangID])
REFERENCES [dbo].[DonHang] ([DonHangID])
GO
ALTER TABLE [dbo].[LichSuMer]  WITH CHECK ADD FOREIGN KEY([DonHangID])
REFERENCES [dbo].[DonHang] ([DonHangID])
GO
ALTER TABLE [dbo].[LichSuMer]  WITH CHECK ADD FOREIGN KEY([MerchantID])
REFERENCES [dbo].[Merchant] ([MerchantID])
GO
ALTER TABLE [dbo].[Merchant]  WITH CHECK ADD FOREIGN KEY([GioiTinhID])
REFERENCES [dbo].[GioiTinh] ([GioiTinhID])
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK__Sach__LoaiBiaID__6C190EBB] FOREIGN KEY([LoaiBiaID])
REFERENCES [dbo].[LoaiBia] ([LoaiBiaID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK__Sach__LoaiBiaID__6C190EBB]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK__Sach__NhaXuatBan__6D0D32F4] FOREIGN KEY([NhaXuatBanID])
REFERENCES [dbo].[NhaXuatBan] ([NhaXuatBanID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK__Sach__NhaXuatBan__6D0D32F4]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK__Sach__TheLoaiID__6E01572D] FOREIGN KEY([TheLoaiID])
REFERENCES [dbo].[TheLoai] ([TheLoaiID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK__Sach__TheLoaiID__6E01572D]
GO
USE [master]
GO
ALTER DATABASE [KnowledgeStore] SET  READ_WRITE 
GO
