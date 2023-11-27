<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<div class="mt-5">
		<div>
			<h4>주문 내역</h4>
		</div>
		<table class="table text-center">
			<thead>
				<tr>
					<th>주문 일자</th>
					<th>상품명</th>
					<th>수량</th>
					<th>금액</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div>2023/11/22</div>
						<button class="btn" type="button" data-toggle="collapse" data-target="#collapseExample">
							상세보기
						</button>
					</td>
					<td>커피창고 원두커피 200g 3봉</td>
					<td>1</td>
					<td><fmt:formatNumber value="12000" type="number" />원</td>
					<td>배송 완료</td>
				</tr>
				<tr>
					<td colspan="5" class="p-0">
						<div class="collapse" id="collapseExample">
							<div class="card card-body">
								<h3>배송 정보</h3>
								<table>
									<tr>
										<td>주문자명</td>
										<td>${userName}</td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td>${userPhoneNumber}</td>
									</tr>
									<tr>
										<td>주소</td>
										<td>...</td>
									</tr>
									<tr>
										<td>배송메모</td>
										<td>...</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div>2023/11/25</div>
						<button class="btn" type="button" data-toggle="collapse" data-target="#collapseExample2">
							상세보기
						</button>
					</td>
					<td>커피창고 원두커피 200g 3봉</td>
					<td>4</td>
					<td><fmt:formatNumber value="48000" type="number" />원</td>
					<td>배송 완료</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>