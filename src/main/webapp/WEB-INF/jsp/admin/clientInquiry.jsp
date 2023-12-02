<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<c:forEach items="${qnaList}" var="qna" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${qna.user.loginId}</td>
				<td>${qna.inquire.title}</td>
				<td><fmt:formatDate value="${qna.inquire.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<c:if test="${not empty qna.answer}">
				<td>Y</td>
			</c:if>
			<c:if test="${empty qna.answer}">
				<td>N</td>
			</c:if>
				<td><input type="checkbox" name="check"></td>
			</tr>
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