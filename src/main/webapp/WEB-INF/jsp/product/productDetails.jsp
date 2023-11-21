<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="prod-info-area d-flex">
	<!-- 상품 이미지 영역 -->
	<div class="prod-image">
		<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지" width="550">
	</div>
	
	<!-- 상품 정보 영역 -->
	<div class="prod-info">
		<div class="prod-name">
			<span>상품명</span>
		</div>
		<div class="prod-price">
			<span>가격</span>
		</div>
		<div class="prod-amount d-flex">
		   <button type="button" class="btn btn-light amount-minus">-</button>
		   <input type="text" class="form-control col-2" id="amount" value="1">
		   <button type="button" class="btn btn-light amount-plus">+</button>
		</div>
		<div class="prod-order-area">
			<div class="prod-total-price">
				<span id="price" data-price="12000">12000</span>
				<span>원</span>
			</div>
			<button type="button" class="btn btn-danger">결제하기</button>
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
		if (amount > 1) {
			// 수량 감소
			amount--;
			$('#amount').val(amount);
			
			// 가격 변동
			changedPrice = prodPrice * amount
			$('#price').text(changedPrice);
			
		}
	});
	
	// 플러스 버튼 클릭 시
	$('.amount-plus').on('click', function() {
		let amount = $('#amount').val();
		let prodPrice = $('#price').data('price');
		let changedPrice = $('#price').text();
		if (amount < 10) {
			// 수량 증가
			amount++;
			$('#amount').val(amount);
			
			// 가격 변동
			changedPrice = prodPrice * amount
			$('#price').text(changedPrice);
		}
	});
});
</script>