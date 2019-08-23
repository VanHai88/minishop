package com.nguyenvanhai.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nguyenvanhai.entity.ChiTietHoaDon;
import com.nguyenvanhai.entity.ChiTietHoaDonId;
import com.nguyenvanhai.entity.GioHang;
import com.nguyenvanhai.entity.HoaDon;
import com.nguyenvanhai.service.ChiTietHoaDonService;
import com.nguyenvanhai.service.HoaDonService;

@Controller
@RequestMapping("giohang/")
@SessionAttributes("giohang")
public class GioHangController {
	
	@Autowired
	HoaDonService hoaDonService;
	
	@Autowired
	ChiTietHoaDonService chiTietHoaDonService;
	
	@GetMapping
	public String Default(HttpSession httpSession, ModelMap modelMap){
		
		if(httpSession.getAttribute("giohang") != null){
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			modelMap.addAttribute("soluongsanphamgiohang", gioHangs.size());
			
			modelMap.addAttribute("giohangs", gioHangs);
		}
		
		return "giohang";
	}
	
	@PostMapping
	public String ThemHoaDon(HttpSession httpSession ,@RequestParam String tenkhachhang, @RequestParam String sodt, @RequestParam String diachigiaohang, @RequestParam String hinhthucgiaohang, @RequestParam String ghichu){
		
		if(httpSession.getAttribute("giohang") != null){
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			
			HoaDon hoaDon = new HoaDon();
			hoaDon.setTenkhachhang(tenkhachhang);
			hoaDon.setSodt(sodt);
			hoaDon.setDiachigiaohang(diachigiaohang);
			hoaDon.setHinhthucgiaohang(hinhthucgiaohang);
			hoaDon.setGhichu(ghichu);
			
			int idHoaDon = hoaDonService.themHoaDon(hoaDon);
			
			if(idHoaDon > 0){
				Set<ChiTietHoaDon> listChiTietHoaDons = new HashSet<>();
				for (GioHang gioHang : gioHangs) {
					ChiTietHoaDonId chiTietHoaDonId = new ChiTietHoaDonId();
					chiTietHoaDonId.setMachitietsanpham(gioHang.getMachitiet());
					chiTietHoaDonId.setMahoadon(hoaDon.getMahoadon());
					
					ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
					chiTietHoaDon.setChiTietHoaDonId(chiTietHoaDonId);
					chiTietHoaDon.setGiatien(gioHang.getGiaTien().toString());
					chiTietHoaDon.setSoluong(gioHang.getSoLuong());
					
					chiTietHoaDonService.ThemChitietHoaDon(chiTietHoaDon);
				}
			}else{
				System.out.println("Them tc");
			}
			
		}
		
		return "giohang";
	}
}
