<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div>
	<!-- 배너 영역 -->
	<div class="d-flex justify-content-center banner-area">
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
					<img src="/static/img/banner/banner1.jpg" alt="carousel1" width="1500" height="400">
					<div class="carousel-caption">
						<div>
							<h3 class="carousel-title">캐롤의 멜로디가 들리는</h3>
							<h1 class="carousel-title">제이커피 12월의 이벤트</h1>
							<p class="carousel-title">다양한 이벤트를 만나보세요</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner2.jpg" alt="carousel2" width="1500" height="400">
					<div class="carousel-caption">
						<div>
							<h3 class="carousel-title">이달의 쿠폰</h3>
							<h1 class="carousel-title">제이커피 PICK 5</h1>
							<p class="carousel-title">매달 1일 쿠폰받고 원하던 상품 PICK!</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner3.gif" alt="carousel3" width="1500" height="400">
					<div class="carousel-caption">
						<div>
							<h3 class="carousel-title">새해를 준비하는 마음가짐!</h3>
							<h1 class="carousel-title">2024 제이커피 굿즈 증정</h1>
							<p class="carousel-title">예쁨 가득! 사랑 가득!</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner4.jpg" alt="carousel4" width="1500" height="400">
					<div class="carousel-caption">
						<div>
							<h3 class="carousel-title">이달의 원두</h3>
							<h1 class="carousel-title">인도 몬순 말라바르 50%</h1>
							<p class="carousel-title">#보리 #카라멜시럽 #볶은견과류</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/static/img/banner/banner5.jpg" alt="carousel5" width="1500" height="400">
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
					<img src="/static/img/banner/banner6.jpg" alt="carousel6" width="1500" height="400">
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
			<c:forEach items="${productSetList}" var="productSet" begin="0" end="15">
				<li class="prod-area">
					<div class="prod">
						<div class="prod_thumbnail">
							<a href="/j-coffee/product/${productSet.product.id}">
								<img src="${productSet.productThumbnail.imagePath}" alt="썸네일 테스트 이미지" width="280">
							</a>
						</div>
						<div class="prod_detail">
							<b>${productSet.product.title}</b>
							<span>
								<fmt:formatNumber>${productSet.product.price}</fmt:formatNumber>원
							</span>
							<span>리뷰(${fn:length(productSet.reviewSetList)})</span>
						</div>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
</div>
