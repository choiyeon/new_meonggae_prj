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

<c:set var="date" value="<%=new java.util.Date()%>" />
<c:set var="strDate"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></c:set>

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

<!-- datepicker 시작-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/jquery-ui.js"></script> <!-- datepicker가 div 뒤에 생기는 문제 방지 -->
<script>
	$( function() {
		// 기본 사용
		//$( "#datepicker" ).datepicker();
		
		// 옵션 부여 - 최대가 오늘
		$( ".datepicker" ).datepicker({
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ], 
			dateFormat: "yy-mm-dd",
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			maxDate: "${strDate}",
			showMonthAfterYear: true
		});
		
		// 옵션 부여 - 최소가 오늘
		$( ".datepickerOver" ).datepicker({
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ], 
			dateFormat: "yy-mm-dd",
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			minDate: "${strDate}",
			showMonthAfterYear: true
		});
	} );
</script>
<!-- datepicker 끝-->

<!-- datepicker css 시작 -->
<link rel="stylesheet" href="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/css/datepicker_pulse10.css">
<!-- datepicker css 끝 -->

<style type="text/css">
	
 	span.invalid{display: none;}
 	.myImg{height: 300px;
 	background-size: contain;
    background-repeat: no-repeat;
    background-position: center;}
    .nav-link{cursor:pointer;}
	
	/* datepicker 아이콘 가져오기 */
	.ui-widget-header .ui-icon { background-image: url('http://192.168.10.214${pageContext.request.contextPath}/mgr_common/images/btns.png'); } 
	
</style>

<script type="text/javascript">
	var nick = "${sessionScope.mgr.nick}";
	var managerId = "${sessionScope.mgr.manager_id}";
	var link = "http://localhost${pageContext.request.contextPath}";
	$(function() {
		
		//탭 누르면 parameter에 담아서 이동하는 방식
		$(".memTab").click(function(){
			let url = new URL(location.href);
			url.searchParams.set('t', $(this).index());
			location.href="${pageContext.request.contextPath}/mgr/member/mgr_member_detail_frm.do" + url.search;
		}); // click
		
		// 목록으로
		$("#backToList").click(function() {
		    let url = new URL(location.href);
		    let searchParams = new URLSearchParams(url.search);
		    let param = '';
		    let arrParamToKeep = ['gender', 'loginFlag', 'startDate', 'endDate', 'memStatus'];
		    for (param of searchParams.keys()) {
		        if (!arrParamToKeep.includes(param)) {
		            searchParams.delete(param);
		        } // end if
		    } // end for
			
			location.href="${pageContext.request.contextPath}/mgr/member/mgr_member_list_frm.do" + searchParams;
		}); // click
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
			<div class="btn btn-outline-light bg-white d-none d-sm-inline-flex">
				<em class="icon ni ni-arrow-left"></em>
				<span id="backToList">목록으로</span>
			</div>
		</div>
	</div>
</div>

<div class="nk-block">
	<div class="card card-bordered">
		<div class="card-inner-group">
			<div class="card-inner">
				<!-- 탭이 바껴도 공통으로 출력해줄 회원 정보 시작 -->
				<div class="user-card">
					<div class="user-avatar lg bg-white">
					
					
					<c:choose>
						<c:when test="${requestScope.memberPersonalDomain.img eq null or requestScope.memberPersonalDomain.img eq '' }">
							<img src="${pageContext.request.contextPath}/profile-img/default.png" alt="" class="thumbnail">
						</c:when>
						<c:when test="${fn:startsWith(requestScope.memberPersonalDomain.img, 'http')}">
							<img src="${requestScope.memberPersonalDomain.img}" alt="" class="thumbnail" style="max-width:40px; max-height:40px;">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/profile-img/${requestScope.memberPersonalDomain.img}" alt="" class="thumbnail">
						</c:otherwise>
					</c:choose>
					
					
					
<!-- 						<span></span> -->
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
						<span data-bs-toggle="tab" aria-selected=${param.t eq 0 or param.t eq null ? '"true" role="tab" class="nav-link active"' : '"false" class="nav-link" tabindex="-1"'}>
							<em class="icon ni ni-user-circle"></em>
							<span>개인정보</span>
						</span>
					</li>
					<li class="nav-item memTab">
						<span data-bs-toggle="tab" aria-selected=${param.t eq 1 ? '"true" role="tab" class="nav-link active"' : '"false" class="nav-link" tabindex="-1"'}>
							<em class="icon ni ni-repeat"></em>
							<span>거래내역</span>
						</span>
					</li>
					<li class="nav-item memTab">
						<span data-bs-toggle="tab" aria-selected=${param.t eq 2 ? '"true" role="tab" class="nav-link active"' : '"false" class="nav-link" tabindex="-1"'}>
							<em class="icon ni ni-file-text"></em>
							<span>신고내역</span>
						</span>
					</li>
					<li class="nav-item memTab">
						<span data-bs-toggle="tab" aria-selected=${param.t eq 3 ? '"true" role="tab" class="nav-link active"' : '"false" class="nav-link" tabindex="-1"'}>
							<em class="icon ni ni-bell"></em>
							<span>문의내역</span>
						</span>
					</li>
					<li class="nav-item memTab">
						 <span data-bs-toggle="tab" aria-selected=${param.t eq 4 ? '"true" role="tab" class="nav-link active"' : '"false" class="nav-link" tabindex="-1"'}>
							<em class="icon ni ni-activity"></em>
							<span>후기내역</span>
						</span>
					</li>
					<li class="nav-item memTab">
						<span data-bs-toggle="tab" aria-selected=${param.t eq 5 ? '"true" role="tab" class="nav-link active"' : '"false" class="nav-link" tabindex="-1"'}>
							<em class="icon ni ni-activity"></em>
							<span>찜목록</span>
						</span>
					</li>
					<li class="nav-item memTab">
						<span data-bs-toggle="tab" aria-selected=${param.t eq 6 ? '"true" role="tab" class="nav-link active"' : '"false" class="nav-link" tabindex="-1"'}>
							<em class="icon ni ni-activity"></em>
							<span>로그인 로그</span>
						</span>
					</li>
					<li class="nav-item memTab">
						<span data-bs-toggle="tab" aria-selected=${param.t eq 7 ? '"true" role="tab" class="nav-link active"' : '"false" class="nav-link" tabindex="-1"'}>
							<em class="icon ni ni-activity"></em>
							<span>회원 정지</span>
						</span>
					</li>
				</ul>
				<!-- 탭 목록 끝 -->
				<!-- 탭 내용 시작 -->
				<div class="tab-content">