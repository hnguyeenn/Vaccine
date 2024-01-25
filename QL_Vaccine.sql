CREATE DATABASE QL_Vaccine
Go

Use QL_Vaccine
Go

CREATE TABLE [dbo].[KhachHang](
	[MaKH]               [varchar]  (30)  NOT NULL,
	[Ho]                 [nvarchar] (20)  NOT NULL,
	[TenDem]             [nvarchar] (25)  NOT NULL,
	[Ten]                [nvarchar] (20)  NOT NULL,
	[NgaySinh]           [date]           NOT NULL,
	[GioiTinh]           [bit]            NOT NULL, -- 0 : Nam , 1 : Nu
	[Ho_NguoiGiamHo]     [nvarchar] (20)  NOT NULL,
	[TenDem_NguoiGiamHo] [nvarchar] (25)  NOT NULL,
	[Ten_NguoiGiamHo]    [nvarchar] (20)  NOT NULL,
	[CMND_TCC]           [varchar]  (30)  NOT NULL,
	[MaBHYT]             [varchar]  (20)  NULL,
	[DiaChi]             [varchar]  (20)  NULL,
	[DCCT]               [nvarchar] (150) NULL,
	[SDT_NguoiGiamHo]    [varchar]  (30)  NOT NULL,
	[Email]              [varchar]  (150) NULL,
	[HotenNVThem]        [nvarchar] (65)   NULL,
PRIMARY KEY (MaKH)
)
GO 

CREATE TABLE [dbo].[Loai_Benh](
	[MaBenh] [INT] IDENTITY(1,1) NOT NULL, 
	[TenBenh] [nvarchar] (150) NOT NULL,
PRIMARY KEY (MaBenh)
)
GO

CREATE TABLE [dbo].[NhanVienYTe](
	[MaNV]     [varchar]  (30)  NOT NULL,
	[Ho]       [nvarchar] (20)  NULL,
	[TenDem]   [nvarchar] (25)  NULL,
	[Ten]      [nvarchar] (20)  NOT NULL,
	[NgaySinh] [date]           NULL,
	[GioiTinh] [bit]            NULL, 
	[MaCV]     [varchar]  (10)  NULL,
	[DiaChi]   [varchar]  (20)  NULL,
	[DCCT]     [nvarchar] (150) NULL,
	[SDT]      [varchar]  (30)  NULL,
	[Email]    [varchar]  (150) NULL,
	[CCCD]	   [varchar]  (13)  NULL,
PRIMARY KEY (MaNV)
)
GO

CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC]     [int] IDENTITY(1,1) NOT NULL,
	[TenNCC]    [nvarchar] (150)    NULL,
	[DienThoai] [varchar]  (20)     NULL,
	[Email]     [varchar]  (50)     NULL,
	[Fax]       [varchar]  (20)     NULL,
	[QuocGia]   [nvarchar] (50)     NULL,
	[Disable]   [bit]               NULL,
PRIMARY KEY (MaNCC)
)
GO

CREATE TABLE [dbo].[XuatXu](
	[MaXuatXu] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar] (50)          NOT NULL,
PRIMARY KEY(MaXuatXu)
)
GO

CREATE TABLE [dbo].[ChucVu](
	[MaCV]  [varchar] (10)  NOT NULL,
	[TenCV] [nvarchar](150) NULL,
PRIMARY KEY (MaCV)
)
GO

CREATE TABLE [dbo].[Kho]
(
	[MaSoLo]  [varchar](30) NOT NULL,
	[MaVacxin] [varchar](30) NOT NULL,
	[NgayNhap] DATE NOT NULL,
	[HanSuDung] DATE NOT NULL,
 PRIMARY KEY (MaSoLo)
)
GO

Drop table [dbo].[MenuVacxinTrongKho]

CREATE TABLE [dbo].[DanhMuc_Vaccine](
	[MaVacxin]     [varchar]  (30)  NOT NULL,
	[TenChung]	   [nvarchar] (150) NOT NULL,
	[TenThuongMai] [nvarchar] (150) NOT NULL,
	[MaBenh]	   [int]			NOT NULL,
	[MoTa]         [nvarchar] (MAX) NOT NULL,
	[ThanhPhan]    [nvarchar] (MAX) NOT NULL,
	[TacDungPhu]   [nvarchar] (MAX) NOT NULL,
	[DonGia]       [float]          NOT NULL,
PRIMARY KEY (MaVacxin)
)
GO

CREATE TABLE [dbo].[Lo_Vacxin](
	[MaSoLo]       [varchar] (30)   NOT NULL,
	[MaDanhMuc]    [varchar] (30)   NOT NULL,
	[SoLuong_Lieu] [int]            NOT NULL,
	[GiaLo]        [float]          NOT NULL,
	[MaNCC]        [int]            NOT NULL, 
	[MaXuatXu]     [int]            NOT NULL,
	[TinhTrang]    [bit] default 1  NOT NULL, -- 0 het , 1 con
PRIMARY KEY(MaSoLo)
)
GO

CREATE TABLE [dbo].[HoaDonNhap_Vacxin](
	[MaHDN]        [uniqueidentifier] NOT NULL,
	[TongTien]     [float]            NOT NULL,
	[MaNCC]        [int]              NOT NULL,
	[MaNV]         [varchar] (30)     NOT NULL,
	[NgayNhap]     [datetime]         NOT NULL,
	[TrangThai]    [bit]              NOT NULL,
	[GhiChu]       [ntext]            NULL,
PRIMARY KEY (MaHDN)
)
GO

CREATE TABLE [dbo].[ChiTietHoaDonNhap_Vacxin](
	[KhoaCT]    [uniqueidentifier] NOT NULL,
	[MaHDN]     [uniqueidentifier] NOT NULL,
	[MaSoLo]	[varchar] (30)     NOT NULL,
	[SoLuong]   [int]              NOT NULL,
	[DonGia]    [float]            NOT NULL,
	[ThanhTien] [float]            NOT NULL,
PRIMARY KEY (KhoaCT)
)
GO

CREATE TABLE [dbo].[TaiKhoan](
	[MaNV] [varchar](30) NOT NULL,
	[TenTK] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NULL,
PRIMARY KEY (MaNV)
)
GO

