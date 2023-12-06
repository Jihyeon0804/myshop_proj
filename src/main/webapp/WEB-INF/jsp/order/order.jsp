<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<label class="mr-3"><input type="radio" name="address" checked>기존 배송지</label>
							<label><input type="radio" name="address">신규 배송지</label>
						</td>
					</tr>
					<tr>
						<th>배송지명</th>
						<td>
							<input type="text" class="form-control col-5">
						</td>
					</tr>
					<tr>
						<th>받는 분</th>
						<td>
							<input type="text" class="form-control col-5">
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<div class="d-flex">
								<select class="form-control col-1">
									<option>010</option>
									<option>011</option>
									<option>02</option>
								</select>
								<span class="p-2">-</span>
								<input type="text" class="form-control col-1">
								<span class="p-2">-</span>
								<input type="text" class="form-control col-1">
							</div>
							<div class="d-flex mt-2">
								<select class="form-control col-1">
									<option>010</option>
									<option>011</option>
									<option>02</option>
								</select>
								<span class="p-2">-</span>
								<input type="text" class="form-control col-1">
								<span class="p-2">-</span>
								<input type="text" class="form-control col-1">
							</div>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<div class="d-flex">
								<input type="text" class="form-control col-2" id="zipCode">
								<button class="btn border ml-2">주소 찾기</button>
							</div>
							<input type="text" class="form-control col-5 my-2" id="address">
							<input type="text" class="form-control col-5" id="addressDetail">
						</td>
					</tr>
					<tr>
						<th>배송 메세지</th>
						<td>
							<input type="text" class="form-control col-5">
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
								<img src="/static/img/sample-thumbnail.jpg" alt="주문 상품 썸네일 이미지" width="100">
								<div class="d-flex align-items-center ml-3">
									<div>
										<span>상품명</span><br>
										<span>옵션명</span>
									</div>
								</div>
							</div>
						</td>
						<td>판매 가격</td>
						<td>수량</td>
						<td>구매 가격</td>
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
						<td>99,999원</td>
					</tr>
					<tr>
						<th>할인 금액</th>
						<td>0원</td>
					</tr>
					<tr>
						<th>배송비</th>
						<td>3,000원</td>
					</tr>
					<tr>
						<th>최종 결제 금액</th>
						<td>22,222원</td>
					</tr>
				</tbody>
			</table>
			<div class="d-flex justify-content-end">
				<button class="btn btn-danger">결제하기</button>
			</div>
		</div>
	</div>
</div>
