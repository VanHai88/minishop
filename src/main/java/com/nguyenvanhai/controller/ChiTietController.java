package com.nguyenvanhai.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nguyenvanhai.entity.DanhMucSanPham;
import com.nguyenvanhai.entity.GioHang;
import com.nguyenvanhai.entity.SanPham;
import com.nguyenvanhai.service.DanhMucService;
import com.nguyenvanhai.service.SanPhamService;

@Controller
@RequestMapping("/chitiet")
@SessionAttributes("giohang")
public class ChiTietController {
	
	@Autowired
	SanPhamService sanPhamService;
	
	@Autowired
	DanhMucService danhMucService;
	
	@GetMapping("/{masanpham}")
	public String Default(@PathVariable int masanpham, ModelMap modelMap, HttpSession httpSession){
		SanPham sanpham = sanPhamService.LayDanhSachChiTietSanPhamTheoMa(masanpham);
		modelMap.addAttribute("sanpham", sanpham);
		
		if(httpSession.getAttribute("giohang") != null){
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			modelMap.addAttribute("soluongsanphamgiohang", gioHangs.size());
		}
		
		List<DanhMucSanPham> listDanhMucs = danhMucService.layDanhMuc();
		modelMap.addAttribute("listDanhMucs", listDanhMucs);
		return "chitiet";
	}
	
	
	
}
