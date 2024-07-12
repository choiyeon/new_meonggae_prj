<%@page import="com.store.meonggae.event.service.EventService"%>
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
<jsp:include page="../main_page/script.jsp" />
<script src="../common/JS/event_content_ajax.js"></script>
<!-- <script src="../common/JS/event_detail_ajax.js"></script> -->
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
			<div class="tab tab--item2" style="font-size: 20px; font-weight: 500 ">
				<form name="evt_frm" id="evt_frm">
					<input type="button" class="btn-gradient green small" name="event-type" value="진행중" style="margin-right: 5px"> 
					<input type="button" class="btn-gradient green small" name="event-type" value="종료">
				</form>
			</div>
			<c:choose>
				<c:when test="${not empty eventList}">
					<div class="article">
						<div class="event-board">
							<div class="list list--event">
								<ul class="list-ul">
									<c:forEach var="evtDomain" items="${eventList}" varStatus="i">
										<li class="list-item">
											<div class="event-item">
												<a
													href="${pageContext.request.contextPath}/event_page/event_detail.do?event-code=${evtDomain.eventNum}"
													class="event_link">
													<div class="list__thumb">
														<div class="image-container">
															<img
																src="${pageContext.request.contextPath}/common/images/${evtDomain.img}"
																alt="이벤트 이미지">
														</div>
													</div>
													<div class="list__content">
														<div class="list__subject" aria-label="제목">
															<span class="list__title"><c:out
																	value="${evtDomain.title}" /></span>
														</div>
														<div class="list__term">
															<strong>이벤트 기간</strong> :
															<c:out value="${evtDomain.start_date}" />
															~
															<c:out value="${evtDomain.end_date}" />
														</div>
													</div>
													<div class="list__status">
														<span class="list__status--ongoing">${ evtDomain.event_status }</span>
													</div>
												</a>
											</div>
										</li>
									</c:forEach>
								</ul>
								<div class="pagination" style="display: flex; justify-content: center;">${paging}</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="article">
						<p>이벤트 목록을 불러올 수 없습니다.</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 검색 창 시작 -->
		<div style="text-align: center; margin-top: 20px;">
			<form name="searchFrm" id="searchFrm" method="GET">
				<select name="field" id="field" style="height: 30px; vertical-align: middle; width: 70px;">
					<option value="0"${ param.field eq 0 ? " selected='selected' " : "" }>제목</option>
					<option value="1"${ param.field eq 1 ? " selected='selected' " : "" }>내용</option>
<%-- 					<option value="2"${ param.field eq 2 ? " selected='selected' " : "" }>진행상황</option> --%>
				</select>
				<input type="hidden" name="eventType" id="eventType" value="진행중"/>
				<input type="hidden" name="currentPage" id="currentPage" value="${ param.currentPage }"/>
				<input type="text" name="keyword" id="keyword" value="${ param.keyword }" style="width: 230px; height: 30px; vertical-align: middle;" />
				<input type="button" value="검색" id="btnSearch" class="btn-gradient green small" style="padding: 3px 9px !important; width: 80px; height: 30px; vertical-align: middle;"/>
				<input type="button" value="전체글" id="btnAllSearch" class="btn-gradient green small" style="padding: 3px 9px !important; width: 80px; height: 30px; vertical-align: middle;"/>
				<input type="text" style="display: none;"/>
			</form>
		</div>
		<!-- 검색 창 끝 -->
	</div>
	
	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>