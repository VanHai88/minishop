package com.nguyenvanhai.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenvanhai.daoimp.SizeSanPhamImp;
import com.nguyenvanhai.entity.SizeSanPham;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS) 
public class SizeSanPhamDAO implements SizeSanPhamImp {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<SizeSanPham> layDanhSachSize() {
		Session session = sessionFactory.getCurrentSession();
		String query = "FROM sizesanpham";
		List<SizeSanPham> listSizeSanPham = session.createQuery(query).getResultList();
		return listSizeSanPham;
	}

}
