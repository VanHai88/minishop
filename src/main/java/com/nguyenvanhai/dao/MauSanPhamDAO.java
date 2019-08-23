package com.nguyenvanhai.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenvanhai.daoimp.MauSanPhamImp;
import com.nguyenvanhai.entity.MauSanPham;
import com.nguyenvanhai.entity.SizeSanPham;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS) 
public class MauSanPhamDAO implements MauSanPhamImp {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<MauSanPham> layMauSanPham() {
		Session session = sessionFactory.getCurrentSession();
		String query = "FROM mausanpham";
		List<MauSanPham> listMauSanPham = session.createQuery(query).getResultList();
		return listMauSanPham;
	}
	
	
}
