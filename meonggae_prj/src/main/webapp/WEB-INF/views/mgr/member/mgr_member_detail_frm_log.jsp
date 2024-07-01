<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 회원 관리 - 회원 상세 조회"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%/*
작성자: 김동섭
작성일: 2024-06-02
*/%>
<%@ include file="mgr_member_detail_frm_upper.jsp" %>
					<!-- 탭7. 로그인 로그 시작 -->
					<div class="tab-pane active show" id="tabItem7" role="tabpanel">
						<div class="card card-stretch">
							<div class="card-inner-group">
								<div class="card-inner p-0">
									<div class="nk-tb-list nk-tb-ulist">
										<div class="nk-tb-item nk-tb-head">
											<div class="nk-tb-col" style="width:8%;">
												<span class="sub-text">번호</span>
											</div>
											<div class="nk-tb-col tb-col-sm">
												<span class="sub-text">아이피</span>
											</div>
											<div class="nk-tb-col tb-col-sm">
												<span class="sub-text">접속 OS</span>
											</div>
											<div class="nk-tb-col tb-col-xl">
												<span class="sub-text">접속 브라우저</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span class="sub-text">상태</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="sub-text">로그인 일시</span>
											</div>
										</div>
										<c:choose>
										<c:when test="${requestScope.list eq null or fn:length(requestScope.list) eq 0}">
										<h6>조회된 데이터가 없습니다</h6>
										</c:when>
										<c:otherwise>
										<c:forEach var="loginLogDomain" items="${requestScope.list }" varStatus="i">
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount"><c:out value="${requestScope.totalCount - ((requestScope.currentPage - 1) * requestScope.pageScale) - i.index }"/></span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount"><c:out value="${loginLogDomain.ip }"/></span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount"><c:out value="${loginLogDomain.os }"/></span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span><c:out value="${loginLogDomain.browser }"/></span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<c:choose>
													<c:when test="${loginLogDomain.memStatus eq 'N'}">
													<span class="tb-status text-success">일반</span>
													</c:when>
													<c:when test="${loginLogDomain.memStatus eq 'S'}">
													<span class="tb-status text-warning">정지</span>
													</c:when>
													<c:when test="${loginLogDomain.memStatus eq 'W'}">
													<span class="tb-status text-danger">탈퇴</span>
													</c:when>
												</c:choose>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span><c:out value="${loginLogDomain.inputDate }"/></span>
											</div>
										</div>
										</c:forEach>
										
										</c:otherwise>
										</c:choose>
										
									</div>
								</div>
								<div class="card-inner">
<!-- 									<div class="form-inline flex-nowrap gx-3" style="float:right;"> -->
<!-- 										<div class="form-wrap w-200px"> -->
<!-- 											<div class="input-group-prepend" style="width:180px;"> -->
<!-- 												<div class="card-tools shrink-0 d-none d-sm-block"> -->
<!-- 													<ul class="nav nav-switch-s2 nav-tabs bg-white"> -->
<!-- 														<li class="nav-item" style="margin-left:20px;"> -->
<!-- 															<div class="card-title-group pb-3 g-2"> -->
<!-- 																<div class="btn-wrap"> -->
<!-- 																	<span class="d-none d-md-block"> -->
<!-- 																		<button class="btn btn-light">엑셀로 다운</button> -->
<!-- 																	</span> -->
<!-- 																</div> -->
<!-- 															</div>								 -->
<!-- 														</li> -->
<!-- 													</ul> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div>	 -->
									<div class="nk-block-between-md g-3">
										<div class="g" style="margin:0px auto;">
											${requestScope.pageNation }
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 탭7. 로그인 로그 끝 -->
<%@ include file="mgr_member_detail_frm_lower.jsp" %>
