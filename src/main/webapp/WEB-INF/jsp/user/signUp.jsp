<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="sign-up-box d-flex justify-content-center">
		<div class="signUpArea">
			<div class="signUpNag">
				<h1>회원가입</h1>	
			</div>
			<div class="userInfo">
				<label>이름</label>
				<input type="text" id="name" placeholder="이름을 입력해주세요." class="form-control">
			</div>
			<div class="userInfo">
				<label>아이디</label>
				<div class="d-flex justify-content-between">
					<input type="text" id="userId" placeholder="아이디를 입력해주세요." class="form-control col-9">
					<button class="btn btn-primary" id="isDuplicatedBtn">중복확인</button>
				</div>
			</div>
			<div class="userInfo">
				<label>비밀번호</label>
				<input type="password" id="password" placeholder="비밀번호를 입력해주세요." class="form-control">
			</div>
			<div class="userInfo">
				<label>비밀번호 확인</label>
				<input type="password" id="passwordChk" placeholder="비밀번호를 입력해주세요." class="form-control">
			</div>
			<div class="userInfo">
				<label>휴대폰 번호</label>
				<input type="text" id="phoneNumber" placeholder="휴대폰 번호를 입력해주세요." class="form-control">
			</div>
			<div class="userInfo">
				<label>이메일</label>
				<div class="d-flex align-items-center">
					<input type="text" id="email" placeholder="이메일" class="form-control col-6">
					<span>@</span>
					<select class="form-control col-5">
					  <option selected>메일 주소 선택</option>
					  <option>naver.com</option>
					  <option>google.com</option>
					  <option>kakao.com</option>
					  <option>직접입력</option>
					</select>
				</div>
			</div>
			<div class="userInfo">
				<label>생년월일</label>
				<input type="text" id="birth" placeholder="생년월일을 입력해주세요." class="form-control">
			</div>
			<button type="button" id="signUpBtn" class="btn btn-lg btn-dark w-100 my-5">회원가입</button>
		</div>
	</div>
</div>


<script>
$(document).ready(function() {
	
	
	let name = $('#name').val();
	let userId = $('#userId').val();
	let password = $('#password').val();
	let passwordChk = $('#passwordChk').val();
	let email = $('#email').val();
	let phoneNumber = $('#phoneNumber').val();
	let birth = $('#birth').val();
	
	$('#name').change(function() {
		if ($('#name').val() != '') {
			$('#name').addClass('is-valid');
		}
	});
	
	$('#signUpBtn').on('click', function() {
		
	});
});
</script>