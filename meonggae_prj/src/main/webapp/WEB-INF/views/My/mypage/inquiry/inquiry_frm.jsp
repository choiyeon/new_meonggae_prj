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
		$("#inquiryWriteBtn").click(function(){
			location.href="http://localhost/meonggae_prj/My/mypage/inquiry/inquiry_add_frm.do"
		});//click
	});//ready
</script>

<!-- 내용 시작 -->
<div class="container">
	<div id="mypageMenu" class="mypageMenu">
		<!-- 메뉴목록 -->
		<%
		String pageName = "inquiry";
		pageContext.setAttribute("pageName", pageName);
		%>
		<%@ include file="../menuBar/mypageMenu.jsp" %>
		
		<div id="lowMenu" class="lowMenu">1:1 문의</div>
		<hr id="menuBottonLine">
		<!-- 메뉴목록 -->
		<div id="notice" class="notice">
		답변이 완료된 후에는 수정이 불가능합니다.
		</div>
		
		<table id="inquiryTable" class="table table-hover">
			<thead>
				<tr>
					<td style="width: 45%">제목</td>
					<td style="width: 20%">글쓴이</td>
					<td style="width: 20%">상태</td>
					<td style="width: 15%">작성일</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>출근안하고싶어요</td>
					<td>ㄱㄴㄷ</td>
					<td>답변 대기중</td>
					<td>2024-05-29</td>
				</tr>
				<tr>
					<td scope="row">
					<a href="http://localhost/meonggae_prj/My/mypage/inquiry/inquiry_detail_frm.do"><div>ㅃㄹ퇴근하고십어요</div></a>
					</td>
					<td>제발</td>
					<td>답변 완료</td>
					<td>2024-05-22</td>
				</tr>
			</tbody>
		</table>
		<input type="button" value="문의쓰기" id="inquiryWriteBtn" class="btn btn-primary btn-sm"/>
		
	</div>
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:otherwise>
</c:choose>