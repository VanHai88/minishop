<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE HTML>
<html>
<head>
<title>Pooled Admin Panel Category Flat Bootstrap Responsive Web Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href='<c:url value = "/resources/bootstrap/css/bootstrap.min.css"/>'/>
<!-- Custom CSS -->
<link rel="stylesheet" href='<c:url value = "/resources/css/style.css"/>'/>
<link rel="stylesheet" href='<c:url value = "/resources/css/morris.css"/>'/>
<!-- Graph CSS -->
<link rel="stylesheet" href='<c:url value = "/resources/css/font-awesome.css"/>'/>
<!-- jQuery -->
<script src='<c:url value = "/resources/JS/jquery-3.2.1.min.js"/>' ></script>
<!-- //jQuery -->
<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet" href='<c:url value = "/resources/css/icon-font.min.css"/>'/>
<!-- //lined-icons -->
</head> 
<body>
<div class="page-container">
<!--/content-inner-->
	<div class="left-content">
		<div class="row">
			<h2>Sản Phẩm</h2>
			<form action="" id="form-data">
			<div class="col-sm-12 col-md-5 form-group">
				<label for="tensanpham">Tên Sản Phẩm: </label> <br/>
				<input name="tensanpham" type="text" id="tensanpham" class="form-control" placeholder="Nhập Vào Tên Sản Phẩm" /><br/>
				
				<label for="giatien">Giá Tiền: </label> <br/>
				<input name="giatien" type="text" id="giatien" class="form-control" placeholder="Nhập Vào Giá Tiền" /><br/>
				
				<label for="gianhcho">Giành Cho: </label> <br/>
				<label class="radio-inline"><input id="rd-nam" type="radio" name="gianhcho" value="nam" checked>Nam</label>
				<label class="radio-inline"><input id="rd-nu" type="radio" name="gianhcho" value="nu">Nữ</label><br/><br/>
				
				<label for="danhmucsanpham">Danh Mục:</label>
				  <select name="danhmucsanpham" class="form-control" id="danhmucsanpham">
				  	<c:forEach var="danhmuc" items="${listDanhMucs }">
				  		<option value="${danhmuc.getMadanhmuc() }">${danhmuc.getTendanhmuc() }</option>
				  	</c:forEach>
				  </select><br/>
				
				<label for="mota">Mô Tả: </label> <br/>
				<textarea rows="5" name="mota" id="mota" class="form-control" placeholder="Nhập Vào Mô Tả"></textarea><br/>
				
				<label for="hinhanh">Hình Ảnh: </label> <br/>
				<input type="file" name="hinhanh" id="hinhanh" class="form-control" /><br/>
				
				<div id="containerchitietsanpham">
					<div class="chitietsanpham">
						<span>Chi Tiết</span>
						<select class="form-control" id="mausanpham">
					  	<c:forEach var="mausanpham" items="${listMauSanPham }">
					  		<option value="${mausanpham.getMamau() }">${mausanpham.getTenmau() }</option>
					  	</c:forEach>
						</select><br/>
						 
						<select class="form-control" id="sizesanpham">
						<c:forEach var="sizesanpham" items="${listSizeSanPham }">
						  <option value="${sizesanpham.getMasize() }">${sizesanpham.getSize() }</option>
						</c:forEach>
						</select><br/> 
						<input type="number" value="1" min="1" name="soluong" id="soluong" class="form-control" placeholder="Nhập vào Số Lượng" /><br/>
						<button class="btn btn-primary btn-chitiet">Thêm Chi Tiết</button>		
					</div>
				</div>
				
				<div id="chitietsanpham" class="chitietsanpham">
					<span>Chi Tiết</span>
					<select class="form-control" id="mausanpham">
				  	<c:forEach var="mausanpham" items="${listMauSanPham }">
				  		<option value="${mausanpham.getMamau() }">${mausanpham.getTenmau() }</option>
				  	</c:forEach>
					 </select><br/>
					 
					<select class="form-control" id="sizesanpham">
					  <c:forEach var="sizesanpham" items="${listSizeSanPham }">
					  	<option value="${sizesanpham.getMasize() }">${sizesanpham.getSize() }</option>
					  </c:forEach>
					</select><br/> 
					<input type="number" value="1" min="1" name="soluong" id="soluong" class="form-control" placeholder="Nhập vào Số Lượng" /><br/>
					<button class="btn btn-primary btn-chitiet">Thêm Chi Tiết</button>		
				</div><br/>
				
				<p>
					<button class="btn btn-primary" id="btnThemSanPham">Thêm Sản Phẩm</button>
					<button class="btn btn-primary hidden" id="btnCapNhatSanPham">Cập Nhật</button>
					<button class="btn btn-primary hidden" id="btnThoat">Thoát</button>
				</p>
				</form>
			</div>
			
			<div class="col-sm-12 col-md-7">
				<div style="float: right;">
					<button id="xoa-sanpham" class="btn btn-info">Xóa</button>
				</div>
				<table id="table-sanpham" class="table">
					<thead>
						<tr>
							<th>
								<div class="checkbox">
								  <label><input id="checkall" type="checkbox" value=""></label>
								</div>
							</th>
							<th>Tên Sản Phẩm</th>
							<th>Giá Tiền</th>
							<th>Giành Cho</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="sanpham" items="${listSanPham }">
							<tr>
								<td>
									<div class="checkbox">
									  <label><input class="checkboxsanpham" type="checkbox" value="${sanpham.getMasanpham() }"></label>
									</div>
								</td>
								<td class="tensp" data-masp="${sanpham.getMasanpham() }"> ${sanpham.getTensanpham() }</td>
								<td class="giatien">${sanpham.getGiatien() }</td>
								<td class="gianhcho">${sanpham.getGianhcho() }</td>
								<td style="color: white;" class=" btn btn-warning capnhatsanpham" data-id="${sanpham.getMasanpham() }">Sửa</td>
							  </tr>
						</c:forEach>
					</tbody>
				</table>
				
				<ul class="pagination pagination-sm">
					<li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				        <span class="sr-only">Previous</span>
				      </a>
				    </li>
					<c:forEach var="i" begin="1" end="${tongsopage }">
						<c:choose>
							<c:when test="${i == 1 }">
								<li class="pagin-item active"><a href="#">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li class="pagin-item"><a href="#">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				        <span class="sr-only">Next</span>
				      </a>
				    </li>
				</ul>
			
			</div>
		</div>
	</div>
	
  <!--//content-inner-->
			<!--/sidebar-menu-->
				<div class="sidebar-menu">
					<header class="logo1">
						<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> 
					</header>
						<div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
                           <div class="menu">
									<ul id="menu" >
										<c:choose>
								        	<c:when test="${nhanVien.getChucVu().getMachucvu() == 1}">
								        		<li><a href='<c:url value = "/"/>'><i class="fa fa-home"></i> <span>Trang Chủ</span><div class="clearfix"></div></a></li>
								        		<li><a href='<c:url value = "/thongke/"/>'><i class="fa fa-bar-chart"></i> <span>Thống Kê</span><div class="clearfix"></div></a></li>
								        		<li><a href='<c:url value = "/taikhoan/"/>'><i class="fa fa-user"></i> <span>tài Khoản</span><div class="clearfix"></div></a></li>
												<li id="menu-academico" ><a href='<c:url value = "/themsanpham"/>'><i class="fa fa-cube nav_icon"></i><span>Sản Phẩm</span><div class="clearfix"></div></a></li>
										 		<!-- <li><a href="index.html"><i class="fa fa-users"></i> <span>Quản Lý Nhân Viên</span><div class="clearfix"></div></a></li> -->
												<li><a href='<c:url value = "/hoadon/"/>'><i class="fa fa-list-alt dangxuat"></i> <span>Quản Lý Hóa Đơn</span><div class="clearfix"></div></a></li>
												<li><a href='<c:url value = "/dangxuat"/>' datavalue="${machucvu}"><i class="fa fa-sign-out"></i> <span>Đăng Xuất</span><div class="clearfix"></div></a></li>
						
								        	</c:when>
								        	<c:when test="${nhanVien.getChucVu().getMachucvu() == 2}">
								        		<li><a href='<c:url value = "/"/>'><i class="fa fa-home"></i> <span>Trang Chủ</span><div class="clearfix"></div></a></li>
								        		<li><a href='<c:url value = "/taikhoan/"/>'><i class="fa fa-user"></i> <span>tài Khoản</span><div class="clearfix"></div></a></li>
												<li id="menu-academico" ><a href='<c:url value = "/themsanpham"/>'><i class="fa fa-cube nav_icon"></i><span>Sản Phẩm</span><div class="clearfix"></div></a></li>
												<li><a href="index.html"><i class="fa fa-list-alt"></i> <span>Quản lý Hóa Đơn</span><div class="clearfix"></div></a></li>
												<li><a href='<c:url value = "/dangxuat"/>' datavalue="${machucvu}"><i class="fa fa-sign-out" ></i> <span>Đăng Xuất</span><div class="clearfix"></div></a></li>
								        	</c:when>
								        	<c:otherwise>
								        		<li><a href='<c:url value = "/"/>'><i class="fa fa-home"></i> <span>Trang Chủ</span><div class="clearfix"></div></a></li>
								        		<li><a href='<c:url value = "/taikhoan/"/>'><i class="fa fa-user"></i> <span>tài Khoản</span><div class="clearfix"></div></a></li>
								        		<li><a href='<c:url value = "/dangxuat"/>' datavalue="${machucvu}"><i class="fa fa-sign-out" ></i> <span>Đăng Xuất</span><div class="clearfix"></div></a></li>
								        	</c:otherwise>
								        </c:choose>
										
										
								  </ul>
								</div>
							  </div>
							  <div class="clearfix"></div>		
							</div>
							<script>
							var toggle = true;
										
							$(".sidebar-icon").click(function() {                
							  if (toggle)
							  {
								$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
								$("#menu span").css({"position":"absolute"});
							  }
							  else
							  {
								$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
								setTimeout(function() {
								  $("#menu span").css({"position":"relative"});
								}, 400);
							  }
											
											toggle = !toggle;
										});
							</script>
