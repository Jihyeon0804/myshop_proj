<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<c:forEach items="${orderSetList}" var="orderSet">
				<tr>
					<td>
						<div>
							<fmt:parseDate value="${orderSet.order.updatedAt}" pattern="yyyy-MM-dd" var="parseDate"/> 
							<fmt:formatDate value="${parseDate}" pattern="yyyy-MM-dd"/> 
						</div>
						<button class="btn" type="button" data-toggle="collapse" data-target="#deliveryInfo">
							상세보기
						</button>
					</td>
					<td>${orderSet.product.title}</td>
					<td>${orderSet.order.amount}</td>
					<td><fmt:formatNumber value="${orderSet.order.totalPrice}" type="number" />원</td>
					<td>배송 완료</td>
				</tr>
				<tr>
					<td colspan="5" class="p-0">
						<div class="collapse" id="deliveryInfo">
							<div class="card card-body">
								<h3>배송 정보</h3>
								<table>
									<tr>
										<td>주문자명</td>
										<td>${orderSet.order.orderName}</td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td>${orderSet.order.phoneNumber}</td>
									</tr>
									<tr>
										<td>주소</td>
										<td>${orderSet.order.address}</td>
									</tr>
									<tr>
										<td>배송메모</td>
										<td>${orderSet.order.message}</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>