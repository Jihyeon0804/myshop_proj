<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<div class="util-area">
	<ul>
		<c:if test="${empty userName}">
			<li><a href="/site-name/sign-in-view">로그인</a></li>
			<li><a href="/site-name/sign-up-view">회원가입</a></li>
		</c:if>
		<c:if test="${not empty userName}">
			<li><a href="/site-name/${userName}">${userName} 님</a></li>
			<li><a href="/user/sign-out">로그아웃</a></li>
			<li><a href="/site-name/#">장바구니</a></li>
		</c:if>
	</ul>
</div>
<div class="header-area">
	<div class="logo-area">
		<span>LOGO</span>
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
