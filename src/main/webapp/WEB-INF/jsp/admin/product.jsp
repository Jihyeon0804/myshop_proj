<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="admin-product-box">
	<h3>상품 관리</h3>
	<!-- 상품 등록 버튼 -->
	<div class="d-flex justify-content-end">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postModal">
			등록하기
		</button>
	</div>
	<table class="table text-center mt-3">
		<thead>
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>재고량</th>
				<th>정가</th>
				<th>판매가</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td></td>
			</tr>
		</tbody>
	</table>
</div>

<div class="modal fade" id="postModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">상품 등록</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <label>상품명</label><input type="text" class="form-control">
        <label>카테고리</label>
        <select id="category" class="product-category form-control">
        	<option selected disabled>카테고리</option>
        	<c:forEach items="${categoryList}" var="categoryList">
        		<option data-id="${categoryList.id}">${categoryList.category}</option>
        	</c:forEach>
        </select>
        <label>소분류</label>
		<select id="subclass" class="product-subclass form-control">
        	<option selected disabled>소분류</option>
        	
        </select>
        <label>정가</label><input type="text" class="form-control">
        <label>할인가</label><input type="text" class="form-control">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button id="postProduct" type="button" class="btn btn-primary">등록하기</button>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
	$('#category').on('change', function() {
		let categoryId = $('#category option:selected').data("id");
		
		$.ajax({
			type:"post"
			, url : "/subclass"
			, data:{"categoryId":categoryId}
		
			, success:function(data) {
			}
		});
	});
});	
</script>