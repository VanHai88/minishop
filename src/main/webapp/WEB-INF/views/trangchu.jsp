<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
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
	<div id="header" class="container-fluid">
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
		      <a class="navbar-brand" style="margin-top: -14px;" href='<c:url value = "/"/>'><img src='<c:url value = "/resources/Image/logoShop.png"/>'/></a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav navbar-center">
		        <li class="activetc test-size"><a href='<c:url value = "/"/>'>TRANG CHỦ</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle test-size" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sản Phẩm <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		          	<c:forEach var="danhmuc" items="${listDanhMucs }">
						<li><a href='<c:url value = "/sanpham/${danhmuc.getMadanhmuc() }/${danhmuc.getTendanhmuc() }"/>'>${danhmuc.getTendanhmuc() }</a></li>
						<li role="separator" class="divider"></li>
					</c:forEach>
		          </ul>
		        </li>
		        <li><a href="#" class="test-size">DỊCH VỤ</a></li>
		        <li><a href="#" class="test-size">LIÊN HỆ</a></li>
		      </ul>
		      
		      <ul class="nav navbar-nav navbar-right">
		      
				<div class="modal fade" id="search">
				  	 <div class="modal-dialog">
			      		<!-- Modal content-->
				      	<div class="modal-content">
					        <!-- <div class="modal-body">	
					          	<input name="tensanpham" type="text" id="timkiem" class="form-control" placeholder="Nhập Vào Từ Khóa Tìm Kiếm"/>
					          	<button class="btn btn-primary fa fa-search close" style="background-color: blue;" data-dismiss="modal" id="bt-timkiem"></button>
					        </div> -->
					        <div class="modal-body">	
					        <form:form method="get" action = "">
               					<td><form:input id="timkiem" path = "tensanpham" /></td>
               					<input class="btn btn-primary fa fa-search" id="bt-timkiem" type = "submit" value="Tìm Kiếm" style="margin-left: 1172px; margin-top: -54px; width: 72px; height: 54px; border-radius: 9px; padding-left: 7px;"/>
					        </form:form>
					        </div>
				      	</div>
			      
			    	</div>
				</div>
		        
		        <li><a href="#search" data-toggle="modal" ><i class="fa fa-search"></i></a></li>
		        <c:choose>
		        	<c:when test="${nhanvien.getHinhanh() != null}">
		        		<li class="hidden"><a class="circle-avatar href="dashboard/"><span>${avatar }</span> </a></li>
		        		<li><a class="circle-avatar" href="taikhoan/"><span><img id="anhdaidien" src='<c:url value = "/resources/Image/sanpham/${nhanvien.getHinhanh()}"/>'></span></a></li><br/>
		        		<li><a href="#"><img id="cart" src='<c:url value = "/resources/Image/ic_shopping_cart_white_24dp_1x.png"/>' /></a> </li>
		        	</c:when>
		        	<c:when test="${avatar != null}">
			        	<li><a class="circle-avatar " href="taikhoan/"><span>${avatar }</span> </a></li>
		        		<li class="hidden"><a class="circle-avatar" href="dashboard/"><span><img id="anhdaidien" src='<c:url value = "/resources/Image/sanpham/${nhanvien.getHinhanh()}"/>'></span></a></li><br/>
		        		<li><a href="#"><img id="cart" src='<c:url value = "/resources/Image/ic_shopping_cart_white_24dp_1x.png"/>' /></a> </li>
		        	</c:when>
		        	<c:otherwise>
		        		<li><a class="test-size" href="dangnhap/">ĐĂNG NHẬP</a></li>
		        		<li><a href="#"><img src='<c:url value = "/resources/Image/ic_shopping_cart_white_24dp_1x.png"/>' /></a> </li>
		        	</c:otherwise>
		        </c:choose>
				
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	
		<div class="event_header container wow rubberBand">
			<span>Ngày 06/04 - 10/04/2019</span> <br/>
			<span style="font-size: 50px">Mua 1 Tặng 1</span> <br/>
			<button>XEM NGAY</button>
		</div>
	</div>
	
	<!-- //banner -->
    <div class="banner_bottom_agile_info">
	    <div class="container">
            <div class="banner_bottom_agile_info_inner_w3ls">
    	           <div class="col-md-6 wthree_banner_bottom_grid_three_left1 grid">
						<figure class="effect-roxy">
							<img src='<c:url value = "/resources/images/bottom1.jpg"/>' alt=" " class="img-responsive" />
							<figcaption>
								<h3><span>F</span>all Ahead</h3>
								<p>New Arrivals</p>
							</figcaption>			
						</figure>
					</div>
					 <div class="col-md-6 wthree_banner_bottom_grid_three_left1 grid">
						<figure class="effect-roxy">
							<img src='<c:url value = "/resources/images/bottom1.jpg"/>' alt=" " class="img-responsive" />
							<figcaption>
								<h3><span>F</span>all Ahead</h3>
								<p>New Arrivals</p>
							</figcaption>			
						</figure>
					</div>
					<div class="clearfix"></div>
		    </div> 
		 </div> 
    </div>
	<!-- schedule-bottom -->
	
	<div id="title-sanpham" class="container">
		<span>SẢN PHẨM HOT</span>
		${tensanpham }
		<div class="row sptrangchu" style="margin-top: 42px">
		
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
								<a class="btn btn-default" href="chitiet/${sanPham.getMasanpham() }""><span class="glyphicon fa fa-shopping-bag"> Mua</span></a> 
						
							</div>
							</div>
							</div>
				
					</div>
				</div>
			</c:forEach>
		</div>
		
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
		
	<div id="footer" class="container-fluid">
	
