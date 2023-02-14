<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Page Header Start -->
<div class="container-fluid page-header mb-5 wow fadeIn"
	data-wow-delay="0.1s">
	<div class="container">
		<h1 class="display-3 mb-3 animated slideInDown">Chi tiết sản phẩm</h1>
		<small>Nông sản sạch an tâm mỗi bữa ăn</small>
	</div>
</div>
<!-- Page Header End -->

<!-- Details Start -->
<section>
	<div class="container pb-5">
		<div class="row">
			<div class="col-lg-5 mt-5">
				<div class="card mb-3 h-100">
					<img class="card-img img-fluid"
						src="/assets/img/product/${item.image}" alt="Card image cap"
						id="product-detail">
				</div>
			</div>
			<div class="col-lg-7 mt-5 ">
				<div class="card h-100">
					<div class="card-body">
						<h1 class="h2">${item.name}(${item.quantity}
							${item.quantitative.name} )</h1>
						<p class="h3 py-2 ">
							<span class="text-primary me-1"><fmt:formatNumber
									value="${item.price - (item.price * item.sale/100)}"
									type="currency" /> </span>
							<c:if test="${item.sale > 0}">
								<span class="text-body "> <span
									class="text-decoration-line-through"><fmt:formatNumber
											value="${item.price}" type="currency" /></span> <span
									class="h6 align-middle bg-secondary text-white">Giảm <fmt:formatNumber
											value="${item.sale}" type="NUMBER" /> %
								</span></span>

							</c:if>
						</p>
						<ul class="list-inline">
							<li class="list-inline-item">
								<h6>Loại</h6>
							</li>
							<li class="list-inline-item">
								<p class="text-muted">
									<strong>${item.category.name}</strong>
								</p>
							</li>
						</ul>

						<h6>Mô tả:</h6>
						<p>${item.description}</p>
						<form action="/Gshop/add/${item.id}?link=details" method="post">
							<div class="row">
								<div class="col-auto">
									<div class="mb-3">
										<h6>Số lượng:</h6>
										<div class="input-group">
											<span class="btn btn-success input-group-text"
												onclick="minus('quantitys'); ">-</span> <input
												id="quantitys" name="quantitys" type="number"
												class="text-muted form-control text-center" value="1"
												maxlength="5" style="width: 69px;" /> <span
												class="btn btn-success input-group-text"
												onclick="plus('quantitys')">+</span>
										</div>
									</div>
								</div>
							</div>
							<div class="row pb-3 ">
								<div class="col d-grid">
									<button class="btn btn-success btn-lg" name="submit"
										formaction="/Gshop/add/${item.id}?link=cart">Mua ngay</button>
								</div>
								<div class="col d-grid">
									<button class="btn btn-success btn-lg" name="submit">Thêm
										vào giỏ hàng</button>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Details End -->
<div class="container-xxl py-5">
	<div class="container">
		<div class="row g-0 gx-5 align-items-end">
			<div class="col-lg-6">
				<div class="section-header text-start mb-5 wow fadeInUp"
					data-wow-delay="0.1s" style="max-width: 500px;">
					<h1 class="display-5 mb-3">Sản phẩm gợi ý</h1>
					<p>Sản phẩm liên quan</p>
				</div>
			</div>
		</div>
		<div class="tab-content">
			<div id="tab-1" class="tab-pane fade show p-0 active">
				<div class="row g-4">
					<c:forEach items="${list}" var="item" begin="0" end="3">
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
										class="text-body" href="/Gshop/dang-nhap"><i
											class="fas fa-shopping-cart me-2"></i>Mua ngay</a>
									</small> <small class="w-50 text-center py-2"> <a
										class="text-body" href="/Gshop/gio-hang"><i
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