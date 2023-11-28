<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<h4>찜한 상품</h4>
	<div>
		<div class="d-flex align-items-center justify-content-between mt-5">
			<div class="d-flex align-items-center">
				<img src="/static/img/sample-thumbnail.jpg" alt="찜 목록 테스트 이미지"
					width="150">
				<div class="ml-3">
					<div>구매일자 2023-11-22</div>
					<div>커피창고 원두커피 200g 3봉</div>
				</div>
			</div>
			<div class="d-flex flex-column">
				<button class="btn">
					<img src="/static/img/full-heart-icon.png" alt="is-product-like"
						width="30">
				</button>
				<button class="btn mt-3" data-toggle="modal" data-target="#liekToCartModal">
					<img src="/static/img/cart-icon.png" alt="is-product-like"
						width="35">
				</button>
			</div>

			<!-- 장바구니로 이동 시 해당 상품의 옵션이 있을 경우 모달 창으로 옵션 띄운 후 이동  -->
			<div class="modal fade" id="liekToCartModal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h3>옵션 선택</h3>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body d-flex">
							<img src="/static/img/sample-thumbnail.jpg" alt="찜 목록 테스트 이미지" width="150">
							<div class="w-100 ml-3 mt-3">
								<div>커피창고 원두커피 200g 3봉</div>
								<select class="form-control w-100 mt-3">
									<option selected disabled>옵션을 선택해주세요.</option>
									<option>옵션1</option>
									<option>옵션2</option>
									<option>옵션3</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">닫기</button>
							<button id="likeToCartBtn" type="button"
								class="btn btn-primary" data-dismiss="">장바구니 담기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	
</script>