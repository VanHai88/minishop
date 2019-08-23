-- CREATE DATABASE dbminishop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- USE dbminishop;

 CREATE TABLE CHUCVU(
	machucvu integer AUTO_INCREMENT,
    tenchucvu NVARCHAR(55),
    PRIMARY KEY (machucvu)
 );

CREATE TABLE NHANVIEN(
	manhanvien integer AUTO_INCREMENT,
    hoten NVARCHAR(55),
    diachi NVARCHAR(200),
    gioitinh TINYINT,
    cmnd char(14),
    machucvu bit,
    email VARCHAR(50),
    tendangnhap VARCHAR(50),
    matkhau VARCHAR(50),
    PRIMARY KEY (manhanvien),
    CONSTRAINT FK_NhanVien_ChucVu FOREIGN KEY (machucvu) REFERENCES CHUCVU(machucvu)
);

CREATE TABLE DANHMUCSANPHAM(
	madanhmuc INTEGER AUTO_INCREMENT,
    tendanhmuc NVARCHAR(100),
    hinhdanhmuc TEXT,
    PRIMARY KEY(madanhmuc)
);

CREATE TABLE SANPHAM(
	masanpham INTEGER AUTO_INCREMENT,
    tensanpham NVARCHAR(100),
    giatien VARCHAR(50),
    mota text,
    hinhsanpham TEXT,
    madanhmuc INTEGER,
    PRIMARY KEY(masanpham),
    CONSTRAINT FK_SanPham_DanhMuc FOREIGN KEY(madanhmuc) REFERENCES DANHMUCSANPHAM(madanhmuc)
);

CREATE TABLE MAUSANPHAM(
	mamau INTEGER AUTO_INCREMENT,
    tenmau NVARCHAR(50),
    PRIMARY KEY(mamau)
);

CREATE TABLE SIZESANPHAM(
	masize INTEGER AUTO_INCREMENT,
    size NVARCHAR(20),
    PRIMARY KEY(masize)
);

CREATE TABLE CHITIETSANPHAM(
	machitietsanpham INTEGER AUTO_INCREMENT,
    masanpham INTEGER,
    masize INTEGER,
    mamau INTEGER,
    soluong INTEGER,
    ngaynhap VARCHAR(50),
    PRIMARY KEY(machitietsanpham),
    CONSTRAINT FK_ChiTiet_SanPham FOREIGN KEY(masanpham) REFERENCES SANPHAM(masanpham),
    CONSTRAINT FK_ChiTiet_Size FOREIGN KEY(masize) REFERENCES SIZESANPHAM(masize),
    CONSTRAINT FK_ChiTiet_MauSanPham FOREIGN KEY(mamau) REFERENCES MAUSANPHAM(mamau)
);

CREATE TABLE KHUYENMAI(
	makhuyenmai INTEGER AUTO_INCREMENT,
    tenkhuyenmai NVARCHAR(200),
    thoigianbatdau NVARCHAR(50),
    thoigianketthuc NVARCHAR(50),
    mota TEXT,
    hinhkhuyenmai TEXT,
	giagiam INTEGER,
    PRIMARY KEY(makhuyenmai)
);

CREATE TABLE CHITIETKHUYENMAI(
	makhuyenmai INTEGER AUTO_INCREMENT,
    masanpham INTEGER,
    PRIMARY KEY(makhuyenmai, masanpham),
    CONSTRAINT FK_CTKM_SanPham FOREIGN KEY(masanpham) REFERENCES SANPHAM(masanpham)
);

CREATE TABLE HOADON(
	mahoadon INTEGER AUTO_INCREMENT,
    tenkhachhang NVARCHAR(100),
    sodt char(12),
    diachigiaohang NVARCHAR(200),
    inhtrang bit,
    ngaylap VARCHAR(50),
    PRIMARY KEY(mahoadon)
);

CREATE TABLE CHITIETHOADON(
	mahoadon INTEGER,
    machitietsanpham INTEGER,
    soluong INTEGER,
    giatien VARCHAR(100),
    PRIMARY KEY(mahoadon, machitietsanpham),
    CONSTRAINT FK_CTHD_HoaDon FOREIGN KEY(mahoadon) REFERENCES HOADON(mahoadon),
    CONSTRAINT FK_CTHD_CTSP FOREIGN KEY(machitietsanpham) REFERENCES CHITIETSANPHAM(machitietsanpham)
);























