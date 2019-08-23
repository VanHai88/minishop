package com.nguyenvanhai.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.nguyenvanhai.daoimp.SanPhamImp;
import com.nguyenvanhai.entity.ChiTietHoaDon;
import com.nguyenvanhai.entity.ChiTietHoaDonId;
import com.nguyenvanhai.entity.ChiTietSanPham;
import com.nguyenvanhai.entity.SanPham;

@Repository //de spring hieu day la class DAO
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS) 
public class SanPhamDAO implements SanPhamImp {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<SanPham> LayDanhSachSanPhamLimit(int spBatDau, int spKetThuc, String tensp) {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> listSanPhams = new ArrayList<>();
		if(spBatDau < 0){
			listSanPhams = (List<SanPham>) session.createQuery("FROM sanpham").getResultList();
		}else{
			listSanPhams = (List<SanPham>) session.createQuery("FROM sanpham LIMIT")
					.setFirstResult(spBatDau).setMaxResults(spKetThuc).getResultList();
		}
		return listSanPhams;
	}

	@Override
	@Transactional
	public SanPham LayDanhSachChiTietSanPhamTheoMa(int masanpham) {
		Session session = sessionFactory.getCurrentSession();
		SanPham sanPham = (SanPham) session.createQuery("FROM sanpham WHERE masanpham="+masanpham).getSingleResult();
		
		return sanPham;
	}

	@Override
	@Transactional
	public List<SanPham> LayDanhSachSanPhamTheoDanhMuc(int madanhmuc) {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> listSanPhams = (List<SanPham>) session.createQuery("FROM sanpham WHERE madanhmuc="+madanhmuc).getResultList();
		
		return listSanPhams;
	}

	@Override
	@Transactional
	public boolean xoaSanPhamTheoMaSanPham(int masanpham) {
		Session session = sessionFactory.getCurrentSession();
		SanPham sanPham = session.get(SanPham.class, masanpham); // lay ra 1 san pham theo ma
		
		Set<ChiTietSanPham> chiTietSanPhams = sanPham.getChitietsanpham();
		for (ChiTietSanPham chiTietSanPham : chiTietSanPhams) {
			session.createQuery("DELETE chitiethoadon WHERE machitietsanpham ="+chiTietSanPham.getMachitietsanpham()).executeUpdate();
		}
		
		session.createQuery("DELETE chitietsanpham WHERE masanpham="+masanpham).executeUpdate();
		session.createQuery("DELETE sanpham WHERE masanpham ="+masanpham).executeUpdate();
		return false;
	}

	@Override
	@Transactional
	public boolean themSanPham(SanPham sanPham) {
		Session session = sessionFactory.getCurrentSession();
		int id = (int)session.save(sanPham);
		return false;
	}

	@Override
	@Transactional
	public boolean capNhatSanPham(SanPham sanPham) {
		Session session = sessionFactory.getCurrentSession();
		session.update(sanPham);
		return false;
	}

	@Override
	@Transactional
	public List<SanPham> timKiemSanPham(String tensp) {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> listSanPhams = (List<SanPham>) session.createQuery("FROM sanpham WHERE tensanpham LIKE '%"+tensp+"%'").getResultList();
		return listSanPhams;
	}

}
