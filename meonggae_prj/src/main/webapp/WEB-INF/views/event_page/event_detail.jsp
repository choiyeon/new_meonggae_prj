<%@page import="com.store.meonggae.event.dao.UserEventDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.store.meonggae.event.domain.EventDomain"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- eventDetail 객체가 존재하는지 확인 --%>
<c:choose>
	<c:when test="${not empty eventDetail}">
		<div class="container" style="height: 1000px;">
			<table class="table table-hover" style="width: 100%;">
				<tr>
					<th style="width: 50%">제목 : ${eventDetail.title}</th>
					<!-- <th style="width: 20%">작성자(DB에서 ID)</th> -->
					<th style="width: 20%">조회 수 : ${eventDetail.cnt}</th>
					<th style="width: 5%"><a
						href="${pageContext.request.contextPath}/event_page/event_main.do">목록으로</a></th>
				</tr>
				<tr>
					<td colspan="5"><img
						src="${pageContext.request.contextPath}/common/images/event${eventDetail.img}"
						style="width: 100%; height: 500px;"> ${eventDetail.content}
					</td>
				</tr>
			</table>
		</div>
	</c:when>
	<c:otherwise>
		<div class="container" style="height: 1000px;">
			<p>이벤트 정보를 찾을 수 없습니다. 다시 시도해 주세요.</p>
		</div>
	</c:otherwise>
</c:choose>