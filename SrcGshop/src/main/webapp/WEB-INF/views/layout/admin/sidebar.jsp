<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav id="sidebarMenu"
	class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse ">
	<div class="position-sticky pt-3 ">
		<ul class="nav nav-pills flex-column">
			<li class="nav-item"><a
				class="nav-link <c:if test="${link.contains('nguoi-dung')}">active</c:if>"
				aria-current="page" href="/Gshop/quan-li/nguoi-dung"><i
					class="fas fa-user"></i> Người dùng </a></li>
			<li class="nav-item"><a
				class="nav-link <c:if test="${link.contains('san-pham')}">active</c:if>"
				aria-current="page" href="/Gshop/quan-li/san-pham"><i
					class="fas fa-apple-alt"></i> Sản phẩm </a></li>
			<li class="nav-item"><a
				class="nav-link <c:if test="${link.contains('don-hang')}">active</c:if>"
				aria-current="page" href="/Gshop/quan-li/don-hang"><i
					class="fas fa-money-bill"></i> Đơn hàng </a></li>
		</ul>

		<h6
			class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
			<span>Báo cáo - thống kê</span> </a>
		</h6>
		<ul class="nav flex-column mb-auto">
			<li class="nav-item"><a
				class="nav-link <c:if test="${link.contains('doanh-thu')}">active</c:if>"
				href="/Gshop/quan-li/doanh-thu"> <i class="fas fa-file-invoice"></i>
					Doanh thu
			</a></li>
		</ul>
		<h6
			class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
			<span>Chuyển hướng</span> </a>
		</h6>
		<ul class="nav flex-column ">
			<li class="nav-item"><a class="nav-link text-secondary"
				href="/Gshop/trang-chu"> <i class="fas fa-arrow-left"></i> Về
					trang chủ
			</a></li>
			<li class="nav-item"><a class="nav-link text-secondary"
				href="/Gshop/thong-tin"> <i class="fas fa-arrow-left"></i> Hồ sơ
					cá nhân
			</a></li>
			<li class="nav-item"><a class="nav-link text-secondary"
				href="/Gshop/san-pham"> <i class="fas fa-arrow-left"></i> Sản phẩm
			</a></li>
			<li class="nav-item"><a class="nav-link text-secondary"
				href="/Gshop/dang-xuat"><i class="fas fa-sign-out-alt"></i> Đăng
					xuất </a></li>
		</ul>
	</div>
</nav>