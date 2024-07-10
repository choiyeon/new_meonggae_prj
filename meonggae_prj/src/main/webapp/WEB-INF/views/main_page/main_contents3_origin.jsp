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

<script src ="${pageContext.request.contextPath}/common/JS/script.js"></script>
<!-- <script src ="${pageContext.request.contextPath}/common/JS/infinite_scroll.js"></script> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/responsive.css">
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

    <div class="featured-items">

        <div class="container">

            <div class="row" style="width: 1140px">
                <div class="tab-content">

                    <div class="tab-pane active" id="trending">

                    	<div class="single-products">
							<c:forEach var="pd" items="${requestScope.prdAllList}" varStatus="i">
                            	<div class="single-product prevent-overflow">
                            		<div class="product-block">
                            			<a href="main_page/products_detail.do?goodsNum=${ pd.goodsNum }">
                            				<!-- 상세페이지로 이동 -->
											<img src="${pageContext.request.contextPath}/products-img/${ pd.imgName }" alt="" class="thumbnail">
											<div class="product-description">
												<p class="title">${ pd.goodsName }</p>
												<div style="overflow: hidden;">
													<p class="price" style="float: left;">${ pd.priceFm }원</p>
													<p class="location" style="float: left;"><i class="fa fa-map-marker" aria-hidden="true"></i>${ pd.locationStr }</p>
													<p class="time-ago" style="float: right;">${ pd.timeAgo }</p>
												</div>
											</div>
                            			</a>
									</div>
								</div>
							</c:forEach>
							<div id="listEnd"></div>
						</div>
                   	</div>

				</div>

			</div>

		</div>

	</div>

</div>
<!-- footer 시작 -->
<jsp:include page="../footer/footer.jsp" />
<!-- footer 끝 -->