CREATE TABLE [dbo].[TiemChich](
	[MaTiem]   [varchar]  (20)  NOT NULL,
	[MaNV]     [varchar]  (30)  NOT NULL,
	[MaKH]     [varchar]  (30)  NOT NULL,
	[MaVacxin] [varchar]  (30)  NOT NULL,
	[MaSoLo]   [varchar]  (30)  NOT NULL, 
	[TiemLan]  [int]            NOT NULL,
	[NgayTiem] [datetime]       NOT NULL,
	[GhiChu]   [nvarchar] (150) NULL,
	[LieuLuong] [float]			NOT NULL,
	[DuongvaViTriTiem] [nvarchar](MAX) NOT NULL
PRIMARY KEY (MaTiem)
)
GO

CREATE TABLE [dbo].[KhamSangLoc](
	[MaKSL]        [varchar](30) NOT NULL,
	[MaKH]         [varchar](30) NOT NULL,
	[MaNV]         [varchar](30) NOT NULL,
	[NgayKham]     [datetime]    NOT NULL,
	[NhipTim]      [float]       NULL,
	[HuyetAp]      [float]       NULL,
	[ChieuCao]     [float]       NULL,
	[CanNang]      [float]       NULL,
	[ThongTinKham] [ntext]       NULL,
	[ThongTinKhac] [ntext]       NULL,
	[KetQua]       [bit]        NULL, -- 0 duoc tiem 1 kh duoc tiem
PRIMARY KEY (MaKSL)
)
GO

--=====   Khu vực   ==========================================================

CREATE TABLE [dbo].[KhuVuc](
	[MaKhuVuc] [varchar](20) NOT NULL,
	[MaTTP]	   [varchar](10) NULL,
	[MaQH]     [varchar](10) NULL,
	[MaPX]     [varchar](10) NULL,
PRIMARY KEY (MaKhuVuc)
)
GO

CREATE TABLE [dbo].[TinhThanhPho](
	[MaTTP]  [varchar]  (10)  NOT NULL,
	[TenTTP] [nvarchar] (150) NOT NULL,
PRIMARY KEY (MaTTP)
)
GO

CREATE TABLE [dbo].[QuanHuyen](
	[MaQH]  [varchar]  (10)  NOT NULL,
	[TenQH] [nvarchar] (150) NOT NULL,
	[MaTTP] [varchar]  (10)  NULL,
PRIMARY KEY (MaQH)
)
GO

CREATE TABLE [dbo].[PhuongXa](
	[MaPX]  [varchar]  (10)  NOT NULL,
	[TenPX] [nvarchar] (150) NOT NULL,
	[MaQH]  [varchar]  (10)  NULL,
PRIMARY KEY (MaPX)
)
GO
--======================================================================

--=====   CREATE FOREIGN KEY  ==========================================
ALTER TABLE [dbo].[KhuVuc] ADD FOREIGN KEY(MaTTP) REFERENCES [dbo].[TinhThanhPho]([MaTTP])
GO

ALTER TABLE [dbo].[KhuVuc] ADD FOREIGN KEY(MaQH) REFERENCES [dbo].[QuanHuyen]([MaQH])
GO

ALTER TABLE [dbo].[KhuVuc] ADD FOREIGN KEY(MaPX) REFERENCES [dbo].[PhuongXa]([MaPX])
GO

ALTER TABLE [dbo].[PhuongXa] ADD FOREIGN KEY(MaQH) REFERENCES [dbo].[QuanHuyen]([MaQH])
GO

ALTER TABLE [dbo].[QuanHuyen] ADD FOREIGN KEY(MaTTP) REFERENCES [dbo].[TinhThanhPho]([MaTTP])
GO

ALTER TABLE [dbo].[TaiKhoan] ADD FOREIGN KEY(MaNV) REFERENCES [dbo].[NhanVienYTe]([MaNV])
GO

ALTER TABLE [dbo].[KhachHang] ADD FOREIGN KEY(DiaChi) REFERENCES [dbo].[KhuVuc] ([MaKhuVuc])
GO

ALTER TABLE [dbo].[NhanVienYTe] ADD FOREIGN KEY(MaCV) REFERENCES [dbo].[ChucVu] ([MaCV])
GO

ALTER TABLE [dbo].[NhanVienYTe] ADD FOREIGN KEY(DiaChi) REFERENCES [dbo].[KhuVuc] ([MaKhuVuc])
GO

ALTER TABLE [dbo].[KhamSangLoc] ADD FOREIGN KEY(MaKH) REFERENCES [dbo].[KhachHang] ([MaKH])
GO

ALTER TABLE [dbo].[KhamSangLoc] ADD FOREIGN KEY(MaNV) REFERENCES [dbo].[NhanVienYTe]([MaNV])
GO

ALTER TABLE [dbo].[TiemChich] ADD FOREIGN KEY(MaNV) REFERENCES [dbo].[NhanVienYTe]([MaNV])
GO

ALTER TABLE [dbo].[TiemChich] ADD FOREIGN KEY(MaVacxin) REFERENCES [dbo].[DanhMuc_Vaccine]([MaVacxin])
GO

ALTER TABLE [dbo].[TiemChich] ADD FOREIGN KEY(MaKH) REFERENCES [dbo].[KhachHang] ([MaKH])
GO

ALTER TABLE [dbo].[DanhMuc_Vaccine] ADD FOREIGN KEY(MaBenh) REFERENCES [dbo].[Loai_Benh]([MaBenh])
GO

ALTER TABLE  [dbo].[Lo_Vacxin] ADD FOREIGN KEY(MaDanhMuc) REFERENCES  [dbo].[DanhMuc_Vaccine]([MaVacxin])
GO

ALTER TABLE  [dbo].[Lo_Vacxin] ADD FOREIGN KEY(MaNCC) REFERENCES  [dbo].[NhaCungCap]([MaNCC])
GO

ALTER TABLE  [dbo].[Lo_Vacxin] ADD FOREIGN KEY(MaXuatXu) REFERENCES [dbo].[XuatXu]([MaXuatXu])
GO

ALTER TABLE  [dbo].[HoaDonNhap_Vacxin] ADD FOREIGN KEY(MaNCC) REFERENCES [dbo].[NhaCungCap]([MaNCC])
GO

ALTER TABLE  [dbo].[HoaDonNhap_Vacxin] ADD FOREIGN KEY(MaNV) REFERENCES [dbo].[NhanVienYTe]([MaNV])
GO

ALTER TABLE  [dbo].[ChiTietHoaDonNhap_Vacxin] ADD FOREIGN KEY(MaHDN) REFERENCES [dbo].[HoaDonNhap_Vacxin]([MaHDN])
GO

