package com.nguyenvanhai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenvanhai.dao.SizeSanPhamDAO;
import com.nguyenvanhai.daoimp.SizeSanPhamImp;
import com.nguyenvanhai.entity.SizeSanPham;

@Service
public class SizeSanPhamSevice implements SizeSanPhamImp {
	@Autowired
	SizeSanPhamDAO sizeSanPhamDAO;

	@Override
	public List<SizeSanPham> layDanhSachSize() {
		return sizeSanPhamDAO.layDanhSachSize();
	}
	
}
