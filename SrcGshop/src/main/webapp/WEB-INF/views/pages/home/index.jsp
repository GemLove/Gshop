<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Carousel Start -->
<div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay="0.1s">
	<div id="header-carousel" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="w-100" src="/assets/img/carousel-1.jpg" alt="Image">
				<div class="carousel-caption">
					<div class="container">
						<div class="row justify-content-start">
							<div class="col-lg-7">
								<h1 class="display-2 mb-5 animated slideInDown">Rau củ sạch
									rất tốt cho sức khỏe</h1>
								<a href="/Gshop/san-pham"
									class="btn btn-primary rounded-pill py-sm-3 px-sm-5">Sản
									phẩm</a> <a href="/Gshop/lien-he"
									class="btn btn-secondary rounded-pill py-sm-3 px-sm-5 ms-3">Liên
									hệ</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="w-100" src="/assets/img/carousel-2.jpg" alt="Image">
				<div class="carousel-caption">
					<div class="container">
						<div class="row justify-content-start">
							<div class="col-lg-7">
								<h1 class="display-2 mb-5 animated slideInDown">Hoa quả
									thiên nhiên luôn là lựa chọn tốt nhất cho sức khỏe</h1>
								<a href="/Gshop/san-pham"
									class="btn btn-primary rounded-pill py-sm-3 px-sm-5">Sản
									phẩm</a> <a href="/Gshop/lien-he"
									class="btn btn-secondary rounded-pill py-sm-3 px-sm-5 ms-3">Liên
									hệ</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#header-carousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#header-carousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</div>
<!-- Carousel End -->

<!-- About Start -->
<div class="container-xxl py-5">
	<div class="container">
		<div class="row g-5 align-items-center">
			<div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
				<div class="about-img position-relative overflow-hidden p-5 pe-0">
					<img class="img-fluid w-100" src="/assets/img/about.jpg">
				</div>
			</div>
			<div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
				<h1 class="display-5 mb-4">Trái cây và rau hữu cơ rất tốt</h1>
				<p class="mb-4">Rau sạch là loại rau an toàn được canh tác theo
					quy trình tuân thủ một số tiêu chí: Hạn chế thấp nhất việc sử dụng
					thuốc bảo vệ thực vật, phân hóa học,… Phương pháp này giảm tối đa
					lượng độc tố trong rau như nitrat, thuốc trừ sâu và sinh vật gây
					bệnh. Hiện nay rau sạch đang rất phổ biến trên thị trường. Nhưng
					người tiêu dùng lại ưu tiên chọn rau hữu cơ, rau organic.</p>
				<p>
					<i class="fa fa-check text-primary me-3"></i>Sử dụng rau hữu cơ sẽ
					giảm thiểu nguy cơ mắc các căn bệnh nguy hiểm về tim mạch, ung thư
					hay huyết áp
				</p>
				<p>
					<i class="fa fa-check text-primary me-3"></i>Rau hữu cơ không chứa
					các sinh vật biến đổi gen, các chất hóa học.
				</p>
				<p>
					<i class="fa fa-check text-primary me-3"></i>Nó giàu vitamin và
					chất dinh dưỡng.
				</p>
				<!-- 	<a class="btn btn-primary rounded-pill py-3 px-5 mt-3" href="">Xem thêm</a> -->
			</div>
		</div>
	</div>
</div>
<!-- About End -->


