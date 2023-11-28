<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- 내가 만든 스타일시트 -->
<link rel="stylesheet" type="text/css" href="/static/css/style.css">

<!-- favicon 설정 -->
<link rel="icon" type="image/png" sizes="32x32" href="/static/img/coffee-icon.png">
</head>
<body>
	<div id="wrap">
		<header class="bg-warning">
			<div class="util-area">
				<ul>
					<c:if test="${not empty userName}">
						<li><a href="/site-name/my-page/${userName}">${userName} 님</a></li>
						<li><a href="/user/sign-out">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
			<div class="logo-area ml-5">
				<a href="/admin/main" id="logoTitle">LOGO</a>
				<span>ADMIN</span>
			</div>
		</header>
		<section class="d-flex">
			<div class="admin-box">
				<div class="admin-menu-list">
					<span>관리자 페이지</span>
					<ul class="nav flex-column">
						<li class="nav-item">
							<button id="userManagement" class="nav-link btn">회원 관리</button>
						</li>
						<li class="nav-item">
							<button id="orderManagement" class="nav-link btn">주문 관리</button>
						</li>
						<li class="nav-item">
							<button id="productManagement" class="nav-link btn">상품 관리</button>
						</li>
						<li class="nav-item">
							<button id="clientManagement" class="nav-link btn">고객 문의</button>
						</li>
					</ul>
				</div>
				<div id="adminContents">
					<div class="d-flex site-info">
						<div class="info-box">
							<div>
								<div>
									<img src="/static/img/admin-user-icon.png" width="30">
								</div>
								<div class="info-title">회원 수</div>
								<div class="info-amount">${fn:length(userList)}</div>
							</div>
						</div>
						<div class="info-box">
							<div>
								<div>
									<img src="/static/img/admin-order-icon.png" width="30">
								</div>
								<div class="info-title">주문 건수</div>
								<div class="info-amount">N</div>
							</div>
						</div>
						<div class="info-box">
							<div>
								<div>
									<img src="/static/img/admin-inquiry-icon.png" width="30">
								</div>
								<div class="info-title">고객 문의</div>
								<div class="info-amount">N</div>
							</div>
						</div>
						<div class="info-box">
							<div>
								<div>
									<img src="/static/img/admin-amount-icon.png" width="30">
								</div>
								<div class="info-title">총 매출액</div>
								<div class="info-amount">N</div>
							</div>
						</div>
					</div>
					<div>
						<h4>최근 주문 내역</h4>
						<table class="table text-center">
							<thead>
								<tr>
									<th>상품번호</th>
									<th>주문자 아이디</th>
									<th>주문자명</th>
									<th>가격</th>
									<th>요청사항</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
		<footer class="bg-success">
			<jsp:include page="../include/footer.jsp" />
		</footer>
	</div>
</body>

<script>
$(document).ready(function() {
	// 회원 관리 버튼 클릭 시
	$('#userManagement').on('click', function() {
		// ajax
		$.ajax({
			// request
			url:"/admin/user"
			// response
			,success:function(data) {
				$('#adminContents').html(data);
			}
		});
	});
	
	// 주문 관리 버튼 클릭 시
	$('#orderManagement').on('click', function() {
		// ajax
		$.ajax({
			// request
			url:"/admin/order"
			// response
			,success:function(data) {
				$('#adminContents').html(data);
			}
		});
	});
	
	// 상품 관리 버튼 클릭 시
	$('#productManagement').on('click', function() {
		// ajax
		$.ajax({
			// request
			url:"/admin/product"
			// response
			,success:function(data) {
				$('#adminContents').html(data);
			}
		});
	});
	
	// 고객 문의 버튼 클릭 시
	$('#clientManagement').on('click', function() {
		// ajax
		$.ajax({
			// request
			url:"/admin/inquiry"
			// response
			,success:function(data) {
				$('#adminContents').html(data);
			}
		});
	});

});
</script>

</html>