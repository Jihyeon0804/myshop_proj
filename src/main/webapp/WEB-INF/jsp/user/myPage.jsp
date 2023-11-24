<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="my-page-area d-flex">
		<!-- 마이페이지 메뉴 영역 -->
		<div class="my-page-menu-list">
			<div><h3>마이페이지</h3></div>
			<ul class="nav flex-column">
				<li class="nav-item">
					<a class="nav-link" href="#">주문/배송 조회</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">장바구니</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">찜한 상품</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">나의 리뷰</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">내 정보 수정</a>
				</li>
			</ul>
		</div>
		<!-- 마이페이지 내용 영역 (동적으로 바뀔 부분) -->
		<div class="my-page-content">
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
		</div>
	</div>
</div>