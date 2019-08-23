package com.nguyenvanhai.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nguyenvanhai.entity.NhanVien;
import com.nguyenvanhai.service.NhanVienService;

@Controller
@RequestMapping("taikhoan/")
public class TaiKhoanController {
	
	@Autowired
	NhanVienService nhanVienService;
	
	@GetMapping
	public String Default(ModelMap modelMap, HttpSession httpSession){
		NhanVien nhanVien = (NhanVien) httpSession.getAttribute("user");
		int manhanvien = nhanVien.getManhanvien();
	
		boolean gioitinh = nhanVien.getGioitinh();
		//String hinhAnh = nhanVien.getHinhanh();
		
		if(gioitinh){
			modelMap.addAttribute("gioitinh", "Nam");
		}else{
			modelMap.addAttribute("gioitinh", "Nữ");
		}
		
		modelMap.addAttribute("nhanVien", nhanVien);
		return "taikhoan";
	}
}
