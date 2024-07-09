<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 회원 관리 - 리스트"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-06-01
*/%>

<c:set var="date" value="<%=new java.util.Date()%>" />
<c:set var="strDate"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터 관리자</title>
<link rel="icon" href="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/images/favicon.png"/>
<!--bootstrap 시작-->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
<!--bootstrap 끝-->

<!-- dashlite css 시작-->
<link rel="stylesheet" href="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<!--dashlite css 끝-->

<!-- <link rel="stylesheet" href="http://211.63.89.136${pageContext.request.contextPath}/common/css/board.css" type="text/css" media="all" /> -->
<!-- <link rel="stylesheet" href="http://211.63.89.136${pageContext.request.contextPath}/common/css/main.css" type="text/css" media="all" /> -->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<!-- datepicker 시작-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->
<script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/jquery-ui.js"></script> <!-- datepicker가 div 뒤에 생기는 문제 방지 -->
<script>
	$( function() {
		// 기본 사용
		//$( "#datepicker" ).datepicker();
		
		// 옵션 부여
		$( ".datepicker" ).datepicker({
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ], 
			dateFormat: "yy-mm-dd",
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			maxDate: "${strDate}",
			showMonthAfterYear: true
		});
	} );
</script>
<!-- datepicker 끝-->

<!-- datepicker css 시작 -->
<link rel="stylesheet" href="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/css/datepicker_pulse10.css">
<!-- datepicker css 끝 -->

<style type="text/css">
	
	/* datepicker 아이콘 가져오기 */
	.ui-widget-header .ui-icon { background-image: url('http://211.63.89.136${pageContext.request.contextPath}/mgr_common/images/btns.png'); } 
	
	.user-avatar2{
	    border-radius:50%;
	    height:40px;
	    width:40px;
	    display:flex;
	    justify-content:center;
	    align-items:center;
	    color:#fff;
	    font-size:14px;
	    font-weight:500;
	    letter-spacing:.06em;
	    flex-shrink:0;
	    position:relative
	}
</style>

<script type="text/javascript">
	var nick = "${sessionScope.mgr.nick}";
	var managerId = "${sessionScope.mgr.manager_id}";
	var link = "http://localhost${pageContext.request.contextPath}";
	$(function() {
		
		// 필터 적용 버튼
		$("#btnFilter").click(function(){
			if($("#keyword").val() == null || $("#keyword").val().trim() == '') {
				$("#keyword").prop("disabled", "disabled");
				$("#field").prop("disabled", "disabled");
			} // end if
			disableInput();
			
			$("#frmBoard").submit();
		}); // click
		
		// 검색
		$("#btnSearch").click(function () {
			chkNull();
		}); // click
		
		// 검색
		$("#keyword").keydown(function (evt) {
			if(evt.which == 13) {
				chkNull();
			} // end if
		}); // keydown
		
		// 필터 초기화
		$("#resetFilter").click(function () {
			let url = new URL(location.href);
			url.searchParams.delete('startDate');
			url.searchParams.delete('endDate');
			url.searchParams.delete('gender');
			url.searchParams.delete('loginFlag');
			url.searchParams.delete('memStatus');
			location.href = "${pageContext.request.contextPath}/mgr/member/mgr_member_list_frm.do" + url.search;
		}); // click
		
		// 전체 조회
		$("#btnAllSearch").click(function () {
			location.href = "${pageContext.request.contextPath}/mgr/member/mgr_member_list_frm.do";
		}); // click
	}); // $(document).ready(function() { })
	
	// 검색을 위한 null 체크
	function chkNull() {
		if($("#keyword").val().trim() != "") {
// 			if($("#chkDeptAll").is(":checked")) {
// 				$(".dept").prop("disabled", "disabled");
// 			} // end if
			disableInput();
			$("#frmBoard").submit();
		} // end if
	} // chkNull
	
	// form submit시 null인 거 안 넘어가게
	function disableInput() {
		if($("#startDate").val() == null || $("#startDate").val().trim() == '') {
			$("#startDate").prop("disabled", "disabled");
		} // end if
		if($("#endDate").val() == null || $("#endDate").val().trim() == '') {
			$("#endDate").prop("disabled", "disabled");
		} // end if
		
		let arrFilter = $(".filter");
		for(let i = 0; i < arrFilter.length; i++) {
			if($(arrFilter[i]).val() == null || $(arrFilter[i]).val().trim() == '') {
				$(arrFilter[i]).prop("disabled", "disabled");
			} // end if
		} // end for
	} // disableInput
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
	<div class="nk-block-between">
		<div class="nk-block-head-content">
			<h3 class="nk-block-title page-title">회원 관리</h3>
			<div class="nk-block-des text-soft"><p>회원 리스트 조회</p></div>
		</div>
	</div>
