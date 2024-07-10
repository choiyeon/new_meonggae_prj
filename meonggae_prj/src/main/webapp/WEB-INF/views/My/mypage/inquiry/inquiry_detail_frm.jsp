<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="1:1 문의"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			location.href="${pageContext.request.contextPath}/index.do";
		</script>
	</c:when>
	<c:when test="${ user.memNum ne iDetailDomain.writerNum }">
		<script type="text/javascript">
			alert("작성자만 조회 가능한 글입니다.");
			location.href="${pageContext.request.contextPath}/My/mypage/inquiry/inquiry_frm.do";
		</script>
	</c:when>
	<c:when test="${ iDetailDomain.deleteFlag eq 'Y' }">
		<script type="text/javascript">
			alert("삭제된 글입니다.");
			location.href="${pageContext.request.contextPath}/My/mypage/inquiry/inquiry_frm.do";
		</script>
	</c:when>
	<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<!-- header -->
<c:import url="/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/My/css/style_mypage.css">
<!-- CSS -->

<script type="text/javascript">
	$(function(){
		$("#inquiryListBtn").click(function(){
			location.href="${pageContext.request.contextPath}/My/mypage/inquiry/inquiry_frm.do";
		});
		
		/* 수정 */
		$("#inquiryModifyBtn").click(function(){
			$("#inquiryModifyForm").submit();
		});
		
		/* 삭제 */
		$("#inquiryDeleteBtn").click(function(){
			if(confirm("정말 삭제하시겠습니까?")){
				$("#inquiryDeleteForm").submit();
				alert("삭제되었습니다.");
			}//if
		});
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
				<div id="postTitle" class="postTitle"><c:out value="${ iDetailDomain.title }"/></div>
				<div id="postEtc" class="postEtc">
				문의 유형 : <c:out value="${ iDetailDomain.category }"/><br>
				작성자 : <c:out value="${ user.nick }"/><br>
				작성일 : <fmt:formatDate value="${ iDetailDomain.inputDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
			</div>
			<div id="content" class="content">
			<c:out value="${ iDetailDomain.contents }" escapeXml="false"/>
			</div>
		</div>
		<c:choose>
			<c:when test="${ iDetailDomain.answerFlag eq 'Y' }">
				<div id="answerTitle" class="answerTitle">
					<div id="postTitle" class="postTitle">운영자 답변</div>
					<div id="postEtc" class="postEtc">
					답변일 : <fmt:formatDate value="${ iDetailDomain.answerDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</div>
				</div>
				<div id="answer" class="answer">
					<div id="answerContent" class="answerContent">
					<c:out value="${ iDetailDomain.answerContents }" escapeXml="false"/>
					</div>
				</div>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>

		
		<div id="btnWrap2">
		<c:choose>
			<c:when test="${ iDetailDomain.answerFlag eq 'Y' }">
			<input type="button" value="목록" id="inquiryListBtn" class="btn btn-info"/>
			</c:when>
			<c:otherwise>
			<form method="post" action="inquiry_modify.do" id="inquiryModifyForm">
			<input type="hidden" name="inquiryNum" value="${ iDetailDomain.inquiryNum }"/>
			</form>
			<form method="get" action="inquiry_delete.do" id="inquiryDeleteForm">
			<input type="hidden" name="inquiryNum" value="${ iDetailDomain.inquiryNum }"/>
			</form>
			<input type="button" value="목록" id="inquiryListBtn" class="btn btn-info"/>
			<input type="button" value="수정" id="inquiryModifyBtn" class="btn btn-warning"/>
			<input type="button" value="삭제" id="inquiryDeleteBtn" class="btn btn-secondary"/>
			</c:otherwise>
		</c:choose>
		</div>
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:otherwise>
</c:choose>