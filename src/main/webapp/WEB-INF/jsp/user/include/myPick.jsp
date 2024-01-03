<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div>
	<h2>찜한 상품</h2>
	<div>
		<c:forEach items="${likeSetList}" var="likeList">
		<div class="d-flex align-items-center justify-content-between mt-5">
			<div class="d-flex align-items-center">
				<img src="${likeList.productThumbnail.imagePath}" alt="찜 목록 테스트 이미지" width="150">
				<div class="ml-3">
					<h5>${likeList.product.title}</h5>
					<h5><fmt:formatNumber>${likeList.product.price}</fmt:formatNumber>원</h5>
				</div>
			</div>
			<div class="d-flex flex-column">
				<button class="btn delete-like-btn" data-product-id="${likeList.product.id}">
					<img src="/static/img/full-heart-icon.png" alt="is-product-like" width="30">
				</button>
				<button class="btn mt-3" data-toggle="modal" data-target="#liekToCartModal">
					<img src="/static/img/cart-icon.png" alt="is-product-like" width="35">
				</button>
			</div>
		</div>
		</c:forEach>
	</div>
</div>
<script>
$(document).ready(function() {
	$('.delete-like-btn').on('click', function() {
		let productId = $(this).data('product-id');
		
		$.ajax({
			type:"post"
			,url:"/like/delete"
			, data:{"productId":productId}
			
			,success:function(data) {
				if(data.code==200) {
					alert("삭제되었습니다.");
					location.reload();
				} else {
					alert("다시 시도해주세요.");
				}
			}
			, error:function(request, status, error) {
				alert("다시 시도해 주세요");
			}
		});
	});
});
</script>