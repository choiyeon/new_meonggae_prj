<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="문의 리스트 조회"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--<link rel="icon" href="http://192.168.10.210/spring_mvc/common/favicon.ico"/>-->
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet" href="http://211.63.89.135/spring_mvc/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://211.63.89.135/spring_mvc/common/css/board.css" type="text/css" media="all" />
<!--jquery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jquery CDN 끝-->

<style type="text/css">
	
	
</style>
<script type="text/javascript">
	$(function(){
	
	});//ready
</script>
</head>
<body>
<div>
입력하신 문의번호 [<strong><c:out value="${ param.inquiry_num }"/></strong>번] 문의번호검색결과<br>
<c:catch var="e">
<table class="table table-hover">
<tr>
<th style="width: 80px">문의번호</th>
<th style="width: 200px">제목</th>
<th style="width: 120px">관리자아이디</th>
<th style="width: 120px">작성일</th>
<th style="width: 200px">답변상태</th>
</tr>
<c:if test="${ empty requestScope.listInquiry }">
<tr>
<td colspan="5" style="text-align: center">
사원이 존재하지 않는 부서
</td>
</tr>
</c:if>
<c:forEach var="id" items="${ requestScope.listInquiry }" varStatus="i">
<tr>
<td><c:out value="${ id.inquiry_num }"/></td>
<td><a href="inquiry_detail.do?inquiry_num=${ id.inquiry_num }"><c:out value="${ id.title }"/></a></td>
<td><c:out value="${ id.answer_manager_id }"/></td>
<td><c:out value="${ id.input_date }"/></td>
<td><c:out value="${ id.answer_flag }"/></td>
</tr>
</c:forEach>
</table>
</c:catch>
<c:if test="${ not empty e }">
사원번호는 숫자로만 구성됩니다.
</c:if>

<div style="text-align:  center;">
	<form action="inquiry_result.jsp" name="frmBoard" id="frmBoard">
		<select name="field" id="field">
		<option value="0"${ param.field eq 0?" selected='selected'":"" }>제목</option>
		<option value="1"${ param.field eq 1?" selected='selected'":"" }>내용</option>
		<option value="2"${ param.field eq 2?" selected='selected'":"" }>작성자</option>
		</select>
		<input type="text" name="keyword" id="keyword" value="${ param.keyword }" style="width: 230px"/>
		<input type="button" value="검색" id="btnSearch" class="btn btn-info btn-sm"/>
		<input type="button" value="전체글" id="btnAllSearch" class="btn btn-info btn-sm"/>
		<input type="text" style="display: none;"/>
	</form>
	</div>
	
</div>
</body>
</html>