<!--/grids-->
<div class="coupons">
		<div class="coupons-grids text-center">
			<div class="w3layouts_mail_grid">
				<div class="col-md-3 w3layouts_mail_grid_left">
					<div class="w3layouts_mail_grid_left1 hvr-radial-out">
						<i class="fa fa-truck" aria-hidden="true"></i>
					</div>
					<div class="w3layouts_mail_grid_left2">
						<h3>FREE SHIPPING</h3>
						<p>Lorem ipsum dolor sit amet, consectetur</p>
					</div>
				</div>
				<div class="col-md-3 w3layouts_mail_grid_left">
					<div class="w3layouts_mail_grid_left1 hvr-radial-out">
						<i class="fa fa-headphones" aria-hidden="true"></i>
					</div>
					<div class="w3layouts_mail_grid_left2">
						<h3>24/7 SUPPORT</h3>
						<p>Lorem ipsum dolor sit amet, consectetur</p>
					</div>
				</div>
				<div class="col-md-3 w3layouts_mail_grid_left">
					<div class="w3layouts_mail_grid_left1 hvr-radial-out">
						<i class="fa fa-shopping-bag" aria-hidden="true"></i>
					</div>
					<div class="w3layouts_mail_grid_left2">
						<h3>MONEY BACK GUARANTEE</h3>
						<p>Lorem ipsum dolor sit amet, consectetur</p>
					</div>
				</div>
					<div class="col-md-3 w3layouts_mail_grid_left">
					<div class="w3layouts_mail_grid_left1 hvr-radial-out">
						<i class="fa fa-gift" aria-hidden="true"></i>
					</div>
					<div class="w3layouts_mail_grid_left2">
						<h3>FREE GIFT COUPONS</h3>
						<p>Lorem ipsum dolor sit amet, consectetur</p>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>

		</div>
</div>
<!--grids-->
</div>
	
	<!-- footer -->
<div class="footer">
	<div class="footer_agile_inner_info_w3l">
		<div class="col-md-5 footer-left">
			<h2><a href="index.html"><span>H</span>2T Shoppy </a></h2>
			<span>Shop thời trang nam online H2T đã khẳng định được sự chuyên nghiệp của mình trong công việc. Quần, áo tại H2T được cập nhật mới liên tục, mỗi mẫu đều có số lượng hàng đầy đủ để cung ứng cho khách hàng bán buôn và bán lẻ. Đội ngũ nhân viên của H2T trẻ trung, năng động và phong cách bán hàng chuyên nghiệp nhiệt tình...H2T-Shop cam kết bán hàng đúng giá niêm yết, chất lượng đảm bảo, bồi thường gấp đôi nếu có vấn để về chất lượng sản phẩm khi bán cho khách hàng. Shop online H2T luôn đem lại sự hài lòng đến với khách hàng!</span>
			
		</div>
		<div class="col-md-7 footer-right">
			<div class="sign-grds">
				<div class="col-md-6 sign-gd">
					<h4><span>về chúng tôi</span> </h4>
					<ul id="ul-sign-grds">
						<li><a href="#">Fanpage cộng đồng H2T</a></li>
						<li><a href="#">Bài báo về H2T</a></li>
						<li><a href="#">Chính sách bảo mật</a></li>
						<li><a href="#">Tuyển dụng</a></li>
						<li><a href="#">Chính sách đổi trả</a></li>
						<li><a href="#">Chính sách khách hàng thân thiết</a></li>
						<li><a href="#">Hướng dẫn mua hàng</a></li>
					</ul>
				</div>
				
				<div class="col-md-6 sign-gd-two">
					<h4><span>THÔNG TIN LIÊN HỆ</span></h4>
					<div class="w3-address">
						<div class="w3-address-grid">
							<div class="w3-address-left">
								<i class="fa fa-phone" aria-hidden="true"></i>
							</div>
							<div class="w3-address-right">
								<h6>Số điện thoại liên hệ: </h6>
								<p>0973741903</p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="w3-address-grid">
							<div class="w3-address-left">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</div>
							<div class="w3-address-right">
								<h6>EMAIL liên hệ:</h6>
								<p>Email :<a href="mailto:example@email.com"> zzvanhai81@gmail.com</a></p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="w3-address-grid">
							<div class="w3-address-left">
								<i class="fa fa-map-marker" aria-hidden="true"></i>
							</div>
							<div class="w3-address-right">
								<h6>Địa chỉ: </h6>
								<p>459 Tôn Đức Thắng - Phường Hoàn Khánh - Quận Liên Chiểu - Thành phố Đà Nẵng </p>
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
				</div>
				
				<div class="clearfix"></div>
			</div>
		</div>
		</div>
		<div class="clearfix"></div>
			<div class="agile_newsletter_footer">
					<div class="col-sm-6 newsleft">
				<h3>ĐĂNG KÝ NHẬN THÔNG BÁO !</h3>
			</div>
			<div class="col-sm-6 newsright">
				<form action="#" method="post">
					<input type="email" placeholder="Enter your email..." name="email" required="">
					<input type="submit" value="Submit">
				</form>
			</div>

		<div class="clearfix"></div>
</div>

<!-- //footer -->
	
	
	<jsp:include page="footer.jsp"/>
</body>

</html>