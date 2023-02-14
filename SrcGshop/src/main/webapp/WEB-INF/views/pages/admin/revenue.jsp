<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row">
	<div class="col-md-12">
		<div class="card mb-4 mb-md-0 wow fadeInUp" data-wow-delay="0.1s">
			<div class="card-body">
				<p class="mb-4">
					<span class="text-primary font-italic me-1 h4">Doanh Thu</span>

				</p>
				<table class="table table-bordered border-dark text-center">
					<thead>
						<tr>
							<th scope="col">Tên sản phẩm</th>
							<th scope="col">Giá</th>
							<th scope="col">Mô tả</th>
							<th scope="col">Ngày tạo</th>
							<th scope="col">Trang thái</th>
							<th scope="col">Ngày tạo</th>
							<th scope="col">Giảm giá</th>
							<th scope="col">Định lượng</th>
							<th scope="col">Sửa</th>
							<th scope="col">Xóa</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listProduct.content}" var="list">
							<tr>
								<th scope="row" class="text-break">${list.name}</th>
								<th scope="row" class="text-break">${list.price}</th>
								<th scope="row" class="text-break">${list.description}</th>
								<th scope="row" class="text-break">${list.createDate}</th>
								<th scope="row" class="text-break"><c:choose>
										<c:when test="${list.available}">
											<span class="text-success">Còn hàng</span>
										</c:when>
										<c:otherwise>
											<span class="text-danger">Hết hàng</span>
										</c:otherwise>
									</c:choose></th>
								<th scope="row" class="text-break"><fmt:formatDate
										pattern="dd-MM-yyyy" value="${list.createDate}" /></th>
								<th scope="row" class="text-break">${list.sale}%</th>
								<th scope="row" class="text-break">${list.quantity}
									${list.quantitative.name}</th>
								<td class="text-center"><a
									href="/Gshop/quan-li/san-pham/sua/${list.id}?page=${listProduct.number}">Sửa</a></td>
								<td class="text-center"><a data-bs-toggle="modal"
									data-bs-target="#removeProductModal" type="button"
									id="${list.id}" class="text-danger" name="${list.name}"
									onclick="getProduct('${list.id}')">Xóa</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link"
							<c:if test="${listProduct.number>0}">href="?page=0"</c:if>>Đầu</a></li>
						<li class="page-item"><a class="page-link"
							<c:if test="${listProduct.number>0}">href="?page=${listProduct.number-1}"</c:if>><<</a></li>
						<li class="page-item"><a class="page-link"
							<c:if test="${listProduct.number<listProduct.totalPages-1}">href="?page=${listProduct.number+1}"</c:if>>>></a></li>
						<li class="page-item"><a class="page-link"
							<c:if test="${listProduct.number<listProduct.totalPages-1}">href="?page=${listProduct.totalPages-1}"</c:if>>Cuối</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- Modal remove Product -->
<div class="modal fade" id="removeProductModal"
	data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">Thông báo quan
					trọng</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" id="noidung"></div>
			<div class="modal-footer">
				<a type="button" class="btn btn-primary" id="xoaProduct">Có</a> <a
					type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</a>

			</div>
		</div>
	</div>
</div>
<!-- custom JS  -->
<script type="text/javascript">
	function getProduct(x) {
		var product = $("#" + x).attr("id");
		var productName = $("#" + x).attr("name");
		$("#noidung").html(
				"<span>Bạn có chắc chắn xóa sản phẩm "
						+ "<span class='text-info'>" + productName + "</span>"
						+ " không ?" + "</span>");
		$("#xoaProduct").attr(
				'href',
				'/Gshop/quan-li/san-pham/xoa/' + product
						+ '?page=${listProduct.number}');
		;

	}
</script>




