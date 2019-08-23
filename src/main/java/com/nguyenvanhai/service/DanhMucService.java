package com.nguyenvanhai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenvanhai.dao.DanhMucDAO;
import com.nguyenvanhai.daoimp.DanhMucImp;
import com.nguyenvanhai.entity.DanhMucSanPham;

@Service
public class DanhMucService implements DanhMucImp {

	@Autowired
	DanhMucDAO danhMucDAO;
	
	@Override
	public List<DanhMucSanPham> layDanhMuc() {
		return danhMucDAO.layDanhMuc();
	}

}
