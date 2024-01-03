<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="info-box-area">
		<h4>내 정보 수정</h4>
		<!-- <label for="confirmPassword">비밀번호 확인</label>
		<div class="d-flex">
			<input class="form-control col-6" type="password" id="confirmPassword">
			<button class="btn btn-primary">확인</button>
		</div> -->
		<div>
			<label>이름</label>
			<input class="form-control col-6 mb-3" type="text" disabled value="${userName}">
			
			<label>아이디</label>
			<input class="form-control col-6 mb-3" type="text" disabled value="${userLoginId}">
			
			<label>생년월일</label>
			<input id="birth" class="form-control col-6 mb-3">
			
			<label>전화번호</label>
			<input class="form-control col-6 mb-3" type="text">
			
			<label>주소</label>
			<div class="address-box">
				<div class="w-100">
					<div class="d-flex justify-content-between">
						<input id="zipNo" class="form-control col-7" type="text">
						<button id="addressSearch" type="button" class="btn btn-primary" onclick="goPopup();">주소 찾기</button>
					</div>
					<input id="roadAddrPart1" class="form-control" type="text">
					<input id="addrDetail" class="form-control mb-3" type="text">
				</div>
			</div>
			
			<div class="d-flex justify-content-end mt-5 col-7 p-0">
				<button id="cancelBtn" class="btn btn-secondary mr-2">취소</button>
				<button id="reviseBtn" class="btn btn-danger">수정하기</button>
			</div>
		</div>
	</div>
</div>
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
<script>
function goPopup() {
	 var pop = window.open("/address/juso","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadAddrPart1, addrDetail, raodAddrPart2, zipNo) {
	$('#zipNo').val(zipNo);
	$('#roadAddrPart1').val(roadAddrPart1);
	$('#addrDetail').val(addrDetail + ' ' + raodAddrPart2);
}
</script>