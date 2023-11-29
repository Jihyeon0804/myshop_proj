<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h4>내 정보 수정</h4>
	<label for="confirmPassword">비밀번호 확인</label>
	<div class="d-flex">
		<input class="form-control col-6" type="password" id="confirmPassword">
		<button class="btn btn-primary">확인</button>
	</div>
	<div>
		<label>이름</label>
		<input class="form-control col-6" type="text" disabled value="${userName}">
		
		<label>아이디</label>
		<input class="form-control col-6" type="text" disabled value="${userLoginId}">
		
		<label>이름</label>
		<input class="form-control col-6" type="text">
		
		<label>생년월일</label>
		<input id="birth" class="form-control col-6">
		
		<label>전화번호</label>
		<input class="form-control col-6" type="text">
		
		<label>주소</label>
		<div class="d-flex">
			<input id="searchAddress" class="form-control col-6" type="text">
			<input id="address_detail" name="address_detail" class="form-control col-6" type="text">
			<button id="address" class="btn btn-ligth border">우편번호 검색</button>
		</div>
		
		
		<button id="cancelBtn" class="btn btn-secondary">취소</button>
		<button id="reviseBtn" class="btn btn-danger">수정하기</button>
	</div>
</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	$(document).ready(function() {
		
		// 생년월일 datepicker
		$('#birth').datepicker({
			dateFormat:"yy-mm-dd",
		    changeMonth: true,
		    changeYear: true,
		    yearRange:'c-100:c+0',
		    showMonthAfterYear: true,
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
		    maxDate: 0
		});
	});
</script>