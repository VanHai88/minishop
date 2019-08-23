$(document).ready(function(){ //$(document).ready(function() khi nao page dc load
	
	var masanpham = 0;
	var manhanvien = 0;
	
	$("#cot1").click(function(){
		var chuoi = $("#cot1").attr("data-text");
		alert(chuoi);
	});
	
	$("#btnDangNhap").click(function(){
		var ten = $("#email").val();
		var password = $("#matkhau").val();
		$.ajax({
			url: "/minishop/api/KiemTraDangNhap",
			type: "GET",
			data: {
				email: ten,
				matkhau: password
			},
			success: function(value) {
				if(value == "true"){
					duongdanhientai = window.location.href;
					duongdan = duongdanhientai.replace("dangnhap/","")
					window.location = duongdan;
				}else{
					$("#ketqua").text("Dang Nhap That Bai!")
				}
			}
		})
	});
	
	$("#dangky").click(function() {
		$(this).addClass("actived");
		$("#dangnhap").removeClass("actived");
		$(".container-login-form").hide();
		$(".container-signup-form").show();
	});
	
	$("#dangnhap").click(function() {
		$(this).addClass("actived");
		$("#dangky").removeClass("actived");
		$(".container-login-form").show();
		$(".container-signup-form").hide();
	});
	
	$(".btn-giohang").click(function(){
		var machitiet = $(this).attr("data-machitiet");
		var mamau = $(this).closest("tr").find(".mau").attr("data-mamau");
		var tenmau = $(this).closest("tr").find(".mau").text();
		var masize = $(this).closest("tr").find(".size").attr("data-masize");
		var tensize = $(this).closest("tr").find(".size").text();
		var soluong = $(this).closest("tr").find(".soluong").text();
		var tensp = $("#tensp").text();
		var masp = $("#tensp").attr("data-masp");
		var giatien = $("#giatien").attr("data-value");
		
		$.ajax({
			url: "/minishop/api/ThemGioHang",
			type: "GET",
			data: {
				masp:masp,
				maSize:masize,
				maMau:mamau,
				tenSP:tensp,
				giaTien:giatien,
				tenMau:tenmau,
				tenSize:tensize,
				soLuong:soluong,
				machitiet:machitiet
			},
			success: function(value) {
				$("#giohang").find("div").addClass("circle-giohang");
				$("#giohang").find("div").html("<span>"+value+"</span>");
			}
		  })
		/*}).done(function() { // khi ma ajax tren thuc hien xong viec them gio hang
			$.ajax({
				url: "/minishop/api/laySoLuongGioHang",
				type: "GET",
				success: function(value) { // value ket qua tra ve cua ham laySoLuongGioHang
					$("#giohang").find("div").addClass("circle-giohang");
					$("#giohang").find("div").html("<span>"+value+"</span>");
				}
			})
		});*/
	});
	
	ganTongTienGioHang();
	
	function ganTongTienGioHang(isEventChange) {
		var tongtiensp = 0;
		$(".giatien").each(function() { //each vong lap for, duyet cac class co ten la giatien
			var giatien = $(this).attr("data-value");
			var soluong = $(this).closest("tr").find(".soluong-giohang").val();
			var tongtien = soluong * parseFloat(giatien);
			
			var format =  parseFloat(tongtien).toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString()
			if(!isEventChange){
				$(this).html(format);
			}
			
			tongtiensp = tongtiensp + tongtien;
			var formatTongTien =  tongtiensp.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString()
			$("#tongtien").html(formatTongTien+"")
		})
	}
	
	$(".soluong-giohang").change(function() {
		var soluong = $(this).val(); //lay ra value ben html
		var giatien = $(this).closest("tr").find(".giatien").attr("data-value"); // attr lay ra gia tri t du dinh ngia
		var tongtien = soluong * parseInt(giatien); //parseInt dua ve kieu so
		var format =  tongtien.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString()
		
		$(this).closest("tr").find(".giatien").html(format);
		ganTongTienGioHang(true);
		
		var mamau = $(this).closest("tr").find(".mau").attr("data-mamau");
		var masize = $(this).closest("tr").find(".size").attr("data-masize");
		var masp = $(this).closest("tr").find(".tensp").attr("data-masp");
		
		$.ajax({
			url: "/minishop/api/CapNhatGioHang",
			type: "GET",
			data: {
				maSp:masp,
				maSize:masize,
				maMau:mamau,
				soLuong:soluong
			},
			success: function(value) {
				
			}
		  })
	})
	
	$(".xoa-giohang").click(function() {
		var self = $(this)
		var mamau = $(this).closest("tr").find(".mau").attr("data-mamau");
		var masize = $(this).closest("tr").find(".size").attr("data-masize");
		var masp = $(this).closest("tr").find(".tensp").attr("data-masp");
		
		$.ajax({
			url: "/minishop/api/xoaGioHang",
			type: "GET",
			data: {
				maSp:masp,
				maSize:masize,
				maMau:mamau,
			},
			success: function(value) {
				self.closest("tr").remove();
				ganTongTienGioHang(true);
			}
		  })
	})
	
	$("body").on("click",".pagin-item",function(){ //vi nhung code jquery phat sinh sau se khong an su kien click luc ban dau nen ta dung on!!
		$(".pagin-item").removeClass("active");
		$(this).addClass("active");
		var sotrang = $(this).text();
		var spbatdau = (sotrang - 1) * 5;
		
		$.ajax({
			url: "/minishop/api/laySanPhamLimit",
			type: "GET",
			data: {
				spbatdau:spbatdau
			},
			success: function(value) {
				var tbodysanpham = $("#table-sanpham").find("tbody");
				tbodysanpham.empty();// xoa toan bo noi dung trong tbody
				tbodysanpham.append(value);
			}
		  })
	})
	
	$("body").on("click",".pagin-item",function(){
		$(".pagin-item").removeClass("active");
		$(this).addClass("active");
		var sotrang = $(this).text();
		var spbatdau = (sotrang - 1) * 12;
		
		$.ajax({
			url: "/minishop/api/laySanPhamLimitTrangChu",
			type: "GET",
			data: {
				spbatdau:spbatdau
			},
			success: function(value) {
				var tbodysanpham = $(".sptrangchu");
				tbodysanpham.empty();// xoa toan bo noi dung trong tbody
				tbodysanpham.append(value);
			}
		  })
	})
	
	
	$("#bt-timkiem").click(function() {
		tensp = $("#timkiem").val();
		$.ajax({
			url: "/minishop/",
			type: "POST",
			data: {
				tensp:tensp
			},
			success: function(value) {
//				var tbodysanpham = $(".sptrangchu");
//				tbodysanpham.empty();// xoa toan bo noi dung trong tbody
//				tbodysanpham.append(value);
			}
		  })
	})
	
	$("#checkall").change(function() {
		if(this.checked){
			$("#table-sanpham input").each(function() {
				$(this).attr('checked',true);
			})
		}else{
			$("#table-sanpham input").each(function() {
				$(this).attr('checked',false);
			})
		}
	})
	
	$("#xoa-sanpham").click(function() {
		$("#table-sanpham > tbody input:checked").each(function() {
			var masanpham = $(this).val();
			var This = $(this);
			
			$.ajax({
				url: "/minishop/api/xoaSanPham",
				type: "GET",
				data: {
					masp:masanpham
				},
				success: function(value) {
					This.closest("tr").remove();
				}
			  })
		})
	})
	
	var files = [];
	var tenhinh = "";
	$("#hinhanh").change(function(event) {
		var files = event.target.files;
		tenhinh = files[0].name;
		forms = new FormData();
		forms.append("file", files[0]);
		$.ajax({
			url: "/minishop/api/uploadFile",
			type: "POST",
			data:forms,
			contentType:false, // da ma hoi roi nen contentType bo luon
			processData:false, // khong su ly date nua
			enctype:"multipart/form-data", //ma hoa file
			success: function(value) {
			}
		  })
	})
	
	$("body").on("click",".btn-chitiet",function(){
		$(this).remove();
		var chiTietClone = $("#chitietsanpham").clone().removeAttr("id");
		$("#containerchitietsanpham").append(chiTietClone);
	})
	
	$("#btnThemSanPham").click(function(event) {
		event.preventDefault();
		var formdata = $("#form-data").serializeArray();//serializeArray() cho phep lay tat ca gia tri cua the form
		json = {};
		arrayChiTiet = [];
		$.each(formdata, function(i, field){
		   json[field.name] = field.value;
		 });
		
		$("#containerchitietsanpham > .chitietsanpham").each(function() {
			objectChiTiet = {};
			mausp = $(this).find("#mausanpham").val();
			sizesp = $(this).find("#sizesanpham").val();
			soluong = $(this).find("#soluong").val();
			objectChiTiet["mausanpham"] = mausp;
			objectChiTiet["sizesanpham"] = sizesp;
			objectChiTiet["soluong"] = soluong;
			arrayChiTiet.push(objectChiTiet);
		})
		
		json["chitietsanpham"] = arrayChiTiet;
		json["hinhsanpham"] = tenhinh;
		console.log(json)
		$.ajax({
			url: "/minishop/api/themsanpham",
			type: "POST",
			data:{
				dataJson: JSON.stringify(json),// convert doi tuong json sang String
			},
			success: function(value) {
			}
		  })
	})
	
	$("#btnCapNhatSanPham").click(function(event) {
		event.preventDefault();
		var formdata = $("#form-data").serializeArray();//serializeArray() cho phep lay tat ca gia tri cua the form
		json = {};
		arrayChiTiet = [];
		$.each(formdata, function(i, field){
		   json[field.name] = field.value;
		 });
		
		$("#containerchitietsanpham > .chitietsanpham").each(function() {
			objectChiTiet = {};
			mausp = $(this).find("#mausanpham").val();
			sizesp = $(this).find("#sizesanpham").val();
			soluong = $(this).find("#soluong").val();
			objectChiTiet["mausanpham"] = mausp;
			objectChiTiet["sizesanpham"] = sizesp;
			objectChiTiet["soluong"] = soluong;
			arrayChiTiet.push(objectChiTiet);
		})
		
		json["masanpham"] = masanpham;
		json["chitietsanpham"] = arrayChiTiet;
		json["hinhsanpham"] = tenhinh;
		console.log(json)
		$.ajax({
			url: "/minishop/api/capnhatsanpham",
			type: "POST",
			data:{
				dataJson: JSON.stringify(json),// convert doi tuong json sang String
			},
			success: function(value) {
			}
		  })
	})
	
	$("body").on("click",".capnhatsanpham",function(){
		masanpham = $(this).attr("data-id");
		
		$("#btnCapNhatSanPham").removeClass("hidden");
		$("#btnThoat").removeClass("hidden");
		$("#btnThemSanPham").addClass("hidden")
		$.ajax({
			url: "/minishop/api/layDanhSachSanPhamTheoMa",
			type: "GET",
			data: {
				masanpham:masanpham
			},
			success: function(value) {
				console.log(value);
				$("#tensanpham").val(value.tensanpham);
				$("#giatien").val(value.giatien);
				$("#mota").val(value.mota);
				$("#danhmucsanpham").val(value.danhmucsanpham.madanhmuc)
				if(value.gianhcho === "nam"){
					$("#rd-nam").prop('checked',true);
				}else{
					$("#rd-nu").prop('checked',true);
				}
				
				$("#containerchitietsanpham").empty();
				
				var countchitiet = value.chitietsanpham.length;
				for(i = 0; i < countchitiet; i++){
					
					var chiTietClone = $("#chitietsanpham").clone().removeAttr("id");
					if(i < countchitiet - 1){
						chiTietClone.find(".btn-chitiet").remove();
					}
					
					chiTietClone.find("#mausanpham").val(value.chitietsanpham[i].mausanpham.mamau);
					chiTietClone.find("#sizesanpham").val(value.chitietsanpham[i].sizesanpham.masize);
					chiTietClone.find("#soluong").val(value.chitietsanpham[i].soluong);
					
					$("#containerchitietsanpham").append(chiTietClone);
				}
			}
		  })
		
	})
	
	$("#btnsua-taikhoan").click(function() {
		$("#form-taikhoan").removeClass("hidden")
		$("#page-taikhoan").addClass("hidden");
		manhanvien = $(this).attr("data-id");
		$.ajax({
			url: "/minishop/api/laytaikhoan",
			type: "GET",
			data: {
			},
			success: function(value) {
				console.log(value);
				$("#hoten").val(value.hoten);
				$("#diachi").val(value.diachi);
				if(value.gioitinh){
					$("#rd-nam").prop('checked',true);
				}else{
					$("#rd-nu").prop('checked',true);
				}
				$("#cmnd").val(value.cmnd);
				$("#email").val(value.email);
				$("#matkhau").val(value.matkhau);
				}
		  })
		
	})
	
	$(("#btnthoat-taikhoan")).click(function() {
		$("#form-taikhoan").addClass("hidden")
		$("#page-taikhoan").removeClass("hidden");
	})
	
	$("#btncapnhat-taikhoan").click(function(event) {
		machucvu = $("#machucvu").text();
		event.preventDefault();
		var formdata = $("#form-taikhoan").serializeArray();//serializeArray() cho phep lay tat ca gia tri cua the form
		json = {};
		arrayChiTiet = [];
		$.each(formdata, function(i, field){
		   json[field.name] = field.value;
		 });
		json["manhanvien"] = manhanvien;
		json["hinhanh"] = tenhinh;
		json["machucvu"] = machucvu;
		console.log(json)
		$.ajax({
			url: "/minishop/api/capnhattaikhoan",
			type: "POST",
			data:{
				dataJson: JSON.stringify(json),// convert doi tuong json sang String
			},
			success: function(value) {
				
			}
		  })
	})
	
	$("#bt-timkiem").click(function() {
		$(".pagination").css("display","none");
	})
	
})