<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 아임포트 라이브러리 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<div class="order-section">
	<div class="order-area">
		<h3>주문/결제</h3>
		
		<div class="my-4">
			<h4>배송지 정보</h4>
			<table class="table">
				<tbody>
					<tr>
						<th>배송지 선택</th>
						<td>
							<label class="mr-3"><input type="radio" name="address" value="existAddress" checked>기존 배송지</label>
							<label><input type="radio" name="address" value="newAddress">신규 배송지</label>
						</td>
					</tr>
					<tr>
						<th>배송지명</th>
						<td>
							<span>${userName}</span>
						</td>
					</tr>
					<tr>
						<th>받는 분</th>
						<td>
							<div class="d-flex">
								<div class="d-flex align-items-center mr-2 required-items">*</div>
								<input type="text" class="form-control col-5" id="orderName">
							</div>
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<div class="d-flex">
								<div class="d-flex align-items-center mr-2 required-items">*</div>
								<select class="form-control col-1" id="phoneNumber1">
									<option>010</option>
									<option>011</option>
									<option>02</option>
								</select>
								<span class="p-2">-</span>
								<input type="text" class="form-control col-1" id="phoneNumber2" maxlength="4">
								<span class="p-2">-</span>
								<input type="text" class="form-control col-1" id="phoneNumber3" maxlength="4">
							</div>
							<div class="d-flex mt-2">
								<select class="form-control col-1 ml-3">
									<option>010</option>
									<option>011</option>
									<option>02</option>
								</select>
								<span class="p-2">-</span>
								<input type="text" class="form-control col-1" maxlength="4">
								<span class="p-2">-</span>
								<input type="text" class="form-control col-1" maxlength="4">
							</div>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<div class="d-flex address-input-box">
								<div class="d-flex align-items-center mr-2 required-items">*</div>
								<input type="text" class="address-input form-control col-2" id="zipNo">
								<button class="btn border ml-2" id="addressSearch" type="button" onclick="goPopup();">
									주소 찾기
								</button>
							</div>
							<input type="text" class="address-input form-control col-5 my-2 ml-3" id="roadAddrPart1">
							<input type="text" class="address-input form-control col-5 ml-3" id="addrDetail">
						</td>
					</tr>
					<tr>
						<th>배송 메세지</th>
						<td>
							<input type="text" class="form-control col-5 ml-3" id="message">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div>
			<h4>주문 정보</h4>
			<table class="table" id="cartTable">
				<thead>
					<tr>
						<th>상품명</th>
						<th>판매 가격</th>
						<th>수량</th>
						<th>구매 가격</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="d-flex">
								<img src="https://www.coffeecg.com/web/product/medium/202311/9fc4668022f46bbbaab335eec5db1a2b.jpg" alt="주문 상품 썸네일 이미지" width="100">
								<div class="d-flex align-items-center ml-3">
									<div>
										<span id="productTitle" data-product-id="${product.id}">${product.title}</span><br>
										<span id="productOption">${option}</span>
									</div>
								</div>
							</div>
						</td>
						<td><fmt:formatNumber>${product.price}</fmt:formatNumber>원</td>
						<td>${amount}</td>
						<td><fmt:formatNumber>${product.price}</fmt:formatNumber>원</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div>
			<h4>최종 결제 정보</h4>
			<table class="table">
				<tbody>
					<tr>
						<th>총 상품 금액</th>
						<td>
							<span id="productPrice"><fmt:formatNumber>${product.price}</fmt:formatNumber></span>원
						</td>
					</tr>
					<tr>
						<th>할인 금액</th>
						<td>0원</td>
					</tr>
					<tr>
						<th>배송비</th>
						<td>
						<c:if test="${product.price < 50000}">
							<span id="deliveryPrice"><fmt:formatNumber>3000</fmt:formatNumber></span>원
						</c:if>
						<c:if test="${product.price >= 50000}">
							<span id="deliveryPrice">0</span>원
						</c:if>
						</td>
					</tr>
					<tr>
						<th>최종 결제 금액</th>
						<td><span id="totalPrice"></span>원</td>
					</tr>
				</tbody>
			</table>
			<div class="d-flex justify-content-end">
				<button class="btn btn-danger" id="paymentBtn">결제하기</button>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	let productPrice = $('#productPrice').text();
	let deliveryPrice = $('#deliveryPrice').text();
	
	productPrice = productPrice.replace(',', '');
	deliveryPrice = deliveryPrice.replace(',', '');
	productPrice = parseInt(productPrice);
	deliveryPrice = parseInt(deliveryPrice);
	totalPrice = productPrice + deliveryPrice;
	totalPrice = totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	$('#totalPrice').text(totalPrice);
	
	
	
	
	// 신규 배송지 선택 시 주소에 있는 input들 초기화
	$('input[name=address]').on('change', function() {
		let addressOption = $('input[name=address]:checked').val();		// newAddress or existAddress
		
		if (addressOption == 'newAddress') {
			$('#zipNo').val('');
			$('#roadAddrPart1').val('');
			$('#addrDetail').val('');
		}
	});
	
	$('#paymentBtn').on('click', function() {
		// 주문 상품 번호
		let productId = $('#productTitle').data('product-id');
		// 선택 옵션
		let option = $('#productOption').text();
		// 받는 사람 이름
		let orderName = $('#orderName').val();
		// 주소
		let address = '(' + $('#zipNo').val() + ') ' + $('#roadAddrPart1').val() + ' ' + $('#addrDetail').val();
		// 휴대폰 번호
		let phoneNumber = $('#phoneNumber1 option:selected').val() + $('#phoneNumber2').val() + $('#phoneNumber3').val();
		// 배송 메세지
		//let message = $('#message').val();
		// 전체 상품 수량
		let amount = $('#cartTable > tbody > tr').length;
		// 배송비
		let deliveryPrice = $('#deliveryPrice').text().replace(',', '');
		// 총 결제 금액
		let totalPrice = $('#totalPrice').text().replace(',', '');
/* 		console.log(productId);
		console.log(option);
		console.log(orderName);
		console.log(address);
		console.log(amount);
		console.log(totalPrice); */
		
		if (orderName == '') {
			alert("받는 분 성함을 입력해주세요.");
			return;
		}
		
		if (phoneNumber == '' || $('#phoneNumber1 option:selected').val() == '' ||  $('#phoneNumber2').val() == '' || $('#phoneNumber3').val() == '') {
			alert("핸드폰 번호를 입력해주세요.");
			return;
		}
		
		if ($('#zipNo').val() == '' || $('#roadAddrPart1').val() == '') {
			alert("주소를 입력해주세요.");
			return;
		}
		
		var IMP = window.IMP;
        IMP.init('imp68504540');
        
        
        IMP.request_pay({
        	pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid: 'ORD' + new Date().getTime(),
            name: $('#productTitle').text(),
            amount: 1,
            buyer_email: '',
            buyer_name: orderName,
            buyer_tel: phoneNumber,
            buyer_addr:  $('#roadAddrPart1').val() + ' ' + $('#addrDetail').val(),
            buyer_postcode: $('#zipNo').val()
        }, function (rsp) {
            console.log(rsp);
            $.ajax({
                type: "post" 
               	, url: "/order/payment"
               	, data: {
               		"productId" : productId,
               		"option" : option,
                	"orderName" : orderName,
                	"address" : address,
                	"phoneNumber" : phoneNumber,
                    "amount" : amount,
                    "totalPrice" : totalPrice,
                    "deliveryPrice" : deliveryPrice
                }
            	, success:function(data) {
            		if (data.code == 200) {
            			
            		} else {
            			alert("잠시후 다시 시도해주세요.");
            		}
            	}
            	, error:function(request, status, error) {
    				alert("잠시후 다시 시도해주세요.");
    			}
            });

            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                alert("결제가 완료되었습니다.");
                
                location.herf = "/test3"
            } else {
                alert(rsp.error_msg)
            }
            location.href="/j-coffee";  //alert창 확인 후 이동할 url 설정
        });
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