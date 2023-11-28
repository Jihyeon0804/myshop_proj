<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="admin-user-box">
	<h3>회원 정보</h3>
	<table class="table text-center mt-3">
		<thead>
			<tr>
				<th>NO.</th>
				<th>이름</th>
				<th>사용자 아이디</th>
				<th>주소</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userList}" var="user">
			<tr>
				<td>${user.id}</td>
				<td>${user.name}</td>
				<td>${user.loginId}</td>
				<td>${user.address}</td>
				<td>${user.email}</td>
				<td>${user.phoneNumber}</td>
				<td>
					<fmt:formatDate value="${user.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>