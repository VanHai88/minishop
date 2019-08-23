package com.nguyenvanhai.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nguyenvanhai.entity.DanhMucSanPham;
import com.nguyenvanhai.entity.MauSanPham;
import com.nguyenvanhai.entity.NhanVien;
import com.nguyenvanhai.entity.SanPham;
import com.nguyenvanhai.entity.SizeSanPham;
import com.nguyenvanhai.service.DanhMucService;
import com.nguyenvanhai.service.MauSanPhamService;
import com.nguyenvanhai.service.SanPhamService;
import com.nguyenvanhai.service.SizeSanPhamSevice;

@Controller
@RequestMapping("/themsanpham")
public class ThemSanPhamController {
	
	@Autowired
	SanPhamService sanPhamService;
	
	@Autowired
	DanhMucService danhMucService;
	
	@Autowired 
	SizeSanPhamSevice sizeSanPhamSevice;
	
	@Autowired
	MauSanPhamService mauSanPhamSevice;
	
	@GetMapping
	public String Default(ModelMap modelMap, HttpSession httpSession){
		NhanVien nhanVien = (NhanVien) httpSession.getAttribute("user");
		List<SanPham> listSanPhams = sanPhamService.LayDanhSachSanPhamLimit(0,5,"");
		List<SanPham> allSanPhams = sanPhamService.LayDanhSachSanPhamLimit(-1,0,"");
		List<DanhMucSanPham> listDanhMucs = danhMucService.layDanhMuc();
		List<SizeSanPham> listSizeSanPhams = sizeSanPhamSevice.layDanhSachSize();
		List<MauSanPham> listMauSanPhams = mauSanPhamSevice.layMauSanPham();
		
		double tongSoPage = Math.ceil((double)allSanPhams.size() / 5);
		
		modelMap.addAttribute("listSanPham", listSanPhams);
		modelMap.addAttribute("allsanpham", allSanPhams);
		modelMap.addAttribute("tongsopage", tongSoPage);
		modelMap.addAttribute("listDanhMucs", listDanhMucs);
		modelMap.addAttribute("listSizeSanPham", listSizeSanPhams);
		modelMap.addAttribute("listMauSanPham", listMauSanPhams);
		modelMap.addAttribute("nhanVien", nhanVien);
		return "themsanpham";
	}
}
