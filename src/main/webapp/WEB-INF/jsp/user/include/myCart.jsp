<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<h4>장바구니</h4>
	<div>
		<table class="table" id="cartTable">
			<thead>
				<tr>
					<th>
						<input type="checkbox" id="checkedAll" name="check">
					</th>
					<th>상품명</th>
					<th>옵션</th>
					<th>수량</th>
					<th>가격</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="checkbox">
					</td>
					<td>
						<img src="/static/img/sample-thumbnail.jpg" alt="장바구니 테스트 이미지" width="100">
						<span>커피창고 원두커피 200g 3봉</span>
					</td>
					<td>
						<select class="form-control">
							<option></option>
						</select>
					</td>
					<td>
						<div class="d-flex">
							<button type="button" class="btn btn-light amount-minus border">
								<img src="/static/img/minus-icon.png" alt="minus" width="23">
							</button>
							<input type="text" class="form-control" id="amount" value="1">
							<button type="button" class="btn btn-light amount-plus border">
								<img src="/static/img/plus-icon.png" alt="plus" width="23">
							</button>
						</div>
					</td>
					<td>
						<fmt:formatNumber value="12000" type="number" />원
					</td>
					<td>
						<button class="btn btn-lg">&times;</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script>
$(document).ready(function() {
	// checkbox toggle
	$('#checkedAll').on('click', function() {
		if ($('#checkedAll').is(':checked')) {
			$('input[name=check]').prop('checked', true);
		} else {
			$('input[name=check]').prop('checked', false);
		}
	});
	
	// 마이너스 버튼 클릭 시
	$('.amount-minus').on('click', function() {
		let amount = $(this).next().val();
		let prodPrice = $('#cartPrice').data('price');
		let changedPrice = $('#cartPrice').text();
		let regexp = /\B(?=(\d{3})+(?!\d))/g;
		if (amount > 1) {
			// 수량 감소
			amount--;
			$(this).next().val(amount);

			// 가격 변동
			changedPrice = prodPrice * amount
			changedPrice = changedPrice.toString().replace(regexp, ',');
			$('#cartPrice').text(changedPrice);

		}
	});

	// 플러스 버튼 클릭 시
	$('.amount-plus').on('click', function() {
		let amount = $(this).prev().val();
		let prodPrice = $('#cartPrice').data('price');
		let changedPrice = $('#cartPrice').text();
		let regexp = /\B(?=(\d{3})+(?!\d))/g;
		if (amount < 10) {
			// 수량 증가
			amount++;
			$(this).prev().val(amount);

			// 가격 변동
			changedPrice = prodPrice * amount
			changedPrice = changedPrice.toString().replace(regexp, ',');
			$('#cartPrice').text(changedPrice);
		}
	});
	
	
	// 장바구니 삭제
	$('.del-cart-btn').on('click', function() {
		let cartId = $(this).data('cart-id');
		
		$.ajax({
			// request
			type:"delete"
			,url:"/cart/product-delete"
			,data:{"cartId":cartId}
			
			// response
			,success:function(data) {
				if (data.code == 200) {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error) {
				alert("장바구니 삭제를 실패했습니다. 잠시후 다시 시도해주세요.")
			}
		});
	});

});
</script>