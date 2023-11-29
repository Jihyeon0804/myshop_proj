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
		
		<label>생년월일</label>
		<input id="birth" class="form-control col-6">
		
		<label>전화번호</label>
		<input class="form-control col-6" type="text">
		
		<label>주소</label>
		<div class="address-box">
			<div class="w-100">
				<div class="d-flex justify-content-between">
					<input id="zipCode" class="form-control col-7" type="text">
					<!--
					<a href="https://business.juso.go.kr/addrlink/addrLinkUrl.do?
					confmKey=devU01TX0FVVEgyMDIzMTEyOTExNTEzMTExNDMxNzA%3D
					&returnUrl=http://localhost/address/search" id="searchAddress" class="btn btn-light">주소 찾기</a>  -->
					<button id="addressSearch" type="button" class="btn" onclick="goPopup()">주소 찾기</button>
				</div>
				<input id="address" class="form-control" type="text">
				<input id="addressDetail" class="form-control" type="text">
			</div>
		</div>
		
		
		<button id="cancelBtn" class="btn btn-secondary">취소</button>
		<button id="reviseBtn" class="btn btn-danger">수정하기</button>
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
function goPopup() {
	//주소찾기 버튼을 누르면 절대경로로 팝업창을 오픈
	var url = location.href;
	var pop = window.open("https://business.juso.go.kr/addrlink/addrLinkUrl.do?"
			+ "confmKey=devU01TX0FVVEgyMDIzMTEyOTExNTEzMTExNDMxNzA%3D" + "&returnUrl=" + url
			,"pop","width=570,height=420, scrollbars=yes, resizable=yes"); 		
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		//콜백 방식으로 받아온 데이터를 가입 폼에 자동 완성해주겠다.
		docuement.getElementById('address').value = roadAddrPart1;
		docuement.getElementById('addressDetail').value = addrDetail + roadAddrPart2;
		docuement.getElementById('zipCode').value = zipNo;
}
</script>