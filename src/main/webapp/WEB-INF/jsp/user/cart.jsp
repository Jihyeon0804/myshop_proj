<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<thead class="text-center">
							<tr>
								<th>
									<input type="checkbox" id="checkedAll">
								</th>
								<th>상품명</th>
								<th>수량</th>
								<th>가격</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${cartSetList}" var="cartSet">
							<tr>
								<td>
									<input type="checkbox" name="check">
								</td>
								<td>
									<div class="d-flex">
										<img src="${cartSet.productThumbnail.imagePath}" alt="장바구니 테스트 이미지" width="100">
										<div class="d-flex align-items-center ml-3">
											<div>
												<span>${cartSet.product.title}</span><br>
												<span>${cartSet.cart.optionId}</span><button class="btn">옵션변경</button>
											</div>
										</div>
									</div>
									
								</td>
								<td>
									<div class="d-flex">
										<button type="button" class="btn btn-light amount-minus border">
											<img src="/static/img/minus-icon.png" alt="minus" width="23">
										</button>
										<input type="text" class="form-control" id="amount" value="${cartSet.cart.amount}">
										<button type="button" class="btn btn-light amount-plus border">
											<img src="/static/img/plus-icon.png" alt="plus" width="23">
										</button>
									</div>
								</td>
								<td>
								<c:if test="${cartSet.product.discountPrice eq 0}">
									<span id="cartPrice" data-price="${cartSet.product.price}">
										<fmt:formatNumber value="${cartSet.product.price * cartSet.cart.amount}" type="number" />원
									</span>
								</c:if>
								<c:if test="${cartSet.product.discountPrice ne 0}">
									<span id="cartPrice" data-price="${cartSet.product.discountPrice}">
										<fmt:formatNumber value="${cartSet.product.discountPrice * cartSet.cart.amount}" type="number" />원
									</span>
								</c:if>
								</td>
								<td>
									<button class="btn btn-lg del-cart-btn" data-cart-id="${cartSet.cart.id}">&times;</button>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	// checkbox toggle
	$('#checkedAll').on('click', function() {
		if ($('#checkedAll').is(':checked')) {
			$('input[name=check]').prop('checked', true);
		} else {
			$('input[name=check]').prop('checked', false);
		}
	});

	// 마이너스 버튼 클릭 시
	$('.amount-minus').on('click', function() {
		let amount = $(this).next().val();
		let prodPrice = $('#price').data('price');
		let changedPrice = $('#price').text();
		if (amount > 1) {
			// 수량 감소
			amount--;
			$(this).next().val(amount);

			// 가격 변동
			changedPrice = prodPrice * amount
			$('#price').text(changedPrice);

		}
	});

	// 플러스 버튼 클릭 시
	$('.amount-plus').on('click', function() {
		let amount = $(this).prev().val();
		let prodPrice = $('#cartPrice').data('price');
		let changedPrice = $('#cartPrice').text();
		if (amount < 10) {
			// 수량 증가
			amount++;
			$(this).prev().val(amount);

			// 가격 변동
			changedPrice = prodPrice * amount
			$('#price').text(changedPrice);
		}
	});
	
	
	// 장바구니 삭제
	$('.del-cart-btn').on('click', function() {
		let cartId = $(this).data('cart-id');
		
		$.ajax({
			// request
			type:"delete"
			,url:"/cart/product-delete"
			,data:{"cartId":cartId}
			
			// response
			,success:function(data) {
				if (data.code == 200) {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error) {
				alert("장바구니 삭제를 실패했습니다. 잠시후 다시 시도해주세요.")
			}
		});
	});
});
</script>