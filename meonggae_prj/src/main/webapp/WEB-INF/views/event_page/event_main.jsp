<%@page import="com.store.meonggae.event.service.EventService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터</title>
<link rel="icon" href="http://localhost/meonggae_prj/common/tamcatIcon.ico" />

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
<script src="../common/JS/script.js"></script>
<script src="../common/JS/event_content_ajax.js"></script>
<script src="../common/JS/event_detail_ajax.js"></script>
<link rel="stylesheet"
	href="http://localhost/meonggae_prj/common/CSS/style.css">
<link rel="stylesheet"
	href="http://localhost/meonggae_prj/common/CSS/event_style.css">
<link rel="stylesheet"
	href="http://localhost/meonggae_prj/common/CSS/responsive.css">
</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="../header/header.jsp" />
	<div class="container" style="height: 1000px;">
		<div>
			<h1>이벤트</h1>
		</div>
		<hr>
		<div id="event_main">
			<div class="tab tab--item2">
				<form name="evt_frm" id="evt_frm">
					<input type="button" name="event-type" value="진행중"> <input
						type="button" name="event-type" value="종료">
				</form>
			</div>
			<c:choose>
				<c:when test="${not empty eventList}">
					<%--        총 레코드의 수 : ${totalCnt}건<br />
                    한 화면에 보여줄 게시물 수 : ${pageScale}건<br />
                    총 페이지 수 : ${totalPage}장<br />
                    클릭한 페이지 : ${currentPage}<br /> --%>
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
																src="${pageContext.request.contextPath}/common/images/event${evtDomain.img}"
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
														<span class="list__status--ongoing">진행</span>
													</div>
												</a>
											</div>
										</li>
									</c:forEach>
								</ul>
								<div class="pagination">${paging}</div>
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
	</div>
	
	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 끝 -->
</body>
</html>