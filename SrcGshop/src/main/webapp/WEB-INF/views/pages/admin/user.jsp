<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>

<div class="card mb-4 mt-4">
	<div class="card-body">
		<p class="mb-4">
			<span class="text-primary font-italic me-1 h4">Tài khoản người
				dùng</span>
		</p>
		<c:if test="${mess.equals('active')}">
			<div class="alert ${color}" role="alert">${message}</div>
		</c:if>
		<fr:form
			action="/Gshop/quan-li/nguoi-dung/them?page=${listUser.number}"
			method="post" modelAttribute="signUp">
			<div class="row d-flex">
				<div class="col-sm-6 ">
					<div class="mb-3">
						<label for="txtUsername" class=" col-form-label ">Tên đăng
							nhập</label>
						<c:if test="${sessionScope.updateUser !=null}">
							<fr:input type="text" id="txtUsername" name="username"
								class="text-muted mb-0 w-100 form-control" path="username"
								readonly="true" />
						</c:if>
						<c:if test="${sessionScope.updateUser ==null}">
							<fr:input type="text" id="txtUsername" name="username"
								class="text-muted mb-0 w-100 form-control" path="username" />
						</c:if>
						<div class="ms-1 text-danger">${errorUser}</div>
						<fr:errors path="username" element="span" class="text-danger" />
					</div>
					<div class="mb-3">
						<label for="txtPassword" class=" col-form-label ">Mật khẩu</label>
						<fr:input type="password" id="txtPassword" name="password"
							class="text-muted mb-0 w-100 form-control" path="password" />
						<fr:errors path="password" element="span" class="text-danger" />
					</div>
					<div class="mb-3">
						<label for="txtRePassword" class=" col-form-label ">Nhập
							lại mật khẩu</label>
						<fr:input type="password" id="txtRePassword" name="rePassword"
							class="text-muted mb-0 w-100 form-control" path="rePassword" />
						<div class="ms-1 text-danger">${errorRePassword}</div>
						<fr:errors path="rePassword" element="span" class="text-danger" />
					</div>
					<div class="mb-3">
						<label for="txtRePassword" class=" col-form-label ">Vai
							trò </label>
						<div>
							<div class="form-check form-check-inline">
								<fr:radiobutton class="form-check-input" name="admin"
									id="adminTrue" value="true" path="admin" />
								<label class="form-check-label" for="adminTrue">Quản lí</label>
							</div>
							<div class="form-check form-check-inline">
								<fr:radiobutton class="form-check-input" name="admin"
									id="adminFalse" value="false" path="admin" />
								<label class="form-check-label" for="adminFalse">Người
									dùng</label>
							</div>
						</div>
					</div>

				</div>
				<div class="col-sm-6">
					<div class="mb-3">
						<label for="txtFullname" class=" col-form-label ">Họ và
							tên</label>
						<fr:input type="text" id="txtFullname" name="fullname"
							class="text-muted mb-0 w-100 form-control" path="fullname" />
						<fr:errors path="fullname" element="span" class="text-danger" />
					</div>
					<div class="mb-3">
						<label for="txtEmail" class=" col-form-label ">Email</label>
						<fr:input type="email" id="txtEmail" name="email"
							class="text-muted mb-0 w-100 form-control" path="email" />
						<div class="ms-1 text-danger">${errorEmail}</div>
						<fr:errors path="email" element="span" class="text-danger" />
					</div>
					<div class="mb-3">
						<label for="txtNumberphone" class=" col-form-label ">Số
							điện thoại</label>
						<fr:input type="text" id="txtNumberphone" name="numberphone"
							class="text-muted mb-0 w-100 form-control" path="numberphone" />
						<div class="ms-1 text-danger">${errorNumber}</div>
						<fr:errors path="numberphone" element="span" class="text-danger" />
					</div>

					<div class="mb-3">
						<c:if test="${sessionScope.updateUser !=null}">
							<label for="txtRePassword" class=" col-form-label ">Trạng
								thái </label>
							<div>
								<div class="form-check form-check-inline">
									<fr:radiobutton class="form-check-input" name="active"
										id="activeTrue" value="true" path="active" />
									<label class="form-check-label" for="activeTrue">Đang
										hoạt động</label>
								</div>
								<div class="form-check form-check-inline">
									<fr:radiobutton class="form-check-input" name="active"
										id="activeFalse" value="false" path="active" />
									<label class="form-check-label" for="activeFalse">Ngừng
										hoạt động</label>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="d-flex ">
						<c:choose>
							<c:when test="${sessionScope.updateUser !=null}">
								<button class="btn btn-primary ms-auto"
									formaction="/Gshop/quan-li/nguoi-dung/sua/${sessionScope.updateUser.username}?page=${listUser.number}">Sửa</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-primary ms-auto ">Tạo</button>
							</c:otherwise>
						</c:choose>
						<a class=" btn btn-secondary ms-2"
							href="/Gshop/quan-li/nguoi-dung?page=${listUser.number}">Làm
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
				<table class="table table-bordered border-dark">
					<thead>
						<tr>
							<th scope="col">Tên đăng nhập</th>
							<th scope="col">Họ và tên</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Email</th>
							<th scope="col">Vai trò</th>
							<th scope="col">Trạng thái</th>
							<th scope="col" class="text-center">Sửa</th>
							<th scope="col" class="text-center">Xóa</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listUser.content}" var="list">
							<tr>
								<th scope="row" class="text-break">${list.username}</th>
								<th scope="row" class="text-break">${list.fullname}</th>
								<th scope="row" class="text-break">${list.numberphone}</th>
								<th scope="row" class="text-break">${list.email}</th>
								<th scope="row" class="text-break"><c:choose>
										<c:when test="${list.admin}">
											<span class="text-info">Quản lí</span>
										</c:when>
										<c:otherwise>
											<span>Người dùng</span>
										</c:otherwise>
									</c:choose></th>
								<th scope="row" class="text-break"><c:choose>
										<c:when test="${list.active}">
											<span class="text-success">Đang hoạt động</span>
										</c:when>
										<c:otherwise>
											<span class="text-danger"> Ngừng hoạt động</span>
										</c:otherwise>
									</c:choose></th>
								<td class="text-center"><a
									href="/Gshop/quan-li/nguoi-dung/sua/${list.username}?page=${listUser.number}">Sửa</a></td>
								<td class="text-center"><a data-bs-toggle="modal"
									data-bs-target="#removeUserModal" type="button"
									id="${list.username}" class="text-danger"
									onclick="getUsername('${list.username}')">Xóa</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link"
							<c:if test="${listUser.number>0}">href="?page=0"</c:if>>Đầu</a></li>
						<li class="page-item"><a class="page-link"
							<c:if test="${listUser.number>0}">href="?page=${listUser.number-1}"</c:if>><<</a></li>
						<li class="page-item"><a class="page-link"
							<c:if test="${listUser.number<listUser.totalPages-1}">href="?page=${listUser.number+1}"</c:if>>>></a></li>
						<li class="page-item"><a class="page-link"
							<c:if test="${listUser.number<listUser.totalPages-1}">href="?page=${listUser.totalPages-1}"</c:if>>Cuối</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- Modal remove user -->
<div class="modal fade" id="removeUserModal" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
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
				<a type="button" class="btn btn-primary" id="xoaUser">Có</a> <a
					type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</a>

			</div>
		</div>
	</div>
</div>
<!-- custom JS  -->
<script type="text/javascript">
	function getUsername(x) {
		var username = $("#" + x).attr("id");
		$("#noidung").html(
				"<span>Bạn có chắc chắn xóa tài khoản "
						+ "<span class='text-info'>" + username + "</span>"
						+ " không ?" + "</span>");
		$("#xoaUser").attr(
				'href',
				'/Gshop/quan-li/nguoi-dung/xoa/' + username
						+ '?page=${listUser.number}');
		;

	}
</script>


