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
	<link rel="stylesheet" href='<c:url value = "/resources/css/font-awesome.css"/>'/>
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
		        
		        <li id="giohang"> <a href='<c:url value = "/giohang/"/>'><img src='<c:url value = "/resources/Image/ic_shopping_cart_white_24dp_1x.png"/>' />
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
		<div class="row" style="margin-top: 16px">
			<div class="col-sm-2 col-md-2">
				<h3>DANH MỤC</h3>
				<ul class="mymenu">
					<c:forEach var="danhmuc" items="${listDanhMucs }">
						<li><a href="#">${danhmuc.getTendanhmuc() }</a></li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="col-sm-10 col-md-10">
					<div class="row">
						<h2><span>${tendanhmuc }</span></h2>
						<c:forEach var="sanPham" items="${listSanPham }">
							<div class="col-sm-6 col-md-3"> 
				   				<div class="product">
									<div class="sanpham wow zoomIn">
								 		<p style="text-align:center;margin-top:20px;"> <img style="width: 100%" src='<c:url value = "/resources/Image/sanpham/${sanPham.getHinhsanpham() }"/>'> </p> 
				    					<div class="caption"> 
				     					<div class="blur"></div> 
				     					<div class="caption-text"> 
				      						<h4 id="textten">${sanPham.getTensanpham()}</h4> 
											<p style="font-size: 18px">${sanPham.getGiatien()} VNĐ</p>
											<p id="textmota">${sanPham.getMota() }</p> 
											<a class="btn btn-default" href='<c:url value = "/chitiet/${sanPham.getMasanpham() }"/>'><span class="glyphicon fa fa-shopping-bag"> Mua</span></a> 
									
										</div>
										</div>
										</div>
							
								</div>
							</div>
						</c:forEach>
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