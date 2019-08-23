package com.nguyenvanhai.daoimp;

import java.util.List;

import com.nguyenvanhai.entity.SanPham;

public interface SanPhamImp {
	List<SanPham> LayDanhSachSanPhamLimit(int spBatDau, int spKetThuc, String tensp);
	SanPham LayDanhSachChiTietSanPhamTheoMa(int masanpham);
	List<SanPham> LayDanhSachSanPhamTheoDanhMuc(int madanhmuc);
	boolean xoaSanPhamTheoMaSanPham(int masanpham);
	boolean themSanPham(SanPham sanPham);
	boolean capNhatSanPham(SanPham sanPham);
	List<SanPham> timKiemSanPham(String tensp);
}
