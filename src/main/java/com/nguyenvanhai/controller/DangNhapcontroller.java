package com.nguyenvanhai.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nguyenvanhai.entity.ChucVu;
import com.nguyenvanhai.entity.NhanVien;
import com.nguyenvanhai.service.NhanVienService;
import com.nguyenvanhai.utils.MD5;

@Controller
@RequestMapping("dangnhap/")
@SessionAttributes("user")
public class DangNhapcontroller {
	
	@Autowired
	NhanVienService nhanVienService;
	
	@GetMapping
	public String Default(){
		
		return "dangnhap";
	}
	
	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = 
		    Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

	public static boolean validate(String emailStr) {
		 Matcher matcher = VALID_EMAIL_ADDRESS_REGEX .matcher(emailStr);
		 return matcher.find();
	}
	
	@PostMapping
	public String DangKy(@RequestParam String email, @RequestParam String matkhau, @RequestParam String nhaplaimatkhau, ModelMap modelMap){
		boolean ktmail = validate(email);
		if(ktmail){
			if(matkhau.equals(nhaplaimatkhau)){
				NhanVien nhanVien = new NhanVien();
				nhanVien.setEmail(email);
				nhanVien.setMatkhau(MD5.md5(matkhau));
				
				ChucVu chucVu = new ChucVu();
				chucVu.setMachucvu(3);
				nhanVien.setChucVu(chucVu);
				int ktThem = 0;
				boolean check = true;
				List<NhanVien> listNhanViens = nhanVienService.getAllNhanVien();
				for (NhanVien dsnhanVien : listNhanViens) {
					if(nhanVien.getEmail().equals(dsnhanVien.getEmail())){
						check = false;
					}
				}
				
				if(check){
					ktThem = nhanVienService.ThemNhanVien(nhanVien);
					NhanVien getnhanvien = nhanVienService.getNhanVien(ktThem);
					modelMap.addAttribute("user", getnhanvien);
					if(ktThem > 0 ){
						modelMap.addAttribute("kiemtradangnhap", "Tạo Tài Khoản Thành Công");
					}else{
						modelMap.addAttribute("kiemtradangnhap", "Tạo Tài Khoản Thất Bại");
					}
				}else{
					modelMap.addAttribute("kiemtradangnhap", "Email Đã Tồn Tại");
				}
			
			}else{
				modelMap.addAttribute("kiemtradangnhap", "Mật Khẩu Không Trùng Khớp");
			}
		}else{
			modelMap.addAttribute("kiemtradangnhap", "Vui Lòng Nhập Đúng Định Dạng Email");
		}
		return "dangnhap";
	}
	
}
