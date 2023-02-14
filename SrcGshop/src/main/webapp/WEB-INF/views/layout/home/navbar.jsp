<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Navbar Start -->
<div class="container-fluid fixed-top px-0 wow fadeIn"
	data-wow-delay="0.1s">
	<div class="top-bar row gx-0 align-items-center d-none d-lg-flex">
		<div class="col-lg-6 px-5 text-start">
			<small><i class="fa fa-map-marker-alt me-2"></i>288 Đường
				Nguyễn Văn Linh, Hưng Lợi, Ninh Kiều, Cần Thơ</small> <small class="ms-4"><i
				class="fa fa-envelope me-2"></i>locttpc01615@gmail.edu.vn</small>
		</div>
		<div class="col-lg-6 px-5 text-end">
			<small>Theo dõi:</small> <a class="text-body ms-3"
				href="https://www.facebook.com/CDFPTCT"><i
				class="fab fa-facebook-f"></i></a>
			<!-- <a class="text-body ms-3" href="">
				 <i
						class="fab fa-twitter"></i></a> <a class="text-body ms-3" href=""><i
						class="fab fa-linkedin-in"></i></a> <a class="text-body ms-3" href=""><i
						class="fab fa-instagram"></i></a> -->
		</div>
	</div>

	<nav
		class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn"
		data-wow-delay="0.1s">
		<h1 class="fw-bold text-primary m-0">
			G<span class="text-secondary">shop</span>
		</h1>
		<button type="button" class="navbar-toggler me-4"
			data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav ms-auto p-4 p-lg-0">
				<a href="/Gshop/trang-chu"
					class="nav-item nav-link <c:if test="${tt.equals('home') }">active</c:if>">Trang
					chủ</a> <a href="/Gshop/lien-he"
					class="nav-item nav-link <c:if test="${tt.equals('contact') }">active</c:if>">Liên
					hệ</a> <a href="/Gshop/san-pham"
					class="nav-item nav-link <c:if test="${tt.equals('product') }">active</c:if>">Sản
					phẩm</a>
				<div class="nav-item dropdown">
					<c:choose>
						<c:when test="${sessionScope.account.username == null}">
							<a href="#" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown">Tài khoản</a>
						</c:when>
						<c:otherwise>
							<a href="#" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown">Xin Chào,
								${sessionScope.account.fullname}</a>
						</c:otherwise>
					</c:choose>
					<div class="dropdown-menu m-0 w-100">
						<c:choose>
							<c:when test="${sessionScope.account.username == null}">
								<a href="/Gshop/dang-nhap" class="dropdown-item">Đăng nhập </a>
								<a href="/Gshop/dang-ky" class="dropdown-item">Đăng ký</a>
							</c:when>
							<c:otherwise>
								<c:if test="${sessionScope.account.admin == true}">
									<a href="/Gshop/quan-li/nguoi-dung" class="dropdown-item">Quản
										lí</a>
								</c:if>
								<a href="/Gshop/doi-mk" class="dropdown-item">Đổi mật khẩu</a>
								<a href="/Gshop/thong-tin" class="dropdown-item">Hồ sơ cá
									nhân</a>
								<a href="/Gshop/dang-xuat" class="dropdown-item">Đăng xuất</a>
							</c:otherwise>
						</c:choose>
						<a href="/Gshop/quen-mk" class="dropdown-item">Quên mật khẩu ?</a>

					</div>
				</div>
			</div>
			<div class="d-none d-lg-flex ms-2">
				<!-- <a class="btn-sm-square bg-white rounded-circle ms-3" href="">
						<small class="fa fa-search text-body"></small> -->
				<!-- 		</a> <a class="btn-sm-square bg-white rounded-circle ms-3" href="">
						<small class="fa fa-user text-body"></small>	</a>  -->
				<a
					class="btn-sm-square bg-white rounded-circle ms-3 position-relative"
					href="/Gshop/gio-hang"> <c:if test="${listCart.count>0}">
						<span
							class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
							${listCart.count}<span class="visually-hidden">unread
								messages</span>
						</span>
					</c:if> <small class="fa fa-shopping-bag text-body"></small>

				</a>
			</div>
		</div>
	</nav>
</div>
<!-- Navbar End -->