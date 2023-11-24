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
			<button type="button" id="loginBtn" class="btn btn-lg btn-primary w-100 my-3">로그인</button>
			<div class="linkArea d-flex justify-content-center">
				<ul>
					<li><a href="#">아이디 찾기</a></li>
					<li><a href="#">비밀번호 찾기</a></li>
					<li><a href="/site-name/sign-up-view">회원가입</a></li>
				</ul>
			</div>
			<div class="hr-sect">또는</div>
			<!-- 카카오 로그인 -->
			<a href="https://kauth.kakao.com/oauth/authorize?
			client_id=5fe0b7f721365d472ac1462d40d94415&
			redirect_uri=http://localhost/kakao/login/result&response_type=code" class="btn" id="kakaoLoginBtn">
				<img src="/static/img/kakao_logo.png" width="30">
				<span>카카오 로그인</span>
			</a>
			
			<!-- 구글 로그인 -->
			<a href="https://accounts.google.com/o/oauth2/v2/auth?client_id=87909384582
			-c9e49ssd4i0r6p8c1j680n4iuls7puk3.apps.googleusercontent.com
			&redirect_uri=http://localhost/google/login/result
			&response_type=code&scope=email profile" class="btn" id="googleLoginBtn">
				<img src="/static/img/google_logo.png" width="30">
				<span>구글 로그인</span>
			</a>
			
			<!-- 네이버 로그인 -->
			<a href="https://accounts.google.com/o/oauth2/v2/auth?client_id=87909384582
			-c9e49ssd4i0r6p8c1j680n4iuls7puk3.apps.googleusercontent.com
			&redirect_uri=http://localhost/google/login/result
			&response_type=code&scope=email profile" class="btn" id="naverLoginBtn">
				<img src="/static/img/naver_logo.png" width="30">
				<span>네이버 로그인</span>
			</a>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$('#loginBtn').on('click', function() {
		let loginId = $('#id').val();
		let password = $('#password').val();
		
		if (loginId == '' || password == '') {
			return;
		}
		
		
		$.ajax({
			// request
			type:"post"
			,url:"/user/sign-in"
			,data:{"loginId":loginId, "password":password}
		
			// response
			,success:function(data) {
				if (data.code == 200) {
					location.href="/site-name"
				} else {
					alert(data.errorMessage);
				}
			}
		});
	});
});
</script>