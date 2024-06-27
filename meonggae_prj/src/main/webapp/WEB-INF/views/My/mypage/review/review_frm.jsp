<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="나의 후기"%>
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
	<div id="mypageMenu" class="mypageMenu">
		<!-- 메뉴목록 -->
		<%
		String pageName = "review";
		pageContext.setAttribute("pageName", pageName);
		%>
		<%@ include file="../menuBar/mypageMenu.jsp" %>
		<div id="lowMenu" class="lowMenu">나의 후기</div>
		<hr id="menuBottonLine">
		<!-- 메뉴목록 -->
		<div id="reviewLowMenu1" class="reviewLowMenu1">내가 쓴 후기</div>
		<div id="notice1" class="notice1">한번 작성한 후기는 수정할 수 없습니다.</div>
		
		<table id="inquiryTable" class="table table-hover">
			<thead>
				<tr>
					<td style="width: 50%">후기</td>
					<td style="width: 20%">거래자</td>
					<td style="width: 20%">작성일</td>
					<td style="width: 10%">삭제</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>벽돌이 왔어요</td>
					<td>돈없는직장인</td>
					<td>2024-05-23</td>
					<td>
					<img src="http://localhost/meonggae_prj/common/images/deleteBtn.png" id="deleteImg"/>
					</td>
				</tr>
				<tr>
					<td>감사합니다. 복받으세요!</td>
					<td>돈많은백수</td>
					<td>2024-05-22</td>
					<td>
					<img src="http://localhost/meonggae_prj/common/images/deleteBtn.png" id="deleteImg"/>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div id="reviewLowMenu2" class="reviewLowMenu2">작성 가능한 후기</div>
		<table id="inquiryTable" class="table table-hover">
			<thead>
				<tr>
					<td style="width: 80%">구매물품</td>
					<td style="width: 20%">거래자</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
					<a href="http://naver.com"><div>
					50만km탄 레이
					</div></a>
					</td>
					<td>판매자1</td>
				</tr>
				<tr>
					<td>귤껍질(눅눅함)</td>
					<td>집에가고싶어섷거</td>
				</tr>
			</tbody>
		</table>
		
	</div>
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:otherwise>
</c:choose>