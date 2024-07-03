<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="event-board">
    <div class="list list--event">
        <ul class="list-ul">
            <c:forEach var="evtDomain" items="${eventList}" varStatus="i">
                    <li class="list-item">
                        <div class="event-item">
                            <a href="${pageContext.request.contextPath}/event_page/event_detail.do?event-code=${evtDomain.eventNum}" class="event_link">
                                <div class="list__thumb">
                                    <div class="image-container">
                                        <img src="${pageContext.request.contextPath}/common/images/${evtDomain.img}" alt="이벤트 이미지">
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
                                    <span class="list__status--ongoing">${ evtDomain.event_status }</span>
                                </div>
                            </a>
                        </div>
                    </li>
            </c:forEach>
        </ul>
        <div class="pagination" style="display: flex; justify-content: center;">${paging}</div>
        <input type="hidden" name="eventType" id="eventType" value="진행중"/>
    </div>
</div>