<!-- Feature Start -->
<div class="container-fluid bg-light bg-icon my-5 py-6">
	<div class="container">
		<div class="section-header text-center mx-auto mb-5 wow fadeInUp"
			data-wow-delay="0.1s" style="max-width: 500px;">
			<h1 class="display-5 mb-3">Các tính năng</h1>
			<!-- <p>Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum
					diam justo sed rebum vero dolor duo.</p> -->
		</div>
		<div class="row g-4">
			<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
				<div class="bg-white text-center h-100 p-4 p-xl-5">
					<img class="img-fluid mb-4" src="/assets/img/icon-1.png" alt="">
					<h4 class="mb-3">Quá trình tự nhiên</h4>
					<p class="mb-4">Sản phẩm được gieo trồng theo hướng truyền
						thống, không dùng chất thúc ép có hại, không dùng các hóa chất bảo
						quản và vận chuyển không sử dụng nguyên liệu tổng hợp, nhân tạo
						hay chất phụ gia trong quá trình chế biến.</p>
					<!-- <a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill"
							href="">Read More</a> -->
				</div>
			</div>
			<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
				<div class="bg-white text-center h-100 p-4 p-xl-5">
					<img class="img-fluid mb-4" src="/assets/img/icon-2.png" alt="">
					<h4 class="mb-3">Sản phẩm hữu cơ</h4>
					<p class="mb-4">sản phẩm được trồng mà không sử dụng đến hầu
						hết các loại thuốc trừ sâu thông thường, sử dụng phân bón nhân
						tạo, bùn thải, phóng xạ và sinh vật biến đổi gen.</p>
					<!-- <a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill"
							href="">Read More</a> -->
				</div>
			</div>
			<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
				<div class="bg-white text-center h-100 p-4 p-xl-5">
					<img class="img-fluid mb-4" src="/assets/img/icon-3.png" alt="">
					<h4 class="mb-3">An toàn về mặt sinh học</h4>
					<p class="mb-4">Do hai tính năng trên nên nông sản của chúng
						tôi gần như không chứa dư lượng thuốc trừ sâu nào, an toàn cho
						người dùng về các vấn đề liên quan đến sinh học.</p>
					<!-- 	<a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill"
							href="">Read More</a> -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Feature End -->


<!-- Product Start -->
<div class="container-xxl py-5">
	<div class="container">
		<div class="row g-0 gx-5 align-items-end">
			<div class="col-lg-6">
				<div class="section-header text-start mb-5 wow fadeInUp"
					data-wow-delay="0.1s" style="max-width: 500px;">
					<h1 class="display-5 mb-3">Sản phẩm đang giảm giá</h1>
					<p>Đây là những nông sản đang giảm giá</p>
				</div>
			</div>
			<!-- <div class="col-lg-6 text-start text-lg-end wow slideInRight"
					data-wow-delay="0.1s">
					<ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
						<li class="nav-item me-2"><a
							class="btn btn-outline-primary border-2 active"
							data-bs-toggle="pill" href="#tab-1">Vegetable</a></li>
						<li class="nav-item me-2"><a
							class="btn btn-outline-primary border-2" data-bs-toggle="pill"
							href="#tab-2">Fruits </a></li>
						<li class="nav-item me-0"><a
							class="btn btn-outline-primary border-2" data-bs-toggle="pill"
							href="#tab-3">Fresh</a></li>
					</ul>
				</div> -->
		</div>
		<div class="tab-content">
			<div id="tab-1" class="tab-pane fade show p-0 active">
				<div class="row g-4">
					<c:forEach items="${listSale}" var="item" begin="0" end="7">
						<div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp"
							data-wow-delay="0.1s">
							<div class="product-item">
								<div class="position-relative bg-light overflow-hidden">
									<a href="/Gshop/san-pham/${item.id}"> <img
										class="img-fluid w-100"
										src="/assets/img/product/${item.image}" alt=""></a>
									<div
										class="bg-secondary rounded text-white position-absolute start-0 top-0  py-1 px-1 ">
										<span> Giảm <fmt:formatNumber value="${item.sale}"
												type="NUMBER" /> %
										</span>
									</div>
								</div>
								<div class="text-center p-4">
									<a class="d-block text-muted mb-2 "
										href="/Gshop/san-pham/${item.id}">${item.name} (
										${item.quantity} ${item.quantitative.name} ) </a> <span
										class="text-primary me-1"><fmt:formatNumber
											value="${item.price - (item.price * item.sale/100)}"
											type="currency" /> </span>
									<c:if test="${item.sale > 0}">
										<span class="text-body text-decoration-line-through"> <fmt:formatNumber
												value="${item.price}" type="currency" /></span>
									</c:if>
								</div>
								<div class="d-flex border-top">
									<small class="w-50 text-center border-end py-2"> <a
										class="text-body cart"
										onClick="window.location = '/Gshop/add/${item.id}?link=cart'"><i
											class="fas fa-shopping-cart me-2"></i>Mua ngay</a>
									</small> <small class="w-50 text-center py-2"> <a
										class="text-body cart"
										onClick="window.location = '/Gshop/add/${item.id}'" id="click"><i
											class="fas fa-cart-plus me-2"></i></i>Thêm vào giỏ</a>
									</small>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
						<a class="btn btn-primary rounded-pill py-3 px-5"
							href="/Gshop/san-pham">Xem thêm</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Product End -->