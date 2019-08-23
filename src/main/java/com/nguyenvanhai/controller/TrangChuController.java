package com.nguyenvanhai.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.nguyenvanhai.entity.ChucVu;
import com.nguyenvanhai.entity.DanhMucSanPham;
import com.nguyenvanhai.entity.NhanVien;
import com.nguyenvanhai.entity.SanPham;
import com.nguyenvanhai.entity.Student;
import com.nguyenvanhai.service.DanhMucService;
import com.nguyenvanhai.service.NhanVienService;
import com.nguyenvanhai.service.SanPhamService;

@Controller
public class TrangChuController {
	
	@Autowired
	SanPhamService sanPhamService;
	
	@Autowired
	DanhMucService danhMucService;
	
	@Autowired
	NhanVienService nhanVienService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	@Transactional
	public ModelAndView Default(ModelMap modelMap, HttpSession httpSession, @ModelAttribute("SpringWeb")SanPham sanpham){
		System.out.println("asdsadasdasdasdsadsadsadsadsad");
		System.out.println("sanphan: "+sanpham.getTensanpham());
		if(httpSession.getAttribute("user") != null){
			NhanVien nhanVien = (NhanVien) httpSession.getAttribute("user");
			String kyTuDau = nhanVien.getEmail().toString().substring(0, 1);
			modelMap.addAttribute("avatar", kyTuDau);
			modelMap.addAttribute("chucvu", nhanVien.getChucVu().getMachucvu());
			modelMap.addAttribute("nhanvien", nhanVien);
		}else{
			
		}
		
		List<SanPham> allSanPhams =null;
		List<SanPham> listSanPhams = null;
		if(sanpham.getTensanpham() == null || sanpham.getTensanpham().equals("")){
			listSanPhams = sanPhamService.LayDanhSachSanPhamLimit(0, 12,"");
			allSanPhams = sanPhamService.LayDanhSachSanPhamLimit(-1, 0,"");
			modelMap.addAttribute("listSanPham", listSanPhams);
			System.out.println("vao a!!");
		}else{
			listSanPhams = sanPhamService.LayDanhSachSanPhamLimit(0, 12,sanpham.getTensanpham());
			allSanPhams = sanPhamService.timKiemSanPham(sanpham.getTensanpham());
			modelMap.addAttribute("listSanPham", allSanPhams);
			System.out.println("vao b!!");
		}
		
		for (SanPham sanPham2 : allSanPhams) {
			System.out.println("List san phan: "+sanPham2.getTensanpham());
		}
		List<DanhMucSanPham> listDanhMucs = danhMucService.layDanhMuc();
		
		double tongSoPage = Math.ceil((double)allSanPhams.size() / 12);
		
		
		modelMap.addAttribute("listDanhMucs", listDanhMucs);
		modelMap.addAttribute("allsanpham", allSanPhams);
		modelMap.addAttribute("tongsopage", tongSoPage);
		
		return new ModelAndView("trangchu", "command", new SanPham());
	}
	
	

}
