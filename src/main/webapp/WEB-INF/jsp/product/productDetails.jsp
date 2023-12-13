<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="d-flex justify-content-center">
	<div class="product-box">
		<div class="prod-info-area d-flex">
			<!-- 상품 이미지 영역 -->
			<div class="prod-image">
				<img src="${productSet.productThumbnail.imagePath}" alt="썸네일 테스트 이미지" width="500">
			</div>
	
			<!-- 상품 정보 영역 -->
			<div class="prod-info">
				<div class="prod-name">
					<span>${productSet.product.title}</span>
				</div>
				<!-- 상품 정보 -->
				<table class="product-info-table">
					<tbody>
						<tr>
							<th>식품 유형</th>
							<td>커피</td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>3,000원 (50,000원 이상 구매시 무료)</td>
						</tr>
						<c:if test="${productSet.product.discountPrice ne 0}">
							<tr>
								<th>소비자가</th>
								<td><strike><fmt:formatNumber>${productSet.product.price}</fmt:formatNumber>원</strike></td>
							</tr>
							<tr>
								<th>판매가</th>
								<td><fmt:formatNumber>${productSet.product.discountPrice}</fmt:formatNumber>원</td>
							</tr>
						</c:if>
						<c:if test="${productSet.product.discountPrice eq 0}">
						<tr>
							<th>판매가</th>
							<td><fmt:formatNumber>${productSet.product.price}</fmt:formatNumber>원</td>
						</tr>
						</c:if>
					</tbody>
				</table>
				<!-- 옵션 선택 -->
				<table class="product-option-table">
					<tbody>
						<c:forEach items="${productSet.optionName}" var="option" varStatus="status">
						<tr>
							<th>
								${option.option}
							</th>
							<td>
								<select class="form-control optionSelect" id="selectedOption${status.index}">
									<option selected disabled>옵션을 선택해주세요</option>
								<c:forEach items="${productSet.optionList}" var="options">
								<c:if test="${option.option eq options.option}">
									<option value="#">${options.option_name}</option>
								</c:if>
								</c:forEach>
								</select>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<!--  수량 버튼 -->
				<div class="prod-amount-area">
					<div class="prod-amount-box d-flex">
						<div class="title">
							<span>구매 수량</span>
						</div>
						<div class="d-flex">
							<!--  수량 증가 (최대 10개) -->
							<button type="button" class="btn btn-light amount-minus border">
								<img src="/static/img/minus-icon.png" alt="minus" width="23">
							</button>
							<!-- 수량 -->
							<input type="text" class="form-control" id="amount" value="1">
							<!-- 수량 감소 -->
							<button type="button" class="btn btn-light amount-plus border">
								<img src="/static/img/plus-icon.png" alt="plus" width="23">
							</button>
						</div>
					</div>
				</div>
				<!-- 선택된 옵션 영역 -->
				<div>
					<div class="selected-option-area">
						
					</div>
				</div>
				<!-- 상품 가격 + 찜 + 장바구니 + 결제 영역 -->
				<div class="prod-order-area">
					<div class="prod-total-price d-flex">
						<span class="pt-1">결제가격</span>
						<div class="order-price">
							<span id="price" data-price="${productSet.product.price}"><fmt:formatNumber>${productSet.product.price}</fmt:formatNumber></span>
							<span>원</span>
						</div>
					</div>
					<div class="order-button-box d-flex">
						<!-- 찜하기 버튼 -->
						<c:choose>
							<%-- 좋아요를 누르지 않았을 경우(false) ; 빈하트 : 1) 비로그인 2) 좋아요를 누르지 않았을 경우&&로그인된 상태 --%>
							<c:when test="${likeStatus eq false}">
							<button type="button" id="addLikeBtn" class="btn" data-product-id="${productSet.product.id}">
								<img src="/static/img/empty-heart-icon.png" alt="is-product-like">
							</button>
							</c:when>
							
							<%-- 좋아요를 눌렀을 경우(true) ; 꽉 찬 하트 : 좋아요를 누르지 않았을 경우&&로그인된 상태 --%>
							<c:otherwise>
							<button type="button" id="addLikeBtn" class="btn" data-product-id="${productSet.product.id}">
								<img src="/static/img/full-heart-icon.png" alt="is-product-like">
							</button>
							</c:otherwise>
						</c:choose>
						
						<button type="button" id="addCartBtn" class="btn btn-lg btn-light" data-product-id="${productSet.product.id}">
							장바구니 담기
						</button>
						<button type="button" id="orderBtn" class="btn btn-lg btn-danger" data-product-id="${productSet.product.id}">
							결제하기
						</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 상품 설명, 리뷰, 문의 영역 -->
		<div class="prod-description-area">
			<div class="description-button-area">
				<button type="button" id="descriptionBtn" class="btn btn-light btn-lg">상품 설명</button>
				<button type="button" id="reviewBtn" class="btn btn-light btn-lg" data-product-id="${productSet.product.id}">리뷰</button>
				<button type="button" id="qnaBtn" class="btn btn-light btn-lg" data-product-id="${productSet.product.id}">Q&amp;A</button>
			</div>
			
			<!-- 상품 상세 영역 -->
			<div id="includeArea">
				<jsp:include page="../${detailviewName}.jsp"/>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	
	// 마이너스 버튼 클릭 시
	$('.amount-minus').on('click', function() {
		let amount = $('#amount').val();
		let prodPrice = $('#price').data('price');
		let changedPrice = $('#price').text();
		let regexp = /\B(?=(\d{3})+(?!\d))/g;
		if (amount > 1) {
			// 수량 감소
			amount--;
			$('#amount').val(amount);

			// 가격 변동
			changedPrice = prodPrice * amount
			changedPrice = changedPrice.toString().replace(regexp, ',');
			$('#price').text(changedPrice);

		}
	});

	// 플러스 버튼 클릭 시
	$('.amount-plus').on('click', function() {
		let amount = $('#amount').val();
		let prodPrice = $('#price').data('price');
		let changedPrice = $('#price').text();
		let regexp = /\B(?=(\d{3})+(?!\d))/g;
		if (amount < 10) {
			// 수량 증가
			amount++;
			$('#amount').val(amount);

			// 가격 변동
			changedPrice = prodPrice * amount
			changedPrice = changedPrice.toString().replace(regexp, ',');
			$('#price').text(changedPrice);
		}
	});
	
	// 찜하기 버튼 클릭 시
	$('#addLikeBtn').on('click', function() {
		let productId = $(this).data("product-id");
		
		$.ajax({
			// request
			url:"/like/" + productId
			
			// response
			, success:function(data) {
				if (data.code == 200) {
					location.reload();
				} else if (data.code == 500) {
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error) {
				alert("다시 시도해 주세요");
			}
		});
		
	});
	
	
	// 상품 설명 클릭 시
	$('#descriptionBtn').on('click', function() {
		
		$.ajax({
			// request
			url:"/include/product-detail-view"

			// response
			,success:function(data) {
				$('#includeArea').html(data);
			}
		});
	});
	
	// 리뷰 클릭 시
	$('#reviewBtn').on('click', function() {
		let productId = $(this).data('product-id');
		$.ajax({
			// request
			url:"/include/product-review-view"
			, data:{"productId":productId}

			// response
			,success:function(data) {
				$('#includeArea').html(data);
			}
		});
	});
	
	// 상품 문의 클릭 시
	$('#qnaBtn').on('click', function() {
		let productId = $(this).data('product-id');
		$.ajax({
			// request
			url:"/include/product-qna-view"
			, data:{"productId":productId}
	
			// response
			,success:function(data) {
				$('#includeArea').html(data);
			}
		});
	});
	
	// 옵션 선택
	$('.optionSelect').on('change', function() {
		let selectLength = $('select').length;
		let option = [];
		for (let i = 0; i < selectLength; i++) {
			let selector = '#selectedOption'+ i +' option:selected'
			let selected = $(selector).text();
			option.push(selected);
		}
		if (option.includes('옵션을 선택해주세요') == false && option.length == selectLength) {
			$('.title > span').text(option);
		}
		
	});
	
	// 장바구니 담기
	$('#addCartBtn').on('click', function() {
		let productId = $(this).data('product-id');
		let selectLength = $('select').length;
		let amount = $('#amount').val();
		let option = $('.title > span').text();
		

		if (option == '구매 수량') {
			alert("옵션을 선택해주세요.");
			return;
		}
		
		$.ajax({
			type:"post"
			, url:"/cart/product-add"
			, data:{"productId":productId, "option":option, "amount":amount}
			
			, success:function(data) {
				if (data.code == 200) {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error) {
				alert("장바구니 담기에 실패했습니다. 잠시후 다시 시도해주세요.");
			}
		});
	});
	
	// 결제하기 버튼 클릭 시
	$('#orderBtn').on('click', function() {
		let productId = $(this).data('product-id');
		let option = $('.title > span').text();
		let amount = $('#amount').val();
		let price = $('#price').data('price')
		alert(price);
		if (option == '구매 수량') {
			alert("옵션을 선택해주세요.");
			return;
		}
		
		
		$.ajax({
			type:"post"
			, url:"/order/pay"
			, data:{"productId":productId, "option":option, "amount":amount, "price":price}
			, success:function(data) {
				if (data.code == 200) {
					location.href="/site-name/order"
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error) {
				alert("잠시후 다시 시도해주세요.");
			}
		});
	});
});
</script>