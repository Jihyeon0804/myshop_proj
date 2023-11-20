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
				      	<div id="isDuplicatedFeedback" class="invalid-feedback d-none">
				        	이미 사용 중인 아이디입니다.
				      	</div>
				      	<div id="duplicatedCheckFeedback" class="invalid-feedback d-none">
				        	아이디 중복확인을 해주세요.
				      	</div>
				     </div>
					<button class="btn btn-primary" id="isDuplicatedBtn">중복확인</button>
				</div>
			</div>
			<div class="userInfo">
				<label>비밀번호</label>
				<input type="password" id="password" placeholder="비밀번호를 입력해주세요." class="form-control">
			</div>
			<div class="userInfo">
				<label>비밀번호 확인</label>
				<div class="form-row">
					<input type="password" id="passwordChk" placeholder="비밀번호를 입력해주세요." class="form-control is-invalid">
				    <div id="notMatchFeedback" class="invalid-feedback">
				    	비밀번호가 일치하지 않습니다.
				    </div>
				</div>
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
		
		if (loginId.length < 8) {
			$('#loginId').addClass('is-invalid');
			$('#blankId').addClass('d-none');
			$('#invalidLength').removeClass('d-none');
		}
	});

	
	$('#name').change(function() {
		if ($('#name').val() != '') {
			$('#name').addClass('is-valid');
		}
	});
	
});
</script>