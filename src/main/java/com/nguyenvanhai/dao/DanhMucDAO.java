package com.nguyenvanhai.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenvanhai.daoimp.DanhMucImp;
import com.nguyenvanhai.entity.DanhMucSanPham;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DanhMucDAO implements DanhMucImp{
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<DanhMucSanPham> layDanhMuc() {
		Session session = sessionFactory.getCurrentSession();
		
		List<DanhMucSanPham> listDanhMucs = session.createQuery("FROM danhmucsanpham").getResultList();
		return listDanhMucs;
	}

}
