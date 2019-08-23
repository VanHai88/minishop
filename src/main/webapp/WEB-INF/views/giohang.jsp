<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<jsp:include page="header.jsp"/>
</head>
<body>
	<div id="header-chitiet" class="container-fluid">
		<nav class="navbar navbar-default none_nav">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href='<c:url value = "/"/>'><img style="margin-top: -14px;" src='<c:url value = "/resources/Image/logoShop.png"/>'/></a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav navbar-center">
		        <li class="activetc"><a href='<c:url value = "/"/>'>TRANG CHỦ</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sản Phẩm <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		          	<c:forEach var="danhmuc" items="${listDanhMucs }">
						<li><a href='<c:url value = "/sanpham/${danhmuc.getMadanhmuc() }/${danhmuc.getTendanhmuc() }"/>'>${danhmuc.getTendanhmuc() }</a></li>
						<li role="separator" class="divider"></li>
					</c:forEach>
		          </ul>
		        </li>
		        <li><a href="#">DỊCH VỤ</a></li>
		        <li><a href="#">LIÊN HỆ</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        
		        <c:choose>
		        	<c:when test="${avatar != null}">
		        		<li><a class="circle-avatar" href="dangnhap/"><span>${avatar }</span> </a></li>
		        	</c:when>
		        	<c:otherwise>
		        		<li><a href="dangnhap/">ĐĂNG NHẬP</a></li>
		        	</c:otherwise>
		        </c:choose>
		        
		        <li id="giohang"> <a href="#"><img src='<c:url value = "/resources/Image/ic_shopping_cart_white_24dp_1x.png"/>' />
		        	<c:choose>
			        	<c:when test="${soluongsanphamgiohang > 0}">
			        		<div class="circle-giohang"><span>${soluongsanphamgiohang }</span></div>
			        	</c:when>
			        	<c:otherwise>
			        		<div><span>${soluongsanphamgiohang }</span></div>
			        	</c:otherwise>
			        </c:choose>
		        </a></li>
		        
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-6">
			<h3>Danh Sách Sản Phẩm Trong Giỏ Hàng</h3>
				<table class="table">
					<thead>
						<tr>
							<td><h5>Tên Sản Phẩm</h5></td>
							<td><h5>Màu Sản Phẩm</h5></td>
							<td><h5>Size</h5></td>
							<td><h5>Số Lượng</h5></td>
							<td><h5>Giá Tiền</h5></td>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="giohang" items="${giohangs }">
						   <tr data-machitiet="${giohang.getMachitiet() }">
						   		<td class="tensp" data-masp="${giohang.getMasp() }"> ${giohang.getTenSP() }</td>
								<td class="mau" data-mamau="${giohang.getMaMau()}">${giohang.getTenMau() }</td>
								<td class="size" data-masize="${giohang.getMaSize()}">${giohang.getTenSize() }</td>
								<td class="soluong"><input class="soluong-giohang" min="1" type="number" value="${giohang.getSoLuong() }"/></td>
								<td class="giatien" data-value="${giohang.getGiaTien() }">${giohang.getGiaTien() }</td>
								<td class="xoa-giohang btn btn-danger">Xoá</td>
						   </tr>
						</c:forEach>
					</tbody>
				</table>
				<h4>Tổng Tiền: <span id="tongtien" style="color: red;">0 VNĐ</span></h4>
			</div>
			
			<div class="col-sm-12 col-md-6">
				<h3>Thông Tin Người Mua/Nhận</h3>
			
				<div class="form-group">
					<form action="" method="post">
						<label for="tenkhachhang">Tên người Mua/Nhận: </label>
						<input class="form-control" id="tenkhachhang" name="tenkhachhang" /><br/>
						<label for="sodt">Điện Thoại Liên Lạc: </label>
						<input class="form-control" id="sodt" name="sodt" /><br/>
						
						<div class="radio">
							<label><input type="radio" checked="" name="hinhthucgiaohang" value="Giao hành Tận Nơi">Giao hành Tận Nơi</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="hinhthucgiaohang" value="Nhận Hàng tại Cửa hàng">Nhận Hàng tại Cửa hàng</label>
						</div><br/>
						
						<label for="diachigiaohang">Địa Chỉ Nhận Hàng: </label>
						<input class="form-control" id="diachigiaohang" name="diachigiaohang" /><br/>
						
						<label for="ghichu">Ghi Chú: </label>
						<textarea class="form-control" rows="5" id="ghichu" name="ghichu"></textarea><br/>
						
						<input type="submit" class="btn btn-primary" value="Đặt Hàng" />
					</form>
				</div>
			</div>
		</div>
		
	</div>
		
	<div id="footer" class="container-fluid">
		<div class="row">
			<div class="col-sm-4 col-md-4 wow tada">
				<p><span class="title-footer">THÔNG TIN SHOP</span></p>
				<span>Yame là một thương hiệu thời trang đầy uy tín, luôn đảm bảo chất lượng tốt nhất cho khách hàng</span>
			</div>
			<div class="col-sm-4 col-md-4 wow tada">
				<p><span class="title-footer">LIÊN HỆ</span></p>
				<span>459 Tôn Đức Thắng - Phường Hòa Khánh Nam - Quận Liên Chiểu - Thành Phố Đà Nẵng</span><br/>
				<span>zzvanhai81@gmail.com</span><br/>
				<span>0973741903</span>
			</div>
			<div class="col-sm-4 col-md-4 wow tada">
				<p><spa class="title-footer"n>GÓP Ý</span></p>
				<form action="" method="post">
					<input name="tenNhanVien" class="material-textinput" type="text" style="margin-bottom: 8px"  placeholder="Email" />
					<textarea name="tuoi" style="margin-bottom: 8px" rows="4" cols="50" placeholder="Nội Dung"></textarea>
					<button class="material-primary-button">ĐỒNG Ý</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>

</html>