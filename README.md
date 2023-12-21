# 쇼핑몰 개인 프로젝트
## ☕ 프로젝트 소개
  * <a href="https://coffeecg.com/">커피창고</a> 사이트를 참고하여 만든 커피 쇼핑몰입니다.
<br><br>
  * 프로젝트 메인 화면
<div align="center">
  <img src="https://github.com/Jihyeon0804/myshop_proj/assets/80299604/f6ebecd2-c832-4512-9c28-bade26a7e8c0"/>
</div>

## 👩🏻‍💻 개발 기간
  * 2023.11.13 ~ 2023.12.13

## 💡기술 스택
<div>
  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
  <img src="https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white">
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
  <br>
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
  <br>
  <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
  <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white">
  <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
  <br>

  <img src="https://img.shields.io/badge/amazonaws-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white"> 
  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
  <br>
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
</div>

## 화면
  * 메인<br><br>
  ![메인화면](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/5855f7f6-85b5-4ed9-ba0f-2f95fe2284ef)

  * 상품 상세<br><br>
    * 결제하기 버튼 클릭 시 결제 화면으로 이동
    * 장바구니 담기 클릭 시 완료 창을 alert으로 띄우고 location.reload()
    * 장바구니 목록은 마이페이지 장바구니 또는 우측 상단 장바구니 버튼을 통해 이동 가능
  ![상품상세](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/801d919d-e3cf-4e5c-86a6-90e1c28a23aa)
  * 상품 상세 설명<br><br>
  ![상품 상세설명](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/c45ca5a8-70fc-4145-906b-fd0522fec2cc)

  * 상품 리뷰<br><br>
  ![상품 리뷰](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/37a7c4c0-4e22-4f22-9812-aed724f12a03)
    * 사진 리뷰만 보기 선택시 사진이 포함된 리뷰만 보이도록 구현
    * 리뷰 작성은 마이페이지 나의 리뷰에서 작성/수정/삭제 가능
     <br><br>
  * 상품 문의<br><br>
  ![상품 문의](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/9765ac04-8bce-4d1b-9e11-ed7ca27744e6)
    * 문의 내용에 답변이 작성된 문의는 문의 완료, 답변이 없는 문의는 답변 예정으로 색깔을 구분지어 표기하도록 구현
    * 문의하기 버튼 클릭 시 모달 창으로 문의 작성 화면을 띄우도록 구현<br><br>
    ![문의하기](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/662d7000-7d35-4ca8-8719-10f42a499259)
  * 결제하기<br>
    * 상품 상세 화면에서 결제하기 버튼 클릭 시 이동되는 페이지
    * 기존 배송지 체크 시 사용자 정보에 등록되어 있는 주소 가져오도록 구현
    * 신규 배송지 체크 시 주소 부분 비워지도록 구현<br><br>
    ![결제 화면](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/c6ee578d-4b03-46f9-8785-de83d5687e0f)
  * 결제하기 - 주소 찾기<br>
    * 행정안전부 도로명 주소 찾기 API 사용<br><br>
    ![배송지 주소 입력](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/a4dbeddd-26df-4582-8f76-3a7d0ad2315a)
    * 주소 선택 시 우편번호와 도로명주소, 상세 주소 구분하여 출력<br><br>
    ![배송지 주소 넣기&주문상품정보](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/16f2bdfe-2ab4-4c84-ac56-e538853d5b71)
  * 결제하기 - 결제<br><br>
  ![결제 진하기 버튼](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/ad63e5b4-f1de-4ba5-8d42-c69468bca4d7)
  * 결제창
    * 결제하기 버튼 클릭 시 이동되는 페이지
    * 결제 완료 후 결제 성공 창 띄우기 (메인화면으로 이동, 주문 목록으로 이동할지 선택 가능)<br><br>
    ![결제창](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/15f28d9e-9f4a-46f5-be1a-cf9937d6086f)
  * 마이페이지 - 메인
    * 우측 상단의 로그인된 사용자의 이름 클릭 시 이동 가능한 페이지<br><br>
    ![마이페이지 메인](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/f8393c4d-2f42-4acc-a1e9-59bdb8aac5f6)
  * 마이페이지 - 주문/배송조회
    * 주문 목록에서 상세보기 클릭 시 주문 시 입력된 정보를 표기하도록 구현<br><br>
    ![마이페이지 배송 상세정보](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/da13e9bc-36c5-4de3-b502-520eabf900e0)
 * 마이페이지 - 장바구니
    * 삭제 버튼 클릭 시 장바구니 목록에서 삭제 되도록 구현
    * 삭제 버튼에 data 속성을 이용하여 Cart 테이블의 id를 지정 후 id로 Cart 테이블의 데이터 Delete 후 location.reload())<br><br>
    ![마이페이지 장바구니](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/de590bee-8971-4c62-b9ba-3b71338f525e)
 * 마이페이지 - 찜하기
    * 삭제 버튼 클릭 시 찜하기 목록에서 삭제 되도록 구현
    * Like 테이블에서 userId와 productId로 Delete 후 location.reload()<br><br>
    ![마이페이지 찜하기](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/96769434-050a-4be4-878d-f1462b4bb68e)
 * 마이페이지 - 내 정보 수정
    * 이름과 아이디는 변경할 수 없도록 구현
    * 수정하기 버튼 클릭 시 User 테이블 Update 후 변경되었다는 alert 창을 띄운 후 location.reload()
    * 취소 버튼 클릭 시 마이페이지 메인 화면으로 이동<br><br>
    ![마이페이지 내정보수정](https://github.com/Jihyeon0804/myshop_proj/assets/80299604/ae4ea64a-e688-434b-98ab-6ecce37c796c)
