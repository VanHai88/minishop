package com.nguyenvanhai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenvanhai.dao.SanPhamDAO;
import com.nguyenvanhai.daoimp.SanPhamImp;
import com.nguyenvanhai.entity.SanPham;

@Service
public class SanPhamService implements SanPhamImp {

	@Autowired
	SanPhamDAO sanPhamDAO;
	
	@Override
	public List<SanPham> LayDanhSachSanPhamLimit(int spBatDau, int spKetThuc, String tensp) {
		return sanPhamDAO.LayDanhSachSanPhamLimit(spBatDau, spKetThuc, tensp);
	}

	@Override
	public SanPham LayDanhSachChiTietSanPhamTheoMa(int masanpham) {
		return sanPhamDAO.LayDanhSachChiTietSanPhamTheoMa(masanpham);
	}

	@Override
	public List<SanPham> LayDanhSachSanPhamTheoDanhMuc(int madanhmuc) {
		return sanPhamDAO.LayDanhSachSanPhamTheoDanhMuc(madanhmuc);
	}

	@Override
	public boolean xoaSanPhamTheoMaSanPham(int masanpham) {
		return sanPhamDAO.xoaSanPhamTheoMaSanPham(masanpham);
	}

	@Override
	public boolean themSanPham(SanPham sanPham) {
		return sanPhamDAO.themSanPham(sanPham);
	}

	@Override
	public boolean capNhatSanPham(SanPham sanPham) {
		return sanPhamDAO.capNhatSanPham(sanPham);
	}

	@Override
	public List<SanPham> timKiemSanPham(String tensp) {
		return sanPhamDAO.timKiemSanPham(tensp);
	}

}
