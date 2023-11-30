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
				<li data-target="#carousel" data-slide-to="3"></li>
				<li data-target="#carousel" data-slide-to="4"></li>
				<li data-target="#carousel" data-slide-to="5"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="carousel-caption">
						<div>
							<h5>캐롤의 멜로디가 들리는</h5>
							<h3>커피창고 12월의 이벤트</h3>
							<p>다양한 이벤트를 만나보세요</p>
						</div>

					</div>
					<img src="/static/img/banner/banner1.jpg" alt="carousel1">
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner2.jpg" alt="carousel2">
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner3.gif" alt="carousel3">
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner4.jpg" alt="carousel4">
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner5.jpg" alt="carousel5">
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner6.jpg" alt="carousel6">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-target="#carousel" data-slide="prev">
				<span class="sr-only">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-target="#carousel" data-slide="next">
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
							<a href="/site-name/product"> <img
								src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지"
								width="280">
							</a>
						</div>
						<div class="prod_detail">
							<b>상품명</b> <span>가격</span> <span>리뷰 개수, 별점</span>
						</div>
					</div>
				</li>
				<!-- 상품 2 -->
				<li class="prod-area">
					<div class="prod">
						<div class="prod_thumbnail">
							<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지"
								width="280">
						</div>
						<div class="prod_detail">
							<b>상품명</b> <span>가격</span> <span>리뷰 개수, 별점</span>
						</div>
					</div>
				</li>
				<!-- 상품 3 -->
				<li class="prod-area">
					<div class="prod">
						<div class="prod_thumbnail">
							<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지"
								width="280">
						</div>
						<div class="prod_detail">
							<b>상품명</b> <span>가격</span> <span>리뷰 개수, 별점</span>
						</div>
					</div>
				</li>
				<!-- 상품 4 -->
				<li class="prod-area">
					<div class="prod">
						<div class="prod_thumbnail">
							<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지"
								width="280">
						</div>
						<div class="prod_detail">
							<b>상품명</b> <span>가격</span> <span>리뷰 개수, 별점</span>
						</div>
					</div>
				</li>
				<!-- 상품 5 -->
				<li class="prod-area">
					<div class="prod">
						<div class="prod_thumbnail">
							<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지"
								width="280">
						</div>
						<div class="prod_detail">
							<b>상품명</b> <span>가격</span> <span>리뷰 개수, 별점</span>
						</div>
					</div>
				</li>
				<!-- 상품 6 -->
				<li class="prod-area">
					<div class="prod">
						<div class="prod_thumbnail">
							<img src="/static/img/sample-thumbnail.jpg" alt="썸네일 테스트 이미지"
								width="280">
						</div>
						<div class="prod_detail">
							<b>상품명</b> <span>가격</span> <span>리뷰 개수, 별점</span>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</section>