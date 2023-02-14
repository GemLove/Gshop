<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="../ventor/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Lora:wght@600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../ventor/lib/animate/animate.min.css" rel="stylesheet">
<link href="../ventor/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="../ventor/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../ventor/css/style.css" rel="stylesheet">
<style type="text/css">
body {
	background-image: url("../assets/img/carousel-1.jpg");
	background-size: cover;
	height: 100vh;
	padding: 0;
	margin: 0;
}
</style>
</head>
<body>
	<div class="container">
		<div class=" row align-items-center text-white" style="height: 100vh">
			<div class="card col-md-6 p-2 text-dark mx-auto "
				style="background: rgba(255, 255, 255, 0.4)">
				<div class="card-body ">
					<div class="fw-bold fs-1 mb-3 text-primary">Quên mật khẩu</div>
					<form action="/Gshop/quen-mk" method="post">
						<div class="mb-3">
							<div
								class="form-floating border border-5 border-top-0 border-end-0 border-bottom-0 border-primary ">
								<input type="email"
									class="form-control border border-top-5 border-0 rounded-0 shadow-none"
									id="txtEmail" placeholder="Password" name="email"
									value="${param.email}" autocomplete="off"> <label
									for="txtEmail">Email</label>
							</div>
							<div class="ms-1 text-danger">${errorEmail}</div>
						</div>
						<%-- <div class="mb-3">
							<div
								class="form-floating border border-5 border-top-0 border-end-0 border-bottom-0 border-primary ">
								<input type="text"
									class="form-control border-0 rounded-0 shadow-none"
									id="txtUsername" placeholder="Username" name="username"
									value="${sessionScope.account.username}" autocomplete="off">
								<label for="txtUsername">Tên đăng nhập</label>
							</div>
							<div class="ms-1 text-danger">${errorUser}</div>
						</div>--%>
						<div class="mb-3">
							<button class="btn btn-secondary fs-3 w-100"
								formaction="/Gshop/quen-mk">Lấy lại mật khẩu</button>
						</div>
					</form>
					<c:choose>
						<c:when test="${sessionScope.account.username == null}">
							<div class="mb-3 text-center">
								<a href="/Gshop/dang-nhap"
									class="text-decoration-none text-primary fw-bold "><svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										fill="currentColor" class="bi bi-arrow-left"
										viewBox="0 0 16 16">
  <path fill-rule="evenodd"
											d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
</svg> Quay về đăng nhập</a></span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="mb-3 text-center">
								<a href="/Gshop/trang-chu"
									class="text-decoration-none text-primary fw-bold "><svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										fill="currentColor" class="bi bi-arrow-left"
										viewBox="0 0 16 16">
  <path fill-rule="evenodd"
											d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
</svg> Quay về trang chủ</a></span>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../ventor/lib/wow/wow.min.js"></script>
	<script src="../ventor/lib/easing/easing.min.js"></script>
	<script src="../ventor/lib/waypoints/waypoints.min.js"></script>
	<script src="../ventor/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="../ventor/js/main.js"></script>

</body>
</html>