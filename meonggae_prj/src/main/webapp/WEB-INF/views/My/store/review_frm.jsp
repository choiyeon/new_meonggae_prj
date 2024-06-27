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
				location.href="http://localhost/meonggae_prj/index.do";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("비정상적인 접근입니다.");
				location.href="http://localhost/meonggae_prj/index.do";
			</script>
		</c:otherwise>
		</c:choose>
</c:when>
<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<!-- header -->
<c:import url="http://localhost/meonggae_prj/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/CSS/style.css">
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/My/css/style_store.css">
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
				url: "http://localhost/meonggae_prj/My/store/store_more_review.do?nick=" + nick + "&startNum="
						+ startNum + "&endNum=" + endNum,
				type: "GET",
				error: function(xhr){
					console.log(xhr.status);
				},
				success: function(list){
					console.dir(list);
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
</script>

<%
String nick = request.getParameter("nick");
%>
<!-- 내용 시작 -->
<div class="container">
	<div id="storeBanner" class="storeBanner">
		<div id="profileImg" class="profileImg">
		<img src="http://localhost/meonggae_prj/profile-img/${ profile }" class="img-circle" style="width: 100px; height: 100px"/>
		</div>
		<div id="userInfo" class="userInfo">
			<div id="nick" class="nick"><%= nick %>님의 상점</div>
			<a href="#void" id="userDeclaration"><i class="fa fa-exclamation"></i> 신고</a>
		</div>
	</div>
	<div id="storeMenu" class="storeMenu">
		<a href="http://localhost/meonggae_prj/My/store/store_frm.do?nick=${param.nick}" id="unSelected">상품</a> | 
		<a href="http://localhost/meonggae_prj/My/store/store_review_frm.do?nick=${param.nick}" id="selected">후기</a>
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
				<div class="reviewerName">${i.writer}</div>
				<span class="stars">★</span><span class="scoreFont">${ i.starScore }점</span>
				<div class="reviewContent">${i.content}</div>
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