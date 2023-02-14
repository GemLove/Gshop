<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Đăng nhập</title>
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
		<div class=" row align-items-center " style="height: 100vh">
			<div class="card col-md-6  p-2  mx-auto "
				style="background: rgba(255, 255, 255, 0.4)">
				<div class="card-body text-dark">
					<div class="fw-bold fs-1 mb-1 text-primary">
						Đăng nhập <a href="/Gshop/trang-chu" class="text-secondary"> <svg
								xmlns="http://www.w3.org/2000/svg" class="float-end" width="60"
								height="60" fill="currentColor" class="bi bi-x"
								viewBox="0 0 16 16">
  <path
									d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
</svg></a>
					</div>
					<fr:form action="/Gshop/dang-nhap" modelAttribute="user"
						method="post">
						<span class="text-danger">${message}</span>
						<div class="mb-3">
							<div
								class="form-floating border border-5 border-top-0 border-end-0 border-bottom-0 border-primary mt-2">
								<fr:input path="username" type="text"
									class="form-control  border-0 rounded-0 shadow-none"
									id="txtUsername" placeholder="Username" name="username"
									autocomplete="off" value="${username}" />
								<label for="txtUsername">Tên đăng nhập hoặc Email</label>
							</div>
							<fr:errors path="username" element="span" class="text-danger" />
						</div>
						<div class="mb-3">
							<div
								class="form-floating border border-5 border-top-0 border-end-0 border-bottom-0 border-primary ">
								<fr:input path="password" type="password"
									class="form-control border-0  rounded-0 shadow-none"
									id="txtPassword" placeholder="Password" name="password"
									value="${password}" />
								<label for="txtPassword">Mật khẩu</label>
								<!-- <span
								class="input-group-text bg-dark bg-opacity-75 text-white rounded-0 border-white border-0 m-0"
								id="eye" onclick="show('txtPassword','eye')"> <i
								class="fa-solid fa-eye"></i>
							</span> -->
							</div>
							<fr:errors path="password" element="span" class="text-danger" />
						</div>
						<div class="mb-3 form-check fs-5">
							<input type="checkbox" class="form-check-input" id="chckRemember"
								name="remember"
								<c:if test="${remember == 'on'}">checked="checked"</c:if>>
							<label class="form-check-label" for="chckRemember">Ghi
								nhớ tài khoản?</label> <a href="/Gshop/quen-mk"
								class="text-decoration-none  float-end"> Quên mật khẩu ?</a>
						</div>
						<div class="mb-3">
							<button class="btn btn-secondary fs-3 w-100">Đăng nhập</button>
						</div>
						<div class="mb-3 text-center">
							<span class="text-muted lead">Bạn chưa có tài khoản ?<a
								href="/Gshop/dang-ky" class="text-decoration-none  fw-bold ">
									Đăng ký ngay.</a></span>
						</div>
					</fr:form>
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