<!--js -->
<script src='<c:url value = "/resources/JS/jquery.nicescroll.js"/>' ></script>
<script src='<c:url value = "/resources/JS/scripts.js"/>' ></script>
<script src='<c:url value = "/resources/JS/custom.js"/>' ></script>
<!-- Bootstrap Core JavaScript -->
<script src='<c:url value = "/resources/JS/bootstrap.min.js"/>' ></script>
   <!-- /Bootstrap Core JavaScript -->	   
<!-- morris JavaScript -->	
<script src='<c:url value = "/resources/JS/raphael-min.js"/>' ></script>
<script src='<c:url value = "/resources/JS/morris.js"/>' ></script>
<script>
	$(document).ready(function() {
		//BOX BUTTON SHOW AND CLOSE
	   jQuery('.small-graph-box').hover(function() {
		  jQuery(this).find('.box-button').fadeIn('fast');
	   }, function() {
		  jQuery(this).find('.box-button').fadeOut('fast');
	   });
	   jQuery('.small-graph-box .box-close').click(function() {
		  jQuery(this).closest('.small-graph-box').fadeOut(200);
		  return false;
	   });
	   
	    //CHARTS
	    function gd(year, day, month) {
			return new Date(year, month - 1, day).getTime();
		}
		
		graphArea2 = Morris.Area({
			element: 'hero-area',
			padding: 10,
        behaveLikeLine: true,
        gridEnabled: false,
        gridLineColor: '#dddddd',
        axes: true,
        resize: true,
        smooth:true,
        pointSize: 0,
        lineWidth: 0,
        fillOpacity:0.85,
			data: [
				{period: '2014 Q1', iphone: 2668, ipad: null, itouch: 2649},
				{period: '2014 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
				{period: '2014 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
				{period: '2014 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
				{period: '2015 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
				{period: '2015 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
				{period: '2015 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
				{period: '2015 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
				{period: '2016 Q1', iphone: 10697, ipad: 4470, itouch: 2038},
				{period: '2016 Q2', iphone: 8442, ipad: 5723, itouch: 1801}
			],
			lineColors:['#ff4a43','#a2d200','#22beef'],
			xkey: 'period',
            redraw: true,
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
			pointSize: 2,
			hideHover: 'auto',
			resize: true
		});
		
	   
	});
	</script>
</body>
</html>