<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="admin-inquiry-box">
	<h3>고객 문의 관리</h3>
	<table class="table text-center mt-3">
		<thead>
			<tr>
				<th>No.</th>
				<th>사용자 아이디</th>
				<th>제목</th>
				<th>등록일</th>
				<th>답변여부</th>
				<th>
					<label>관리<input type="checkbox" id="checkedAll"></label>	
				</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${inquireList}" var="inquire" varStatus="status">
		<c:forEach items="${userList}" var="user">
		<c:if test="${user.id eq inquire.userId}">
			<tr>
				<td>${status.count}</td>
				<td>${user.loginId}</td>
				<td>${inquire.title}</td>
				<td>${inquire.createdAt}</td>
				<td>N</td>
				<td><input type="checkbox" name="check"></td>
			</tr>
		</c:if>
		</c:forEach>
		</c:forEach>
		</tbody>
	</table>
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

});
</script>