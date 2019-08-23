package com.nguyenvanhai.daoimp;

import java.util.List;

import com.nguyenvanhai.entity.HoaDon;

public interface HoaDonImp {
	int themHoaDon(HoaDon hoaDon);
	List<HoaDon> LayDanhSachHoaDonLimit(int hdbatdau, int hdKetThuc);
}
