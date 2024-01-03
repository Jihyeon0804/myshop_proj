<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div>
	<h4>나의 리뷰</h4>
	<div class="d-flex justify-content-between mt-5">
		<div class="d-flex">
			<img src="/static/img/sample-thumbnail.jpg" alt="장바구니 테스트 이미지" width="150">
			<div>
				<div>구매일자	2023-11-22</div>
				<div>커피창고 원두커피 200g 3봉</div>
				<div>옵션명(optional)</div>
			</div>
		</div>
		<div>
			<button id="postReviewBtn" class="btn btn-light" data-toggle="modal" data-target="#postReivewModal" data-product-id="1">
				리뷰 작성
			</button>
		</div>
	</div>
	<div class="d-flex justify-content-between mt-5">
		<div class="d-flex">
			<img src="/static/img/sample-thumbnail.jpg" alt="장바구니 테스트 이미지" width="150">
			<div>
				<div>구매일자	2023-11-22</div>
				<div>커피창고 원두커피 200g 3봉</div>
				<div>옵션명(optional)</div>
			</div>
		</div>
		<div class="d-flex flex-column">
			<button class="btn btn-light" id="updateReviewBtn">리뷰 수정</button>
			<button class="btn btn-light" id="deleteReviewBtn">리뷰 삭제</button>
		</div>
	</div>
</div>

<!-- Post Review Modal -->
<div class="modal fade" id="postReivewModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰 작성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body d-flex justify-content-center">
        <div>
        	<ul class="review-content p-0">
        		<li class="review-rate">
        			<div class="star-rate d-flex">
        				<span>상품은 어떠셨나요?</span>
        				<ul id="rating" class="d-flex">
        					<li>
        						<button class="star">1</button>
        					</li>
        					<li>
        						<button class="star">2</button>
        					</li>
        					<li>
        						<button class="star">3</button>
        					</li>
        					<li>
        						<button class="star">4</button>
        					</li>
        					<li>
        						<button class="star">5</button>
        					</li>
        				</ul>
        			</div>
        		</li>
        		<li class="review-content">
        			<div>
        				<span>리뷰를 작성해주세요.</span><br>
        				<textarea id="reviewContent"></textarea>
        			</div>
        		</li>
        		<li class="review-photo">
        			<div>
        				<span>사진</span>
        				<div class="d-flex justify-content-between post-area">
        					<div class="photo-area">
	        					<input type="file" accept=".jpg, .png, .jpeg, .gif" class="d-none fileInput">
	        					<button class="add-btn">추가</button>
	        					<img class="preview" src="">
	        					<button class="del-btn d-none">삭제</button>
        					</div>
        					<div class="photo-area">
	        					<input type="file" accept=".jpg, .png, .jpeg, .gif" class="d-none fileInput">
	        					<button class="add-btn">추가</button>
	        					<img class="preview" src="">
	        					<button class="del-btn d-none">삭제</button>
        					</div>
        					<div class="photo-area">
	        					<input type="file" accept=".jpg, .png, .jpeg, .gif" class="d-none fileInput">
	        					<button class="add-btn">추가</button>
	        					<img class="preview" src="">
	        					<button class="del-btn d-none">삭제</button>
        					</div>
        					<div class="photo-area">
	        					<input type="file" accept=".jpg, .png, .jpeg, .gif" class="d-none fileInput">
	        					<button class="add-btn">추가</button>
	        					<img class="preview" src="">
	        					<button class="del-btn d-none">삭제</button>
        					</div>
        					<div class="photo-area">
	        					<input type="file" accept=".jpg, .png, .jpeg, .gif" class="d-none fileInput">
	        					<button class="add-btn">추가</button>
	        					<img class="preview" src="">
	        					<button class="del-btn d-none">삭제</button>
        					</div>
        				</div>
        			</div>
        		</li>
        	</ul>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" id="postReview" class="btn btn-primary">등록하기</button>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
	
	// 별점 선택
	$('.star').on('click', function() {
		let point = $(this).text();		// 3
		point = Number(point);
		$('#rating li:nth-child(-n+ ' + (point) +')').addClass('on');			//:nth-child(-n+point); 처음부터 선택한 곳까지 채워진 별
		$('#rating li:nth-child(n+ ' + (point+1) +')').removeClass('on');		//:nth-child(n+point+1); 선택한 곳 이후 나미저는 비워진 별
	});
	
	
	
	// 사진 업로드 클릭 시
	$('.add-btn').on('click', function() {
		$(this).siblings('.fileInput').click();
	});
	
	$('.fileInput').on('change', function(e) {
		let previewInput = $(this).siblings('.preview');
		let addBtn = $(this).siblings('.add-btn');
		let delBtn = $(this).siblings('.del-btn');
		
		// 파일명 가져오기
		let fileName = e.target.files[0].name;

		// 확장자 유효성 확인
		let ext = fileName.split(".").pop().toLowerCase();
		
		
		if (ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'jpeg') {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$('.fileInput').val("");			// 파일 태그에 파일 제거(보이지 않지만 업로드 될 수 있으므로 주의)
			return;
		}
		
		// 업로드한 이미지 미리보기
		var reader = new FileReader();
		reader.onload = function(e) {
			addBtn.addClass('d-none');
			previewInput.attr('src', e.target.result);
			previewInput.css('width', 85);
			previewInput.css('height', 85);
		 };
		 reader.readAsDataURL(e.target.files[0]);
		 delBtn.removeClass('d-none');
	});
	
	
	// 이미지 삭제 버튼 클릭 시
	$('.del-btn').on('click', function() {
		$(this).siblings('.fileInput').val('');
		$(this).siblings('.preview').attr('src', '');
		$(this).siblings('.preview').css('width', 0);
		$(this).siblings('.preview').css('height' ,0);
		$(this).siblings('.add-btn').removeClass('d-none');
		$(this).addClass('d-none');
	});
	
	// 등록하기 버튼 클릭 시 
	$('#postReview').on('click', function() {
		let productId = $('#postReviewBtn').data('product-id');
		let point = $('#rating > .on').length; 		// 별점
		let content = $('#reviewContent').val();	// 리뷰
		if (content.length < 5) {
			alert("리뷰 내용은 최소 5자 이상으로 적어주세요.");
			return;
		}
		let imageArray = [];
		//console.log(imageArray);
		$.each($('.fileInput'), function (index ,el) {
			if (typeof el.files[0] != 'undefined') {
				imageArray.push(el.files[0]);
			}
		});
		//console.log(imageArray);

		let formData = new FormData();
		formData.append("productId", productId);
		formData.append("point", point);
		formData.append("content", content);
		$.each(imageArray, function (index ,el) {
			formData.append("files", el);
		});
		
		$.ajax({
			// request
			type:"post"
			, url:"/review/post"
			, data:formData
			, enctype:"multipart/formdata"
			, processData:false
			, contentType:false
			
			, success:function(data) {
				if (data.code == 200) {
					alert("success");
				} else {
					alert("fail");
				}
			}
			, error:function(request, status, error) {
				alert("fail");
			}
		});
	});
});
</script>