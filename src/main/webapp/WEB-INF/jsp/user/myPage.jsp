<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="d-flex justify-content-center">
	<div class="my-page-area d-flex">
		<!-- 마이페이지 메뉴 영역 -->
		<div class="my-page-menu-list">
			<h3>마이페이지</h3>
			<ul class="nav flex-column">
				<li class="nav-item">
					<button id="myOrder" class="nav-link btn">주문/배송 조회</button>
				</li>
				<li class="nav-item">
					<button id="myCart" class="nav-link btn">장바구니</button>
				</li>
				<li class="nav-item">
					<button id="myPick" class="nav-link btn">찜한 상품</button>
				</li>
				<li class="nav-item">
					<button id="myReview" class="nav-link btn">나의 리뷰</button>
				</li>
				<li class="nav-item">
					<button id="myInfoRevise" class="nav-link btn">내 정보 수정</button>
				</li>
			</ul>
		</div>
		
		<div id="myPageContents" class="my-page-content">
			<div class="d-flex">
				<img src="/static/img/user-profile-icon.png" width="50">
				<div class="d-flex align-items-center ml-3">${userName}</div>
			</div>
			
			<div class="d-flex justify-content-around user-info-box mt-3">
				<div class="user-info">
					<div>등급</div>
					<div>일반</div>
				</div>
				<div class="user-info">
					<div>주문/배송</div>
					<div>N건</div>
				</div>
				<div class="user-info">
					<div>쿠폰</div>
					<div>N개</div>
				</div>
				<div class="user-info">
					<div>포인트</div>
					<div>Np</div>
				</div>
				<div class="user-info">
					<div>리뷰</div>
					<div>N개</div>
				</div>
			</div>
			
			<div class="mt-5">
				<div><h4>최근 주문 내역</h4></div>
				<table class="table text-center">
					<thead>
						<tr>
							<th>주문 일자</th>
							<th>상품명</th>
							<th>수량</th>
							<th>금액</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2023/11/22</td>
							<td>커피창고 원두커피 200g 3봉</td>
							<td>1</td>
							<td><fmt:formatNumber value="12000" type="number"/>원</td>
							<td>배송 완료</td>
						</tr>
						<tr>
							<td>2023/11/25</td>
							<td>커피창고 원두커피 200g 3봉</td>
							<td>4</td>
							<td><fmt:formatNumber value="48000" type="number"/>원</td>
							<td>배송 완료</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	// 주문/배송 조회 버튼 클릭 시
	$('#myOrder').on('click', function() {
		
		$.ajax({
			// request
			url : "/j-coffee/my-page/order-view"
			
			// response
			, success:function(data) {
				$('#myPageContents').html(data);
			}
		});
	});
	
	// 장바구니 버튼 클릭 시
	$('#myCart').on('click', function() {
		
		$.ajax({
			// request
			url : "/j-coffee/my-page/cart-view"
			
			// response
			, success:function(data) {
				$('#myPageContents').html(data);
			}
		});
	});
	
	
	// 찜한 상품 버튼 클릭 시
	$('#myPick').on('click', function() {
		
		$.ajax({
			// request
			url : "/j-coffee/my-page/like-view"
			
			// response
			, success:function(data) {
				$('#myPageContents').html(data);
			}
		});
	});
	
	
	// 나의 리뷰 버튼 클릭 시
	$('#myReview').on('click', function() {
		
		$.ajax({
			// request
			url : "/j-coffee/my-page/review-view"
			
			// response
			, success:function(data) {
				$('#myPageContents').html(data);
			}
		});
	});
	
	// 내 정보 수정 버튼 클릭 시
	$('#myInfoRevise').on('click', function() {
		
		$.ajax({
			// request
			url : "/j-coffee/my-page/info-revise-view"
			
			// response
			, success:function(data) {
				$('#myPageContents').html(data);
			}
		});
	});
});
</script>