<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="Insert info here"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-05-24

*/%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="${pageContext.request.contextPath}/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->

<link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/board.css" type="text/css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/main.css" type="text/css" media="all" />

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<!-- datepicker 시작-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$( function() {
		// 기본 사용
		//$( "#datepicker" ).datepicker();
		
		// 옵션 부여
		$( "#datepicker" ).datepicker({
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ], 
			dateFormat: "yy-mm-dd",
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			showMonthAfterYear: true
		});
	} );
</script>
<!-- datepicker 끝-->

<style type="text/css">
	
	
	
</style>

<script type="text/javascript">

	$(function() {

	}); // $(document).ready(function() { })

</script>

</head>
<body>

<div>
<br/>
<p>날짜: <input type="text" id="datepicker" style="width:100px;"></p>
<br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "등록" class="btn btn-primary"/><br/><br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "수정" class="btn btn-primary"/><br/><br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "완료" class="btn btn-primary"/><br/><br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "정지 지금 해제" class="btn btn-primary"/><br/><br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "취소" class="btn btn-secondary"/><br/><br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "닫기" class="btn btn-secondary"/><br/><br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "적용" class="btn btn-secondary"/><br/><br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "엑셀로 다운" class="btn btn-secondary"/><br/><br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "뒤로가기" class="btn btn-secondary"/><br/><br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "목록으로" class="btn btn-secondary"/><br/><br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "조회" class="btn btn-secondary"/><br/><br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "삭제" class="btn btn-danger"/><br/><br/>
&nbsp;&nbsp;&nbsp;<input type="button" value = "정지" class="btn btn-danger"/><br/><br/>
</div>

</body>
</html>