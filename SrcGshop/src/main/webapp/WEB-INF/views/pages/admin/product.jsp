<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="card mb-4 mt-4">
	<div class="card-body">
		<p class="mb-4">
			<span class="text-primary font-italic me-1 h4">Sản phẩm</span>
		</p>
		<c:if test="${mess.equals('active')}">
			<div class="alert ${color}" role="alert">${message}</div>
		</c:if>
		<fr:form name="produck"
			action="/Gshop/quan-li/san-pham/them?page=${listProduct.number}"
			method="post" modelAttribute="product" enctype="multipart/form-data">
			<div class="row d-flex">
				<div class="col-sm-12 col-md-4 text-center">
					<label for="fileChooseImage" class=" col-form-label">Ảnh
						sản phẩm</label>
					<div class="position-relative" id="product-img"
						onclick="$('#fileChooseImage').trigger('click');">
						<c:if test="${sessionScope.loadImg !=null}">
							<c:set var="img" value="${sessionScope.loadImg}" />
						</c:if>
						<c:if test="${sessionScope.loadImg ==null}">
							<c:set var="img" value="none-image.jpg" />
						</c:if>
						<img src="/assets/img/product/${img}" alt="avatar" class="w-100">
					</div>
					<a class="btn-primary btn w-100"
						onclick="$('#fileChooseImage').trigger('click');">Chọn ảnh</a>
					<fr:input type="file" name="product-img" accept="image/*"
						class="form-control visually-hidden" id="fileChooseImage" path="" />

				</div>
				<div class="col-sm-12 col-md-8	">
					<div class="mb-3">
						<label for="txtName" class=" col-form-label ">Tên sản phẩm</label>
						<fr:input type="text" id="txtName" name="name"
							class="text-muted mb-0 w-100 form-control" path="name" />
						<fr:errors path="name" element="span" class="text-danger" />
					</div>
					<div class="mb-3">
						<label for="select" class=" col-form-label ">Loại</label>
						<fr:select path="category" class="form-select">
							<c:forEach items="${listCategory}" var="item1">
								<fr:option value="${item1.id}">${item1.name}</fr:option>
							</c:forEach>
						</fr:select>
					</div>
					<div class="mb-3">
						<label for="txtPrice" class=" col-form-label ">Giá</label>
						<fr:input type="price" id="txtPrice" name="price"
							class="text-muted mb-0 w-100 form-control" path="price" />
						<fr:errors path="price" element="span" class="text-danger" />
					</div>
					<div class="mb-3">
						<label for="txtSale" class=" col-form-label ">Giảm giá</label>
						<fr:input type="text" id="txtSale" name="sale"
							class="text-muted mb-0 w-100 form-control" path="sale" />
						<fr:errors path="sale" element="span" class="text-danger" />
					</div>
					<div class="row mb-3">
						<div class="col-md-8 col-sm-6">
							<label for="txtQuantity" class=" col-form-label ">Giá trị
								định lượng</label>
							<fr:input type="text" id="txtQuantity" name="quantity"
								class="text-muted mb-0 w-100 form-control" path="quantity" />
							<fr:errors path="quantity" element="span" class="text-danger" />
						</div>
						<div class="col-md-4 col-sm-6">
							<label for="select" class=" col-form-label ">Giá trị định
								lượng</label>
							<fr:select path="quantitative" class="form-select">
								<c:forEach items="${listQuantitative}" var="item">
									<fr:option value="${item.id}">${item.name}</fr:option>
								</c:forEach>
							</fr:select>
						</div>
					</div>
					<div class="mb-3">
						<c:if test="${sessionScope.updateProduct !=null}">
							<label for="txtRePassword" class=" col-form-label ">Trạng
								thái </label>
							<div>
								<div class="form-check form-check-inline">
									<fr:radiobutton class="form-check-input" name="available"
										id="activeTrue" value="true" path="available" />
									<label class="form-check-label" for="activeTrue">Còn
										hàng</label>
								</div>
								<div class="form-check form-check-inline">
									<fr:radiobutton class="form-check-input" name="available"
										id="activeFalse" value="false" path="available" />
									<label class="form-check-label" for="activeFalse">Hết
										hàng</label>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="mb-3">
						<label for="txtDescription" class="col-form-label">Mô tả</label>
						<fr:textarea id="txtDescription" name="description"
							path="description"
							class="text-muted mb-0 w-100 form-control text-wrap" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="d-flex ">
						<c:choose>
							<c:when test="${sessionScope.updateProduct !=null}">
								<button class="btn btn-primary ms-auto"
									formaction="/Gshop/quan-li/san-pham/sua/${sessionScope.updateProduct.id}?page=${listProduct.number}">Sửa</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-primary ms-auto ">Tạo</button>
							</c:otherwise>
						</c:choose>
						<a class=" btn btn-secondary ms-2"
							href="/Gshop/quan-li/san-pham?page=${listProduct.number}">Làm
							mới</a>
					</div>

				</div>
			</div>
		</fr:form>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="card mb-4 mb-md-0 wow fadeInUp" data-wow-delay="0.1s">
			<div class="card-body">
				<p class="mb-4">
					<span class="text-primary font-italic me-1 h4">Danh sách</span>

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




