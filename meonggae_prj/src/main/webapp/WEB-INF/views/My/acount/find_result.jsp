<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원 탈퇴"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 아이디나, 비밀번호 정보가 없으면 비정상접근처리 -->
<c:if test="${ empty id && empty pw }">
<script type="text/javascript">
	alert("비정상적인 접근입니다.");
	location.href="${pageContext.request.contextPath}/index.do";
</script>
</c:if>

<!-- header -->
<c:import url="/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="../../common/CSS/style.css">
<link rel="stylesheet" href="../../common/My/css/style_acount.css?4331">
<!-- CSS -->

<script type="text/javascript">
	$(function(){
		
		$("#mainBtn").click(function(){
			location.href="${pageContext.request.contextPath}/index.do";
		});
		$("#findPw").click(function(){
			location.href="${pageContext.request.contextPath}/My/acount/acount.do";
		});
		
	});//ready
</script>

<!-- 내용 시작 -->
<div class="container">
	<div id="center1">
	<c:choose>
		<c:when test="${ not empty id }">
			<h1>입력 정보로 검색한 ID</h1>
			<h2><strong>[ ${ id } ]</strong></h2>
			<div id="btnWrap">
			<input type="button" value="메인으로" id="mainBtn"/>
			<input type="button" value="비밀번호 찾기" id="findPw"/>
			</div>
		</c:when>
		<c:when test="${ not empty pw }">
			<h1>임시 비밀번호</h1>
			<h5>로그인 후 꼭 임시 비밀번호를 변경해주세요.</h5>
			<h2><strong>[ ${ pw } ]</strong></h2>
			<div id="btnWrap">
			<input type="button" value="메인으로" id="mainBtn"/>
			</div>
		</c:when>
	</c:choose>
	</div>
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->