ALTER TABLE  [dbo].[ChiTietHoaDonNhap_Vacxin] ADD FOREIGN KEY(MaSoLo) REFERENCES [dbo].[Lo_Vacxin]([MaSoLo])
GO

ALTER TABLE [dbo].[TiemChich] ADD FOREIGN KEY(MaSoLo) REFERENCES [dbo].[Lo_Vacxin]([MaSoLo])
GO

--=====   INSERT TABLE   ==============================================
-- Chức vụ
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'KSL', N'Khám sàng lọc')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'QLDKT', N'Quản lý đăng ký tiêm')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'QLK', N'Quản lý kho')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'QLNV', N'Quản lý nhân viên')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'QLTC', N'Quản lý tiêm chích')
GO
--SELECT * FROM [dbo].[ChucVu] GO

-- Khách hàng
INSERT [dbo].[KhachHang] ([MaKH],[Ho],[TenDem],[Ten],[NgaySinh],[GioiTinh],[Ho_NguoiGiamHo],[TenDem_NguoiGiamHo],[Ten_NguoiGiamHo],[CMND_TCC],[MaBHYT],[DiaChi],[DCCT],[SDT_NguoiGiamHo],[Email],[HotenNVThem])
VALUES ('KH0100100001-1',N'Trần',N'Đinh Hải',N'Nguyên',CAST(N'2020-9-07' AS Date),0,N'Trần',N'Minh',N'Mẫn','080204001821',NULL,'0100100001',N'Ấp Phú Lộc','0357600176','hainguyen272017@gmail.com',N'Trần Thị Thùy Dương')
INSERT [dbo].[KhachHang] ([MaKH],[Ho],[TenDem],[Ten],[NgaySinh],[GioiTinh],[Ho_NguoiGiamHo],[TenDem_NguoiGiamHo],[Ten_NguoiGiamHo],[CMND_TCC],[MaBHYT],[DiaChi],[DCCT],[SDT_NguoiGiamHo],[Email],[HotenNVThem])
VALUES ('KH0100100001-2',N'Ngô',N'Vân',N'Khánh',CAST(N'2004-10-31' AS Date),1,N'Dương',N'Thị',N'Vân','08020400456',NULL,'0100100001',N'Tổ 2 Ấp 5','0357600176','khanhcute@gmail.com',N'Ngô Tiến Thịnh')
GO

--SELECT * FROM [dbo].[KhachHang] GO

-- Loai_Benh
INSERT [dbo].[Loai_Benh] ([TenBenh]) VALUES (N'Sởi');
INSERT [dbo].[Loai_Benh] ([TenBenh]) VALUES (N'Lao');
INSERT [dbo].[Loai_Benh] ([TenBenh]) VALUES (N'Viêm gan B');
INSERT [dbo].[Loai_Benh] ([TenBenh]) VALUES (N'Bạch hầu');
INSERT [dbo].[Loai_Benh] ([TenBenh]) VALUES (N'Ho gà');
INSERT [dbo].[Loai_Benh] ([TenBenh]) VALUES (N'Uốn ván');
INSERT [dbo].[Loai_Benh] ([TenBenh]) VALUES (N'Bại liệt');
INSERT [dbo].[Loai_Benh] ([TenBenh]) VALUES (N'Hib');
GO
--Select * from [dbo].[Loai_Benh]

