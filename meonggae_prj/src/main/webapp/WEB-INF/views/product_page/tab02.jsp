<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(function() {
    $(".change").click(function() {
        var row = $(this).closest("tr");

       
        if (row.find(".sellStatus").val() == 'N') {
        	var sell_status_code = "N";
        } else {
            var sell_status_code = "S";
        }

        var name = row.find(".name").val();
        var price = row.find(".price").val();
        var location = row.find(".location").val();
        var goodsNum = $(this).data("value");

        //alert("판매 상태 코드: " + sell_status_code + "\n이름: " + name + "\n가격: " + price + "\n위치: " + location + "\n상품 번호: " + goodsNum);

        $.ajax({
            url: "${pageContext.request.contextPath}/product_page/product_update.do",
            type: "POST",
            data: {
                'sell_status_code': sell_status_code,
                'name': name,
                'price': price,
                'location': location,
                'goodsNum': goodsNum
            },
            success: function(data) {
                window.location.reload(); // 업데이트 후 페이지를 새로고침하여 변경사항 반영
                alert("상품이 수정되었습니다.")
            },
            error: function(xhr, status, error) {
                //console.error('AJAX 요청 실패: ' + status + " " + error);
            }
        });
    });
    $("#delete").click(function() {
    	var result = confirm("정말 상품을 삭제하시겠습니까?");
    	
    	if(result){
        var row = $(this).closest("tr");

       
        if (row.find(".sellStatus").val() == 'N') {
        	var sell_status_code = "N";
        } else {
            var sell_status_code = "S";
        }//end else

        var name = row.find(".name").val();
        var price = row.find(".price").val();
        var location = row.find(".location").val();
        var goodsNum = $(this).data("value");


        $.ajax({
            url: "${pageContext.request.contextPath}/product_page/product_delete.do",
            type: "POST",
            data: {
                'sell_status_code': sell_status_code,
                'name': name,
                'price': price,
                'location': location,
                'goodsNum': goodsNum
            },
            success: function(data) {
                console.log("Update successful:", data);
                window.location.reload(); // 업데이트 후 페이지를 새로고침하여 변경사항 반영
                alert("상품이 삭제되었습니다.");
            },
            error: function(xhr, status, error) {
                console.error('AJAX 요청 실패: ' + status + " " + error);
            }//error
        });//ajax
    	}//end if
    });//click
});//ready
function checkSellStatus(select) {
    if (select.value.startsWith('S')) {
    	var goodsNumStr = select.value.substring(1);
    	window.open("check_buyer.do?goodsNum="+goodsNumStr, "checkBuyer", "width=472, height=241, top="+
    	(window.screenY+203)+", left="+(window.screenX+306));
    }
}
</script>
<form>
    <table class="table table-hover" style="width: 100%;">
        <thead>
            <tr>
                <th style="width: 150px;">물품</th>
                <th style="width: 100px;">상태</th>
                <th style="width: 100px;">카테고리</th>
                <th style="width: 150px;">상품명</th>
                <th style="width: 100px;">가격</th>
                <th style="width: 150px;">물품 상태</th>
                <th style="width: 150px;">직거래 장소</th>
                <th style="width: 50px;">찜</th>
                <th style="width: 50px;">수정</th>
                <th style="width: 50px;">삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${productList}">
                <tr>
                    <td><img alt="상품 정보"
                        src="${pageContext.request.contextPath}/products-img/${product.img}"></td>
                    <td><select name="sellStatus" class="sellStatus" onchange="checkSellStatus(this)">
                            <option value="N"
                                <c:if test="${product.sell_status_code == 'N'}">selected</c:if>>판매중</option>
                            <option value="S${product.goodsNum}"
                                <c:if test="${product.sell_status_code == 'S'}">selected</c:if>>판매완료</option>
                    </select></td>
                    <td>${product.category}</td>
                    <td><input type="text" value="${product.name}" name="name"
                        class="name"></td>
                    <td><input type="text" value="${product.price}" name="price"
                        class="price"></td>
                    <td><c:if test="${product.quality_code == '1'}">미개봉</c:if> <c:if
                            test="${product.quality_code == '2'}">거의 새 것</c:if> <c:if
                            test="${product.quality_code == '3'}">사용감 있음</c:if></td>
                    <td><input type="text" value="${product.location}"
                        name="location" class="location"></td>
                    <td>${product.cnt}</td>
                    <td>
                    <c:if test="${product.sell_status_code == 'N'}">
                    <input type="button" id=change class="change btn btn-success btn-sm"
                        value="수정" data-value="${product.goodsNum}">
                    </c:if>
                    </td>
                    <td><input type="button" id="delete" class="delete btn2 btn-danger btn-sm"
                        value="삭제" data-value="${product.goodsNum}"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</form>
