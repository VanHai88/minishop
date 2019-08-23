package com.nguyenvanhai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyenvanhai.dao.HoaDonDAO;
import com.nguyenvanhai.daoimp.HoaDonImp;
import com.nguyenvanhai.entity.HoaDon;

@Service
public class HoaDonService implements HoaDonImp {

	@Autowired
	HoaDonDAO hoaDonDAO;
	
	@Override
	public int themHoaDon(HoaDon hoaDon) {
		return hoaDonDAO.themHoaDon(hoaDon);
	}

	@Override
	public List<HoaDon> LayDanhSachHoaDonLimit(int hdbatdau, int hdKetThuc) {
		return hoaDonDAO.LayDanhSachHoaDonLimit(hdbatdau, hdKetThuc);
	}

}
