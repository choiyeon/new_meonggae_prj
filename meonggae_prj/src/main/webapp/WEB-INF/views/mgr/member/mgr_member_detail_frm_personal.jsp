<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 회원 관리 - 회원 상세 조회"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%/*
작성자: 김동섭
작성일: 2024-06-02
*/%>
<%@ include file="mgr_member_detail_frm_upper.jsp" %>
					<!-- 탭1. 개인정보 시작 -->
					<div class="tab-pane active show" id="tabItem1" role="tabpanel">
						<div class="card-inner">
							<div class="nk-block">
								<div class="nk-block-head">
									<h5 class="title">개인정보</h5>
									<p>회원가입시 등록된 정보</p>
								</div>
								<div class="profile-ud-list">
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">이름</span>
											<span class="profile-ud-value"><c:out value="${requestScope.memberPersonalDomain.name}"/></span>
										</div>
									</div>
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">아이디</span>
											<span class="profile-ud-value"><c:out value="${requestScope.memberPersonalDomain.memId}"/></span>
										</div>
									</div>
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">닉네임</span>
											<span class="profile-ud-value"><c:out value="${requestScope.memberPersonalDomain.nick}"/></span>
										</div>
									</div>
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">연령대</span>
											<span class="profile-ud-value"><c:out value="${requestScope.memberPersonalDomain.ageRange}"/></span>
										</div>
									</div>
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">주소</span>
											<span class="profile-ud-value"><c:out value="${requestScope.memberPersonalDomain.addr}"/></span>
										</div>
									</div>
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">전화번호</span>
											<span class="profile-ud-value"><c:out value="${requestScope.memberPersonalDomain.tel}"/></span>
										</div>
									</div>
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">성별</span>
											<c:choose>
												<c:when test="${requestScope.memberPersonalDomain.gender eq null or requestScope.memberPersonalDomain.gender eq ''}">
													<span class="profile-ud-value">-</span>
												</c:when>
												<c:when test="${requestScope.memberPersonalDomain.gender eq 'M'}">
													<span class="profile-ud-value">남자</span>
												</c:when>
												<c:when test="${requestScope.memberPersonalDomain.gender eq 'F'}">
													<span class="profile-ud-value">여자</span>
												</c:when>
											</c:choose>
										</div>
									</div>
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">로그인</span>
											
											<c:choose>
												<c:when test="${requestScope.memberPersonalDomain.loginFlag eq 'N'}">
													<span class="profile-ud-value">일반</span>
												</c:when>
												<c:otherwise>
													<span class="profile-ud-value"><c:out value="${requestScope.memberPersonalDomain.social}"/></span>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">가입일</span>
											<span class="profile-ud-value">
											<c:choose>
												<c:when test="${requestScope.memberPersonalDomain.joinDate eq null or requestScope.memberPersonalDomain.joinDate eq ''}">
												-
												</c:when>
												<c:otherwise>
												<c:out value="${requestScope.memberPersonalDomain.joinDate}"/>
												</c:otherwise>
											</c:choose>
											</span>
										</div>
									</div>
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">최근 로그인</span>
											<span class="profile-ud-value">
											<c:choose>
												<c:when test="${requestScope.memberPersonalDomain.recentLoginDate eq null or requestScope.memberPersonalDomain.recentLoginDate eq ''}">
												-
												</c:when>
												<c:otherwise>
												<fmt:formatDate value="${requestScope.memberPersonalDomain.recentLoginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
												</c:otherwise>
											</c:choose>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="nk-divider divider md"></div>
							<div class="nk-block">
								<div class="nk-block-head nk-block-head-line">
									<h6 class="title overline-title text-base">제재 정보</h6>
								</div>
								<div class="profile-ud-list">
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">정지일</span>
											<c:choose>
												<c:when test="${requestScope.memberPersonalDomain.suspendDate eq null}">
													<span class="profile-ud-value">-</span>
												</c:when>
												<c:otherwise>
													<span class="profile-ud-value"><fmt:formatDate value="${requestScope.memberPersonalDomain.suspendDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">정지 해제일</span>
											<c:choose>
												<c:when test="${requestScope.memberPersonalDomain.unsuspendDate eq null}">
													<span class="profile-ud-value">-</span>
												</c:when>
												<c:otherwise>
													<span class="profile-ud-value"><fmt:formatDate value="${requestScope.memberPersonalDomain.unsuspendDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="profile-ud-item">
										<div class="profile-ud wider">
											<span class="profile-ud-label">탈퇴일</span>
											<c:choose>
												<c:when test="${requestScope.memberPersonalDomain.withdrawDate eq null}">
													<span class="profile-ud-value">-</span>
												</c:when>
												<c:otherwise>
													<span class="profile-ud-value"><fmt:formatDate value="${requestScope.memberPersonalDomain.withdrawDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
							<div class="nk-divider divider md"></div>
						</div>
					</div>
					<!-- 탭1. 개인정보 끝 -->
<%@ include file="mgr_member_detail_frm_lower.jsp" %>
