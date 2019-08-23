package com.nguyenvanhai.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nguyenvanhai.entity.ChiTietSanPham;
import com.nguyenvanhai.entity.ChucVu;
import com.nguyenvanhai.entity.DanhMucSanPham;
import com.nguyenvanhai.entity.GioHang;
import com.nguyenvanhai.entity.JsonSanPham;
import com.nguyenvanhai.entity.MauSanPham;
import com.nguyenvanhai.entity.NhanVien;
import com.nguyenvanhai.entity.SanPham;
import com.nguyenvanhai.entity.SizeSanPham;
import com.nguyenvanhai.service.NhanVienService;
import com.nguyenvanhai.service.SanPhamService;
import com.nguyenvanhai.utils.MD5;

@Controller
@RequestMapping("api/")
@SessionAttributes({"giohang"})
public class ApiController {
	@Autowired
	NhanVienService nhanVienService;
	
	@Autowired
	SanPhamService sanPhamService;
	
	@GetMapping("KiemTraDangNhap")
	@ResponseBody
	public String kiemtradangnhap(HttpServletRequest request, @RequestParam String email, @RequestParam String matkhau, ModelMap modelMap){
		HttpSession session = request.getSession();
		NhanVien nhanVien = nhanVienService.kiemtradangnhap(email, MD5.md5(matkhau));
		
		boolean kiemtra = true;
		if(nhanVien != null){
			session.setAttribute("user", nhanVien);
		}else{
			kiemtra = false;
			System.out.println("kiemtra: "+nhanVien);
		}
		return ""+kiemtra;
	}
	
	@GetMapping("ktDangXuat")
	@ResponseBody
	public String DangXuat(){
		boolean kiemtra = true;
		return ""+kiemtra;
	}
	@GetMapping("CapNhatGioHang")
	@ResponseBody
	private void CapNhatGioHang(HttpSession httpSession,@RequestParam int soLuong,@RequestParam int maSp,@RequestParam int maSize,@RequestParam int maMau){
		List<GioHang> listGioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
		int vitri = KiemTraSanPhamDaTonTaiGioHang(httpSession, maSp, maSize, maMau);
		listGioHangs.get(vitri).setSoLuong(soLuong);
	}
	
	@GetMapping("xoaGioHang")
	@ResponseBody
	private void xoaGioHang(HttpSession httpSession, @RequestParam int maSp, @RequestParam int maSize, @RequestParam int maMau){
		List<GioHang> listGioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
		int vitri = KiemTraSanPhamDaTonTaiGioHang(httpSession, maSp, maSize, maMau);
		listGioHangs.remove(vitri);
	}
	
	@GetMapping("ThemGioHang")
	@ResponseBody
	public String ThemGioHang(@ModelAttribute GioHang gioHang, HttpSession httpSession){
		gioHang.setSoLuong(1);
		if(httpSession.getAttribute("giohang") == null){
			List<GioHang> gioHangs = new ArrayList<>();
			gioHangs.add(gioHang);
			httpSession.setAttribute("giohang", gioHangs);
			return gioHangs.size()+"";
		}else{
			List<GioHang> listGioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			int masp = gioHang.getMasp();
			int masize = gioHang.getMaSize();
			int mamau = gioHang.getMaMau();
			int vitri = KiemTraSanPhamDaTonTaiGioHang(httpSession, masp, masize, mamau);
			if(vitri == -1){
				listGioHangs.add(gioHang);
			}else{
				int soluongmoi = listGioHangs.get(vitri).getSoLuong()+1;
				listGioHangs.get(vitri).setSoLuong(soluongmoi);
			}
			return listGioHangs.size()+"";
		}
	}
	
	private int KiemTraSanPhamDaTonTaiGioHang(HttpSession httpSession, int masp, int masize, int mamau){
		List<GioHang> listGioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
		for (int i = 0; i < listGioHangs.size(); i++) {
			if(listGioHangs.get(i).getMasp() == masp && listGioHangs.get(i).getMaMau() == mamau && listGioHangs.get(i).getMaSize() == masize){
				return i;
			}
		}
		return -1;
	}
	
	/*@GetMapping("laySoLuongGioHang")
	@ResponseBody
	public String laySoLuongGioHang(HttpSession httpSession){
		if(httpSession.getAttribute("giohang") != null){
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			return gioHangs.size()+"";
		}
		return "";
	}*/
	
