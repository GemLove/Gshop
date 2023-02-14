<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Page Header Start -->
<div class="container-fluid page-header mb-5 wow fadeIn"
	data-wow-delay="0.1s">
	<div class="container">
		<h1 class="display-3 mb-3 animated slideInDown">Sản phẩm</h1>
		<small>Nông sản sạch an tâm mỗi bữa ăn</small>
	</div>
</div>
<!-- Page Header End -->


<!-- Product Start -->
<div class="container-xxl py-5">
	<div class="container">
		<div class="row g-0 gx-5 align-items-end">
			<div class="col-lg-6">
				<div class="section-header text-start mb-5 wow fadeInUp"
					data-wow-delay="0.1s" style="max-width: 500px;">
					<h1 class="display-5 mb-3">Sản phẩm</h1>
					<p>Tất cả các mặt hàng rau,củ, quả</p>
				</div>
			</div>
			<div class="col-lg-6 text-start text-lg-end wow slideInRight"
				data-wow-delay="0.1s">
				<ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
					<li class="nav-item me-2"><a
						class="btn btn-outline-primary border-2 <c:if test="${param.filter == null}">active</c:if>"
						href="/Gshop/san-pham">Tất cả</a></li>
					<c:forEach items="${listCategory}" var="item">
						<li class="nav-item me-2"><a
							class="btn btn-outline-primary border-2 <c:if test="${param.filter == item.id}">active</c:if>"
							href="/Gshop/san-pham?filter=${item.id}">${item.name}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="tab-content">
			<div id="tab-1" class="tab-pane fade show p-0 active">
				<div class="row g-4">
					<c:forEach items="${listProduct}" var="item">
						<div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp"
							data-wow-delay="0.1s">
							<div class="product-item">
								<div class="position-relative bg-light overflow-hidden">
									<a href="/Gshop/san-pham/${item.id}"> <img
										class="img-fluid w-100"
										src="/assets/img/product/${item.image}" alt=""></a>
									<c:if test="${item.sale > 0}">
										<div
											class="bg-secondary rounded text-white position-absolute start-0 top-0  py-1 px-1 ">
											<span> Giảm <fmt:formatNumber value="${item.sale}"
													type="NUMBER" /> %
											</span>
										</div>
									</c:if>
								</div>
								<div class="text-center p-4">
									<a class="d-block text-muted mb-2"
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
										onClick="window.location = '/Gshop/add/${item.id}?link=product'" id="click"><i
											class="fas fa-cart-plus me-2"></i></i>Thêm vào giỏ</a>
									</small>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Product End -->
