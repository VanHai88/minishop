package com.nguyenvanhai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenvanhai.dao.ChiTietHoaDonDAO;
import com.nguyenvanhai.daoimp.ChiTietHoaDonImp;
import com.nguyenvanhai.entity.ChiTietHoaDon;

@Service
public class ChiTietHoaDonService implements ChiTietHoaDonImp {

	@Autowired
	ChiTietHoaDonDAO chiTietHoaDonDAO;
	
	@Override
	public boolean ThemChitietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		
		return chiTietHoaDonDAO.ThemChitietHoaDon(chiTietHoaDon);
	}

}