-- Địa chỉ
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100001', N'01', N'001', N'00001')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100004', N'01', N'001', N'00004')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100006', N'01', N'001', N'00006')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100007', N'01', N'001', N'00007')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100008', N'01', N'001', N'00008')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100010', N'01', N'001', N'00010')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100013', N'01', N'001', N'00013')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100016', N'01', N'001', N'00016')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100019', N'01', N'001', N'00019')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100022', N'01', N'001', N'00022')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100025', N'01', N'001', N'00025')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100028', N'01', N'001', N'00028')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100031', N'01', N'001', N'00031')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100100034', N'01', N'001', N'00034')
GO
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200037', N'01', N'002', N'00037')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200040', N'01', N'002', N'00040')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200043', N'01', N'002', N'00043')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200046', N'01', N'002', N'00046')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200049', N'01', N'002', N'00049')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200052', N'01', N'002', N'00052')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200055', N'01', N'002', N'00055')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200058', N'01', N'002', N'00058')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200061', N'01', N'002', N'00061')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200064', N'01', N'002', N'00064')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200067', N'01', N'002', N'00067')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200070', N'01', N'002', N'00070')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200073', N'01', N'002', N'00073')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200076', N'01', N'002', N'00076')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200079', N'01', N'002', N'00079')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200082', N'01', N'002', N'00082')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200085', N'01', N'002', N'00085')
INSERT [dbo].[KhuVuc] ([MaKhuVuc], [MaTTP], [MaQH], [MaPX]) VALUES (N'0100200088', N'01', N'002', N'00088')
GO
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00001', N'Phường Phúc Xá', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00004', N'Phường Trúc Bạch', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00006', N'Phường Vĩnh Phúc', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00007', N'Phường Cống Vị', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00008', N'Phường Liễu Giai', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00010', N'Phường Nguyễn Trung Trực', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00013', N'Phường Quán Thánh', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00016', N'Phường Ngọc Hà', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00019', N'Phường Điện Biên', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00022', N'Phường Đội Cấn', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'000232', N'Phường Phương Mai', N'006')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00025', N'Phường Ngọc Khánh', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00028', N'Phường Kim Mã', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00031', N'Phường Giảng Võ', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00034', N'Phường Thành Công', N'001')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00037', N'Phường Phúc Tân', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00040', N'Phường Đồng Xuân', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00043', N'Phường Hàng Mã', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00046', N'Phường Hàng Buồm', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00049', N'Phường Hàng Đào', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00052', N'Phường Hàng Bồ', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00055', N'Phường Cửa Đông', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00058', N'Phường Lý Thái Tổ', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00061', N'Phường Hàng Bạc', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00064', N'Phường Hàng Gai', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00067', N'Phường Chương Dương', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00070', N'Phường Hàng Trống', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00073', N'Phường Cửa Nam', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00076', N'Phường Hàng Bông', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00079', N'Phường Tràng Tiền', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00082', N'Phường Trần Hưng Đạo', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00085', N'Phường Phan Chu Trinh', N'002')
INSERT [dbo].[PhuongXa] ([MaPX], [TenPX], [MaQH]) VALUES (N'00088', N'Phường Hàng Bài', N'002')
GO
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'001', N'Quận Ba Đình', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'002', N'Quận Hoàn Kiếm', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'003', N'Quận Tây Hồ', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'004', N'Quận Long Biên', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'005', N'Quận Cầu Giấy', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'006', N'Quận Đống Đa', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'007', N'Quận Hai Bà Trưng', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'008', N'Quận Hoàng Mai', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'009', N'Quận Thanh Xuân', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'016', N'Huyện Sóc Sơn', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'017', N'Huyện Đông Anh', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'018', N'Huyện Gia Lâm', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'019', N'Quận Nam Từ Liêm', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'020', N'Huyện Thanh Trì', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'021', N'Quận Bắc Từ Liêm', N'01')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'024', N'Thành phố Hà Giang', N'02')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'026', N'Huyện Đồng Văn', N'02')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'027', N'Huyện Mèo Vạc', N'02')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'028', N'Huyện Yên Minh', N'02')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'029', N'Huyện Quản Bạ', N'02')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'030', N'Huyện Vị Xuyên', N'02')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'031', N'Huyện Bắc Mê', N'02')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'032', N'Huyện Hoàng Su Phì', N'02')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'033', N'Huyện Xín Mần', N'02')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'034', N'Huyện Bắc Quang', N'02')
INSERT [dbo].[QuanHuyen] ([MaQH], [TenQH], [MaTTP]) VALUES (N'035', N'Huyện Quang Bình	', N'02')
GO
INSERT [dbo].[TinhThanhPho] ([MaTTP], [TenTTP]) VALUES (N'01', N'Thành phố Hà Nội')
INSERT [dbo].[TinhThanhPho] ([MaTTP], [TenTTP]) VALUES (N'02', N'Tỉnh Hà Giang')
INSERT [dbo].[TinhThanhPho] ([MaTTP], [TenTTP]) VALUES (N'04', N'Tỉnh Cao Bằng')
INSERT [dbo].[TinhThanhPho] ([MaTTP], [TenTTP]) VALUES (N'06', N'Tỉnh Bắc Kạn')
INSERT [dbo].[TinhThanhPho] ([MaTTP], [TenTTP]) VALUES (N'08', N'Tỉnh Tuyên Quang')
INSERT [dbo].[TinhThanhPho] ([MaTTP], [TenTTP]) VALUES (N'10', N'Tỉnh Lào Cai')
INSERT [dbo].[TinhThanhPho] ([MaTTP], [TenTTP]) VALUES (N'11', N'Tỉnh Điện Biên')
INSERT [dbo].[TinhThanhPho] ([MaTTP], [TenTTP]) VALUES (N'12', N'Tỉnh Lai Châu')
INSERT [dbo].[TinhThanhPho] ([MaTTP], [TenTTP]) VALUES (N'14', N'Tỉnh Sơn La')
INSERT [dbo].[TinhThanhPho] ([MaTTP], [TenTTP]) VALUES (N'15', N'Tỉnh Yên Bái')
GO
-- Nhân viên
INSERT [dbo].[NhanVienYTe] VALUES ('NV0100100001-1',N'Nguyễn',N'Đình',N'Đức',CAST(N'2004-09-08' AS Date),0,'QLDKT','0100100001',N'Ấp 3','0989699855','duclox123@gmail.com','080204001821')
INSERT [dbo].[NhanVienYTe] VALUES ('NV0100100006-1',N'Trần',N'Thị Thùy',N'Dương',CAST(N'2004-02-07' AS Date),0,'QLNV','0100100006',N'Ngã 4','0389373652','thuyduong123@gmail.com','089045353476')
GO

--Select * from [dbo].[NhanVienYTe]

-- Tài khoản
INSERT [dbo].[TaiKhoan] VALUES ('NV0100100001-1','hnguyeenn','12345')
INSERT [dbo].[TaiKhoan] VALUES ('NV0100100006-1','vkhanh','12345')
GO

--select * from [dbo].[TaiKhoan]

--Khám sàng lọc
INSERT INTO KhamSangLoc VALUES('KSL1KH0100200076-1','KH0100200076-1','NV0100100001-1',CAST(N'2023-04-08' AS Date),60,120,120,12,N'Thể trạng bình thường',null,0)
GO


--=====   Create proc   ==============================================

CREATE PROCEDURE [dbo].[USP_GetKhachHangList]
AS
SELECT MaKH,
	CASE 
		WHEN LEN(TenDem) > 0 THEN
		CONCAT(Ho,' ',TenDem,' ',Ten)
		ELSE CONCAT(Ho,' ',Ten)
	END AS HoTen,
	CONVERT(VARCHAR(10), NgaySinh,103) AS NgaySinh,
	CASE 
		WHEN GioiTinh = 0 THEN N'Nam'
		ELSE N'Nữ' 
	END AS GioiTinh,
	CASE 
		WHEN LEN(TenDem_NguoiGiamHo) > 0 THEN
			CONCAT(Ho_NguoiGiamHo,' ',TenDem_NguoiGiamHo,' ',Ten_NguoiGiamHo)
			ELSE CONCAT(Ho_NguoiGiamHo,' ',Ten_NguoiGiamHo)
		END AS HoTen_NguoiGiamHo, CMND_TCC,MaBHYT,
		CONCAT(DCCT,' - ',TenPX,' - ',TenQH,' - ',TenTTP) AS DiaChi, SDT_NguoiGiamHo, Email, HotenNVThem
FROM  dbo.KhachHang, dbo.KhuVuc, dbo.TinhThanhPho, dbo.QuanHuyen, dbo.PhuongXa
WHERE KhuVuc.MaKhuVuc = KhachHang.DiaChi AND TinhThanhPho.MaTTP = KhuVuc.MaTTP AND KhuVuc.MaQH = QuanHuyen.MaQH AND
KhuVuc.MaPX = PhuongXa.MaPX
GO

--EXEC [dbo].[USP_GetKhachHangList]