</div>
<div class="nk-block">
	<div class="card card-bordered card-stretch">
		<div class="card-inner-group">
			<form name="frmBoard" id="frmBoard" action="mgr_member_list_frm.do">
				<div class="card-inner position-relative card-tools-toggle">
					<div class="card-title-group">
						<div class="card-tools">
							<div class="form-inline flex-nowrap gx-5">
								<div class="row gy-4">
									<div class="col-sm-1">
										<div class="btn-wrap">
											<span class="d-none d-md-block">
												<input type="button" class="btn btn-light" id="btnAllSearch" value="전체 조회">
											</span>
										</div>
									</div>
									<hr style="color:#ffffff"/>
									<div class="col-sm-2">
										<div class="form-wrap">
											<div class="input-group-prepend" style="width:180px;">
												<select id="gender" class="form-select js-select2 filter" name="gender">
													<option value="">모든 성별</option>
													<option value="M"${param.gender eq 'M' ? " selected='selected'" : ""}>남자</option>
													<option value="F"${param.gender eq 'F' ? " selected='selected'" : ""}>여자</option>
												</select>
											</div>	
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-wrap">
											<div class="input-group-prepend" style="width:180px;">
												<select id="loginFlag" class="form-select js-select2 filter" name="loginFlag">
													<option value="">모든 로그인 타입</option>
													<option value="N"${param.loginFlag eq 'N' ? " selected='selected'" : ""}>일반 회원</option>
													<option value="S"${param.loginFlag eq 'S' ? " selected='selected'" : ""}>소셜 회원</option>
												</select>
											</div>	
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<div class="form-control-wrap">
												<div class="input-daterange date-picker-range input-group">
													<div class="input-group-addon">가입일</div>
													<input type="text" id="startDate" name="startDate" class="form-control datepicker" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${param.startDate}">
													<div class="input-group-addon"> ~ </div>
													<input type="text" id="endDate" name="endDate" class="form-control datepicker" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${param.endDate}">
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-wrap">
											<div class="input-group-prepend" style="width:180px;">
												<select id="memStatus" class="form-select js-select2 filter" name="memStatus">
													<option value="">모든 회원 상태</option>
													<option value="N"${param.memStatus eq 'N' ? " selected='selected'" : ""}>일반</option>
													<option value="S"${param.memStatus eq 'S' ? " selected='selected'" : ""}>정지</option>
													<option value="W"${param.memStatus eq 'W' ? " selected='selected'" : ""}>탈퇴</option>
												</select>
											</div>	
										</div>
									</div>
									<hr style="color:#ffffff"/>
									<div class="col-sm-1">
										<div class="btn-wrap">
											<span class="d-none d-md-block">
												<input type="button" class="btn btn-dim btn-primary" id="btnFilter" value="적용하기">
											</span>
										</div>
									</div>
									<div class="col-sm-1">
										<div class="btn-wrap">
											<span class="d-none d-md-block">
												<input type="button" class="btn btn-outline-secondary" id="resetFilter" value="초기화">
											</span>
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
												<li class="toggle-close">
													<a href="#" class="btn btn-icon btn-trigger toggle" data-target="cardTools">
														<em class="icon ni ni-arrow-left"></em>
													</a>
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
					<div class="" style="margin-top:10px;">검색된 총 회원 수: <c:out value="${requestScope.totalCount }"/>명</div>
					</div>
				</div>
				<c:set var="flagIsList" value="${not (requestScope.list eq null or fn:length(requestScope.list) eq 0)}"/>
				<div class="card-inner p-0">
					<div class="nk-tb-list nk-tb-ulist">
						<div class="nk-tb-item nk-tb-head">
							<div class="nk-tb-col" style="width:8%;">
								<span class="sub-text">번호</span>
							</div>
							<div class="nk-tb-col tb-col-xs">
								<span class="sub-text">닉네임</span>
							</div>
							<div class="nk-tb-col tb-col-xs">
								<span class="sub-text">로그인 타입</span>
							</div>
							<div class="nk-tb-col">
								<span class="sub-text">아이디</span>
							</div>
