<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="qna-area">
	<div>
		<div class="qna-btn-area">
			<button type="button" id="qnaBtn" class="btn btn-lg btn-secondary">문의하기</button>
		</div>
		
		<!-- 문의 목록 -->
		<div>
			<div class="d-flex">
				<div class="exist-comment">답변 완료</div>
				<div class="col-8">문의 제목</div>
				<div>작성자 아이디</div>
			</div>
			<div class="d-flex">
				<div class="non-comment">답변 예정</div>
				<div class="col-8">문의 제목</div>
				<div>작성자 아이디</div>
			</div>
			
		</div>
		
		<!-- 문의 하기 -->
		<div class="qna-content-area mt-5">
			<div class="qna-box">
				<!-- 문의 유형 선택 영역 -->
				<label for="qnaType">문의 유형</label>
				<select id="qnaType" class="form-control">
					<option selected>상품 문의 유형</option>
					<option>상품 상세 문의</option>
					<option>배송</option>
					<option>재입고</option>
				</select>
				
				<!-- 문의 제목 -->
				<label for="qnaTitle">제목</label>
				<input id="qnaTitle" class="form-control" placeholder="제목을 입력해주세요.">
				
				<!-- 문의 내용 -->
				<label for="qnaContent">내용</label>
				<textarea id="qnaContent" class="form-control" rows="10" placeholder="내용을 입력해주세요."></textarea>
			</div>
		</div>
	</div>
</div>