CREATE PROCEDURE [dbo].[USP_FindKhachHangByMaKH]
@MaKH varchar(30)
AS
SELECT MaKH,
	CASE 
		WHEN LEN(TenDem) > 0 THEN
		CONCAT(Ho,' ',TenDem,' ',Ten)
		ELSE CONCAT(Ho,' ',Ten)
	END AS HoTen,
	CONVERT(VARCHAR(10), NgaySinh,103) AS NgaySinh,
	CASE 
		WHEN GioiTinh = 0 THEN N'Nam'
		ELSE N'Nữ' 
	END AS GioiTinh,
	CASE 
		WHEN LEN(TenDem_NguoiGiamHo) > 0 THEN
			CONCAT(Ho_NguoiGiamHo,' ',TenDem_NguoiGiamHo,' ',Ten_NguoiGiamHo)
			ELSE CONCAT(Ho_NguoiGiamHo,' ',Ten_NguoiGiamHo)
		END AS HoTen_NguoiGiamHo, CMND_TCC,MaBHYT,
		CONCAT(DCCT,' - ',TenPX,' - ',TenQH,' - ',TenTTP) AS DiaChi, SDT_NguoiGiamHo, Email
FROM  dbo.KhachHang, dbo.KhuVuc, dbo.TinhThanhPho, dbo.QuanHuyen, dbo.PhuongXa
WHERE KhuVuc.MaKhuVuc = KhachHang.DiaChi AND TinhThanhPho.MaTTP = KhuVuc.MaTTP AND KhuVuc.MaQH = QuanHuyen.MaQH AND
KhuVuc.MaPX = PhuongXa.MaPX AND KhachHang.MaKH = @MaKH
GO

CREATE PROC [dbo].[USP_Login]
@TenTK varchar(50), @MatKhau varchar(50)
AS
BEGIN
	SELECT * FROM [dbo].[TaiKhoan] where TenTK = @TenTK AND MatKhau = @MatKhau 
END
GO

Create PROCEDURE [dbo].[USP_GetNhanVienByTenTK]
@TenTK varchar(50)
AS
Select NhanVienYTe.MaNV,Ho,TenDem,Ten,NgaySinh,GioiTinh,MaCV,DiaChi,DCCT,SDT,Email,CCCD from NhanVienYTe, TaiKhoan
Where TaiKhoan.MaNV = NhanVienYTe.MaNV AND TaiKhoan.TenTK = @TenTK
GO

--EXEC [dbo].[USP_GetNhanVienByTenTK] @TenTK = 'hnguyeenn'


CREATE PROCEDURE [dbo].[USP_AllNhanVien]
AS
SELECT MaNV, 
	CASE
		WHEN LEN(TenDem) > 0 THEN
			CONCAT(Ho,' ',TenDem,' ', Ten)
		ELSE CONCAT(Ho,' ', Ten)
	END AS HoTen,
	CONVERT(VARCHAR(10), NgaySinh,103) AS NgaySinh,
	CASE 
		WHEN GioiTinh = 0 THEN N'Nam'
	ELSE N'Nữ' 
	END AS GioiTinh,TenCV,
    CONCAT(DCCT,' - ',TenPX,' - ',TenQH,' - ',TenTTP) AS DiaChi, SDT, Email
FROM  dbo.NhanVienYTe, dbo.ChucVu, dbo.KhuVuc, dbo.TinhThanhPho, dbo.QuanHuyen, dbo.PhuongXa
WHERE  NhanVienYTe.MaCV = ChucVu.MaCV AND MaKhuVuc = DiaChi AND 
TinhThanhPho.MaTTP = KhuVuc.MaTTP AND QuanHuyen.MaQH = KhuVuc.MaQH AND PhuongXa.MaPX = KhuVuc.MaPX
GO

CREATE PROCEDURE [dbo].[USP_FindNhanVienByMaNV]
@MaNV varchar(30)
AS
SELECT MaNV, 
	CASE
		WHEN LEN(TenDem) > 0 THEN
			CONCAT(Ho,' ',TenDem,' ', Ten)
		ELSE CONCAT(Ho,' ', Ten)
	END AS HoTen,
	CONVERT(VARCHAR(10), NgaySinh,103) AS NgaySinh,
	CASE 
		WHEN GioiTinh = 0 THEN N'Nam'
	ELSE N'Nữ' 
	END AS GioiTinh,TenCV,
    CONCAT(DCCT,' - ',TenPX,' - ',TenQH,' - ',TenTTP) AS DiaChi, SDT, Email
FROM  dbo.NhanVienYTe, dbo.ChucVu, dbo.KhuVuc, dbo.TinhThanhPho, dbo.QuanHuyen, dbo.PhuongXa
WHERE  NhanVienYTe.MaCV = ChucVu.MaCV AND MaKhuVuc = DiaChi AND 
TinhThanhPho.MaTTP = KhuVuc.MaTTP AND QuanHuyen.MaQH = KhuVuc.MaQH AND PhuongXa.MaPX = KhuVuc.MaPX 
AND NhanVienYTe.MaNV = @MaNV
GO

CREATE PROCEDURE [dbo].[USP_InsertNhanVien]
-- Khai bao tham số truyền vào
	@Ho NVARCHAR(10),
	@TenDem NVARCHAR(20),
	@Ten NVARCHAR(10),
	@NgaySinh DATE,
	@GioiTinh bit,
	@MaCV Varchar(30),
	@CCCD VARCHAR(20),
	@DiaChi VARCHAR(20),
	@DCCT NVARCHAR(150),
	@SDT VARCHAR(30),
	@Email VARCHAR(150)
AS
BEGIN
	DECLARE @I INT = 0
	select @I = (count(*) + 1) from NhanVienYTe WHERE DiaChi = @DiaChi
	
	INSERT INTO NhanVienYTe
	(	MaNV, Ho, TenDem, Ten, NgaySinh, GioiTinh, CCCD, MaCV, DiaChi, DCCT, SDT, Email)
	VALUES
	(	'NV'+@DiaChi+'-'+CAST(@I AS VARCHAR(30)), @Ho, @TenDem, @Ten, @NgaySinh, @GioiTinh, @CCCD, @MaCV, @DiaChi, @DCCT, @SDT, @Email)

	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO

CREATE PROCEDURE [dbo].[USP_InsertKhachHang]
-- Tham số truyền vào
	@Ho NVARCHAR(30),
	@TenDem NVARCHAR(20),
	@Ten NVARCHAR(10),
	@NgaySinh DATE,
	@GioiTinh bit,
	@Ho_NGH nvarchar(30),
	@TenDem_NGH nvarchar(30),
	@Ten_NGH nvarchar(30),
	@CCCD VARCHAR(20),
	@MaBHYT VARCHAR(20),
	@DiaChi VARCHAR(20),
	@DCCT NVARCHAR(150),
	@SDT VARCHAR(30),
	@Email VARCHAR(150),
	@HoTen_NV NVARCHAR(65)
