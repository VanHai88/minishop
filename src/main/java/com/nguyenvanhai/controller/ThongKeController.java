package com.nguyenvanhai.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nguyenvanhai.entity.NhanVien;

@Controller
@RequestMapping("thongke/")
@SessionAttributes("user")
public class ThongKeController {
	
	@GetMapping()
	public String Default(HttpSession session, ModelMap modelMap){
		NhanVien nhanVien = (NhanVien) session.getAttribute("user"); 
		int machucvu = nhanVien.getChucVu().getMachucvu();
		System.out.println("MCV: "+machucvu);
		System.out.println("NV: "+nhanVien.getManhanvien());
		modelMap.addAttribute("machucvu", machucvu);
		return "thongke";
	}
}
