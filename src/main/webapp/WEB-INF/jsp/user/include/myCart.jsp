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
						<input type="checkbox">
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