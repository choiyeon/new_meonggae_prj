<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
const options = [
    "--카테고리 선택--","여성의류", "남성의류", "가방/지갑", "악세서리", "디지털", "스타굿즈", "도서/문구", "뷰티/미용", "상의",
    "바지", "치마", "원피스", "언더웨어/홈웨어", "아우터", "상의", "하의", "여성가방", "남성가방",
    "여행용가방", "귀걸이", "목걸이", "반지", "노트북", "무선이어폰", "스마트폰", "포스터", "포토카드",
    "피규어", "도서", "문구", "티켓", "스킨케어", "색조메이크업", "남성화장품","기타"
];

console.log(options[1]);

let optionTags = "";
for (let i = 0; i < options.length; i++) {
    optionTags += '<option value="' + (i) + '">' + options[i] + '</option>\n';
}

console.log("Final optionTags:", optionTags);  // 최종 optionTags를 로그로 출력

document.getElementById('category_num').innerHTML = optionTags;
</script>
		<form name="newProduct" id="newProduct"
			action="${pageContext.request.contextPath}/product_page/product_add.do"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-section">
				<div class="form-group">
					<label for="image">상품이미지</label> 
					<img id="image-preview" class="image-preview" src=""> 
					<input type="file" id="img" name="img" accept="image/*" onchange="previewImage(event)">
				</div>
				<div class="form-group">
					<label for="name">상품명</label> <input type="text" id="name" name="name" required>
				</div>
				<div class="form-group">
					<label for="category_num">카테고리</label> <select id="category_num" name="category_num" required>
					</select>
				</div>
				<div class="form-group">
					<label for="price">가격</label> 
					<input type="text" id="price" name="price" required>
				</div>
				<div class="form-group">
					<label for="deliver_fee">배송비</label> <input type="text" id="deliver_fee" name="deliver_fee" value="0" required>
				</div>
			</div>
			<div class="form-section">
				<div class="form-group">
					<label>물품 상태</label>
					<div class="radio-group">
						<label><input type="radio" name="quality_code" value="1" required>새상품(미사용)</label> 
						<label><input type="radio" name="quality_code" value="2" required>사용감없음</label> 
						<label><input type="radio" name="quality_code" value="3" required>사용감적음</label> 
						<label><input type="radio" name="quality_code" value="4" required>사용감많음</label> 
						<label><input type="radio" name="quality_code" value="5" required>고장/파손 상품</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="location">직거래 장소</label> 
				<input type="text" id="location" name="location" required>
			</div>
			<div class="form-section">
				<div class="form-group">
					<label for="detail">설명</label>
					<textarea id="detail" name="detail" rows="5" required></textarea>
				</div>
			</div>
			<div class="form-section">
				<div class="form-group">
					<label>거래 방식</label>
					<div class="radio-group">
						<label><input type="radio" name="trade_method_code" value="B" required>택배/직거래</label> 
						<label><input type="radio" name="trade_method_code" value="P" required>택배</label>
						<label><input type="radio" name="trade_method_code" value="D" required>직거래</label>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button type="button" id="add" class="btn btn-success">등록하기</button>
<!-- 				<button type="button" id="change" class="btn btn-secondary">변경하기</button> -->
<!-- 				<button type="button" id="delete" class="btn btn-warning">삭제하기</button> -->
			</div>
		</form>