AS
BEGIN
	DECLARE @I INT = 0
	select @I = (count(*) + 1) from KhachHang WHERE DiaChi = @DiaChi
	
	INSERT INTO KhachHang
	(	MaKH, Ho, TenDem, Ten, NgaySinh, GioiTinh, Ho_NguoiGiamHo, TenDem_NguoiGiamHo, Ten_NguoiGiamHo, CMND_TCC, MaBHYT, DiaChi, DCCT, SDT_NguoiGiamHo, Email, HotenNVThem)
	VALUES
	(	'KH'+@DiaChi+'-'+CAST(@I AS VARCHAR(30)), @Ho, @TenDem, @Ten, @NgaySinh, @GioiTinh, @Ho_NGH, @TenDem_NGH, @Ten_NGH, @CCCD, @MaBHYT, @DiaChi, @DCCT, @SDT, @Email, @HoTen_NV)
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO

CREATE PROCEDURE [dbo].[USP_UpdateKhachHang]
	@MaKH VARCHAR(30),
	@Ho NVARCHAR(30),
	@TenDem NVARCHAR(20),
	@Ten NVARCHAR(10),
	@NgaySinh DATE,
	@GioiTinh bit,
	@Ho_NGH nvarchar(30),
	@TenDem_NGH nvarchar(30),
	@Ten_NGH nvarchar(30),
	@CCCD VARCHAR(20),
	@MaBHYT VARCHAR(20),
	@DiaChi VARCHAR(20),
	@DCCT NVARCHAR(150),
	@SDT VARCHAR(30),
	@Email VARCHAR(150),
	@HoTen_NV NVARCHAR(65)
AS
BEGIN
UPDATE KhachHang
SET
	Ho = @Ho,
	TenDem = @TenDem,
	Ten = @Ten,
	NgaySinh = @NgaySinh,
	GioiTinh = @GioiTinh,
	Ho_NguoiGiamHo = @Ho_NGH ,
	TenDem_NguoiGiamHo = @TenDem_NGH ,
	Ten_NguoiGiamHo = @Ten_NGH,
	CMND_TCC = @CCCD,
	MaBHYT = @MaBHYT ,
	DiaChi = @DiaChi ,
	DCCT = @DCCT ,
	SDT_NguoiGiamHo = @SDT ,
	Email = @Email ,
	HotenNVThem = @HoTen_NV 
where MaKH = @MaKH
IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO

CREATE PROCEDURE [dbo].[USP_DeleteKhachHang]
@MaKH varchar(30)
AS
BEGIN
	DELETE TiemChich where MaKH = @MaKH
	DELETE KhamSangLoc where MaKH = @MaKH
	DELETE KhachHang where MaKH =@MaKH
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO


CREATE PROCEDURE [dbo].[USP_UpdateNhanVien]
	@MaNV VARCHAR(30),
	@Ho NVARCHAR(10),
	@TenDem NVARCHAR(20),
	@Ten NVARCHAR(10),
	@NgaySinh DATE,
	@GioiTinh bit,
	@MaCV Varchar(30),
	@CCCD VARCHAR(20),
	@DiaChi VARCHAR(20),
	@DCCT NVARCHAR(150),
	@SDT VARCHAR(30),
	@Email VARCHAR(150)
AS
BEGIN
UPDATE NhanVienYTe
SET  
	[Ho] = @Ho,  
	[TenDem] = @TenDem,
	[Ten] = @Ten,
	[NgaySinh] = @NgaySinh,
	[GioiTinh] = @GioiTinh,
	[MaCV] = @MaCV,
	[DiaChi]  = @DiaChi,
	[DCCT] = @DCCT,
	[SDT] = @SDT,
	[Email] = @Email,
	[CCCD] = @CCCD
where MaNV = @MaNV
IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO

CREATE PROCEDURE [dbo].[USP_DeleteNhanVien]
@MaNV VARCHAR(30)
AS
BEGIN
	DELETE TaiKhoan WHERE MaNV = @MaNV 
	DELETE NhanVienYTe WHERE MaNV = @MaNV
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO

CREATE PROCEDURE [dbo].[USP_InsertTaiKhoan]
@MaNV VARCHAR(30),
@TenTK varchar(50),
@MatKhau varchar(50)
AS
BEGIN
	INSERT INTO TaiKhoan 
	(MaNV,TenTK,MatKhau)
	Values
	(@MaNV,@TenTK,@MatKhau)
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO

CREATE PROCEDURE [dbo].[USP_GetKhamSangLocList]
AS
SELECT MaKSL,
	CASE
		WHEN LEN(KhachHang.TenDem) > 0 THEN
			CONCAT(KhachHang.Ho,' ',KhachHang.TenDem,' ', KhachHang.Ten)
		ELSE CONCAT(KhachHang.Ho,' ', KhachHang.Ten)
	END AS HoTenKhachHang,
	CASE
		WHEN LEN(NhanVienYTe.TenDem) > 0 THEN
			CONCAT(NhanVienYTe.Ho,' ',NhanVienYTe.TenDem,' ', NhanVienYTe.Ten)
		ELSE CONCAT(NhanVienYTe.Ho,' ', NhanVienYTe.Ten)
	END AS HoTenNhanVienYTe,NgayKham,NhipTim,HuyetAp,ChieuCao,CanNang,ThongTinKham,ThongTinKhac,
	CASE 
		WHEN KetQua = 0 THEN N'Được tiêm'
	ELSE N'Không được tiêm' 
	END AS KetQua
From KhamSangLoc,KhachHang,NhanVienYTe
where KhamSangLoc.MaKH = KhachHang.MaKH AND KhamSangLoc.MaNV = NhanVienYTe.MaNV
GO

