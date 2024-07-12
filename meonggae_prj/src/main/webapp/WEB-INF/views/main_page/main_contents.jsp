<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터</title>
<link rel="icon" href="${pageContext.request.contextPath}/common/tamcatIcon.ico"/>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<!-- Google Font -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
<!-- Theme Stylesheet -->

<%-- <script src ="${pageContext.request.contextPath}/common/JS/script.js"></script> --%>
<%-- <script src ="${pageContext.request.contextPath}/common/JS/infinite_scroll.js"></script><!-- 퀵메뉴js포함 --> --%>
<jsp:include page="../main_page/script.jsp" />
<jsp:include page="../main_page/infinite_scroll.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/infinite_scroll.css"><!-- 퀵메뉴css포함 -->
</head>
<body>
<!-- header 시작 -->
<jsp:include page="../header/header.jsp" />
<!-- header 끝 -->
<div class="contents">
        <div class="container">
		<!-- 캐러셀 시작 -->
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="3000">
			<!-- 슬라이드 -->
			<div class="carousel-inner" role="listbox">
			<c:forEach var="eventList" items="${eventList}" varStatus="i">
				<c:if test="${i.index == 1 }">
					<div class="item active">
						<a href="${pageContext.request.contextPath}/event_page/event_detail.do?event-code=${eventList.eventNum}">
							<img src="${pageContext.request.contextPath}/common/images/${eventList.img}" class="event-image" alt="${eventList.title}">
						</a>
					</div>
				</c:if>
				<c:if test="${i.index != 1 }">
					<div class="item">
						<a href="${pageContext.request.contextPath}/event_page/event_detail.do?event-code=${eventList.eventNum}">
							<img src="${pageContext.request.contextPath}/common/images/${eventList.img}" class="event-image" alt="${eventList.title}">
						</a>
					</div>
				</c:if>
			</c:forEach>
			<!-- 좌우 버튼 -->
			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> 
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> 
			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> 
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- 캐러셀 끝 -->
	</div>
	<!--퀵메뉴 시작 -->
	<div class="quickmenu">
  		<ul class="steamCount">
  			<c:if test="${ empty steamList }">
    		<li>
    			<a href="#void">찜한 상품<br>
    			<i class="fa fa-heart-o"></i> 
    			<span>0</span>
    			</a>
    		</li>
    		</c:if>
  			<c:if test="${ not empty steamList && steamList.steamCnt != 0 }">
    		<li>
    			<a href="${pageContext.request.contextPath}/My/mypage/dibs/dibsGoods_frm.do">찜한 상품<br>
    			<i class="fa fa-heart"></i> 
    			<span>${ steamList.steamCnt }</span>
    			</a>
    		</li>
    		</c:if>
  		</ul>
  		<ul class="recentPrd">
    		<c:if test="${ empty recentPrd }">
    		<li><a href="#void">최근 본 상품
    		<div class="recentPic">
    			<img src="${pageContext.request.contextPath}/common/images/eye.png" alt="빈 최근본상품 아이콘" >
    			<div class="recentMsg">
    				<p>최근 본 상품이<br> 없습니다.</p>
    			</div>
    		</div>
    		</a>
    		</li>
    		</c:if>
    		<c:if test="${not empty recentPrd }">
    		<li><a href="main_page/products_detail.do?goodsNum=${recentPrd.goodsNum}">최근 본 상품
    		<div class="recentPic notEmpty">
    			<img src="${pageContext.request.contextPath}/products-img/${recentPrd.imgName}" alt="최근본상품 이미지" >
    		</div>
    		</a>
    		</li>
    		</c:if>
  		</ul>
  		<ul class="toTheTop">
    		<li><a href="#">TOP</a></li>
  		</ul>
	</div>
	<!--퀵메뉴 끝 -->

    <div class="featured-items">

                <div class="tab-content">

                    <div class="tab-pane active" id="trending">
						<!--상품 하나 -->
                    	<div class="single-products">
							<!--무한스크롤 감지 -->
							<div id="listEnd"></div>
						</div>
                   	</div>

				</div>

	</div>

</div>
<!-- footer 시작 -->
<jsp:include page="../footer/footer.jsp" />
<!-- footer 끝 -->