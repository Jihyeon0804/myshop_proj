<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="bg-light">
	<!-- 배너 영역 -->
	<div class="d-flex justify-content-center">
		<div id="carousel" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators m-0">
		    <li data-target="#carousel" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel" data-slide-to="1"></li>
		    <li data-target="#carousel" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="/static/img/slide-1.jpg" class="d-block w-100" alt="carousel1" height="400">
		    </div>
		    <div class="carousel-item">
		      <img src="/static/img/slide-2.jpg" class="d-block w-100" alt="carousel2" height="400">
		    </div>
		    <div class="carousel-item">
		      <img src="/static/img/slide-3.jpg" class="d-block w-100" alt="carousel3" height="400">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-target="#carousel" data-slide="prev">
		    <span class="sr-only">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-target="#carousel" data-slide="next">
		    <span class="sr-only">Next</span>
		  </button>
		</div>
	</div>
	
	<!-- 상품 리스트 -->
	<div class="d-flex justify-content-center">
		<div class="prod-list-area">
			<ul>
				<!-- 상품 1 -->
				<li class="prod-area">
					<div class="prod">
						<div class="prod_thumbnail">
							<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지" width="280">
						</div>
						<div class="prod_detail">
							<b>상품명</b>
							<span>가격</span>
							<span>리뷰 개수, 별점</span>
						</div>
					</div>
				</li>
				<!-- 상품 2 -->
				<li class="prod-area">
					<div class="prod">
						<div class="prod_thumbnail">
							<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지" width="280">
						</div>
						<div class="prod_detail">
							<b>상품명</b>
							<span>가격</span>
							<span>리뷰 개수, 별점</span>
						</div>
					</div>
				</li>
				<!-- 상품 3 -->
				<li class="prod-area">
					<div class="prod">
						<div class="prod_thumbnail">
							<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지" width="280">
						</div>
						<div class="prod_detail">
							<b>상품명</b>
							<span>가격</span>
							<span>리뷰 개수, 별점</span>
						</div>
					</div>
				</li>
				<!-- 상품 4 -->
				<li class="prod-area">
					<div class="prod">
						<div class="prod_thumbnail">
							<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지" width="280">
						</div>
						<div class="prod_detail">
							<b>상품명</b>
							<span>가격</span>
							<span>리뷰 개수, 별점</span>
						</div>
					</div>
				</li>
				<!-- 상품 5 -->
				<li class="prod-area">
					<div class="prod">
						<div class="prod_thumbnail">
							<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지" width="280">
						</div>
						<div class="prod_detail">
							<b>상품명</b>
							<span>가격</span>
							<span>리뷰 개수, 별점</span>
						</div>
					</div>
				</li>
				<!-- 상품 6 -->
				<li class="prod-area">
					<div class="prod">
						<div class="prod_thumbnail">
							<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지" width="280">
						</div>
						<div class="prod_detail">
							<b>상품명</b>
							<span>가격</span>
							<span>리뷰 개수, 별점</span>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</section>