CREATE PROCEDURE [dbo].[USP_FindKhamSangLocByMaKSL]
@MaKSL varchar(30)
AS
SELECT MaKSL,
	CASE
		WHEN LEN(KhachHang.TenDem) > 0 THEN
			CONCAT(KhachHang.Ho,' ',KhachHang.TenDem,' ', KhachHang.Ten)
		ELSE CONCAT(KhachHang.Ho,' ', KhachHang.Ten)
	END AS HoTenKhachHang,
	CASE
		WHEN LEN(NhanVienYTe.TenDem) > 0 THEN
			CONCAT(NhanVienYTe.Ho,' ',NhanVienYTe.TenDem,' ', NhanVienYTe.Ten)
		ELSE CONCAT(NhanVienYTe.Ho,' ', NhanVienYTe.Ten)
	END AS HoTenNhanVienYTe,NgayKham,NhipTim,HuyetAp,ChieuCao,CanNang,ThongTinKham,ThongTinKhac,
	CASE 
		WHEN KetQua = 0 THEN N'Được tiêm'
	ELSE N'Không được tiêm' 
	END AS KetQua
From KhamSangLoc,KhachHang,NhanVienYTe
where KhamSangLoc.MaKH = KhachHang.MaKH AND KhamSangLoc.MaNV = NhanVienYTe.MaNV AND KhamSangLoc.MaKSL = @MaKSL
GO


CREATE PROCEDURE [dbo].[USP_InsertKhamSangLoc]
	@MaKH varchar(30),
	@MaNV varchar(30),
	@NgayKham datetime,
	@NhipTim float,
	@HuyetAp float,
	@ChieuCao float,
	@CanNang float,
	@ThongTinKham ntext,
	@ThongTinKhac ntext,
	@KetQua bit
AS
BEGIN
	DECLARE @I INT = 0
	select @I = (count(*) + 1) from KhamSangLoc WHERE MaKH = @MaKH
	Insert into KhamSangLoc(MaKSL,MaKH,MaNV,NgayKham,NhipTim,HuyetAp,ChieuCao,CanNang,ThongTinKham,ThongTinKhac,KetQua)
	Values('KSL'+CAST(@I AS VARCHAR(30))+@MaKH,@MaKH,@MaNV,@NgayKham,@NhipTim,@HuyetAp,@ChieuCao,@CanNang,@ThongTinKham,@ThongTinKhac,@KetQua)
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO

CREATE PROCEDURE [dbo].[UpdateKhamSangLoc]
	@MaKSL varchar(30),
	@MaKH varchar(30),
	@MaNV varchar(30),
	@NhipTim float,
	@HuyetAp float,
	@ChieuCao float,
	@CanNang float,
	@ThongTinKham ntext,
	@ThongTinKhac ntext,
	@KetQua bit
AS
BEGIN
UPDATE KhamSangLoc
SET
	MaKH = @MaKH,
	MaNV = @MaNV,
	NhipTim = @NhipTim,
	HuyetAp = @HuyetAp,
	ChieuCao = @ChieuCao,
	CanNang = @CanNang,
	ThongTinKham = @ThongTinKham,
	ThongTinKhac = @ThongTinKhac,
	KetQua = @KetQua
where MaKSL = @MaKSL
IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO

CREATE PROCEDURE [dbo].[GetDanhMucVCList]
AS
BEGIN
	SELECT MaVacxin,TenChung,TenThuongMai,TenBenh,DonGia,MoTa,ThanhPhan,TacDungPhu
	FROM DanhMuc_Vaccine
	INNER JOIN Loai_Benh ON DanhMuc_Vaccine.MaBenh = Loai_Benh.MaBenh
END
GO

CREATE PROCEDURE [dbo].[FindDanhMucVCByMaVacxin]
@MaVacxin varchar(30)
AS
BEGIN
	SELECT MaVacxin,TenChung,TenThuongMai,TenBenh,DonGia,MoTa,ThanhPhan,TacDungPhu
	FROM DanhMuc_Vaccine
	INNER JOIN Loai_Benh ON DanhMuc_Vaccine.MaBenh = Loai_Benh.MaBenh
	WHERE DanhMuc_Vaccine.MaVacxin = @MaVacxin
END
GO

CREATE PROCEDURE [dbo].[InsertDanhMucVacXin]
	@MaBenh int,
	@TenChung varchar(150),
	@TenThuongMai varchar(150),
	@DonGia float,
	@MoTa nvarchar(MAX),
	@ThanhPhan nvarchar(MAX),
	@TacDungPhu nvarchar(MAX)
AS
BEGIN
	INSERT INTO DanhMuc_Vaccine(MaVacxin,MaBenh,TenChung,TenThuongMai,DonGia,MoTa,ThanhPhan,TacDungPhu)
	VALUES ('VC-'+@TenThuongMai,@MaBenh,@TenChung,@TenThuongMai,@DonGia,@MoTa,@ThanhPhan,@TacDungPhu)
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO

EXEC [dbo].[InsertDanhMucVacXin] @MaBenh = 9,@TenChung = '',@TenThuongMai ='',@DonGia = 9,@MoTa =N'',@ThanhPhan=N'',@TacDungPhu =N''
Select * from Loai_Benh where MaBenh='1'
GO

CREATE PROCEDURE [dbo].[UpdateDanhMucVacXin]
	@MaVacxin varchar(30),
	@MaBenh int,
	@TenChung varchar(150),
	@TenThuongMai varchar(150),
	@DonGia float,
	@MoTa nvarchar(MAX),
	@ThanhPhan nvarchar(MAX),
	@TacDungPhu nvarchar(MAX)
AS
BEGIN
	UPDATE DanhMuc_Vaccine
	SET
	TenChung = @TenChung,
	MaBenh = @MaBenh,
	TenThuongMai = @TenThuongMai,
	DonGia = @DonGia,
	MoTa = @MoTa,
	ThanhPhan = @ThanhPhan,
	TacDungPhu = @TacDungPhu
	WHERE MaVacxin = @MaVacxin
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO
Exec proc InsertLo
CREATE PROCEDURE [dbo].[USP_GetTiemChichList]
AS
BEGIN
    SELECT MaTiem,
        CASE
            WHEN LEN(KhachHang.TenDem) > 0 THEN
                CONCAT(KhachHang.Ho, ' ', KhachHang.TenDem, ' ', KhachHang.Ten)
            ELSE CONCAT(KhachHang.Ho, ' ', KhachHang.Ten)
        END AS HoTenKhachHang,
        CASE
            WHEN LEN(NhanVienYTe.TenDem) > 0 THEN
                CONCAT(NhanVienYTe.Ho, ' ', NhanVienYTe.TenDem, ' ', NhanVienYTe.Ten)
            ELSE CONCAT(NhanVienYTe.Ho, ' ', NhanVienYTe.Ten)
        END AS HoTenNhanVienYTe, TenChung, TiemLan, TiemChich.MaSoLo, NgayTiem, LieuLuong, DuongvaViTriTiem,GhiChu
    FROM TiemChich
    INNER JOIN KhachHang ON TiemChich.MaKH = KhachHang.MaKH
    INNER JOIN NhanVienYTe ON TiemChich.MaNV = NhanVienYTe.MaNV
    INNER JOIN DanhMuc_Vaccine ON TiemChich.MaVacxin = DanhMuc_Vaccine.MaVacxin
    INNER JOIN Lo_Vacxin ON TiemChich.MaSoLo = Lo_Vacxin.MaSoLo
