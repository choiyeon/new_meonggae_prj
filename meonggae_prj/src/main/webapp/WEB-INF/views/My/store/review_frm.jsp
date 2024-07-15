<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="나의 상점_리뷰"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
<c:when test="${ empty param.nick }">
	<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			location.href="${pageContext.request.contextPath}/index.do";
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("비정상적인 접근입니다.");
			location.href="${pageContext.request.contextPath}/index.do";
		</script>
	</c:otherwise>
	</c:choose>
</c:when>
<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<!-- header -->
<c:import url="/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/My/css/style_store.css?a1">

<style type="text/css">

	.star-rating,.star-rating span {
		display: inline-block;
		height: 55px;
		overflow: hidden;
		background: url(${pageContext.request.contextPath}/common/My/image/star.png) no-repeat;
	}
	
	.wrap-star {
		text-align: left;
		height: 55px;
		width: 304px;
		margin-top: 20px; 
	}
	
	.star-rating {
		width: 304px;
	}
		
	.star-rating span {
		background-position: left bottom;
		line-height: 0;
		vertical-align: top;
	}

</style>

<!-- CSS -->

<script type="text/javascript">
			
	$(function(){
		var startNum = 3;
		var endNum = 4;
		
		$("#moreReviewBtn").click(function(){
			
			var url = new URL(window.location.href);
			var params = url.searchParams;
			var nick = params.get("nick");

			
			$.ajax({
				url: "${pageContext.request.contextPath}/My/store/store_more_review.do?nick=" + nick + "&startNum="
						+ startNum + "&endNum=" + endNum,
				type: "GET",
				error: function(xhr){
				},
				success: function(list){
					var output = "";
					
					if(list == ""){
						output += "<div class=\"noMoreReview\">";
						output += "마지막 리뷰입니다.";
						output += "</div>";
						$("#output").append(output);
						$("#moreReviewBtn").css("display", "none");
						return;
					}//end if
					
					$.each(list, function(i, data){
						output += "<div class=\"reviewerName\">" + data.writer + "</div>";
						output += "<span class=\"stars\">★</span><span class=\"scoreFont\">"
							+ data.starScore + "점</span>";
						output += "<div class=\"reviewContent\">" + data.content + "</div>";
						output += "<hr>";
					});
					
					
					$("#output").append(output);
				}//success
			});//ajax
			
			startNum += 2;
			endNum += 2;
			
		});//moreReviewBtn
	});//ready
	
/* 	var img_elm = document.getElementById("#profileImg");
	img_elm.onerror = function() {
		this.scr = "${pageContext.request.contextPath}/common/My/image/loading.png";
	} */
</script>

<%
String nick = request.getParameter("nick");
%>
<!-- 내용 시작 -->
<div class="container">
	<div id="storeBanner" class="storeBanner">
		<div id="profileImg" class="profileImg">
		<img src="${pageContext.request.contextPath}/profile-img/${ profile }" class="img-circle" style="width: 100px; height: 100px"
				id="profileImg" onError="this.src='${pageContext.request.contextPath}/common/My/image/loading.png';"/>
		</div>
		<div id="userInfo" class="userInfo">
			<div id="nick" class="nick"><%= nick %>님의 상점</div>
		</div>
	</div>
	<div id="storeMenu" class="storeMenu">
		<a href="${pageContext.request.contextPath}/My/store/store_frm.do?nick=${param.nick}" id="unSelected">상품</a> | 
		<a href="${pageContext.request.contextPath}/My/store/store_review_frm.do?nick=${param.nick}" id="selected">후기</a>
	</div>
	
	<c:choose>
		<c:when test="${not empty listReview}">
	
			<div class="totalStarScore">
				<fmt:formatNumber value="${starScore}" pattern=".0"/><br/>
				<div class="wrap-star">
				    <div class="star-rating">
				        <span style ="width: ${scoreWidth}%;"></span>
				    </div>
				</div>
			</div>
			
			<hr style="color: #606060;">
			<c:forEach var="i" items="${listReview}">
				<div class="reviewerName"><c:out value="${i.writer}"/></div>
				<span class="stars">★</span><span class="scoreFont"><c:out value="${ i.starScore }점"/></span>
				<div class="reviewContent"><c:out value="${i.content}"/></div>
			<hr>
			</c:forEach>
			
			<div id="output" class="output">
			</div>
			
			<div class="moreReviewWrap">
			<input type="button" value="더보기" id="moreReviewBtn" class="moreReviewBtn"/>
			</div>
			
		</c:when>
		<c:otherwise>
			<hr>
			<div class="noReview">
			아직 작성된 후기가 없습니다!
			</div>
		</c:otherwise>
	</c:choose>
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:otherwise>
</c:choose>