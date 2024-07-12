<%@page import="com.store.meonggae.event.dao.UserEventDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.store.meonggae.event.domain.EventDomain"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터</title>
<link rel="icon" href="${pageContext.request.contextPath}/common/tamcatIcon.ico" />

<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<!-- Google Font -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	type="text/css">
<!-- Theme Stylesheet -->
<!-- <script src="../common/JS/script.js"></script> -->
<!-- <script src="../common/JS/event_content_ajax.js"></script> -->
<jsp:include page="../main_page/script.jsp" />
<jsp:include page="../event_page/event_content_ajax.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/common/CSS/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/common/CSS/event_style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/common/CSS/responsive.css">
</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="../header/header.jsp" />
	<div class="container" >
		<div>
			<h1>이벤트</h1>
		</div>
		<hr>
		<div id="event_main">
			<%-- eventDetail 객체가 존재하는지 확인 --%>
			<c:choose>
				<c:when test="${not empty eventDetail}">
					<div class="container" style="height: 1000px;">
						<table class="table table-hover" style="width: 100%;">
							<tr>
								<th style="width: 50%">제목 : ${eventDetail.title}</th>
								<!-- <th style="width: 20%">작성자(DB에서 ID)</th> -->
								<th style="width: 20%">조회 수 : ${eventDetail.cnt}</th>
								<th style="width: 5%"><a
									href="${pageContext.request.contextPath}/event_page/event_main.do">목록으로</a></th>
							</tr>
							<tr>
								<td colspan="5"><img
									src="${pageContext.request.contextPath}/common/images/${eventDetail.img}"
									style="width: 100%; height: auto;">
									${eventDetail.content}</td>
							</tr>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<div class="container" style="height: 1000px;">
						<p>이벤트 정보를 찾을 수 없습니다. 다시 시도해 주세요.</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>