<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 상품 리스트 -->
<div class="d-flex justify-content-center">
	<div class="prod-list-area">
		<ul>
		<!-- 상품 1 -->
		<c:forEach items="${productList}" var="productSet">
			<li class="prod-area">
				<div class="prod">
					<div class="prod_thumbnail">
						<a href="/site-name/product/${productSet.product.id}">
							<img src="${productSet.productThumbnail.imagePath}" alt="썸네일 테스트 이미지" width="280">
						</a>
					</div>
					<div class="prod_detail">
						<b>${productSet.product.title}</b>
						<span>
							<fmt:formatNumber>${productSet.product.price}</fmt:formatNumber>원
						</span>
						<span>리뷰(${fn:length(productSet.reviewSetList)})</span>
					</div>
				</div>
			</li>
		</c:forEach>
		</ul>
	</div>
</div>
