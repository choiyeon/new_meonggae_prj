<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
    <c:when test="${eventType eq '진행중'}">
        <!-- 진행중인 이벤트 내용 -->
        <jsp:include page="on_going_content.jsp" />
    </c:when>
    <c:when test="${eventType eq '종료'}">
        <!-- 종료된 이벤트 내용 -->
        <jsp:include page="end_content.jsp" />

    </c:when>
    <c:otherwise>
        <p>잘못된 요청입니다. 이벤트 타입 : ${eventType}</p>
    </c:otherwise>
</c:choose>
       
</div>