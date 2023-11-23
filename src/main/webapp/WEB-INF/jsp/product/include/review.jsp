<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="review-area">
	<div>
		<h2>상품 리뷰</h2>
	</div>
	<div class="d-flex">
		<div>리뷰 평점</div>
		<div>리뷰 수</div>
		<div>평점 비율</div>
	</div>
	<div class="photo-review">
		<div>포토 N건</div>
		<div>사진 리뷰</div>
	</div>
	<hr>
	<div>
		<div>리뷰</div>
		<!-- 한 사용자의 리뷰 -->
		<div>
			<label>
				<input type="checkbox">
				사진 리뷰만 보기
			</label>
		</div>
		<div>
			<div class="d-flex justify-content-between">
				<div class="d-flex">
					<div class="mr-2 mt-1">
						<img src="/static/img/user-profile-icon.png" alt="사용자 기본 프로필 이미지" width="40">
					</div>
					<div class="review-info d-flex">
						<div>
							<div class="d-flex">
								<img src="/static/img/full-star-icon.png" alt="별점" width="30">
								<img src="/static/img/full-star-icon.png" alt="별점" width="30">
								<img src="/static/img/full-star-icon.png" alt="별점" width="30">
								<img src="/static/img/empty-star-icon.png" alt="별점" width="30">
								<img src="/static/img/empty-star-icon.png" alt="별점" width="30">
							</div>
							<div class="user-id-box">userId</div>
						</div>
					</div>
				</div>
				<div class="review-created-date">리뷰 작성 날짜</div>
			</div>
			<div>사진</div>
			<div>리뷰 내용</div>
		</div>
	</div>
</div>