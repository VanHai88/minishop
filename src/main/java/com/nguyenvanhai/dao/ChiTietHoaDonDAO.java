package com.nguyenvanhai.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenvanhai.daoimp.ChiTietHoaDonImp;
import com.nguyenvanhai.entity.ChiTietHoaDon;
import com.nguyenvanhai.entity.ChiTietHoaDonId;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ChiTietHoaDonDAO implements ChiTietHoaDonImp {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public boolean ThemChitietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		Session session = sessionFactory.getCurrentSession();
		ChiTietHoaDonId id = (ChiTietHoaDonId) session.save(chiTietHoaDon);
		
		if(id != null){
			return true;
		}else{
			return false;
		}
		
	}

}
