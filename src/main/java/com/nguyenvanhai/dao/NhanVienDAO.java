package com.nguyenvanhai.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenvanhai.daoimp.NhanVienImp;
import com.nguyenvanhai.entity.NhanVien;
import com.nguyenvanhai.entity.SanPham;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS) // chi dinh NhanVienDAO la 1 proxyMode chu khong phai chua trong proxyMode
public class NhanVienDAO implements NhanVienImp{
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	@Transactional
	public NhanVien kiemtradangnhap(String email, String matkhau) {
		Session session = sessionFactory.getCurrentSession();
		try {
			NhanVien nhanVien = (NhanVien) session.createQuery("FROM nhanvien WHERE email='"+email+"' AND matkhau='"+matkhau+"'").getSingleResult();
			return nhanVien;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	@Transactional
	public int ThemNhanVien(NhanVien nhanVien) {
		Session session = sessionFactory.getCurrentSession();
		int maNhanVien = (int)session.save(nhanVien);
		if(maNhanVien > 0){
			return maNhanVien;
		}
		return 0;
	}

	@Override
	@Transactional
	public NhanVien getNhanVien(int manv) {
		Session session = sessionFactory.getCurrentSession();
		NhanVien nhanvien = (NhanVien) session.createQuery("FROM nhanvien WHERE manhanvien="+manv).getSingleResult();
		return nhanvien;
	}

	@Override
	@Transactional
	public List<NhanVien> getAllNhanVien() {
		Session session = sessionFactory.getCurrentSession();
		List<NhanVien> listnhanviens = (List<NhanVien>) session.createQuery("FROM nhanvien").getResultList();
		return listnhanviens;
	}

	@Override
	@Transactional
	public boolean capNhatNhanVien(NhanVien nhanvien) {
		Session session = sessionFactory.getCurrentSession();
		session.update(nhanvien);
		return false;
	}
	
	
}
