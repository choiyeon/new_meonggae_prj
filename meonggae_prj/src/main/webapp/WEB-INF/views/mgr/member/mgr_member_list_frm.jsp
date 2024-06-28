<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 회원 관리 - 리스트"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-06-01
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
<link rel="stylesheet" href="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/css/datepicker_pulse10.css">
<!-- datepicker css 끝 -->

<style type="text/css">
	
	/* datepicker 아이콘 가져오기 */
   .ui-widget-header .ui-icon { background-image: url('http://192.168.10.214${pageContext.request.contextPath}/mgr_common/images/btns.png'); } 
	
</style>

<script type="text/javascript">
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
			url.searchParams.delete('parentCategoryNum');
			url.searchParams.delete('categoryNum');
			url.searchParams.delete('startDate');
			url.searchParams.delete('endDate');
			
			url.searchParams.delete('tradeMethodCode');
			url.searchParams.delete('qualityCode');
			url.searchParams.delete('location');
			url.searchParams.delete('minPrice');
			url.searchParams.delete('maxPrice');
			url.searchParams.delete('sellStatusCode');
			location.href = "${pageContext.request.contextPath}/mgr/goods/mgr_goods_list_frm.do" + url.search;
		}); // click
		
		// 전체 조회
		$("#btnAllSearch").click(function () {
			location.href = "${pageContext.request.contextPath}/mgr/goods/mgr_goods_list_frm.do";
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
		if($("#selCategoryUpper").val() == null || $("#selCategoryUpper").val().trim() == '') {
			$("#selCategoryUpper").prop("disabled", "disabled");
			$("#selCategoryLower").prop("disabled", "disabled");
		} // end if
		if($("#selCategoryLower").val() == null || $("#selCategoryLower").val().trim() == '') {
			$("#selCategoryLower").prop("disabled", "disabled");
		} // end if
		if($("#startDate").val() == null || $("#startDate").val().trim() == '') {
			$("#startDate").prop("disabled", "disabled");
		} // end if
		if($("#endDate").val() == null || $("#endDate").val().trim() == '') {
			$("#endDate").prop("disabled", "disabled");
		} // end if
		
		if($("#tradeMethodCode").val() == null || $("#tradeMethodCode").val().trim() == '') {
			$("#tradeMethodCode").prop("disabled", "disabled");
		} // end if
		if($("#qualityCode").val() == null || $("#qualityCode").val().trim() == '') {
			$("#qualityCode").prop("disabled", "disabled");
		} // end if
		if($("#location").val() == null || $("#location").val().trim() == '') {
			$("#location").prop("disabled", "disabled");
		} // end if
		if($("#minPrice").val() == null || $("#minPrice").val().trim() == '') {
			$("#minPrice").prop("disabled", "disabled");
		} // end if
		if($("#maxPrice").val() == null || $("#maxPrice").val().trim() == '') {
			$("#maxPrice").prop("disabled", "disabled");
		} // end if
		if($("#sellStatusCode").val() == null || $("#sellStatusCode").val().trim() == '') {
			$("#sellStatusCode").prop("disabled", "disabled");
		} // end if
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
											<select id="gender" class="form-select js-select2" name="gender">
												<option value="">모든 성별</option>
												<option value="M"${param.tradeMethodCode eq 'M' ? " selected='selected'" : ""}>남자</option>
												<option value="F"${param.tradeMethodCode eq 'F' ? " selected='selected'" : ""}>여자</option>
											</select>
										</div>	
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-wrap">
										<div class="input-group-prepend" style="width:180px;">
											<select id="loginFlag" class="form-select js-select2" name="loginFlag">
												<option value="">모든 로그인 타입</option>
												<option value="N"${param.qualityCode eq 'N' ? " selected='selected'" : ""}>일반 회원</option>
												<option value="S"${param.qualityCode eq 'S' ? " selected='selected'" : ""}>소셜 회원</option>
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
											<select id="memStatus" class="form-select js-select2" name="memStatus">
												<option value="">모든 회원 상태</option>
												<option value="N"${param.sellStatusCode eq 'N' ? " selected='selected'" : ""}>일반</option>
												<option value="S"${param.sellStatusCode eq 'S' ? " selected='selected'" : ""}>정지</option>
												<option value="W"${param.sellStatusCode eq 'W' ? " selected='selected'" : ""}>탈퇴</option>
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
<!-- 											<li> -->
<!-- 												<div class="dropdown"> -->
<!-- 													<a href="#" class="btn btn-trigger btn-icon dropdown-toggle" data-bs-toggle="dropdown"> -->
<!-- 														<div class="dot dot-primary"></div> -->
<!-- 														<em class="icon ni ni-filter-alt"></em> -->
<!-- 													</a> -->
<!-- 													<div class="filter-wg dropdown-menu dropdown-menu-end" style="min-width:200px;max-width:200px;"> -->
<!-- 														<div class="dropdown-head"> -->
<!-- 															<span class="sub-title dropdown-title">필터</span> -->
<!-- 														</div> -->
<!-- 														<div class="dropdown-body dropdown-body-rg"> -->
<!-- 															<div class="row gx-6 gy-3"> -->
<!-- 																<div class="col-12"> -->
<!-- 																	<div class="form-group"> -->
<!-- 																		<label class="overline-title overline-title-alt">상태 선택</label> -->
<!-- 																		<select class="form-select js-select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true"> -->
<!-- 																			<option value="any">모든 상태</option> -->
<!-- 																			<option value="n">일반</option> -->
<!-- 																			<option value="s">정지</option> -->
<!-- 																			<option value="w">탈퇴</option> -->
<!-- 																			<option value="sw">정지 + 탈퇴</option> -->
<!-- 																		</select> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 																<div class="col-12"> -->
<!-- 																	<div class="form-group"> -->
<!-- 																		<button type="button" class="btn btn-secondary">Filter</button> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="dropdown-foot between"> -->
<!-- 															<a class="clickable" href="#">초기화</a> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<div class="dropdown"> -->
<!-- 													<a href="#" class="btn btn-trigger btn-icon dropdown-toggle" data-bs-toggle="dropdown"> -->
<!-- 														<em class="icon ni ni-setting"></em> -->
<!-- 													</a> -->
<!-- 													<div class="dropdown-menu dropdown-menu-xs dropdown-menu-end"> -->
<!-- 														<ul class="link-check"> -->
<!-- 															<li> -->
<!-- 																<span>리스트 수</span> -->
<!-- 															</li> -->
<!-- 															<li class="active"> -->
<!-- 																<a href="#">10</a> -->
<!-- 															</li> -->
<!-- 															<li> -->
<!-- 																<a href="#">20</a> -->
<!-- 															</li> -->
<!-- 															<li> -->
<!-- 																<a href="#">50</a> -->
<!-- 															</li> -->
<!-- 														</ul> -->
<!-- 														<ul class="link-check"> -->
<!-- 															<li> -->
<!-- 																<span>정렬</span> -->
<!-- 															</li> -->
<!-- 															<li class="active"> -->
<!-- 																<a href="#">내림차순</a> -->
<!-- 															</li> -->
<!-- 															<li> -->
<!-- 																<a href="#">오름차순</a> -->
<!-- 															</li> -->
<!-- 														</ul> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</li> -->
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
						<div class="nk-tb-col tb-col-xs">
							<span class="sub-text">닉네임</span>
						</div>
						<div class="nk-tb-col">
							<span class="sub-text">아이디</span>
						</div>
						<div class="nk-tb-col">
							<span class="sub-text">이름</span>
						</div>
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
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">1</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<div class="user-card">
								<div class="user-avatar bg-primary"><span></span></div>
								<div class="user-info">
									<span class="tb-amount"><a href="${pageContext.request.contextPath}/mgr/member/mgr_member_detail_frm.do">김닉</a></span>
								</div>
							</div>
						</div>
						<div class="nk-tb-col tb-col">
							<span class="tb-lead">memberkim</span>
						</div>
						<div class="nk-tb-col tb-col-xs">
							<span class="tb-lead">김회원</span>
						</div>
						<div class="nk-tb-col tb-col-xs">
							<span>2024.07.05 11:12:13</span>
						</div>
						<div class="nk-tb-col tb-col-xs">
							<span>2024.06.02 11:12:13</span>
						</div>
						<div class="nk-tb-col tb-col-xs">
							<span class="tb-status text-success">일반</span>
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
				<div style="margin:0px auto; width:300px; height:70px; text-align:center; padding-top:20px;">
					<div class="form-group">
						<div class="form-control-wrap">
							<div class="input-group">
								<div class="input-group-prepend" style="width:80px;">
						 			<select class="form-select js-select2">
										<option value="id">아이디</option>
										<option value="nick">닉네임</option>
									</select>
								</div>
								<input type="text" class="form-control" aria-label="Text input with dropdown button">
								<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색"/>
							</div>
						</div>
					</div>				
				</div>
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
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script> --%>
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script> --%>
<!-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script> --%>
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script> --%>
<!-- <div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div> -->
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-member").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>