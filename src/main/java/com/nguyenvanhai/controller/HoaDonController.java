package com.nguyenvanhai.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nguyenvanhai.entity.HoaDon;
import com.nguyenvanhai.entity.NhanVien;
import com.nguyenvanhai.service.HoaDonService;

@Controller
@RequestMapping("/hoadon")
public class HoaDonController {
	
	@Autowired
	HoaDonService hoaDonService;

	@GetMapping
	public String Default(ModelMap modelMap, HttpSession httpSession){
		NhanVien nhanVien = (NhanVien) httpSession.getAttribute("user");
		List<HoaDon> listHoadons = hoaDonService.LayDanhSachHoaDonLimit(0,5);
		List<HoaDon> allHoadons = hoaDonService.LayDanhSachHoaDonLimit(-1,0);
		double tongSoPage = Math.ceil((double)allHoadons.size() / 5);
		
		modelMap.addAttribute("listhoadon", listHoadons);
		modelMap.addAttribute("allhoadon", allHoadons);
		modelMap.addAttribute("tongsopage", tongSoPage);
		
		modelMap.addAttribute("nhanVien", nhanVien);
		
		return "hoadon";
	}
}