	@GetMapping(path="laySanPhamLimit", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String laySanPhamLimit(@RequestParam int spbatdau){
		String html = "";
		
		List<SanPham> listSanPhams = sanPhamService.LayDanhSachSanPhamLimit(spbatdau,5,"");
		for (SanPham sanPham : listSanPhams) {
			html += "<tr>";
			html += "<td><div class='checkbox'><label><input class='checkboxsanpham' type='checkbox' value='"+sanPham.getMasanpham() +"'></label></div></td>";
			html += "<td class='tensp' data-masp='"+sanPham.getMasanpham() +"'> "+sanPham.getTensanpham()+"</td>";
			html += "<td class='giatien'>"+sanPham.getGiatien()+"</td>";
			html += "<td class='gianhcho'>"+sanPham.getGianhcho()+"</td>";
			html += "<td style='color: white;' class=' btn btn-warning capnhatsanpham' data-id="+sanPham.getMasanpham()+">Sửa</td>";
			html += "</tr>";
		}
		
		return html;
	}
	
	@GetMapping(path="laySanPhamLimitTrangChu", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String laySanPhamLimitTrangChu(@RequestParam int spbatdau){
		String html = "";
		
		List<SanPham> listSanPhams = sanPhamService.LayDanhSachSanPhamLimit(spbatdau,12,"");
		for (SanPham sanPham : listSanPhams) { 		
			html += "<div class='col-sm-6 col-md-3'>";
			html +=	"<div class='product'>";
			html +=	"<div class='sanpham wow zoomIn'>";
			html += "		<p style='text-align:center;margin-top:20px;'> <img style='width: 100%' src='/minishop/resources/Image/sanpham/"+sanPham.getHinhsanpham()+"'> </p>"; 
			html +=	"	<div class='caption'>"; 
			html +=	"	<div class='blur'></div> ";
			html +=	"	<div class='caption-text'>";
			html +=	"		<h4 id='textten'>"+sanPham.getTensanpham()+"</h4> ";
			html +=	"		<p style='font-size: 18px'>"+sanPham.getGiatien()+" VNĐ</p>";
			html +=	"		<p id='textmota'>"+sanPham.getMota()+"</p> ";
			html +=	"		<a class='btn btn-default' href='chitiet/"+sanPham.getMasanpham()+"'><span class='glyphicon fa fa-shopping-bag'> Mua</span></a>"; 	
			html +=	 "	</div>";
			html +=	"	</div>";
			html +=	"	</div>";		
			html += "</div>";
			html += "</div>";
		}
		
		return html;
	}
	
	@GetMapping(path="timKiemSanPham", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String timKiemSanPham(@RequestParam String tensp){
		/*String html = "";
		
		List<SanPham> listSanPhams = sanPhamService.timKiemSanPham(tensp);
		for (SanPham sanPham : listSanPhams) { 		
			html += "<div class='col-sm-6 col-md-3'>";
			html +=	"<div class='product'>";
			html +=	"<div class='sanpham wow zoomIn'>";
			html += "		<p style='text-align:center;margin-top:20px;'> <img style='width: 100%' src='/minishop/resources/Image/sanpham/"+sanPham.getHinhsanpham()+"'> </p>"; 
			html +=	"	<div class='caption'>"; 
			html +=	"	<div class='blur'></div> ";
			html +=	"	<div class='caption-text'>";
			html +=	"		<h4 id='textten'>"+sanPham.getTensanpham()+"</h4> ";
			html +=	"		<p style='font-size: 18px'>"+sanPham.getGiatien()+" VNĐ</p>";
			html +=	"		<p id='textmota'>"+sanPham.getMota()+"</p> ";
			html +=	"		<a class='btn btn-default' href='chitiet/"+sanPham.getMasanpham()+"'><span class='glyphicon fa fa-shopping-bag'> Mua</span></a>"; 	
			html +=	 "	</div>";
			html +=	"	</div>";
			html +=	"	</div>";		
			html += "</div>";
			html += "</div>";
		}*/
		
		return tensp;
	}
	
	@GetMapping("xoaSanPham")
	@ResponseBody
	public String xoaSanPhamTheoMaSanPham(@RequestParam int masp){
		sanPhamService.xoaSanPhamTheoMaSanPham(masp);
		return "true";
	}
	
	@Autowired
	ServletContext context;
	
	@PostMapping("uploadFile")
	@ResponseBody
	public String uploadFile(MultipartHttpServletRequest request){
		String pathSaveFile = context.getRealPath("/resources/Image/sanpham/");
		Iterator<String> listName = request.getFileNames(); // lay ra tat ca file name ma nguoi dung load tren sever
		MultipartFile mpf = request.getFile(listName.next()); // lay file
		
		File SaveFile = new File(pathSaveFile + mpf.getOriginalFilename()); // lay dc ca duoi file
		try {
			mpf.transferTo(SaveFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("duong dan: "+pathSaveFile);
		return "true";
	}
	
	@PostMapping("themsanpham")
	@ResponseBody
	public void themSanPham(@RequestParam String dataJson){
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonObject;
		
		try {
			SanPham sanPham = new SanPham();
			jsonObject = objectMapper.readTree(dataJson);
			
			DanhMucSanPham danhMucSanPham = new DanhMucSanPham();
			danhMucSanPham.setMadanhmuc(jsonObject.get("danhmucsanpham").asInt());
			
			JsonNode jsonChiTiet = jsonObject.get("chitietsanpham");
			Set<ChiTietSanPham> listChiTiet = new HashSet<>();
			for (JsonNode objectChiTiet : jsonChiTiet) {
				MauSanPham mauSanPham = new MauSanPham();
				mauSanPham.setMamau(objectChiTiet.get("mausanpham").asInt());
				
				SizeSanPham sizesanpham = new SizeSanPham();
				sizesanpham.setMasize(objectChiTiet.get("sizesanpham").asInt());
				
				ChiTietSanPham chiTietSanPham = new ChiTietSanPham();
				chiTietSanPham.setMausanpham(mauSanPham);
				chiTietSanPham.setSizesanpham(sizesanpham);
				chiTietSanPham.setSoluong(objectChiTiet.get("soluong").asInt());
				System.out.println("Mact: "+chiTietSanPham.getMachitietsanpham());
				listChiTiet.add(chiTietSanPham);
			}
			
			String tensanpham = jsonObject.get("tensanpham").asText();
			String giatien = jsonObject.get("giatien").asText();
			String mota = jsonObject.get("mota").asText();
			String hinhsanpham = jsonObject.get("hinhsanpham").asText();
			String gianhcho = jsonObject.get("gianhcho").asText();
			
			System.out.println("size: "+listChiTiet.size());
			sanPham.setChitietsanpham(listChiTiet);
			sanPham.setDanhmucsanpham(danhMucSanPham);
			sanPham.setTensanpham(tensanpham);
			sanPham.setGiatien(giatien);
			sanPham.setMota(mota);
			sanPham.setHinhsanpham(hinhsanpham);
			sanPham.setGianhcho(gianhcho);
			sanPhamService.themSanPham(sanPham);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@PostMapping("capnhatsanpham")
	@ResponseBody
	public void capNhatSanPham(@RequestParam String dataJson){
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonObject;
		
		try {
			SanPham sanPham = new SanPham();
			jsonObject = objectMapper.readTree(dataJson);
			
			DanhMucSanPham danhMucSanPham = new DanhMucSanPham();
			danhMucSanPham.setMadanhmuc(jsonObject.get("danhmucsanpham").asInt());
			
			JsonNode jsonChiTiet = jsonObject.get("chitietsanpham");
			Set<ChiTietSanPham> listChiTiet = new HashSet<>();
			for (JsonNode objectChiTiet : jsonChiTiet) {
				MauSanPham mauSanPham = new MauSanPham();
				mauSanPham.setMamau(objectChiTiet.get("mausanpham").asInt());
				
				SizeSanPham sizesanpham = new SizeSanPham();
				sizesanpham.setMasize(objectChiTiet.get("sizesanpham").asInt());
				
				ChiTietSanPham chiTietSanPham = new ChiTietSanPham();
				chiTietSanPham.setMausanpham(mauSanPham);
				chiTietSanPham.setSizesanpham(sizesanpham);
				chiTietSanPham.setSoluong(objectChiTiet.get("soluong").asInt());
				System.out.println("Mact: "+chiTietSanPham.getMachitietsanpham());
				listChiTiet.add(chiTietSanPham);
			}
			
			String tensanpham = jsonObject.get("tensanpham").asText();
			String giatien = jsonObject.get("giatien").asText();
			String mota = jsonObject.get("mota").asText();
			String hinhsanpham = jsonObject.get("hinhsanpham").asText();
			String gianhcho = jsonObject.get("gianhcho").asText();
			int masanpham = jsonObject.get("masanpham").asInt();
			
			System.out.println("size: "+listChiTiet.size());
			sanPham.setChitietsanpham(listChiTiet);
			sanPham.setDanhmucsanpham(danhMucSanPham);
			sanPham.setTensanpham(tensanpham);
			sanPham.setGiatien(giatien);
			sanPham.setMota(mota);
			sanPham.setHinhsanpham(hinhsanpham);
			sanPham.setGianhcho(gianhcho);
			sanPham.setMasanpham(masanpham);
			sanPhamService.capNhatSanPham(sanPham);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@GetMapping(path="layDanhSachSanPhamTheoMa", produces="application/json; charset=utf-8")
	@ResponseBody
	public JsonSanPham layDanhSachSanPhamTheoMa(@RequestParam int masanpham){
		JsonSanPham jsonSanPham = new JsonSanPham();
		SanPham sanPham = sanPhamService.LayDanhSachChiTietSanPhamTheoMa(masanpham);
		
		jsonSanPham.setMasanpham(sanPham.getMasanpham());
		jsonSanPham.setTensanpham(sanPham.getTensanpham());
		jsonSanPham.setGiatien(sanPham.getGiatien());
		jsonSanPham.setMota(sanPham.getMota());
		jsonSanPham.setHinhsanpham(sanPham.getHinhsanpham());
		jsonSanPham.setGianhcho(sanPham.getGianhcho());
		
		Set<ChiTietSanPham> chiTietSanPhams = new HashSet<>();
		for(ChiTietSanPham value : sanPham.getChitietsanpham()){
			ChiTietSanPham chiTietSanPham = new ChiTietSanPham();
			chiTietSanPham.setMachitietsanpham(value.getMachitietsanpham());
			
			MauSanPham mausanpham = new MauSanPham();
			mausanpham.setMamau(value.getMausanpham().getMamau());
			mausanpham.setTenmau(value.getMausanpham().getTenmau());
			chiTietSanPham.setMausanpham(mausanpham);
			
			SizeSanPham sizesanpham = new SizeSanPham();
			sizesanpham.setMasize(value.getSizesanpham().getMasize());
			sizesanpham.setSize(value.getSizesanpham().getSize());
			chiTietSanPham.setSizesanpham(sizesanpham);
			chiTietSanPham.setSoluong(value.getSoluong());
			chiTietSanPhams.add(chiTietSanPham);
		}
		
		DanhMucSanPham danhMucSanPham = new DanhMucSanPham();
		danhMucSanPham.setMadanhmuc(sanPham.getDanhmucsanpham().getMadanhmuc());
		danhMucSanPham.setTendanhmuc(sanPham.getDanhmucsanpham().getTendanhmuc());
		
		jsonSanPham.setDanhmucsanpham(danhMucSanPham);
		jsonSanPham.setChitietsanpham(chiTietSanPhams);
		
		return jsonSanPham;
	}
	
	@GetMapping("laytaikhoan")
	@ResponseBody
	public NhanVien layTaiKhoan(HttpSession httpSession){
		NhanVien nhanVien = (NhanVien) httpSession.getAttribute("user");
		return nhanVien;
	}
	
	@PostMapping("capnhattaikhoan")
	@ResponseBody
	public void capNhatTaiKhoan(@RequestParam String dataJson, HttpSession httpSession){
		NhanVien nhanVien = (NhanVien) httpSession.getAttribute("user");
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonObject;
		
		try {
			NhanVien nhanvien = new NhanVien();
			jsonObject = objectMapper.readTree(dataJson);
			
			String hoten = jsonObject.get("hoten").asText();
			System.out.println("HO TEN: "+hoten);
			String diachi = jsonObject.get("diachi").asText();
			String gioitinh = jsonObject.get("gioitinh").asText();
			String cmnd = jsonObject.get("cmnd").asText();
			String email = jsonObject.get("email").asText();
			int manhanvien = jsonObject.get("manhanvien").asInt();
			//String tenchucvu = jsonObject.get("tenchucvu").asText();
			String matkhau = jsonObject.get("matkhau").asText();
			System.out.println("ho ten: "+hoten);
			String hinhanh = jsonObject.get("hinhanh").asText();
			
			if(gioitinh.equals("nam")){
				nhanvien.setGioitinh(true);
			}else{
				nhanvien.setGioitinh(false);
			}
			System.out.println("ho ten1: "+hoten);
			System.out.println("HINH ANH: "+hinhanh);
			nhanvien.setHoten(hoten);
			nhanvien.setDiachi(diachi);
			nhanvien.setCmnd(cmnd);
			nhanvien.setEmail(email);
			nhanvien.setMatkhau(matkhau);
			
			ChucVu chucVu = new ChucVu();
			chucVu.setMachucvu(nhanVien.getChucVu().getMachucvu());
			chucVu.setTenchucvu(nhanVien.getChucVu().getTenchucvu());
			nhanvien.setChucVu(chucVu);
			nhanvien.setManhanvien(manhanvien);
			if(!hinhanh.equals("")){
				nhanvien.setHinhanh(hinhanh);
			}else{
				nhanvien.setHinhanh(nhanVien.getHinhanh());
			}
			nhanVienService.capNhatNhanVien(nhanvien);
			httpSession.setAttribute("user", nhanvien);
			System.out.println("Hinh Anh Nhan Vien: "+nhanvien.getHinhanh());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
