<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="1:1 문의"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			location.href="http://localhost/meonggae_prj/index.do";
		</script>
	</c:when>
	<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<!-- header -->
<c:import url="http://localhost/meonggae_prj/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/CSS/style.css">
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/My/css/style_mypage.css">
<!-- CSS -->

<script type="text/javascript">
	$(function(){
		
	});//ready
</script>

<!-- 내용 시작 -->
<div class="container">
		<!-- 메뉴목록 -->
	<div id="mypageMenu" class="mypageMenu">
		<%
		String pageName = "inquiry";
		pageContext.setAttribute("pageName", pageName);
		%>
		<%@ include file="../menuBar/mypageMenu.jsp" %>
		
		<div id="lowMenu" class="lowMenu">1:1 문의</div>
		<hr id="menuBottonLine">
	</div>
		<!-- 메뉴목록 -->
		
		<div id="inquiryDetail" class="inquiryDetail">
			<div id="postDetail">
				<div id="postTitle" class="postTitle">빨리 퇴근하고싶어요</div>
				<div id="postEtc" class="postEtc">
				작성자 : 가나다<br>
				작성일 : 2024-05-22
				</div>
			</div>
			<div id="content" class="content">
			빨리 퇴근하는방법 알려주세요@@@@@@@@@
			</div>
		</div>
		<div id="answer" class="answer">
			<div id="postTitle" class="postTitle">답변입니다!</div>
			<div id="postEtc" class="postEtc">답변일 : 2024-05-23</div>
			<div id="answerContent" class="answerContent">
			저도 알고싶습니다! 감사합니다!
			</div>
		</div>

		
		<div id="btnWrap2">
		<input type="button" value="목록" id="inquiryListBtn" class="btn btn-info"/>
		<input type="button" value="수정" id="inquiryModifyBtn" class="btn btn-warning"/>
		<input type="button" value="삭제" id="inquiryDeleteBtn" class="btn btn-secondary"/>
		</div>
		
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:otherwise>
</c:choose>