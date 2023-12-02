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
					<img src="/static/img/banner/banner1.jpg" alt="carousel1">
					<div class="carousel-caption">
						<div>
							<h3 class="carousel-title">캐롤의 멜로디가 들리는</h3>
							<h1 class="carousel-title">커피창고 12월의 이벤트</h1>
							<p class="carousel-title">다양한 이벤트를 만나보세요</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner2.jpg" alt="carousel2">
					<div class="carousel-caption">
						<div>
							<h3 class="carousel-title">이달의 쿠폰</h3>
							<h1 class="carousel-title">커피창고 PICK 5</h1>
							<p class="carousel-title">매달 1일 쿠폰받고 원하던 상품 PICK!</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner3.gif" alt="carousel3">
					<div class="carousel-caption">
						<div>
							<h3 class="carousel-title">새해를 준비하는 마음가짐!</h3>
							<h1 class="carousel-title">2024 커피창고 굿즈 증정</h1>
							<p class="carousel-title">예쁨 가득! 사랑 가득!</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner4.jpg" alt="carousel4">
					<div class="carousel-caption">
						<div>
							<h3 class="carousel-title">이달의 원두</h3>
							<h1 class="carousel-title">인도 몬순 말라바르 50%</h1>
							<p class="carousel-title">#보리 #카라멜시럽 #볶은견과류</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner5.jpg" alt="carousel5">
					<div class="carousel-caption">
						<div>
							<h3 class="carousel-title">이달의 생두</h3>
							<h1 class="carousel-title">NEW 케냐 AA TOP 10%</h1>
							<h1 class="carousel-title">콜롬비아 수프리모 리사랄다 10%</h1>
							<p class="carousel-title">연말이니깐~ 2개 준비해 보았아요!</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner6.jpg" alt="carousel6">
					<div class="carousel-caption">
						<div>
							<h3 class="carousel-title">장점만 쏙쏙 담았어요!</h3>
							<h1 class="carousel-title">디카페인 블랜드 출시</h1>
							<p class="carousel-title">#초콜릿 #브라운슈가 #오렌지</p>
						</div>
					</div>
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
							<a href="/site-name/product/1"> <img
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