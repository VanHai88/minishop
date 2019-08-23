package com.nguyenvanhai.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nguyenvanhai.entity.DanhMucSanPham;
import com.nguyenvanhai.entity.SanPham;
import com.nguyenvanhai.service.DanhMucService;
import com.nguyenvanhai.service.SanPhamService;

@Controller
@RequestMapping("sanpham/")
public class SanPhamController {
	
	@Autowired
	DanhMucService danhMucService;
	
	@Autowired
	SanPhamService sanPhamService;
	
	@GetMapping("{id}/{tendanhmuc}")
	public String Default(ModelMap modelMap, @PathVariable int id, @PathVariable String tendanhmuc){
		List<DanhMucSanPham> listDanhMucs = danhMucService.layDanhMuc();
		modelMap.addAttribute("listDanhMucs", listDanhMucs);
		
		List<SanPham> listSanPhams = sanPhamService.LayDanhSachSanPhamTheoDanhMuc(id);
		modelMap.addAttribute("tendanhmuc", tendanhmuc);
		modelMap.addAttribute("listSanPham", listSanPhams);
		return "sanpham";
	}
}
