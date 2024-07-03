<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 회원 관리 - 회원 상세 조회"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-06-02
*/%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터 관리자</title>
<link rel="icon" href="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/images/favicon.png"/>
<!--bootstrap 시작-->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
<!--bootstrap 끝-->

<!-- dashlite css 시작-->
<link rel="stylesheet" href="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<!--dashlite css 끝-->

<!-- <link rel="stylesheet" href="http://192.168.10.214${pageContext.request.contextPath}/common/css/board.css" type="text/css" media="all" /> -->
<!-- <link rel="stylesheet" href="http://192.168.10.214${pageContext.request.contextPath}/common/css/main.css" type="text/css" media="all" /> -->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">
	
 	span.invalid{display: none;}
 	.myImg{height: 300px;
 	background-size: contain;
    background-repeat: no-repeat;
    background-position: center;}
	
</style>

<script type="text/javascript">
	var nick = "${sessionScope.mgr.nick}";
	var managerId = "${sessionScope.mgr.manager_id}";
	var link = "http://localhost${pageContext.request.contextPath}";
	$(function() {
		// 탭 누르면 parameter에 담아서 이동하는 방식
// 		$(".memTab").click(function(){
// 			let url = new URL(location.href);
// 			url.searchParams.set('t', $(this).index());
// 			location.href="${pageContext.request.contextPath}/mgr/member/mgr_member_detail_frm.do" + url.search;
// 		}); // click
	}); // $(document).ready(function() { })
</script>

</head>
<body class="nk-body bg-lighter npc-general has-sidebar no-touch nk-nio-theme">
<div class="nk-app-root">
<div class="nk-main ">
<!-- 사이드바 시작 -->
<c:import url="/WEB-INF/views/mgr/common/jsp/sidebar.jsp"/>
<!-- 사이드바 끝 -->
<div class="nk-wrap ">
<!-- 헤더 시작 -->
<c:import url="/WEB-INF/views/mgr/common/jsp/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 본문 시작 -->
<div class="nk-content ">
<div class="container-fluid">
<div class="nk-content-inner">
<div class="nk-content-body">

<div class="nk-block-head nk-block-head-sm">
	<div class="nk-block-between g-3">
		<div class="nk-block-head-content">
			<h3 class="nk-block-title page-title">회원 관리 / <strong class="text-primary small"><c:out value="${requestScope.memberPersonalDomain.nick }"/></strong>
			</h3>
			<div class="nk-block-des text-soft">
				<ul class="list-inline">
					<li>최근 로그인: <span class="text-base">
					<c:choose>
						<c:when test="${requestScope.memberPersonalDomain.recentLoginDate eq null}">-</c:when>
						<c:otherwise><fmt:formatDate value="${requestScope.memberPersonalDomain.recentLoginDate}" pattern="yyyy-MM-dd HH:mm:ss"/></c:otherwise>
					</c:choose>
					</span>
					</li>
				</ul>
			</div>
		</div>
		<div class="nk-block-head-content">
			<a href="/demo1/user-list-regular.html" class="btn btn-outline-light bg-white d-none d-sm-inline-flex">
				<em class="icon ni ni-arrow-left"></em>
				<span>Back</span>
			</a>
			<a href="/demo1/user-list-regular.html" class="btn btn-icon btn-outline-light bg-white d-inline-flex d-sm-none">
				<em class="icon ni ni-arrow-left"></em>
			</a>
		</div>
	</div>
</div>

<div class="nk-block">
	<div class="card card-bordered">
		<div class="card-inner-group">
			<div class="card-inner">
				<!-- 탭이 바껴도 공통으로 출력해줄 회원 정보 시작 -->
				<div class="user-card">
					<div class="user-avatar lg bg-primary">
						<span></span>
					</div>
						
					<div class="user-info">
						<div class="profile-balance">
							<div class="profile-balance-group gx-4">

								<div class="profile-balance-sub">
									<div class="profile-balance-subtitle">회원번호</div>
									<div class="profile-balance-amount">
										<div class="number"><c:out value="${requestScope.memberPersonalDomain.memNum}"/></div>
									</div>
								</div>							
