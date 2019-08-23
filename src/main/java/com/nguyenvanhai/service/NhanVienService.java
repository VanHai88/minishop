package com.nguyenvanhai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenvanhai.dao.NhanVienDAO;
import com.nguyenvanhai.daoimp.NhanVienImp;
import com.nguyenvanhai.entity.NhanVien;

@Service
public class NhanVienService implements NhanVienImp {

	@Autowired
	NhanVienDAO nhanVienDAO;

	@Override
	public NhanVien kiemtradangnhap(String email, String matkhau) {
		return nhanVienDAO.kiemtradangnhap(email, matkhau);
	}

	@Override
	public int ThemNhanVien(NhanVien nhanVien) {
		int ktThemNhanVien = nhanVienDAO.ThemNhanVien(nhanVien);
		return ktThemNhanVien;
	}

	@Override
	public NhanVien getNhanVien(int manv) {
		return nhanVienDAO.getNhanVien(manv);
	}

	@Override
	public List<NhanVien> getAllNhanVien() {
		return nhanVienDAO.getAllNhanVien();
	}

	@Override
	public boolean capNhatNhanVien(NhanVien nhanVien) {
		nhanVienDAO.capNhatNhanVien(nhanVien);
		return false;
	}
	
	
}