<!-- 							<div class="nk-tb-col"> -->
<!-- 								<span class="sub-text">이름</span> -->
<!-- 							</div> -->
							<div class="nk-tb-col tb-col-xs">
								<span class="sub-text">최근 로그인</span>
							</div>
							<div class="nk-tb-col tb-col-xs">
								<span class="sub-text">가입일</span>
							</div>
							<div class="nk-tb-col tb-col-xs">
								<span class="sub-text">상태</span>
							</div>
						</div>
						<c:if test="${flagIsList }">
							<c:forEach var="memberDomain" items="${requestScope.list }" varStatus="i">
								<div class="nk-tb-item">
									<div class="nk-tb-col tb-col-mb">
										<span class="tb-amount"><c:out value="${requestScope.totalCount - ((requestScope.currentPage - 1) * requestScope.pageScale) - i.index }"/></span>
									</div>
									<div class="nk-tb-col tb-col-mb">
										<div class="user-card">
											<div class="user-avatar2 bg-white"><span>
											<c:choose>
												<c:when test="${memberDomain.img eq null or memberDomain.img eq '' }">
													<img src="${pageContext.request.contextPath}/profile-img/default.png" alt="" class="thumbnail">
												</c:when>
												<c:when test="${fn:startsWith(memberDomain.img, 'http')}">
													<img src="${memberDomain.img}" alt="" class="thumbnail" style="max-width:40px; max-height:40px;">
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/profile-img/${memberDomain.img}" alt="" class="thumbnail">
												</c:otherwise>
											</c:choose>
											</span></div>
											<div class="user-info">
												<span class="tb-amount"><a href="${pageContext.request.contextPath}/mgr/member/mgr_member_detail_frm.do?memNum=${memberDomain.memNum}"><c:out value="${memberDomain.nick}"/></a></span>
											</div>
										</div>
									</div>
									<div class="nk-tb-col tb-col">
										<c:choose>
											<c:when test="${memberDomain.loginFlag eq 'N' }">
												<span class="tb-status text-success">일반</span>
											</c:when>
											<c:when test="${memberDomain.loginFlag eq 'S' }">
												<span class="tb-status text-info">소셜</span>
											</c:when>
										</c:choose>
									</div>
									<div class="nk-tb-col tb-col">
										<span class="tb-lead">
										<c:choose>
											<c:when test="${memberDomain.memId ne null}"><c:out value="${memberDomain.memId}"/></c:when>
											<c:otherwise>-</c:otherwise>
										</c:choose>
										</span>
									</div>
<!-- 									<div class="nk-tb-col tb-col-xs"> -->
<!-- 										<span class="tb-lead"> -->
<%-- 										<c:choose> --%>
<%-- 											<c:when test="${memberDomain.name ne null}"><c:out value="${memberDomain.name}"/></c:when> --%>
<%-- 											<c:otherwise>-</c:otherwise> --%>
<%-- 										</c:choose> --%>
<!-- 										</span> -->
<!-- 									</div> -->
									<div class="nk-tb-col tb-col-xs">
										<span>
										<c:choose>
											<c:when test="${memberDomain.recentLoginDate ne null}"><fmt:formatDate value="${memberDomain.recentLoginDate}" pattern="yyyy-MM-dd HH:mm:ss"/></c:when>
											<c:otherwise>-</c:otherwise>
										</c:choose>
										</span>
									</div>
									<div class="nk-tb-col tb-col-xs">
										<span><fmt:formatDate value="${memberDomain.joinDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
									</div>
									<div class="nk-tb-col tb-col-xs">
										<c:choose>
											<c:when test="${memberDomain.memStatus eq 'N'}">
											<span class="tb-status text-success">일반</span>
											</c:when>
											<c:when test="${memberDomain.memStatus eq 'S'}">
											<span class="tb-status text-warning">정지</span>
											</c:when>
											<c:when test="${memberDomain.memStatus eq 'W'}">
											<span class="tb-status text-danger">탈퇴</span>
											</c:when>
										</c:choose>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<c:if test="${not flagIsList }">
					<div style="margin:0px auto; text-align:center; padding-top:15px;">
						<h4>조회된 데이터가 없습니다</h4>
						<hr/>
					</div>
				</c:if>
				<div class="card-inner">
					<div class="nk-block-between-md g-3">
						<div class="g" style="margin:0px auto;">
							${requestScope.pageNation }
						</div>
					</div>
					<div style="margin:0px auto; width:500px; height:70px; text-align:center; padding-top:20px;">
						<div class="form-group">
							<div class="form-control-wrap">
								<div class="input-group">
									<div class="input-group-prepend" style="width:200px;">
							 			<select class="form-select js-select2" id="field" name="field">
											<option value="0"${param.field eq '0' ? " selected='selected'" : ""}>아이디</option>
											<option value="1"${param.field eq '1' ? " selected='selected'" : ""}>닉네임</option>
										</select>
									</div>
									<input type="text" class="form-control" aria-label="Text input with dropdown button"id="keyword" name="keyword" value="${param.keyword }">
									<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색" id="btnSearch"/>
								</div>
							</div>
						</div>				
					</div>
				</div>
			</form>
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
<%-- <script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script> --%>
<%-- <script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script> --%>
<!-- <script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<%-- <script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script> --%>
<%-- <script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script> --%>
<!-- <div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div> -->
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-member").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>