<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="login-box d-flex justify-content-center">
		<div class="loginArea">
			<div class="loginNag">
				<h1>로그인</h1>	
			</div>
			<div class="sign-in-wrap border w-100 p-0">
				<div class="border-bottom pl-3">
					<span>
						<img src="/static/img/id-icon.png" alt="아이디 아이콘" width="25">
					</span>
					<input type="text" id="id" class="sign-in-input" placeholder="아이디">
				</div>
				<div class="pl-3">
					<span>
						<img src="/static/img/password-icon.png" alt="비밀번호 아이콘" width="25">
					</span>
					<input type="password" id="password" class="sign-in-input" placeholder="비밀번호">
				</div>
			</div>
			<button type="button" class="btn btn-lg btn-primary w-100 my-3">로그인</button>
			<!-- 카카오 로그인 API -->
			<div class="linkArea  d-flex justify-content-center">
				<ul>
					<li><a href="#">아이디 찾기</a></li>
					<li><a href="#">비밀번호 찾기</a></li>
					<li><a href="/site-name/sign-up-view">회원가입</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>