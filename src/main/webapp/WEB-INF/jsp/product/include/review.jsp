<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="review-area">
	<c:if test="${empty reviewSetList}">
		<div class="empty-box">
			<div class="text-center">
				<img alt="없음" src="/static/img/empty-icon.png">
				<div>등록된 리뷰가 없습니다.</div>
			</div>
		</div>
	</c:if>
	<div>
	<c:if test="${not empty reviewSetList}">
		<div>
			<h2>상품 리뷰</h2>
		</div>
		<div class="review-info d-flex justify-content-center">
			<div class="review-info-box d-flex">
				<div class="review-point">리뷰 평점</div>
				<div class="review-cnt">리뷰 수</div>
				<div class="review-ratio">평점 비율</div>
			</div>
		</div>
		<div class="photo-review">
			<div>포토 N건</div>
			<div>
			<c:forEach items="${reviewSetList}" var="reviewList">
				<c:forEach items="${reviewList.reviewImageList}" var="review">
						<img src="${review.imagePath}" width="80" height="80" class="mr-3">
				</c:forEach>
			</c:forEach>
			</div>
		</div>
		
		<div>
			<div>리뷰</div>
			<div>
				<label>
					<input type="checkbox" id="onlyPhoto">
					사진 리뷰만 보기
				</label>
			</div>
			<hr>
			<!-- 한 사용자의 리뷰 -->
			<c:forEach items="${reviewSetList}" var="reviewList">
			<div class="prd-review">
				<div class="d-flex justify-content-between">
					<div class="d-flex">
						<div class="mr-2 mt-1">
							<img src="/static/img/user-profile-icon.png" alt="사용자 기본 프로필 이미지" width="40">
						</div>
						<div class="review-info d-flex">
							<div>
								<div class="d-flex">
								<c:forEach begin="1" end="${reviewList.review.point}">
									<img src="/static/img/full-star-icon.png" alt="별점" width="30">
								</c:forEach>
								<c:forEach begin="1" end="${5-reviewList.review.point}">
									<img src="/static/img/empty-star-icon.png" alt="별점" width="30">
								</c:forEach>
								</div>
								<div class="user-id-box">${reviewList.user.loginId.substring(0,3)}*****</div>
							</div>
						</div>
					</div>
					<div class="review-created-date">
						<fmt:parseDate value="${reviewList.review.createdAt}" pattern="yyyy-MM-dd" var="parseDate"/> 
						<fmt:formatDate value="${parseDate}" pattern="yyyy-MM-dd"/> 
					</div>
				</div>
				<c:if test="${not empty reviewList.reviewImageList}">
					<c:forEach items="${reviewList.reviewImageList}" var="reviewImage">
						<div class="review-image my-2">
							<img src="${reviewImage.imagePath}" width="200">
						</div>
					</c:forEach>
				</c:if>
				<div>${reviewList.review.content}</div>
				<hr>
			</div>
			</c:forEach>
		</div>
		</c:if>
	</div>
</div>
<script>
$(document).ready(function () {
	
	// 사진 리뷰만 보기 클릭 시
	$('#onlyPhoto').on('click', function() {
		if ($(this).is(':checked')) {
			$( '.prd-review:not(:has( .review-image ))' ).addClass('d-none');	// 체크 박스 선택 => 이미지가 없는 리뷰 display none
		} else {
			$( '.prd-review:not(:has( .review-image ))' ).removeClass('d-none'); // 체크 박스 해제 => 전체 리뷰 보기
		}
	});
});
</script>