<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="1:1 문의"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			location.href = "http://localhost/meonggae_prj/index.do";
		</script>
	</c:when>
	<c:otherwise>
		<!-- 로그인 세션 설정 끝 -->

		<!-- header -->
		<c:import url="http://localhost/meonggae_prj/common/My/css/css.jsp" />
		<c:import url="/WEB-INF/views/header/header.jsp" />
		<!-- header -->

		<!-- CSS -->
		<link rel="stylesheet"
			href="http://localhost/meonggae_prj/common/CSS/style.css">
		<link rel="stylesheet"
			href="http://localhost/meonggae_prj/common/My/css/style_mypage.css">
		<!-- CSS -->

		<script type="text/javascript">
			$(function() {
				$("#inquiryWriteBtn")
						.click(
								function() {
									location.href = "http://localhost/meonggae_prj/My/mypage/inquiry/inquiry_add_frm.do"
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
				<%@ include file="../menuBar/mypageMenu.jsp"%>

				<div id="lowMenu" class="lowMenu">1:1 문의</div>
				<hr id="menuBottonLine">
				<!-- 메뉴목록 -->
			</div>
				<div id="notice" class="notice">답변이 완료된 후에는 수정이 불가능합니다.</div>

				<table id="inquiryTable" class="table table-hover">
					<thead>
						<tr>
							<td style="width: 60%">제목</td>
							<td style="width: 20%">상태</td>
							<td style="width: 20%">작성일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ inquiryList }" var="il">
							<tr>
								<td><a
									href="http://localhost/meonggae_prj/My/mypage/inquiry/inquiry_detail.do?inquiryNum=${ il.inquiryNum }">
										<c:out value="${ il.title }" />
								</a></td>
								<td>${ il.answerFlag eq 'N'?'답변 대기중':'답변 완료' }</td>
								<td><fmt:formatDate value="${ il.inputDate }"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${ not empty pagination }">
					<div class="pagination" style="display: flex; justify-content: center;">${pagination}</div>
				</c:if>
				<input type="button" value="문의쓰기" id="inquiryWriteBtn"
					class="btn btn-primary btn-sm" />
		</div>
		<!-- 내용 끝 -->

		<!-- footer -->
		<c:import url="/WEB-INF/views/footer/footer.jsp" />
		<!-- footer -->

	</c:otherwise>
</c:choose>