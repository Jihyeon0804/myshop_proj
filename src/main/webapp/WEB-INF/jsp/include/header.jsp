<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<div class="util-area">
		<ul>
			<c:if test="${empty userName}">
				<li><a href="/j-coffee/sign-in-view">로그인</a></li>
				<li><a href="/j-coffee/sign-up-view">회원가입</a></li>
			</c:if>
			<c:if test="${not empty userName}">
				<li><a href="/j-coffee/my-page/${userName}">${userName} 님</a></li>
				<li><a href="/user/sign-out">로그아웃</a></li>
				<li><a href="/j-coffee/my-page/cart">장바구니</a></li>
			</c:if>
		</ul>
	</div>
	<div class="header-area">
		<div class="logo-area">
			<a href="/j-coffee" id="logoTitle">JCOFFEE</a>
		</div>
		<div class="search-box">
			<input type="text" placeholder="검색어를 입력하세요." class="input-box">
			<div class="button-area">
				<button type="button" class="search-btn">
					<img src="/static/img/search-icon.png" alt="search-icon" width="30">
				</button>
			</div>
		</div>
	</div>
	<div class="header-menu d-flex">
		<div>
			<ul class="header-menu-list">
				<li class="header-menu-list-items"><a href="#" id="category"><span>카테고리</span></a>
					<ul class="header-menu-list-items-sub">
						<li class="header-menu-list-items-sub-items">
							<a href="/j-coffee/product/category/1">원두커피</a>
							<div>
								<ul class="subclass-list">
									<li class="subclass-items"><a href="/j-coffee/product/category/1/1">블랜드</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/1/2">싱글 오리진</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/1/3">디카페인</a></li>
								</ul>
							</div>
						</li>
						<li class="header-menu-list-items-sub-items">
							<a href="/j-coffee/product/category/2">간편커피</a>
							<div>
								<ul class="subclass-list">
									<li class="subclass-items"><a href="/j-coffee/product/category/2/1">드립백 커피</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/2/2">콜드브루</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/2/3">캡슐커피 &amp; 티</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/2/4">스틱커피</a></li>
								</ul>
							</div>
						</li>
						<li class="header-menu-list-items-sub-items">
							<a href="/j-coffee/product/category/3">생두</a>
							<div>
								<ul class="subclass-list">
									<li class="subclass-items"><a href="/j-coffee/product/category/3/1">아프리카</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/3/2">남아메리카</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/3/3">북중앙아메리카</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/3/4">아시아 &amp; 기타</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/3/5">디카페인</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/3/6">수입사</a></li>
								</ul>
							</div>
						</li>
						<li class="header-menu-list-items-sub-items">
							<a href="/j-coffee/product/category/4">로스팅 용품</a>
						</li>
						<li class="header-menu-list-items-sub-items">
							<a href="/j-coffee/product/category/5">머신</a>
							<div>
								<ul class="subclass-list">
									<li class="subclass-items"><a href="/j-coffee/product/category/5/1">에스프레소머신</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/5/2">그라인더</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/5/3">로스터기</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/5/4">블렌더</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/5/5">드립포트</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/5/6">드립머신</a></li>
								</ul>
							</div>
						</li>
						<li class="header-menu-list-items-sub-items">
							<a href="/j-coffee/product/category/6">커피용품</a>
							<div>
								<ul class="subclass-list">
									<li class="subclass-items"><a href="/j-coffee/product/category/6/1">홈카페세트</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/6/2">핸드드립추출기구</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/6/3">커피추출기구</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/6/4">바리스타용품</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/6/5">테이블웨어</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/6/6">위생용품</a></li>
									<li class="subclass-items"><a href="/j-coffee/product/category/6/7">보관용품</a></li>
								</ul>
							</div>
						</li>
						<li class="header-menu-list-items-sub-items">
							<a href="/j-coffee/product/category/7">시럽/소스/파우더</a>
						</li>
						<li class="header-menu-list-items-sub-items">
							<a href="/j-coffee/product/category/8">TEA/농축액/시리얼</a>
						</li>
						<li class="header-menu-list-items-sub-items">
							<a href="/j-coffee/product/category/9">음료/탄산수/유제품</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<div>
			<ul class="header-menu-list">
				<li class="header-menu-list-items"><a href="#">신상품</a></li>
				<li class="header-menu-list-items"><a href="#">베스트</a></li>
				<li class="header-menu-list-items"><a href="#">특가/할인</a></li>
				<li class="header-menu-list-items"><a href="#">이벤트</a></li>
			</ul>
		</div>
	</div>
</div>