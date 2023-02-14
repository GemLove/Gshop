<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- Page Header Start -->
<div class="container-fluid page-header mb-5 wow fadeIn"
	data-wow-delay="0.1s">
	<div class="container">
		<h1 class="display-3 mb-3 animated slideInDown">Hồ sơ cá nhân</h1>
		<!-- 		<small>Quản lí thông tin cá nhân của bạn </small> -->
	</div>
</div>
<!-- Page Header End -->
<!-- Profile Start -->
<section>
	<div class="container">
		<div class="section-header text-center mx-auto mb-5 wow fadeInUp"
			data-wow-delay="0.1s"
			style="max-width: 500px; visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
			<h1 class="display-5 mb-3">Thông tin cá nhân</h1>
			<p>Chỉnh sửa các thông tin mà bạn muốn :)</p>
		</div>

		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4 wow slideInLeft" data-wow-delay="0.1s">
					<div class="card-body text-center">
						<img src="/assets/img/user/${sessionScope.account.photo}"
							alt="avatar" class="rounded-circle img-fluid "
							style="width: 150px;">
						<h5 class="my-3">${sessionScope.account.fullname}</h5>
						<p class="text-muted mb-4">-${sessionScope.account.username}-</p>
						<!-- 							<p class="text-muted mb-4">Bay Area, San Francisco, CA</p> -->
						<!-- 	<div class="d-flex justify-content-center mb-2">
								<button type="button" class="btn btn-primary">Follow</button>
								<button type="button" class="btn btn-outline-primary ms-1">Message</button>
							</div> -->
					</div>
				</div>
				<!-- <div class="card mb-4 mb-lg-0">
						<div class="card-body p-0">
							<ul class="list-group list-group-flush rounded-3">
								<li
									class="list-group-item d-flex justify-content-between align-items-center p-3">
									<i class="fas fa-globe fa-lg text-warning"></i>
									<p class="mb-0">https://mdbootstrap.com</p>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center p-3">
									<i class="fab fa-github fa-lg" style="color: #333333;"></i>
									<p class="mb-0">mdbootstrap</p>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center p-3">
									<i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
									<p class="mb-0">@mdbootstrap</p>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center p-3">
									<i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
									<p class="mb-0">mdbootstrap</p>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center p-3">
									<i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
									<p class="mb-0">mdbootstrap</p>
								</li>
							</ul>
						</div> 
					</div>-->
				<div class="card mb-4 mb-lg-0 wow fadeInUp" data-wow-delay="0.1s">
					<div class="card-body p-2">
						<c:choose>
							<c:when test="${set!='update'}">
								<p class="mb-4">
									<span class="text-primary font-italic me-1 h4">Thêm địa
										chỉ</span>
								</p>
								<fr:form action="/Gshop/dia-chi" method="post"
									modelAttribute="Adress">
									<div class="row">
										<div class="col-sm-3">
											<label for="txtAdress" class=" col-form-label ">Địa
												chỉ</label>
										</div>
										<div class="col-sm-9">
											<textarea id="txtAdress" name="adress"
												class="text-muted mb-0 w-100 form-control text-wrap">${diaChi}</textarea>
											<div class="ms-1 text-danger">${errorAdress}</div>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-12">
											<div class="float-end">

												<button class="btn btn-primary me-2">Thêm</button>
											</div>
										</div>
									</div>
								</fr:form>
							</c:when>
							<c:when test="${set=='update'}">
								<p class="mb-4">
									<span class="text-primary font-italic me-1 h4">Sửa địa
										chỉ</span>
								</p>
								<fr:form action="/Gshop/dia-chi/${ma}" method="post"
									modelAttribute="Adress">
									<div class="row">
										<div class="col-sm-3">
											<label for="txtAdress" class=" col-form-label ">Địa
												chỉ</label>
										</div>
										<div class="col-sm-9">
											<textarea id="txtAdress" name="adress"
												class="text-muted mb-0 w-100 form-control text-wrap">${diaChi}</textarea>
											<div class="ms-1 text-danger">${errorAdress}</div>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-12">
											<div class="float-end">
												<button class="btn btn-primary me-2">Sửa</button>
												<a class="btn btn-primary me-2" href="/Gshop/thong-tin">Reset</a>
											</div>
										</div>
									</div>
								</fr:form>
							</c:when>
						</c:choose>

					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="card mb-4 wow slideInRight" data-wow-delay="0.1s">
					<div class="card-body">
						<fr:form action="/Gshop/thong-tin" method="post"
							modelAttribute="profile">
							<div class="row">
								<div class="col-sm-3">
									<label for="txtUsername" class=" col-form-label ">Tên
										đăng nhập</label>
								</div>
								<div class="col-sm-9">
									<input type="text" id="txtUsername" name="username"
										class="text-muted mb-0 w-100 form-control"
										value="${sessionScope.account.username}" disabled="disabled" />
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<label for="txtHoTen" class=" col-form-label ">Họ và
										tên</label>
								</div>
								<div class="col-sm-9">
									<fr:input path="fullname" type=" text" id="txtHoTen"
										name="fullname" class="text-muted mb-0 w-100 form-control" />
									<fr:errors path="fullname" element="span" class="text-danger" />
								</div>

							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<label for="txtEmail" class=" col-form-label ">Email</label>
								</div>
								<div class="col-sm-9">
									<fr:input path="email" type="email" id="txtEmail" name="email"
										class="text-muted mb-0 w-100 form-control" />
									<div class="ms-1 text-danger">${errorEmail}</div>
									<fr:errors path="email" element="span" class="text-danger" />
								</div>

							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<label for="txtPhoneNumber" class=" col-form-label ">Số
										điện thoại</label>
								</div>
								<div class="col-sm-9">
									<fr:input path="numberphone" type="text" id="txtNumberPhone"
										name="sdt" class="text-muted mb-0 w-100 form-control" />
									<div class="ms-1 text-danger">${errorNumber}</div>
									<fr:errors path="numberphone" element="span"
										class="text-danger" />
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-12">
									<div class="float-end">
										<button class="btn btn-primary float-end ">Sửa</button>
										<a class="btn btn-secondary me-2" href="/Gshop/doi-mk">Đổi
											mật khẩu</a>
									</div>

								</div>
							</div>

						</fr:form>
					</div>
				</div>
				<div class="row">
					<!-- <div class="col-md-6">
							<div class="card mb-4 mb-md-0">
								<div class="card-body">
									<p class="mb-4">
										<span class="text-primary font-italic me-1">assigment</span>
										Project Status
									</p>
									<p class="mb-1" style="font-size: .77rem;">Web Design</p>
									<div class="progress rounded" style="height: 5px;">
										<div class="progress-bar" role="progressbar"
											style="width: 80%" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<p class="mt-4 mb-1" style="font-size: .77rem;">Website
										Markup</p>
									<div class="progress rounded" style="height: 5px;">
										<div class="progress-bar" role="progressbar"
											style="width: 72%" aria-valuenow="72" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
									<div class="progress rounded" style="height: 5px;">
										<div class="progress-bar" role="progressbar"
											style="width: 89%" aria-valuenow="89" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<p class="mt-4 mb-1" style="font-size: .77rem;">Mobile
										Template</p>
									<div class="progress rounded" style="height: 5px;">
										<div class="progress-bar" role="progressbar"
											style="width: 55%" aria-valuenow="55" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
									<div class="progress rounded mb-2" style="height: 5px;">
										<div class="progress-bar" role="progressbar"
											style="width: 66%" aria-valuenow="66" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div> -->

					<div class="col-md-12">
						<div class="card mb-4 mb-md-0 wow fadeInUp" data-wow-delay="0.1s">
							<div class="card-body">
								<p class="mb-4">
									<span class="text-primary font-italic me-1 h4">Danh sách</span>

								</p>
								<table class="table">
									<thead>
										<tr>
											<th scope="col">Địa chỉ</th>
											<th scope="col" class="text-end">Sửa</th>
											<th scope="col" class="text-end">Xóa</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listAdress}" var="list">
											<tr>

												<th scope="row" class="text-break">${list.adress}</th>
												<td class="text-end"><a
													href="/Gshop/dia-chi/${list.adressId}">Sửa</a></td>
												<c:if test="${listAdress.size() !=1}">
													<td class="text-end"><a
														href="/Gshop/dia-chi?set=delete&id=${list.adressId}"
														class="text-danger">Xóa</a></td>
												</c:if>
												<!-- 												<td class="text-end "><a class="text-secondary"
													href="?adr=true">Mặc định </a></td> -->
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4 mb-md-0 ">
					<div class="card-body">
						<p class="mb-4">
							<span class="text-primary font-italic me-1 h4">Danh sách
								đơn hàng</span>

						</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Địa chỉ</th>
									<th scope="col">Ngày đặt</th>
									<th scope="col">Trạng thái</th>
									<th scope="col">Xem</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listOrder}" var="list">
									<tr>
										<td scope="row" class="text-break">${list.adress}</td>
										<td scope="row" class="text-break">${list.createDate}</td>
										<td scope="row" class="text-break"><c:choose>
												<c:when test="${list.status}">
													<span class="text-success">Đã thanh toán</span>
												</c:when>
												<c:otherwise>
													<span class="text-danger">Chưa thanh toán</span>
												</c:otherwise>
											</c:choose></td>
										<td scope="row" class="text-break"><a>Xem</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Profile End -->
