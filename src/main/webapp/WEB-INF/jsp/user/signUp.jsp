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
				<div class="form-row">
					<input type="text" id="name" placeholder="이름을 입력해주세요." class="form-control">
					<div id="blankName" class="invalid-feedback d-none">
						이름을 입력해주세요.
					</div>
				</div>
			</div>
			<div class="userInfo">
				<label>아이디</label>
				<div class="d-flex justify-content-between">
					<div class="form-row w-75">
						<input type="text" id="loginId" placeholder="아이디를 입력해주세요." class="form-control">
				      	<div id="blankId" class="invalid-feedback d-none">
				        	아이디를 입력해주세요.
				      	</div>
				      	<div id="invalidLength" class="invalid-feedback d-none">
				        	아이디는 최소 6자 이상으로 입력해주세요.
				      	</div>
				      	<div id="duplicatedCheckFeedback" class="invalid-feedback d-none">
				        	아이디 중복확인을 해주세요.
				      	</div>
				      	
				      	<!-- 중복확인 결과 -->
				      	<div id="isDuplicatedFeedback" class="invalid-feedback d-none">
				        	이미 사용 중인 아이디입니다.
				      	</div>
				      	<div id="validFeedback" class="valid-feedback d-none">
				        	사용 가능한 아이디입니다.
				      	</div>
				     </div>
					<button class="btn btn-primary" id="isDuplicatedBtn">중복확인</button>
				</div>
			</div>
			<div class="userInfo">
				<label>비밀번호</label>
				<div class="form-row">
					<input type="password" id="password" placeholder="비밀번호를 입력해주세요." class="form-control">
					<div id="blankPassword" class="invalid-feedback d-none">
				      비밀번호를 입력해주세요
					</div>
					<div id="invalidPasswordLength" class="invalid-feedback d-none">
				      비밀번호는 최소 8자 이상으로 입력해주세요.
					</div>
				</div>
			</div>
			<div class="userInfo">
				<label>비밀번호 확인</label>
				<div class="form-row">
					<input type="password" id="passwordChk" placeholder="비밀번호를 입력해주세요." class="form-control">
				    <div id="notMatchFeedback" class="invalid-feedback">
				    	비밀번호가 일치하지 않습니다.
				    </div>
				</div>
			</div>
			<div class="userInfo">
				<label>휴대폰 번호</label>
				<div class="form-row">
					<input type="text" id="phoneNumber" placeholder="휴대폰 번호를 입력해주세요." class="form-control">
				    <div id="blankPhoneNumber" class="invalid-feedback">
				    	휴대폰 번호를 입력해주세요.
				    </div>
				    <div id="invalidPhoneNumber" class="invalid-feedback">
				    	올바른 휴대폰 번호를 입력해주세요.
				    </div>
				</div>
			</div>
			<div class="userInfo">
				<label>이메일</label>
				<div class="d-flex align-items-center">
					<input type="text" id="email" placeholder="이메일" class="form-control col-6">
					<span>@</span>
					<input type="text" id="emailAddress" class="form-control col-5 d-none">
					<select class="form-control col-5" id="emailAddress">
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
				<div class="form-row">
					<input type="text" id="birth" placeholder="생년월일을 입력해주세요." class="form-control">
				    <div id="blankBirth" class="invalid-feedback">
				    	생년월일을 입력해주세요.
				    </div>
				</div>
			</div>
			<button type="button" id="signUpBtn" class="btn btn-lg btn-dark w-100 my-5">회원가입</button>
		</div>
	</div>
</div>


