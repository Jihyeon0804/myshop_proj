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
			<div>
				<h4>장바구니</h4>
				<div>
					<table class="table" id="cartTable">
						<thead>
							<tr>
								<th>
									<input type="checkbox">
								</th>
								<th>상품명</th>
								<th>수량</th>
								<th>가격</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input type="checkbox">
								</td>
								<td>
									<div class="d-flex">
										<img src="/static/img/sample-thumbnail.jpg" alt="장바구니 테스트 이미지" width="100">
										<div>
											<span>커피창고 원두커피 200g 3봉</span><br>
											<span>옵션명</span><button class="btn">옵션변경</button>
										</div>
									</div>
									
								</td>
								<td>
									<div class="d-flex">
										<button type="button" class="btn btn-light amount-minus border">
											<img src="/static/img/minus-icon.png" alt="minus" width="23">
										</button>
										<input type="text" class="form-control" id="amount" value="1">
										<button type="button" class="btn btn-light amount-plus border">
											<img src="/static/img/plus-icon.png" alt="plus" width="23">
										</button>
									</div>
								</td>
								<td>
									<fmt:formatNumber value="12000" type="number" />원
								</td>
								<td>
									<button class="btn btn-lg">&times;</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>