<!-- 								<div class="profile-balance-sub"> -->
<!-- 									<div class="profile-balance-subtitle">이름</div> -->
<!-- 									<div class="profile-balance-amount"> -->
<!-- 										<div class="number">김회원</div> -->
<!-- 									</div> -->
<!-- 								</div>							 -->
<!-- 								<div class="profile-balance-sub"> -->
<!-- 									<div class="profile-balance-subtitle">아이디</div> -->
<!-- 									<div class="profile-balance-amount"> -->
<!-- 										<div class="number">memberkim</div> -->
<!-- 									</div> -->
<!-- 								</div>							 -->
								<div class="profile-balance-sub">
									<div class="profile-balance-subtitle">닉네임</div>
									<div class="profile-balance-amount">
										<div class="number"><c:out value="${requestScope.memberPersonalDomain.nick}"/></div>
									</div>
								</div>							
								<div class="profile-balance-sub">
									<div class="profile-balance-subtitle">상태</div>
									<div class="profile-balance-amount">
										<c:choose>
											<c:when test="${requestScope.memberPersonalDomain.memStatus eq 'N'}">
												<span class="text-success number">일반</span>
											</c:when>
											<c:when test="${requestScope.memberPersonalDomain.memStatus eq 'S'}">
												<span class="text-warning number">정지</span>
											</c:when>
											<c:when test="${requestScope.memberPersonalDomain.memStatus eq 'W'}">
												<span class="text-danger number">탈퇴</span>
											</c:when>
										</c:choose>
									</div>
								</div>							
							</div>
						</div>						
					</div>	
				</div>
				<!-- 탭이 바껴도 공통으로 출력해줄 회원 정보 끝 -->
				<div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
					<div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
				</div>
			</div>		
			<div class="card-inner">
				<!-- 탭 목록 시작 -->
				<ul class="nav nav-tabs nav-tabs-mb-icon nav-tabs-card" role="tablist">
					<li class="nav-item memTab">
						<a class="nav-link active" href="#tabItem1" data-bs-toggle="tab" aria-selected="true" role="tab">
							<em class="icon ni ni-user-circle"></em>
							<span>개인정보</span>
						</a>
					</li>
					<li class="nav-item memTab">
						<a class="nav-link" href="#tabItem2" data-bs-toggle="tab" aria-selected="false" role="tab" tabindex="-1">
							<em class="icon ni ni-repeat"></em>
							<span>거래내역</span>
						</a>
					</li>
					<li class="nav-item memTab">
						<a class="nav-link" href="#tabItem3" data-bs-toggle="tab" aria-selected="false" role="tab" tabindex="-1">
							<em class="icon ni ni-file-text"></em>
							<span>신고내역</span>
						</a>
					</li>
					<li class="nav-item memTab">
						<a class="nav-link" href="#tabItem4" data-bs-toggle="tab" aria-selected="false" role="tab" tabindex="-1">
							<em class="icon ni ni-bell"></em>
							<span>문의내역</span>
						</a>
					</li>
					<li class="nav-item memTab">
						<a class="nav-link" href="#tabItem5" data-bs-toggle="tab" aria-selected="false" role="tab" tabindex="-1">
							<em class="icon ni ni-activity"></em>
							<span>후기내역</span>
						</a>
					</li>
					<li class="nav-item memTab">
						<a class="nav-link" href="#tabItem6" data-bs-toggle="tab" aria-selected="false" role="tab" tabindex="-1">
							<em class="icon ni ni-activity"></em>
							<span>찜목록</span>
						</a>
					</li>
					<li class="nav-item memTab">
						<a class="nav-link" href="#tabItem7" data-bs-toggle="tab" aria-selected="false" role="tab" tabindex="-1">
							<em class="icon ni ni-activity"></em>
							<span>로그인 로그</span>
						</a>
					</li>
					<li class="nav-item memTab">
						<a class="nav-link" href="#tabItem8" data-bs-toggle="tab" aria-selected="false" role="tab" tabindex="-1">
							<em class="icon ni ni-activity"></em>
							<span>회원 정지</span>
						</a>
					</li>
				</ul>
				<!-- 탭 목록 끝 -->
				
				<!-- 탭 내용 시작 -->
				<div class="tab-content">
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
					<!-- 탭2. 거래내역 시작 -->
					<div class="tab-pane" id="tabItem2" role="tabpanel">
						<div class="card-inner">
							<div class="nk-block">
								<div class="nk-block-head">
									<h5 class="title">회원의 거래 내역</h5>
									<p>판매중, 판매완료, 구매완료 선택</p>
								</div>
							</div>
						</div>
						<!-- 거래내역 하위 탭 목록 시작 -->	
						<ul class="nav nav-tabs nav-tabs-mb-icon nav-tabs-card" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" href="#tabTradeItem1" data-bs-toggle="tab" aria-selected="true" role="tab">
									<em class="icon ni ni-user-circle"></em>
									<span>판매중</span>
								</a>
							</li>			
							<li class="nav-item">
								<a class="nav-link" href="#tabTradeItem2" data-bs-toggle="tab" aria-selected="flase" role="tab">
									<em class="icon ni ni-user-circle"></em>
									<span>판매완료</span>
								</a>
							</li>			
							<li class="nav-item">
								<a class="nav-link" href="#tabTradeItem3" data-bs-toggle="tab" aria-selected="flase" role="tab">
									<em class="icon ni ni-user-circle"></em>
									<span>구매완료</span>
								</a>
							</li>			
						</ul>			
						<!-- 거래내역 하위 탭 목록 끝 -->	
						<!-- 거래내역 탭 내용 시작 -->
						<div class="tab-content">
							<!-- 거래내역 탭1. 판매중 시작 -->
							<div class="tab-pane active show" id="tabTradeItem1" role="tabpanel">
								<div class="row g-gs">
									<c:forEach begin="1" end="16" varStatus="i">
			                        <div class="col-md-6 col-lg-5 col-xxl-3">
										<div class="card card-bordered">
											<div class="card-inner">
					                            <div class="single-product">
					                            	<div class="product-block">
					                            		<div class="myImg col-xxl-12" style="background-image: url(http://192.168.10.214${pageContext.request.contextPath}/user/products-img/product-${ i.index }.jpg);">
					                            		</div>
														<div class="product-description text-left" style="margin-top:20px;">
															<h6>여성의류${ i.index }</h6>
															<div style="overflow: hidden;">
																<h6 class="price" style="float: left;">1${ i.index },000원</h6>
																<p class="time-ago" style="float: right;">${ i.index }일전</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
								<div class="card-inner">
									<div class="nk-block-between-md g-3">
										<div class="g" style="margin:0px auto;">
											<ul class="pagination justify-content-center justify-content-md-start">
												<li class="page-item">
													<a class="page-link" href="#">처음 페이지로</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&lt;&lt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">4</a>
												</li>
												<li class="page-item active">
													<a class="page-link" href="#">5</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">6</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&gt;&gt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">마지막 페이지로</a>
												</li>
											</ul>
										</div>
									</div>
									<div style="margin:0px auto; width:650px; height:70px; text-align:center; padding-top:20px;">
										<div class="form-group">
											<div class="form-control-wrap">
												<div class="input-group">
													<div class="input-group-prepend" style="margin:0px auto;">
														<span class="input-group-text">상품명</span>
														<input type="text" class="form-control" aria-label="Text input with dropdown button">
														<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색">
													</div>
												</div>
											</div>
										</div>				
									</div>
								</div>
							</div>
							<!-- 거래내역 탭1. 판매중 끝 -->
							<!-- 거래내역 탭2. 판매 완료 시작 -->
							<div class="tab-pane" id="tabTradeItem2" role="tabpanel">
								<div class="row g-gs">
									<c:forEach begin="1" end="16" varStatus="i">
			                        <div class="col-md-6 col-lg-5 col-xxl-3">
										<div class="card card-bordered">
											<div class="card-inner">
					                            <div class="single-product">
					                            	<div class="product-block">
					                            		<div class="myImg col-xxl-12" style="background-image: url(http://192.168.10.214${pageContext.request.contextPath}/user/products-img/product-${ i.index }.jpg);">
					                            		</div>
														<div class="product-description text-left" style="margin-top:20px;">
															<h6>여성의류${ i.index }</h6>
															<div style="overflow: hidden;">
																<h6 class="price" style="float: left;">1${ i.index },000원</h6>
																<p class="time-ago" style="float: right;">${ i.index }일전</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
								<div class="card-inner">
									<div class="nk-block-between-md g-3">
										<div class="g" style="margin:0px auto;">
											<ul class="pagination justify-content-center justify-content-md-start">
												<li class="page-item">
													<a class="page-link" href="#">처음 페이지로</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&lt;&lt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">4</a>
												</li>
												<li class="page-item active">
													<a class="page-link" href="#">5</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">6</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&gt;&gt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">마지막 페이지로</a>
												</li>
											</ul>
										</div>
									</div>
									<div style="margin:0px auto; width:650px; height:70px; text-align:center; padding-top:20px;">
										<div class="form-group">
											<div class="form-control-wrap">
												<div class="input-group">
													<div class="input-group-prepend" style="width:200px;">
											 			<select class="form-select js-select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
															<option value="title">상품명</option>
															<option value="nick">구매자</option>
														</select>
													</div>
													<input type="text" class="form-control" aria-label="Text input with dropdown button">
													<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색">
												</div>
											</div>
										</div>				
									</div>
								</div>
							</div>
							<!-- 거래내역 탭2. 판매 완료 끝 -->
							<!-- 거래내역 탭3. 구매 완료 시작 -->
							<div class="tab-pane" id="tabTradeItem3" role="tabpanel">
								<div class="row g-gs">
									<c:forEach begin="1" end="16" varStatus="i">
			                        <div class="col-md-6 col-lg-5 col-xxl-3">
										<div class="card card-bordered">
											<div class="card-inner">
					                            <div class="single-product">
					                            	<div class="product-block">
					                            		<div class="myImg col-xxl-12" style="background-image: url(http://192.168.10.214${pageContext.request.contextPath}/user/products-img/product-${ i.index }.jpg);">
					                            		</div>
														<div class="product-description text-left" style="margin-top:20px;">
															<h6>여성의류${ i.index }</h6>
															<div style="overflow: hidden;">
																<h6 class="price" style="float: left;">1${ i.index },000원</h6>
																<p class="time-ago" style="float: right;">${ i.index }일전</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
								<div class="card-inner">
									<div class="nk-block-between-md g-3">
										<div class="g" style="margin:0px auto;">
											<ul class="pagination justify-content-center justify-content-md-start">
												<li class="page-item">
													<a class="page-link" href="#">처음 페이지로</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&lt;&lt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">4</a>
												</li>
												<li class="page-item active">
													<a class="page-link" href="#">5</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">6</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&gt;&gt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">마지막 페이지로</a>
												</li>
											</ul>
										</div>
									</div>
									<div style="margin:0px auto; width:650px; height:70px; text-align:center; padding-top:20px;">
										<div class="form-group">
											<div class="form-control-wrap">
												<div class="input-group">
													<div class="input-group-prepend" style="width:200px;">
											 			<select class="form-select js-select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
															<option value="title">상품명</option>
															<option value="nick">판매자</option>
														</select>
													</div>
													<input type="text" class="form-control" aria-label="Text input with dropdown button">
													<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색">
												</div>
											</div>
										</div>				
									</div>
								</div>
							</div>
							<!-- 거래내역 탭3. 구매 완료 끝 -->
						</div>
						<!-- 거래내역 탭 내용 끝 -->
					</div>
					<!-- 탭2. 거래내역 끝 -->
					<!-- 탭3. 신고내역 시작 -->
					<div class="tab-pane" id="tabItem3" role="tabpanel">
						<div class="card card-stretch">
							<div class="card-inner-group">
								<div class="card-inner position-relative card-tools-toggle">
									<div class="card-title-group" data-select2-id="7">
										<div class="card-tools" data-select2-id="67">
											<div class="form-inline flex-nowrap gx-3" data-select2-id="14">
												<div class="form-wrap w-200px">
													<div class="input-group-prepend" style="width:180px;">
														<div class="card-tools shrink-0 d-none d-sm-block">
															<ul class="nav nav-switch-s2 nav-tabs bg-white">
																<li class="nav-item">
																	<div class="form-group">
																		<div class="form-control-wrap">
																			<div class="input-daterange date-picker-range input-group" style="float:left; width:300px;">
																				<div class="input-group-addon">시작일</div>
																				<div class="form-control-wrap">
																					<div class="form-icon form-icon-left"><em class="icon ni ni-calendar"></em></div>
																					<input type="text" class="form-control date-picker" data-date-format="yyyy-mm-dd" maxlength="10">
																				</div>
																			</div>
																			<div class="input-daterange date-picker-range input-group" style="float:left;width:300px;">
																				<div class="input-group-addon">종료일</div>
																				<div class="form-control-wrap">
																					<div class="form-icon form-icon-left"><em class="icon ni ni-calendar"></em></div>
																					<input type="text" class="form-control date-picker" data-date-format="yyyy-mm-dd" maxlength="10">
																				</div>
																			</div>
																		</div>
																	</div>
																</li>
																<li class="nav-item">
																	<div class="card-title-group pb-3 g-2">
																		<div class="card-title card-title-sm">
																			<h6 class="title">처리상태</h6>
																		</div>
																		<div class="card-tools">
																			<div class="drodown">
																				<a href="#" class="dropdown-toggle dropdown-indicator btn btn-sm btn-outline-light btn-white" data-bs-toggle="dropdown" aria-expanded="false">전체</a>
																				<div class="dropdown-menu dropdown-menu-end dropdown-menu-xs" style="">
																					<ul class="link-list-opt no-bdr">
																						<li>
																							<a href="#">
																								<span>전체</span>
																							</a>
																						</li>
																						<li>
																							<a href="#">
																								<span>처리전</span>
																							</a>
																						</li>
																						<li>
																							<a href="#">
																								<span>처리완료</span>
																							</a>
																						</li>
																					</ul>
																				</div>
																			</div>
																		</div>						
																	</div>								
																</li>
																<li class="nav-item" style="margin-left:20px;">
																	<div class="card-title-group pb-3 g-2">
																		<div class="btn-wrap">
																			<span class="d-none d-md-block">
																				<button class="btn btn-light">적용하기</button>
																			</span>
																		</div>
																	</div>								
																</li>
															</ul>
														</div>								
													</div>	
												</div>
											</div>
										</div>
										<div class="card-tools me-n1">
											<ul class="btn-toolbar gx-s1">
												<li>
													<div class="toggle-wrap">
														<a href="#" class="btn btn-icon btn-trigger toggle" data-target="cardTools">
															<em class="icon ni ni-menu-right"></em>
														</a>
														<div class="toggle-content" data-content="cardTools">
															<ul class="btn-toolbar gx-1">
																<li>
																	<div class="dropdown">
																		<a href="#" class="btn btn-trigger btn-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
																			<em class="icon ni ni-setting"></em>
																		</a>
																		<div class="dropdown-menu dropdown-menu-xs dropdown-menu-end" style="">
																			<ul class="link-check">
																				<li>
																					<span>리스트 수</span>
																				</li>
																				<li class="active">
																					<a href="#">10</a>
																				</li>
																				<li>
																					<a href="#">20</a>
																				</li>
																				<li>
																					<a href="#">50</a>
																				</li>
																			</ul>
																			<ul class="link-check">
																				<li>
																					<span>정렬</span>
																				</li>
																				<li class="active">
																					<a href="#">내림차순</a>
																				</li>
																				<li>
																					<a href="#">오름차순</a>
																				</li>
																			</ul>
																		</div>
																	</div>
																</li>
															</ul>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="card-search search-wrap" data-search="search">
										<div class="card-body">
											<div class="search-content">
												<a href="#" class="search-back btn btn-icon toggle-search" data-target="search">
													<em class="icon ni ni-arrow-left"></em>
												</a>
												<input type="text" class="form-control border-transparent form-focus-none" placeholder="Search by user or email">
												<button class="search-submit btn btn-icon">
													<em class="icon ni ni-search"></em>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="card-inner p-0">
									<div class="nk-tb-list nk-tb-ulist">
										<div class="nk-tb-item nk-tb-head">
											<div class="nk-tb-col" style="width:8%;">
												<span class="sub-text">번호</span>
											</div>
											<div class="nk-tb-col tb-col-sm">
												<span class="sub-text">제목</span>
											</div>
											<div class="nk-tb-col tb-col-sm">
												<span class="sub-text">신고자</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="sub-text">판매자</span>
											</div>
											<div class="nk-tb-col tb-col-xl">
												<span class="sub-text">작성일</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span class="sub-text">처리상태</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="sub-text">처리날짜</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">스팸홍보/도배글입니다</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-lead">황닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:20</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:20</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">2</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">스팸홍보/도배글입니다</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">이닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:19</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:20</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">3</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">음란물입니다</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">박닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">4</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">불법 정보를 포함하고 있습니다</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">최닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:16</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">5</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">청소년에게 유해한 내용입니다</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">정닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:15</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">6</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">욕설/생명경시/혐오/차별적 표현입니다</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">강닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:14</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">7</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">개인정보 노출 게시물입니다</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">조닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:13</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">처리 완료</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">8</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">불쾌한 표현이 있습니다</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">윤닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:12</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">처리 완료</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">9</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">명예훼손 또는 저작권이 침해되었습니다</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">장닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:11</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">처리 완료</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">10</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">불법 촬영물 등이 포함되어 있습니다</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">임닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:10</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">처리 완료</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
									</div>
								</div>
								<div class="card-inner">
									<div class="nk-block-between-md g-3">
										<div class="g" style="margin:0px auto;">
											<ul class="pagination justify-content-center justify-content-md-start">
												<li class="page-item">
													<a class="page-link" href="#">처음 페이지로</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&lt;&lt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">4</a>
												</li>
												<li class="page-item active">
													<a class="page-link" href="#">5</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">6</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&gt;&gt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">마지막 페이지로</a>
												</li>
											</ul>
										</div>
									</div>
									<div style="margin:0px auto; width:650px; height:70px; text-align:center; padding-top:20px;">
										<div class="form-group">
											<div class="form-control-wrap">
												<div class="input-group">
													<div class="input-group-prepend" style="width:200px;">
											 			<select class="form-select js-select2 select2-hidden-accessible" data-select2-id="3" tabindex="-1" aria-hidden="true">
															<option value="title">신고 내용</option>
															<option value="nick">판매자 닉네임</option>
															<option value="name">판매 상품명</option>
														</select>
													</div>
													<input type="text" class="form-control" aria-label="Text input with dropdown button">
													<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색">
												</div>
											</div>
										</div>				
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 탭3. 신고내역 끝 -->
					<!-- 탭4. 문의내역 시작 -->
					<div class="tab-pane" id="tabItem4" role="tabpanel">
						<div class="card card-stretch">
							<div class="card-inner-group">
								<div class="card-inner position-relative card-tools-toggle">
									<div class="card-title-group" data-select2-id="7">
										<div class="card-tools" data-select2-id="67">
											<div class="form-inline flex-nowrap gx-3" data-select2-id="14">
												<div class="form-wrap w-200px">
													<div class="input-group-prepend" style="width:180px;">
														<div class="card-tools shrink-0 d-none d-sm-block">
															<ul class="nav nav-switch-s2 nav-tabs bg-white">
																<li class="nav-item">
																	<div class="form-group">
																		<div class="form-control-wrap">
																			<div class="input-daterange date-picker-range input-group" style="float:left; width:300px;">
																				<div class="input-group-addon">시작일</div>
																				<div class="form-control-wrap">
																					<div class="form-icon form-icon-left"><em class="icon ni ni-calendar"></em></div>
																					<input type="text" class="form-control date-picker" data-date-format="yyyy-mm-dd" maxlength="10">
																				</div>
																			</div>
																			<div class="input-daterange date-picker-range input-group" style="float:left;width:300px;">
																				<div class="input-group-addon">종료일</div>
																				<div class="form-control-wrap">
																					<div class="form-icon form-icon-left"><em class="icon ni ni-calendar"></em></div>
																					<input type="text" class="form-control date-picker" data-date-format="yyyy-mm-dd" maxlength="10">
																				</div>
																			</div>
																		</div>
																	</div>
																</li>
																<li class="nav-item">
																	<div class="card-title-group pb-3 g-2">
																		<div class="card-title card-title-sm">
																			<h6 class="title">처리상태</h6>
																		</div>
																		<div class="card-tools">
																			<div class="drodown">
																				<a href="#" class="dropdown-toggle dropdown-indicator btn btn-sm btn-outline-light btn-white" data-bs-toggle="dropdown" aria-expanded="false">전체</a>
																				<div class="dropdown-menu dropdown-menu-end dropdown-menu-xs" style="">
																					<ul class="link-list-opt no-bdr">
																						<li>
																							<a href="#">
																								<span>전체</span>
																							</a>
																						</li>
																						<li>
																							<a href="#">
																								<span>처리전</span>
																							</a>
																						</li>
																						<li>
																							<a href="#">
																								<span>처리완료</span>
																							</a>
																						</li>
																					</ul>
																				</div>
																			</div>
																		</div>						
																	</div>								
																</li>
																<li class="nav-item" style="margin-left:20px;">
																	<div class="card-title-group pb-3 g-2">
																		<div class="btn-wrap">
																			<span class="d-none d-md-block">
																				<button class="btn btn-light">적용하기</button>
																			</span>
																		</div>
																	</div>								
																</li>
															</ul>
														</div>								
													</div>	
												</div>
											</div>
										</div>
										<div class="card-tools me-n1">
											<ul class="btn-toolbar gx-s1">
												<li>
													<div class="toggle-wrap">
														<a href="#" class="btn btn-icon btn-trigger toggle" data-target="cardTools">
															<em class="icon ni ni-menu-right"></em>
														</a>
														<div class="toggle-content" data-content="cardTools">
															<ul class="btn-toolbar gx-1">
																<li>
																	<div class="dropdown">
																		<a href="#" class="btn btn-trigger btn-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
																			<em class="icon ni ni-setting"></em>
																		</a>
																		<div class="dropdown-menu dropdown-menu-xs dropdown-menu-end" style="">
																			<ul class="link-check">
																				<li>
																					<span>리스트 수</span>
																				</li>
																				<li class="active">
																					<a href="#">10</a>
																				</li>
																				<li>
																					<a href="#">20</a>
																				</li>
																				<li>
																					<a href="#">50</a>
																				</li>
																			</ul>
																			<ul class="link-check">
																				<li>
																					<span>정렬</span>
																				</li>
																				<li class="active">
																					<a href="#">내림차순</a>
																				</li>
																				<li>
																					<a href="#">오름차순</a>
																				</li>
																			</ul>
																		</div>
																	</div>
																</li>
															</ul>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="card-search search-wrap" data-search="search">
										<div class="card-body">
											<div class="search-content">
												<a href="#" class="search-back btn btn-icon toggle-search" data-target="search">
													<em class="icon ni ni-arrow-left"></em>
												</a>
												<input type="text" class="form-control border-transparent form-focus-none" placeholder="Search by user or email">
												<button class="search-submit btn btn-icon">
													<em class="icon ni ni-search"></em>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="card-inner p-0">
									<div class="nk-tb-list nk-tb-ulist">
										<div class="nk-tb-item nk-tb-head">
											<div class="nk-tb-col" style="width:8%;">
												<span class="sub-text">번호</span>
											</div>
											<div class="nk-tb-col tb-col-sm">
												<span class="sub-text">제목</span>
											</div>
											<div class="nk-tb-col tb-col-sm">
												<span class="sub-text">작성자</span>
											</div>
											<div class="nk-tb-col tb-col-xl">
												<span class="sub-text">작성일</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span class="sub-text">처리상태</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="sub-text">처리날짜</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:20</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:20</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">2</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:19</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:20</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">3</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">4</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:16</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">5</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:15</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">6</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:14</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">7</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:13</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">처리 완료</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">8</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:12</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">처리 완료</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">9</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:11</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">처리 완료</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">10</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:10</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">처리 완료</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
									</div>
								</div>
								<div class="card-inner">
									<div class="nk-block-between-md g-3">
										<div class="g" style="margin:0px auto;">
											<ul class="pagination justify-content-center justify-content-md-start">
												<li class="page-item">
													<a class="page-link" href="#">처음 페이지로</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&lt;&lt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">4</a>
												</li>
												<li class="page-item active">
													<a class="page-link" href="#">5</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">6</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&gt;&gt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">마지막 페이지로</a>
												</li>
											</ul>
										</div>
									</div>
									<div style="margin:0px auto; width:650px; height:70px; text-align:center; padding-top:20px;">
										<div class="form-group">
											<div class="form-control-wrap">
												<div class="input-group">
													<div class="input-group-prepend" style="width:200px;">
											 			<select class="form-select js-select2 select2-hidden-accessible" data-select2-id="3" tabindex="-1" aria-hidden="true">
															<option value="title">문의 제목</option>
															<option value="content">문의 내용</option>
														</select>
													</div>
													<input type="text" class="form-control" aria-label="Text input with dropdown button">
													<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색">
												</div>
											</div>
										</div>				
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 탭4. 문의내역 끝 -->
					<!-- 탭5. 후기내역 시작 -->
					<div class="tab-pane" id="tabItem5" role="tabpanel">
						<div class="card card-stretch">
							<div class="card-inner-group">
								<div class="card-inner position-relative card-tools-toggle">
									<div class="card-title-group" data-select2-id="7">
										<div class="card-tools" data-select2-id="67">
											<div class="form-inline flex-nowrap gx-3" data-select2-id="14">
												<div class="form-wrap w-200px">
													<div class="input-group-prepend" style="width:180px;">
														<div class="card-tools shrink-0 d-none d-sm-block">
															<ul class="nav nav-switch-s2 nav-tabs bg-white">
																<li class="nav-item">
																	<div class="form-group">
																		<div class="form-control-wrap">
																			<div class="input-daterange date-picker-range input-group" style="float:left; width:300px;">
																				<div class="input-group-addon">시작일</div>
																				<div class="form-control-wrap">
																					<div class="form-icon form-icon-left"><em class="icon ni ni-calendar"></em></div>
																					<input type="text" class="form-control date-picker" data-date-format="yyyy-mm-dd" maxlength="10">
																				</div>
																			</div>
																			<div class="input-daterange date-picker-range input-group" style="float:left;width:300px;">
																				<div class="input-group-addon">종료일</div>
																				<div class="form-control-wrap">
																					<div class="form-icon form-icon-left"><em class="icon ni ni-calendar"></em></div>
																					<input type="text" class="form-control date-picker" data-date-format="yyyy-mm-dd" maxlength="10">
																				</div>
																			</div>
																		</div>
																	</div>
																</li>
																<li class="nav-item" style="margin-left:20px;">
																	<div class="card-title-group pb-3 g-2">
																		<div class="btn-wrap">
																			<span class="d-none d-md-block">
																				<button class="btn btn-light">적용하기</button>
																			</span>
																		</div>
																	</div>								
																</li>
															</ul>
														</div>								
													</div>	
												</div>
											</div>
										</div>
										<div class="card-tools me-n1">
											<ul class="btn-toolbar gx-s1">
												<li>
													<div class="toggle-wrap">
														<a href="#" class="btn btn-icon btn-trigger toggle" data-target="cardTools">
															<em class="icon ni ni-menu-right"></em>
														</a>
														<div class="toggle-content" data-content="cardTools">
															<ul class="btn-toolbar gx-1">
																<li>
																	<div class="dropdown">
																		<a href="#" class="btn btn-trigger btn-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
																			<em class="icon ni ni-setting"></em>
																		</a>
																		<div class="dropdown-menu dropdown-menu-xs dropdown-menu-end" style="">
																			<ul class="link-check">
																				<li>
																					<span>리스트 수</span>
																				</li>
																				<li class="active">
																					<a href="#">10</a>
																				</li>
																				<li>
																					<a href="#">20</a>
																				</li>
																				<li>
																					<a href="#">50</a>
																				</li>
																			</ul>
																			<ul class="link-check">
																				<li>
																					<span>정렬</span>
																				</li>
																				<li class="active">
																					<a href="#">내림차순</a>
																				</li>
																				<li>
																					<a href="#">오름차순</a>
																				</li>
																			</ul>
																		</div>
																	</div>
																</li>
															</ul>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="card-search search-wrap" data-search="search">
										<div class="card-body">
											<div class="search-content">
												<a href="#" class="search-back btn btn-icon toggle-search" data-target="search">
													<em class="icon ni ni-arrow-left"></em>
												</a>
												<input type="text" class="form-control border-transparent form-focus-none" placeholder="Search by user or email">
												<button class="search-submit btn btn-icon">
													<em class="icon ni ni-search"></em>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="card-inner p-0">
									<div class="nk-tb-list nk-tb-ulist">
										<div class="nk-tb-item nk-tb-head">
											<div class="nk-tb-col" style="width:8%;">
												<span class="sub-text">번호</span>
											</div>
											<div class="nk-tb-col tb-col-sm">
												<span class="sub-text">상품명</span>
											</div>
											<div class="nk-tb-col tb-col-sm">
												<span class="sub-text">판매자</span>
											</div>
											<div class="nk-tb-col tb-col-xl">
												<span class="sub-text">내용</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span class="sub-text">작성자</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="sub-text">별점</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="sub-text">작성일</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<div class="user-card">
													<div class="user-avatar bg-primary">
														<span></span>
													</div>
													<div class="user-info">
														<span class="tb-lead">상품명</span>
													</div>
												</div>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">이닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>후기 내용</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>김닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>★★★★★</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">2</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<div class="user-card">
													<div class="user-avatar bg-primary">
														<span></span>
													</div>
													<div class="user-info">
														<span class="tb-lead">상품명</span>
													</div>
												</div>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">이닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>후기 내용</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>김닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>★★★★★</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">3</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<div class="user-card">
													<div class="user-avatar bg-primary">
														<span></span>
													</div>
													<div class="user-info">
														<span class="tb-lead">상품명</span>
													</div>
												</div>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">이닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>후기 내용</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>김닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>★★★★★</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">4</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<div class="user-card">
													<div class="user-avatar bg-primary">
														<span></span>
													</div>
													<div class="user-info">
														<span class="tb-lead">상품명</span>
													</div>
												</div>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">이닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>후기 내용</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>김닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>★★★★★</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">5</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<div class="user-card">
													<div class="user-avatar bg-primary">
														<span></span>
													</div>
													<div class="user-info">
														<span class="tb-lead">상품명</span>
													</div>
												</div>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">이닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>후기 내용</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>김닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>★★★★★</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">6</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<div class="user-card">
													<div class="user-avatar bg-primary">
														<span></span>
													</div>
													<div class="user-info">
														<span class="tb-lead">상품명</span>
													</div>
												</div>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">이닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>후기 내용</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>김닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>★★★★★</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">7</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<div class="user-card">
													<div class="user-avatar bg-primary">
														<span></span>
													</div>
													<div class="user-info">
														<span class="tb-lead">상품명</span>
													</div>
												</div>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">이닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>후기 내용</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>김닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>★★★★★</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">8</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<div class="user-card">
													<div class="user-avatar bg-primary">
														<span></span>
													</div>
													<div class="user-info">
														<span class="tb-lead">상품명</span>
													</div>
												</div>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">이닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>후기 내용</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>김닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>★★★★★</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">9</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<div class="user-card">
													<div class="user-avatar bg-primary">
														<span></span>
													</div>
													<div class="user-info">
														<span class="tb-lead">상품명</span>
													</div>
												</div>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">이닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>후기 내용</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>김닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>★★★★★</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">10</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<div class="user-card">
													<div class="user-avatar bg-primary">
														<span></span>
													</div>
													<div class="user-info">
														<span class="tb-lead">상품명</span>
													</div>
												</div>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">이닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>후기 내용</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>김닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>★★★★★</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										
									</div>
								</div>
								<div class="card-inner">
									<div class="nk-block-between-md g-3">
										<div class="g" style="margin:0px auto;">
											<ul class="pagination justify-content-center justify-content-md-start">
												<li class="page-item">
													<a class="page-link" href="#">처음 페이지로</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&lt;&lt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">4</a>
												</li>
												<li class="page-item active">
													<a class="page-link" href="#">5</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">6</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&gt;&gt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">마지막 페이지로</a>
												</li>
											</ul>
										</div>
									</div>
									<div style="margin:0px auto; width:650px; height:70px; text-align:center; padding-top:20px;">
										<div class="form-group">
											<div class="form-control-wrap">
												<div class="input-group">
													<div class="input-group-prepend" style="width:200px;">
											 			<select class="form-select js-select2 select2-hidden-accessible" data-select2-id="3" tabindex="-1" aria-hidden="true">
															<option value="title">상품명</option>
															<option value="content">판매자</option>
															<option value="content">후기내용</option>
														</select>
													</div>
													<input type="text" class="form-control" aria-label="Text input with dropdown button">
													<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색">
												</div>
											</div>
										</div>				
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 탭5. 후기내역 끝 -->
					<!-- 탭6. 찜목록 시작 -->
					<div class="tab-pane" id="tabItem6" role="tabpanel">
						<div class="row g-gs">
							<c:forEach begin="1" end="16" varStatus="i">
	                        <div class="col-md-6 col-lg-5 col-xxl-3">
								<div class="card card-bordered">
									<div class="card-inner">
			                            <div class="single-product">
			                            	<div class="product-block">
			                            		<div class="myImg col-xxl-12" style="background-image: url(http://192.168.10.214${pageContext.request.contextPath}/user/products-img/product-${ i.index }.jpg);">
			                            		</div>
												<div class="product-description text-left" style="margin-top:20px;">
													<h6>여성의류${ i.index }</h6>
													<div style="overflow: hidden;">
														<h6 class="price" style="float: left;">1${ i.index },000원</h6>
														<p class="time-ago" style="float: right;">${ i.index }일전</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
						<div class="card-inner">
							<div class="nk-block-between-md g-3">
								<div class="g" style="margin:0px auto;">
									<ul class="pagination justify-content-center justify-content-md-start">
										<li class="page-item">
											<a class="page-link" href="#">처음 페이지로</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="#">&lt;&lt;</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="#">4</a>
										</li>
										<li class="page-item active">
											<a class="page-link" href="#">5</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="#">6</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="#">&gt;&gt;</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="#">마지막 페이지로</a>
										</li>
									</ul>
								</div>
							</div>
							<div style="margin:0px auto; width:650px; height:70px; text-align:center; padding-top:20px;">
								<div class="form-group">
									<div class="form-control-wrap">
										<div class="input-group">
											<div class="input-group-prepend" style="width:200px;">
									 			<select class="form-select js-select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
													<option value="title">상품명</option>
													<option value="nick">판매자</option>
												</select>
											</div>
											<input type="text" class="form-control" aria-label="Text input with dropdown button">
											<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색">
										</div>
									</div>
								</div>				
							</div>
						</div>
					</div>
					<!-- 탭6. 찜목록 끝 -->
					<!-- 탭7. 로그인 로그 시작 -->
					<div class="tab-pane" id="tabItem7" role="tabpanel">
						<div class="card card-stretch">
							<div class="card-inner-group">
								<div class="card-inner position-relative card-tools-toggle">
									<div class="card-title-group" data-select2-id="7">
										<div class="card-tools" data-select2-id="67">
										</div>
										<div class="card-tools me-n1">
											<ul class="btn-toolbar gx-s1">
												<li>
													<div class="toggle-wrap">
														<a href="#" class="btn btn-icon btn-trigger toggle" data-target="cardTools">
															<em class="icon ni ni-menu-right"></em>
														</a>
														<div class="toggle-content" data-content="cardTools">
															<ul class="btn-toolbar gx-1">
																<li>
																	<div class="dropdown">
																		<a href="#" class="btn btn-trigger btn-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
																			<em class="icon ni ni-setting"></em>
																		</a>
																		<div class="dropdown-menu dropdown-menu-xs dropdown-menu-end" style="">
																			<ul class="link-check">
																				<li>
																					<span>리스트 수</span>
																				</li>
																				<li class="active">
																					<a href="#">10</a>
																				</li>
																				<li>
																					<a href="#">20</a>
																				</li>
																				<li>
																					<a href="#">50</a>
																				</li>
																			</ul>
																			<ul class="link-check">
																				<li>
																					<span>정렬</span>
																				</li>
																				<li class="active">
																					<a href="#">내림차순</a>
																				</li>
																				<li>
																					<a href="#">오름차순</a>
																				</li>
																			</ul>
																		</div>
																	</div>
																</li>
															</ul>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="card-search search-wrap" data-search="search">
										<div class="card-body">
											<div class="search-content">
												<a href="#" class="search-back btn btn-icon toggle-search" data-target="search">
													<em class="icon ni ni-arrow-left"></em>
												</a>
												<input type="text" class="form-control border-transparent form-focus-none" placeholder="Search by user or email">
												<button class="search-submit btn btn-icon">
													<em class="icon ni ni-search"></em>
												</button>
											</div>
										</div>
									</div>
								</div>
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
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1.241.155.210</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">Windows</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>chrome</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">일반</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">2</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1.241.155.210</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">Windows</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>chrome</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">일반</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">3</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1.241.155.210</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">Windows</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>chrome</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">일반</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">4</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1.241.155.210</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">Windows</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>chrome</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">일반</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">5</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1.241.155.210</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">Windows</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>chrome</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">일반</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">6</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1.241.155.210</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">Windows</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>chrome</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">일반</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">7</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1.241.155.210</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">Windows</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>chrome</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">일반</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">8</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1.241.155.210</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">Windows</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>chrome</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-warning">정지</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">9</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1.241.155.210</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">Windows</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>chrome</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-warning">정지</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">10</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1.241.155.210</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">Windows</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>chrome</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">일반</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:19</span>
											</div>
										</div>
										
									</div>
								</div>
								<div class="card-inner">
									<div class="form-inline flex-nowrap gx-3" style="float:right;">
										<div class="form-wrap w-200px">
											<div class="input-group-prepend" style="width:180px;">
												<div class="card-tools shrink-0 d-none d-sm-block">
													<ul class="nav nav-switch-s2 nav-tabs bg-white">
														<li class="nav-item" style="margin-left:20px;">
															<div class="card-title-group pb-3 g-2">
																<div class="btn-wrap">
																	<span class="d-none d-md-block">
																		<button class="btn btn-light">엑셀로 다운</button>
																	</span>
																</div>
															</div>								
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="nk-block-between-md g-3">
										<div class="g" style="margin:0px auto;">
											<ul class="pagination justify-content-center justify-content-md-start">
												<li class="page-item">
													<a class="page-link" href="#">처음 페이지로</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&lt;&lt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">4</a>
												</li>
												<li class="page-item active">
													<a class="page-link" href="#">5</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">6</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&gt;&gt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">마지막 페이지로</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 탭7. 로그인 로그 끝 -->
					<!-- 탭8. 회원 정지 시작 -->
					<div class="tab-pane" id="tabItem8" role="tabpanel">
						<div class="col-xxl-6">
							<div class="card">
								<div class="card-inner">
									<div class="row gy-4">
										<div class="col-12">
											<div class="g-4 align-center flex-wrap">
												<div class="g" style="min-width:200px;">
													<div class="custom-control custom-radio checked">
														<input type="radio" class="custom-control-input" name="radSuspendMem" id="radSuspendMem" checked='checked'>
														<label class="custom-control-label" for="radSuspendMem">정지일 선택</label>
													</div>
												</div>
												<div class="g">
													<div class="form-group">
														<div class="form-control-wrap">
															<div class="input-group">
																<div class="input-group-prepend" style="width:200px;">
														 			<select class="form-select js-select2 select2-hidden-accessible" data-select2-id="3" tabindex="-1" aria-hidden="true">
																		<option value="d1">1일</option>
																		<option value="d3">3일</option>
																		<option value="d7">7일</option>
																		<option value="d15">15일</option>
																		<option value="d30">30일</option>
																		<option value="d60">60일</option>
																		<option value="d90">90일</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-12">
											<div class="g-4 align-center flex-wrap">
												<div class="g" style="min-width:200px;">
													<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" name="radSuspendMem" id="radSuspendMemDetail">
														<label class="custom-control-label" for="radSuspendMemDetail">정지 기간 상세 설정</label>
													</div>
												</div>
												<div class="g">
													<label class="form-label" for="fv-full-name">정지일</label>
													<div class="form-control-wrap">
														<c:set var="now" value="<%=new java.util.Date()%>" />
														<input type="text" class="form-control invalid" value="<fmt:formatDate value='${now }' pattern='yyyy-MM-dd'/>" disabled="disabled">
													</div>
												</div>
												<div class="g">
													<label class="form-label" for="fv-full-name">해제일</label>
													<div class="form-control-wrap">
														<div class="form-icon form-icon-left">
															<em class="icon ni ni-calendar"></em>
														</div>
														<input type="text" class="form-control date-picker invalid"	id="fv-full-name" name="fv-full-name" required="" aria-describedby="fv-full-name-error" aria-invalid="true" data-date-format="yyyy-mm-dd" maxlength="10">
													</div>
												</div>
											</div>
										</div>
										<div class="col-12">
											<div class="col-1" style="margin:0px auto;">
												<input type="button" class="btn btn-danger" value="회원 정지"/>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 탭8. 회원 정지 끝 -->
				</div>
				<!-- 탭 내용 끝 -->
			</div>
		</div>
	</div>
</div>

</div>
</div>
</div>
</div>
<!-- 본문 끝 -->
<!-- 푸터 시작 -->
<c:import url="/WEB-INF/views/mgr/common/jsp/footer.jsp"/>
<!-- 푸터 끝 -->
</div>
</div>
</div>
<!-- dashlite 시작-->
<!-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script> -->
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/bundle_beauty_my.js?ver=3.2.3"></script>
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script>
<!-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script>
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script>
<div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div>
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-member").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>