END
GO


CREATE PROCEDURE [dbo].[USP_FindTiemChichByMaKH]
    @MaKH VARCHAR(30)
AS
BEGIN 
    SELECT MaTiem,
        CASE
            WHEN LEN(KhachHang.TenDem) > 0 THEN
                CONCAT(KhachHang.Ho, ' ', KhachHang.TenDem, ' ', KhachHang.Ten)
            ELSE CONCAT(KhachHang.Ho, ' ', KhachHang.Ten)
        END AS HoTenKhachHang,
        CASE
            WHEN LEN(NhanVienYTe.TenDem) > 0 THEN
                CONCAT(NhanVienYTe.Ho, ' ', NhanVienYTe.TenDem, ' ', NhanVienYTe.Ten)
            ELSE CONCAT(NhanVienYTe.Ho, ' ', NhanVienYTe.Ten)
        END AS HoTenNhanVienYTe, 
        TenChung, 
        TiemLan, 
		TiemChich.MaSoLo,
        NgayTiem,
        LieuLuong,
        DuongvaViTriTiem,
        GhiChu
    FROM TiemChich
    INNER JOIN KhachHang ON TiemChich.MaKH = KhachHang.MaKH
    INNER JOIN NhanVienYTe ON TiemChich.MaNV = NhanVienYTe.MaNV
    INNER JOIN DanhMuc_Vaccine ON TiemChich.MaVacxin = DanhMuc_Vaccine.MaVacxin
	 INNER JOIN Lo_Vacxin ON TiemChich.MaSoLo = Lo_Vacxin.MaSoLo
    WHERE TiemChich.MaKH = @MaKH
END

SELECT * FROM Lo_Vacxin
INSERT INTO Lo_Vacxin (MaSoLo, MaDanhMuc, SoLuong_Lieu, GiaLo, MaNCC, MaXuatXu, TinhTrang) VALUES ('Lo2-BCG SSI', 'VC-BCG SSI', 120, 3000000000, 3, 1, 1)

Exec [dbo].[USP_GetTiemChichList]

CREATE PROCEDURE [dbo].[USP_AddTiemChich_UpdateLoVacxin]
    @MaNV VARCHAR(30),
    @MaKH VARCHAR(30),
    @MaVacxin VARCHAR(30),
    @MaSoLo VARCHAR(30),
    @TiemLan int,
    @NgayTiem DATETIME,
    @GhiChu NVARCHAR(150),
    @LieuLuong FLOAT,
    @DuongvaViTriTiem NVARCHAR(MAX)
AS
BEGIN
	DECLARE @I INT = 0
	SELECT @I = (count(*) + 1) from TiemChich WHERE MaKH = @MaKH
    -- Thêm tiêm chủng mới vào bảng TiemChich
    INSERT INTO TiemChich (MaTiem, MaNV, MaKH, MaVacxin, MaSoLo, TiemLan, NgayTiem, GhiChu, LieuLuong, DuongvaViTriTiem)
    VALUES ('T'+CAST(@I AS VARCHAR(30))+@MaKH, @MaNV, @MaKH, @MaVacxin, @MaSoLo, @TiemLan, @NgayTiem, @GhiChu, @LieuLuong, @DuongvaViTriTiem)
    
    -- Trừ đi 1 số lượng liều trong bảng Lo_Vacxin
    UPDATE Lo_Vacxin
    SET SoLuong_Lieu = SoLuong_Lieu - 1
    WHERE MaSoLo = @MaSoLo
   IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO

CREATE PROCEDURE [dbo].[USP_UpdateTiemChich]
	@MaTiem VARCHAR(30),
	@MaNV VARCHAR(30),
	@MaKH VARCHAR(30),
	@MaVacxin VARCHAR(30),
	@MaSoLo VARCHAR(30),
	@TiemLan int,
	@NgayTiem DATETIME,
	@GhiChu NVARCHAR(150),
	@LieuLuong FLOAT,
	@DuongvaViTriTiem NVARCHAR(MAX)
AS
BEGIN
	UPDATE TiemChich
	SET 
	MaNV = @MaNV,
	MaKH = @MaKH,
	MaVacxin = @MaVacxin,
	MaSoLo = @MaSoLo,
	TiemLan = @TiemLan,
	NgayTiem = @NgayTiem,
	GhiChu = @GhiChu,
	LieuLuong = @LieuLuong,
	DuongvaViTriTiem = @DuongvaViTriTiem
	WHERE MaTiem = @MaTiem
	
UPDATE Lo_Vacxin
	SET SoLuong_Lieu = SoLuong_Lieu + 1
	WHERE MaSoLo = (SELECT MaSoLo FROM TiemChich WHERE MaTiem = @MaTiem)
	
UPDATE Lo_Vacxin
	SET SoLuong_Lieu = SoLuong_Lieu - 1
	WHERE MaSoLo = @MaSoLo
	
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO

EXEC USP_AddTiemChich_UpdateLoVacxin @MaNV = 'MaNV1', @MaKH = 'MaKH1', @MaVacxin = 'MaVX1', @MaSoLo = 'MaSL1',  @TiemLan = 'TiemLan1', @NgayTiem = '2022-04-13', @GhiChu = 'GhiChu1', @LieuLuong = 1.5, @DuongvaViTriTiem = 'DV1';

select * from Lo_Vacxin where MaDanhMuc = 'VC-BCG SSI'
GO

EXEC USP_UpdateTiemChich @MaTiem = 'T1KH0100100001-1',@MaNV = 'NV0100100001-1',@MaKH= 'KH0100100001-1',@MaVacxin = 'VC-BCG SSI',@MaSoLo = 'Lo2-BCG SSI',@TiemLan = 1,@NgayTiem = '2023-04-14',@GhiChu =  'Đã tiêm',@LieuLuong =  2.3,@DuongvaViTriTiem = 'Bắp tay'
Select * from TiemChich