<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="qna-area">
	<div>
		<div class="qna-btn-area mt-5">
			<button type="button" id="inquireBtn" data-toggle="modal"
				data-target="#inquireModal" class="btn btn-lg btn-secondary">문의하기</button>
		</div>

		<div class="modal fade" id="inquireModal">
			<div class="modal-dialog modal-xl modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="inquireTitle">문의하기</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="qna-content-area">
							<div class="qna-box">
								<!-- 문의 유형 선택 영역 -->
								<label for="qnaType">문의 유형</label> <select id="qnaType"
									class="form-control">
									<option selected disabled>상품 문의 유형</option>
									<option>상품 상세 문의</option>
									<option>배송</option>
									<option>재입고</option>
								</select>

								<!-- 문의 제목 -->
								<label for="qnaTitle">제목</label> <input id="qnaTitle"
									class="form-control" placeholder="제목을 입력해주세요.">

								<!-- 문의 내용 -->
								<label for="qnaContent">내용</label>
								<textarea id="qnaContent" class="form-control" rows="10"
									placeholder="내용을 입력해주세요."></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button id="RequestInquireBtn" type="button"
							class="btn btn-primary" data-dismiss="">등록하기</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 문의 목록 -->
		<div class="d-flex justify-content-center inquire-list">
			<c:if test="${empty qnaList}">
				<div class="empty-box">
					<div class="text-center">
						<img alt="없음" src="/static/img/empty-icon.png">
						<div>등록된 상품 문의가 없습니다.</div>
					</div>
				</div>
			</c:if>
			<c:if test="${not empty qnaList}">
			<div class="inquire-list-box">
				<c:forEach items="${qnaList}" var="qna">
				
					<div class="d-flex justify-content-between mt-3">
						<c:if test="${not empty qna.answer}">
							<div class="exist-comment">답변 완료</div>
						</c:if>
						<c:if test="${empty qna.answer}">
							<div class="non-comment">답변 예정</div>
						</c:if>
						<div class="inquire-title">${qna.inquire.title}</div>
						<div class="inquire-writer">${qna.user.loginId}</div>
					</div>
				</c:forEach>
			</div>
			</c:if>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	
	$('#RequestInquireBtn').on('click', function() {
		let type = $('#qnaType').val();
		let title = $('#qnaTitle').val();
		let content = $('#qnaContent').val();
		if (type == null) {
			$('#qnaType').addClass('is-invalid');
			return;
		} else {
			$('#qnaType').removeClass('is-invalid');
		}

		if (title == '') {
			$('#qnaTitle').addClass('is-invalid');
			return;
		} else {
			$('#qnaType').removeClass('is-invalid');
		}

		if (content == '') {
			$('#qnaContent').addClass('is-invalid');
			return;
		} else {
			$('#qnaContent').removeClass('is-invalid');
		}

		// ajax
		$.ajax({
			// request
			type : "post",
			url : "/inquire/add",
			data : {
				"productId" : "1",
				"type" : type,
				"title" : title,
				"content" : content
			}

			// response
			,
			success : function(data) {
				if (data.code == 200) {
					location.reload();
				} else {
					alert("상품 문의 등록에 실패했습니다. 다시 시도해 주세요.")
				}

			},
			error : function() {
				alert("상품 문의 등록에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
});
</script>