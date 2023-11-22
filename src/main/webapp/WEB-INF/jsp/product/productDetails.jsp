<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="product-box">
		<div class="prod-info-area d-flex">
			<!-- 상품 이미지 영역 -->
			<div class="prod-image">
				<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지"
					width="450">
			</div>
	
			<!-- 상품 정보 영역 -->
			<div class="prod-info">
				<div class="prod-name">
					<span>커피창고 원두커피 200g 3봉</span>
				</div>
				<div class="prod-price d-flex mt-2">
					<span class="origin-price mr-2">
						<strike class="origin-price">21,000</strike>
						<span>원</span>
					</span> <span class="discount-price"> <span><strong>18,900</strong>원</span>
					</span>
				</div>
				<div class="prod-amount-area">
					<div class="prod-amount-box d-flex">
						<div class="title">
							<span>구매 수량</span>
						</div>
						<div class="d-flex">
							<button type="button" class="btn btn-light amount-minus border">
								<img src="/static/img/minus-icon.png" alt="minus" width="23">
							</button>
							<input type="text" class="form-control" id="amount" value="1">
							<button type="button" class="btn btn-light amount-plus border">
								<img src="/static/img/plus-icon.png" alt="plus" width="23">
							</button>
						</div>
					</div>
				</div>
				<div class="prod-order-area">
					<div class="prod-total-price d-flex">
						<span class="pt-1">결제가격</span>
						<div class="order-price">
							<span id="price" data-price="12000">12000</span>
							<span>원</span>
						</div>
					</div>
					<div class="order-button-box d-flex">
						<button type="button" id="addLikeBtn" class="btn">
							<img src="/static/img/full-heart-icon.png" alt="is-product-like">
						</button>
						<button type="button" id="addCartBtn" class="btn btn-lg btn-light">장바구니 담기</button>
						<button type="button" id="orderBtn" class="btn btn-lg btn-danger">결제하기</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 상품 설명, 리뷰, 문의 영역 -->
		<div class="prod-description-area">
			<div class="description-button-area">
				<button type="button" class="btn btn-light btn-lg">상품 설명</button>
				<button type="button" class="btn btn-light btn-lg">리뷰</button>
				<button type="button" class="btn btn-light btn-lg">Q&amp;A</button>
			</div>
			
			<!-- 상품 상세 영역 -->
			<div class="description-area d-none">
				description
			</div>
			
			<!-- 상품 리뷰 영역 -->
			<div class="review-area">
				<div>
					<h2>상품 리뷰</h2>
				</div>
				<div class="d-flex">
					<div>리뷰 평점</div>
					<div>리뷰 수</div>
					<div>평점 비율</div>
				</div>
				<div class="photo-review">
					<div>포토 N건</div>
					<div>사진 리뷰</div>
				</div>
				<hr>
				<div>
					<div>리뷰</div>
					<!-- 한 사용자의 리뷰 -->
					<div>
						<div class="d-flex">
							<div>
								<img src="/static/img/user-profile-icon.png" alt="사용자 기본 프로필 이미지" width="30">
							</div>
							<div class="review-info d-flex">
								<div>
									<div class="d-flex">
										<img src="/static/img/full-star-icon.png" alt="별점" width="30">
										<img src="/static/img/full-star-icon.png" alt="별점" width="30">
										<img src="/static/img/full-star-icon.png" alt="별점" width="30">
										<img src="/static/img/empty-star-icon.png" alt="별점" width="30">
										<img src="/static/img/empty-star-icon.png" alt="별점" width="30">
									</div>
									<div>userId</div>
								</div>
							</div>
							<div>리뷰 작성 날짜</div>
						</div>
						<div>사진</div>
						<div>리뷰 내용</div>
					</div>
				</div>
			</div>
			
			<!-- 상품 문의 영역 -->
			<div class="qna-area d-none">
				description
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