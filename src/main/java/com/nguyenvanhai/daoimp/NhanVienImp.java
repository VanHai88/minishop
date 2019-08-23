package com.nguyenvanhai.daoimp;

import java.util.List;

import com.nguyenvanhai.entity.NhanVien;

public interface NhanVienImp {
	NhanVien kiemtradangnhap(String email, String matkhau);
	int ThemNhanVien(NhanVien nhanVien);
	NhanVien getNhanVien(int manv);
	List<NhanVien> getAllNhanVien();
	boolean capNhatNhanVien(NhanVien nhanVien);
}
