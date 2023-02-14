<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi mật khẩu</title>
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

#background-video {
	width: 100vw;
	height: 100vh;
	object-fit: cover;
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: -1;
}
</style>
</head>
<body>

	<video id="background-video" autoplay muted loop>
		<source src="${view}/video/bg1.mp4" type="video/mp4">
	</video>
	<div class="container">
		<div class=" row align-items-center" style="height: 100vh">
			<div class="card col-md-6  p-2  mx-auto "
				style="background: rgba(255, 255, 255, 0.4)">
				<div class="card-body ">
					<div class="fw-bold fs-1 mb-3">Đổi mật khẩu</div>
					<fr:form action="/Gshop/doi-mk" method="post"
						modelAttribute="changePassword">
						<div class="mb-3">
							<div
								class="form-floating border border-5 border-top-0 border-end-0 border-bottom-0 border-primary ">
								<fr:input path="passwordSrc" type="password"
									class="form-control border border-top-5 border-0 rounded-0 shadow-none"
									id="txtPasswordSrc" placeholder="Password" name="passwordSrc" />
								<label for="txtPassword">Mật khẩu ban đầu</label>
								<!-- <span
											class="input-group-text rounded-0 border-white border-0 m-0"
											id="eyeSrc" onclick="show('txtPasswordSrc','eyeSrc')">
											<i class="fa-solid fa-eye"></i>
										</span> -->

							</div>
							<div class="ms-1 text-danger">${errorPasswordSrc}</div>
							<fr:errors path="passwordSrc" element="span" class="text-danger" />
						</div>
						<div class="mb-3">
							<div
								class="form-floating border border-5 border-top-0 border-end-0 border-bottom-0 border-primary ">
								<fr:input type="password" path="password"
									class="form-control border border-top-5 border-0 rounded-0 shadow-none"
									id="txtPassword" placeholder="Password" name="password" />
								<label for="txtPassword">Mật khẩu</label>
								<!--  <span
									class="input-group-text rounded-0 border-white border-0 m-0"
									id="eye" onclick="show('txtPassword','eye')"> <i
									class="fa-solid fa-eye"></i>
								</span> -->
							</div>
							<fr:errors path="password" element="span" class="text-danger" />
						</div>
						<div class="mb-3">
							<div
								class="form-floating border border-5 border-top-0 border-end-0 border-bottom-0 border-primary ">
								<fr:input path="rePassword" type="password"
									class="form-control border border-top-5 border-0 rounded-0 shadow-none"
									id="txtRePassword" placeholder="Password" name="Repassword" />
								<label for="txtRePassword">Nhập lại mật khẩu</label>
								<!-- <span
								class="input-group-text rounded-0 border-white border-0 m-0"
								id="ReEye" onclick="show('txtRePassword','ReEye')"> <i
								class="fa-solid fa-eye"></i>
							</span> -->
							</div>
							<div class="ms-1 text-danger">${errorPassword}</div>
							<fr:errors path="rePassword" element="span" class="text-danger" />
						</div>
						<div class="mb-3">
							<fr:button class="btn btn-secondary fs-3 w-100">Xác nhận</fr:button>
						</div>
					</fr:form>
					<c:choose>
						<c:when test="${sessionScope.account.username == null}">
							<div class="mb-3 text-center">
								<a href="/Gshop/dang-nhap" class="text-decoration-none fw-bold "><svg
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
								<a href="/Gshop/thong-tin" class="text-decoration-none fw-bold "><svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										fill="currentColor" class="bi bi-arrow-left"
										viewBox="0 0 16 16">
  <path fill-rule="evenodd"
											d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
</svg> Quay về</a></span>
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