<script>
$(document).ready(function() {
	
	$('#name').on('input', function() {
		let name = $('#name').val();
		if (name == '') {
			$('#name').addClass('is-invalid');
			$('#blankName').removeClass('d-none');
		} else {
			$('#name').removeClass('is-invalid');
			$('#name').addClass('is-valid');
		}
	});
	
	// 아이디 중복확인 버튼 클릭 시
	$('#isDuplicatedBtn').on('click', function() {
		let name = $('#name').val();
		$('#name').removeClass('is-invalid');
		$('#name').removeClass('is-valid');
		
		if (name == '') {
			$('#name').addClass('is-invalid');
			$('#blankName').removeClass('d-none');
			return;
		} else {
			$('#name').addClass('is-valid');
		}
		
		let loginId = $('#loginId').val();
		$('#loginId').removeClass('is-invalid');
		$('#loginId').removeClass('is-valid');
		$('#blankId').addClass('d-none');
		$('#invalidLength').addClass('d-none');
		$('#isDuplicatedFeedback').addClass('d-none');
		$('#duplicatedCheckFeedback').addClass('d-none');
		
		if (loginId == '') {
			$('#loginId').addClass('is-invalid');
			$('#blankId').removeClass('d-none');
			return;
		}
		
		if (loginId.length < 6) {
			$('#loginId').addClass('is-invalid');
			$('#blankId').addClass('d-none');
			$('#invalidLength').removeClass('d-none');
			return;
		}
		
		$.ajax({
			// request			
			type:"post"
			, url:"/user/is-duplicated-id"
			, data:{"loginId":loginId}
		
			// response
			, success:function(data) {
				if (data.result) { // 중복인 경우 - true
					$('#loginId').addClass('is-invalid');
					$('#isDuplicatedFeedback').removeClass('d-none');
					return;
				} else {
					// 중복이 아닌 경우
					$('#loginId').addClass('is-valid');
					$('#validFeedback').removeClass('d-none');
				}
				
				
			}
		});
	});

	
	$('#password').on('input', function() {
		let password = $('#password').val();
		if (password == '') {
			$('#password').addClass('is-invalid');
			$('#blankPassword').removeClass('d-none');
			$('#invalidPasswordLength').addClass('d-none');
		} else if (password.length < 8) {
			$('#password').addClass('is-invalid');
			$('#blankPassword').addClass('d-none');
			$('#invalidPasswordLength').removeClass('d-none');
		} else {
			$('#password').removeClass('is-invalid');
			$('#password').addClass('is-valid');
		}
	});
	
	$('#passwordChk').on('input', function() {
		let password = $('#password').val();
		let passwordChk = $('#passwordChk').val();
		if (password != passwordChk) {
			$('#passwordChk').addClass('is-invalid');
			$('#notMatchFeedback').removeClass('d-none');
		} else {
			$('#passwordChk').removeClass('is-invalid');
			$('#passwordChk').addClass('is-valid');
		}
	});
	
	$('#phoneNumber').on('input', function() {
		let phoneNumber = $('#phoneNumber').val();
		if (phoneNumber == '') {
			$('#phoneNumber').addClass('is-invalid');
			$('#invalidPhoneNumber').addClass('d-none');
			$('#blankPhoneNumber').removeClass('d-none');
		} else if (phoneNumber.length != 11) {
			$('#phoneNumber').addClass('is-invalid');
			$('#blankPhoneNumber').addClass('d-none');
			$('#invalidPhoneNumber').removeClass('d-none');
		} else {
			$('#phoneNumber').removeClass('is-invalid');
			$('#phoneNumber').addClass('is-valid');
		}
	});
	
	$('#email').on('input', function() {
		
	});
	let email = $('#email').val();
	
	$('#birth').datepicker({
		dateFormat:"yy-mm-dd",
	    changeMonth: true,
	    changeYear: true,
	    maxDate: 0
	});
	
	$('#birth').on('change', function() {
		let birth = $('#birth').val();
		
		if (birth == '') {
			$('#birth').addClass('is-invalid');
			$('#blankBirth').removeClass('d-none');
		} else {
			$('#birth').addClass('is-valid');
			$('#blankBirth').addClass('d-none');
			$('#birth').removeClass('is-invalid');
		}
	});
	
	
	// 회원가입 버튼 클릭 시
	$('#signUpBtn').on('click', function() {
		if ($('.is-invalid').length > 0 || $('.is-valid').length != 7) {
			return;
		} 
		
		
		// 모든 요소가 is-valid인 경우 ajax 통신
		$.ajax({
			// request
			type:"post"
			, url:"/user/sign-up"
			, data:{"loginId":loginId,
				"password":password,
				"name":name,
				"email":email,
				"phoneNumber":phoneNumber,
				"birth":birth}
			
			// response
			, success:function(data) {
				if (data.code == 200) {
					location.href = "/site-name/sign-in-view"
				}
			}
		});
		
	});
	
	
});
</script>