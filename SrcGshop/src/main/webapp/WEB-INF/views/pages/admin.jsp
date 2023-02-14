<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Gshop - Quản lí</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="/ventor/img/favicon.ico" rel="icon">

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
<link href="/ventor/lib/animate/animate.min.css" rel="stylesheet">
<link href="/ventor/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/ventor/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/ventor/css/style.css" rel="stylesheet">
<link href="/assets/css/style.css" rel="stylesheet">
</head>
<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->
	<tiles:insertAttribute name="header" />
	<div class="container-fluid">
		<div class="row">
			<tiles:insertAttribute name="sidebar" />
			<div class="col-md-9 ms-sm-auto col-lg-10 px-md-3">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/ventor/lib/wow/wow.min.js"></script>
	<script src="/ventor/lib/easing/easing.min.js"></script>
	<script src="/ventor/lib/waypoints/waypoints.min.js"></script>
	<script src="/ventor/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="/ventor/js/admin/main.js"></script>

	<!-- Template Javascript -->
	<script src="/ventor/js/main.js"></script>

	<!-- Custom Jquery -->
	<c:choose>
		<c:when test="${link.contains('them')}">
			<c:set var="next" value="them" />
		</c:when>
		<c:when test="${link.contains('sua/')}">
			<c:set var="next" value="${link}" />
		</c:when>
		<c:otherwise>
			<c:set var="next" value="null" />
		</c:otherwise>
	</c:choose>
	<script type="text/javascript">
		$('#fileChooseImage')
				.change(
						function() {
							$('form[name=produck]')
									.attr('action',
											'/Gshop/quan-li/san-pham/anh?page=${listProduct.number}&load=${next}');
							$('form').submit();
						});
	</script>

</body>
</html>