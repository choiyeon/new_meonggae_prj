<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 검사</title>
<link rel="icon" href="${pageContext.request.contextPath}/common/tamcatIcon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->

<!-- sist스타일시트 -->
<link rel="stylesheet" href="https://www.sist.co.kr/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="https://www.sist.co.kr/css/board.css" type="text/css" media="all" />
<!-- sist스타일시트 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/check_buyer.css">
<script src ="../common/JS/id_dup.js"></script>

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<script type="text/javascript">
function sell() {
	const goodsNum = $("#goodsNum").val();
	const buyers = document.querySelector('#buyers');
	const buyer = buyers.options[buyers.selectedIndex];
	const value = buyer.value;
	if(value == "0"){
		alert("구매자를 선택해주세요.");
		return;
	}else{
		
	alert(value);
        $.ajax({
            url: "${pageContext.request.contextPath}/product_page/product_buy.do",
            type: "POST",
            data: {
                'buyer': value,
                'goodsNum': goodsNum
            },
            success: function(data) {
                alert("상품이 판매되었습니다.")
                window.close();
            },
            error: function(xhr, status, error) {
                //console.error('AJAX 요청 실패: ' + status + " " + error);
            }//error
        });//ajax
	}//end else
}//sell
</script>
</head>
<body onload="document.board.goodsNum.focus();">

<div id="wrap">
	<div id="member" class="idCheck_wrap">
		<div id="mpop">
			<form name="board" method="get" action="check_buyer.do">
			<h2>구매자 선택</h2>
					<div class="bgBox">
						<dl class="conBox">
							<dd>
                    			<select name="buyers" id="buyers" class="buyers">
                            		<option value="0">------구매자를 선택해주세요.------</option>
									<c:forEach var="buyer" items="${buyerList}">
                            			<option value="${buyer.MEM_NUM_SEND}">${buyer.NICK}</option>
            						</c:forEach>
                    			</select>
							</dd>
						</dl>
					</div>
			</form>
			<div id="dupResult">
			<div style="margin: 10px 0 0 0">
				<a href="#" id="btns" onclick="sell();" class="button btnPush btnBlueGreen">판매 완료</a>
			</div>
				<input type="hidden" id="goodsNum" value="${param.goodsNum}" />
			</div>
		</div>
		<!-- //mpop -->
	</div>
	<!-- //member -->
</div>
</body>
</html>
