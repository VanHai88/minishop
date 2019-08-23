package com.nguyenvanhai.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenvanhai.daoimp.HoaDonImp;
import com.nguyenvanhai.entity.HoaDon;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS) 
public class HoaDonDAO implements HoaDonImp {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public int themHoaDon(HoaDon hoaDon) {
		Session session = sessionFactory.getCurrentSession();
		int id = (int) session.save(hoaDon);
		if(id > 0){
			return id;
		}else{
			return 0;
		}
		
	}

	@Override
	@Transactional
	public List<HoaDon> LayDanhSachHoaDonLimit(int hdbatdau, int hdKetThuc) {
		Session session = sessionFactory.getCurrentSession();
		List<HoaDon> listHoadons = new ArrayList<>();
		if(hdbatdau < 0){
			listHoadons = (List<HoaDon>) session.createQuery("FROM hoadon").getResultList();
		}else{
			listHoadons = (List<HoaDon>) session.createQuery("FROM hoadon LIMIT")
					.setFirstResult(hdbatdau).setMaxResults(hdKetThuc).getResultList();
		}
		return listHoadons;
	}

}
