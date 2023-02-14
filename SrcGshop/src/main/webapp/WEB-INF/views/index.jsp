<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Gshop - Shop nông sản</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="/ventor/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
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
<style>
/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

/* Firefox */
input[type=number] {
	-moz-appearance: textfield;
}
</style>
</head>

<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<tiles:insertAttribute name="navbar" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />


	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/ventor/lib/wow/wow.min.js"></script>
	<script src="/ventor/lib/easing/easing.min.js"></script>
	<script src="/ventor/lib/waypoints/waypoints.min.js"></script>
	<script src="/ventor/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="/ventor/js/main.js"></script>
	<script>
		$(".cart").hover(function() {
			$(this).css("cursor", "pointer");

		});
		$("#quantitys").on("keyup blur", function() {
			var quantity = $(this).val();
			if (quantity > 99) {
				$(this).val("99");
			} else if (quantity <= 0 || quantity == "") {
				$(this).val("1");
			}
		});
		function vali(x) {
			$("#" + x).on("keyup blur keydown", function() {
				var quantity = $(this).val();
				if (quantity > 99) {
					$(this).val("99");
				} else if (quantity <= 0 || quantity == "") {
					$(this).val("1");
				}
			});
		}
		function plus(x) {
			var quantity = parseInt($("#" + x).val());
			if (quantity > 98) {
				$("#" + x).val("99");
			} else {
				$("#" + x).val(quantity + 1);
			}
		}
		function minus(x) {
			var quantity = parseInt($("#" + x).val());
			if (quantity < 2) {
				$("#" + x).val("1");
			} else {
				$("#" + x).val(quantity - 1);
			}
		}
	</script>
	<script type="text/javascript">
		function edit() {
			var hoTen = document.getElementById("txtHoTen");
			var email = document.getElementById("txtEmail");
			var sdt = document.getElementById("txtPhoneNumber");
			if (hoTen.disabled) {
				hoTen.disabled = false;
				email.disabled = false;
				sdt.disabled = false;
			} else {
				hoTen.disabled = true;
				email.disabled = true;
				sdt.disabled = true;
			}
		}
	</script>
</body>

</html>