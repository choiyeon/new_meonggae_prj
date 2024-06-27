<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="../common/JS/event_detail_ajax.js"></script>
<%
    // Java 코드 블록에서 현재 날짜를 가져옵니다.
    java.time.LocalDate currentDate = java.time.LocalDate.now();
    // 현재 날짜를 request 속성에 추가합니다.
    request.setAttribute("currentDate", currentDate.toString());
%>
<div class="event-board">
    <div class="list list--event">
        <ul class="list-ul">
            <c:forEach var="evtDomain" items="${eventList}" varStatus="i">
                <!-- JSP 내에서 날짜 비교를 위한 준비 -->
                <c:set var="currentDate" value="${currentDate}" />
                <c:set var="eventEndDate" value="${evtDomain.end_date}" />

                <!-- 날짜 비교를 위해 연월일 부분을 추출 -->
                <c:set var="currentYear" value="${fn:split(currentDate, '-')[0]}" />
                <c:set var="currentMonth" value="${fn:split(currentDate, '-')[1]}" />
                <c:set var="currentDay" value="${fn:split(currentDate, '-')[2]}" />

                <c:set var="eventEndYear" value="${fn:split(eventEndDate, '-')[0]}" />
                <c:set var="eventEndMonth" value="${fn:split(eventEndDate, '-')[1]}" />
                <c:set var="eventEndDay" value="${fn:split(eventEndDate, '-')[2]}" />

                <!-- 날짜 비교 조건 -->
                <c:if test="${eventEndYear gt currentYear or (eventEndYear eq currentYear and eventEndMonth gt currentMonth) or (eventEndYear eq currentYear and eventEndMonth eq currentMonth and eventEndDay gt currentDay)}">
                    <li class="list-item">
                        <div class="event-item">
                            <a href="${pageContext.request.contextPath}/event_page/event_detail.do?event-code=${evtDomain.eventNum}" class="event_link">
                                <div class="list__thumb">
                                    <div class="image-container">
                                        <img src="${pageContext.request.contextPath}/common/images/event${evtDomain.img}" alt="이벤트 이미지">
                                    </div>
                                </div>
                                <div class="list__content">
                                    <div class="list__subject" aria-label="제목">
                                        <span class="list__title"><c:out value="${evtDomain.title}" /></span>
                                    </div>
                                    <div class="list__term">
                                        <strong>이벤트 기간</strong> :
                                        <c:out value="${evtDomain.start_date}" />
                                        ~
                                        <c:out value="${evtDomain.end_date}" />
                                    </div>
                                </div>
                                <div class="list__status">
                                    <span class="list__status--ongoing">진행</span>
                                </div>
                            </a>
                        </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
        <div class="pagination">${paging}</div>
    </div>
</div>