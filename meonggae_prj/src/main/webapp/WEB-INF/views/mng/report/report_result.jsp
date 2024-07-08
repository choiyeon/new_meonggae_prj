<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="신고 리스트 조회"%>
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
입력하신 신고번호 [<strong><c:out value="${ param.rep_num }"/></strong>번] 신고번호검색결과<br>
<c:catch var="e">
<table class="table table-hover">
<tr>
<th style="width: 80px">신고번호</th>
<th style="width: 200px">제목</th>
<th style="width: 80px">상품번호</th>
<th style="width: 120px">신고자</th>
<th style="width: 120px">작성일</th>
<th style="width: 120px">처리상태</th>
</tr>
<c:if test="${ empty requestScope.listReport }">
<tr>
<td colspan="5" style="text-align: center">
사원이 존재하지 않는 부서
</td>
</tr>
</c:if>
<c:forEach var="rd" items="${ requestScope.listReport }" varStatus="i">
<tr>
<td><c:out value="${ rd.rep_num }"/></td>
<td><a href="report_detail.do?rep_num=${ rd.rep_num }"><c:out value="${ rd.title }"/></a></td>
<td><c:out value="${ rd.goods_num }"/></td>
<td><c:out value="${ rd.mem_num_rep }"/></td>
<td><c:out value="${ rd.input_date }"/></td>
<td><c:out value="${ rd.process_status_code }"/></td>
</tr>
</c:forEach>
</table>
</c:catch>
<c:if test="${ not empty e }">
신고번호는 숫자로만 구성됩니다.
</c:if>


	
</div>
</body>
</html>