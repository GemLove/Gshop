<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Page Header Start -->
<div class="container-fluid page-header wow fadeIn"
	data-wow-delay="0.1s">
	<div class="container">
		<h1 class="display-3 mb-3 animated slideInDown">Giỏ hàng</h1>
		<nav aria-label="breadcrumb animated slideInDown"></nav>
	</div>
</div>
<!-- Page Header End -->

<!-- Cart Start -->
<section class="h-100 h-custom" style="background-color: white;">
	<div class="container py-5 h-100 ">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col">
				<c:choose>
					<c:when test="${listCart.count >0 }">
						<div class="card">
							<div class="card-body p-4">
								<div class="row">
									<div class="col-lg-7 wow fadeInUp" data-wow-delay="0.1s">
										<h5 class="mb-3">
											<a href="/Gshop/trang-chu" class="text-body"><i
												class="fas fa-long-arrow-alt-left me-2"></i>Về trang chủ</a>
										</h5>
										<hr>
										<div
											class="d-flex justify-content-between align-items-center mb-4">
											<div>
												<p class="mb-1">Giỏ hàng</p>
												<p class="mb-0">Bạn có ${count} mặt hàng trong giỏ hàng</p>
											</div>
											<div>
												<p class="mb-0">
													<span class="text-muted">Sắp xếp :</span> <a href="#!"
														class="text-body">giá <i
														class="fas fa-angle-down mt-1"></i></a>
												</p>
											</div>
										</div>
										<c:forEach items="${listCart.items}" var="item"
											varStatus="viTri">
											<div class="card mb-3">
												<div class="card-body">
													<div class="d-flex justify-content-between">
														<div class="d-flex flex-row align-items-center">
															<div>
																<img src="/assets/img/product/${item.image}"
																	class="img-fluid rounded-3" alt="Shopping item"
																	style="width: 65px;">
															</div>
															<div class="ms-3">
																<h5>${item.name}</h5>
																<p class="small mb-0">${item.quantity}
																	${item.quantitative.name}</p>
															</div>
														</div>
														<div class="d-flex flex-row align-items-center">
															<div>
																<form action="/Gshop/update/${item.id}" method="post">
																	<div class="input-group">
																		<button
																			class="border-0 input-group-text bg-transparent cart"
																			id="btn-minus"
																			onclick="minus('quantitys${viTri.index}')">-</button>
																		<input id="quantitys${viTri.index}" name="quantitys"
																			type="number"
																			class="text-muted form-control text-center "
																			style="width: 69px" value="${item.quantitys}"
																			maxlength="5" onblur="this.form.submit()"
																			onfocus="vali('quantitys${viTri.index}')" />
																		<button
																			class="border-0 input-group-text bg-transparent cart"
																			id="btn-plus"
																			onclick="plus('quantitys${viTri.index}')">+</button>
																	</div>
																</form>
															</div>
															<div style="width: 80px;" class="me-1">
																<h5 class="mb-0">
																	<fmt:formatNumber
																		value="${item.price - (item.price * item.sale/100)}"
																		type="currency" />
																</h5>
															</div>
															<a href="/Gshop/remove/${item.id}"
																style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
														</div>
													</div>

												</div>
											</div>
										</c:forEach>
									</div>
									<div class="col-lg-5 wow fadeInUp" data-wow-delay="0.1s">
										<div class="card  text-white rounded-3">
											<div class="card-body">
												<div
													class="d-flex justify-content-between align-items-center mb-4">
													<h4 class="mb-0">Thanh toán</h4>
													<img src="/assets/img/user/${sessionScope.account.photo}"
														class="img-fluid rounded-3" style="width: 45px;"
														alt="Avatar">
												</div>
												<form class="mt-4" action="/Gshop/thanh-toan" method="post">
													<div class="form-outline form-white mb-4 text-dark">
														<p>
															Họ và tên : <span class="fw-bold">${sessionScope.account.fullname}
															</span>
														</p>
													</div>
													<div class="form-outline form-white mb-4 text-dark">
														<p>
															SĐT: <span class="fw-bold">${sessionScope.account.numberphone}</span>
														</p>
													</div>
													<div class="mb-3">
														<label class="form-label text-dark">Địa chỉ nhận
															hàng :</label>
														<c:choose>
															<c:when test="${listAdress.size() > 0 }">
																<div class="input-group">
																	<select class="form-select text-truncate"
																		aria-label="Default select example"
																		onchange="newAdress()" name="adress">
																		<c:forEach items="${listAdress}" var="list">
																			<option value="${list.adressId}">${list.adress}</option>
																		</c:forEach>
																	</select>
																	<button type="button"
																		class="btn btn-primary input-group-text"
																		data-bs-toggle="modal" data-bs-target="#exampleModal">thêm</button>
																	<div class="ms-1 text-danger">${errorAdress}</div>
																</div>
															</c:when>
															<c:otherwise>
																<textarea id="txtAdress" name="adress"
																	class="text-muted mb-0 w-100 form-control text-wrap">${diaChi}</textarea>
																<div class="ms-1 text-danger">${errorAdress}</div>
															</c:otherwise>
														</c:choose>
													</div>

													<hr class="my-4 bg-dark">

													<div class="d-flex justify-content-between mb-4 text-dark">
														<p class="mb-2">Tổng tiền :</p>
														<fmt:formatNumber value="${listCart.amount}"
															type="currency" />
													</div>

													<button class="btn btn-secondary btn-block btn-lg">
														<div class="d-flex justify-content-between">
															<span>Đặt hàng <i
																class="fas fa-long-arrow-alt-right ms-2"></i></span>
														</div>
													</button>
												</form>



											</div>
										</div>

									</div>

								</div>

							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col text-center">
							<div>
								<img src="/assets/img/cart-icon.png" alt="avatar"
									class="img-fluid " style="min-width: 150px; max-width: 240px"></i>
							</div>
							<div class="fs-1 mb-3">Bạn chưa có mặt hàng nào trong giỏ
								hàng</div>
							<div class="wow fadeInUp text-center" data-wow-delay="0.1s">
								<a class="btn btn-primary rounded-pill py-3 px-5"
									href="/Gshop/san-pham">Xem sản phẩm</a>
							</div>
						</div>

					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</section>
<!-- Cart End -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<form action="/Gshop/dia-chi?link=cart" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thêm địa chỉ</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<textarea id="txtAdress" name="adress"
						class="text-muted mb-0 w-100 form-control text-wrap"></textarea>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary">Thêm</button>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- <script type="text/javascript">
	function newAdress() {
		var choose = $('#listAdr').find(":selected").val();
		if (choose == 'other') {
			$('#modalAdress').show();
		}

	}
</script> -->