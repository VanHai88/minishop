package com.nguyenvanhai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenvanhai.dao.MauSanPhamDAO;
import com.nguyenvanhai.daoimp.MauSanPhamImp;
import com.nguyenvanhai.entity.MauSanPham;

@Service
public class MauSanPhamService implements MauSanPhamImp {
	@Autowired
	MauSanPhamDAO mauSanPhamDAO;

	@Override
	public List<MauSanPham> layMauSanPham() {
		return mauSanPhamDAO.layMauSanPham();
	}

}
