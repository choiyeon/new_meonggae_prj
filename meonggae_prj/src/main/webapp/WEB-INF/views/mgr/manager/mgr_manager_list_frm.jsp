<%@page import="com.store.meonggae.mgr.manager.domain.MgrManagerDomain"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 관리자 관리 - 리스트"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-06-01
*/%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터 관리자</title>
<link rel="icon" href="${pageContext.request.contextPath}/mgr_common/images/favicon.png"/>
<!--bootstrap 시작-->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
<!--bootstrap 끝-->

<!-- dashlite css 시작-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<!--dashlite css 끝-->

<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/board.css" type="text/css" media="all" /> -->
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/main.css" type="text/css" media="all" /> -->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">
	
	.clickable {cursor:pointer;}
	
</style>

<script type="text/javascript">
	var nick = "${sessionScope.mgr.nick}";
	var managerId = "${sessionScope.mgr.manager_id}";
	var link = "${pageContext.request.contextPath}";
	$(function() {
		
		setCheckboxChecked();
		
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
		
		// 전체 조회
		$("#btnAllSearch").click(function () {
			location.href = "${pageContext.request.contextPath}/mgr/manager/mgr_manager_list_frm.do";
		}); // click
		
		// 등록
		$("#btnAdd").click(function () {
			location.href = "${pageContext.request.contextPath}/mgr/manager/mgr_manager_add_frm.do";
		}); // click
		
		// 필터 누르면 div 토글
		$("#dropdownFilter").click(function () {
			$("#filterDiv").toggle();
		}); // click
		
		// 필터 영역 이외 누르면 div 숨기기
		$('html').click(function(e) {   
			if($(e.target).parents('.filterArea').length < 1 && !$(e.target).hasClass('filterArea')){   
				$("#filterDiv").hide();
			} // end if
		});
		
		// 필터 - 전체 부서 체크박스 클릭시
		$("#chkDeptAll").click(function() {
			if($("#chkDeptAll").is(":checked")) {
				$(".dept").prop("checked", "checked");
			} else {
				$(".dept").removeAttr("checked");
			} // end else
		}); // click
		
		// 필터 - 전체 부서 이외 체크박스 클릭시
		$(".deptOne").click(function() {
			let flagAllChk = true;
			let arrChk = $(".deptOne");
			for(let i = 0; i < $(arrChk).length; i++) {
				if(!$(arrChk[i]).is(":checked")) {
					flagAllChk = false;
				} // end if
			} //end for
			if(flagAllChk){
				$("#chkDeptAll").prop("checked", "checked");
			} else {
				$("#chkDeptAll").removeAttr("checked");
			} // end else
		}); // click
		
		// 필터 적용 버튼
		$("#btnFilter").click(function(){
			if($("#keyword").val().trim() == '' || $("#keyword").val() == null) {
				$("#keyword").prop("disabled", "disabled");
				$("#field").prop("disabled", "disabled");
			} // end if
			$("#frmBoard").submit();
		}); // click
		
		// 필터 초기화
		$("#resetFilter").click(function () {
			let url = new URL(location.href);
			url.searchParams.delete('deptno');
			location.href = "${pageContext.request.contextPath}/mgr/manager/mgr_manager_list_frm.do" + url.search;
		}); // click
	}); // $(document).ready(function() { })
	
	function chkNull() {
		if($("#keyword").val().trim() != "") {
			if($("#chkDeptAll").is(":checked")) {
				$(".dept").prop("disabled", "disabled");
			} // end if
			$("#frmBoard").submit();
		} // end if
	} // chkNull
	
	// parameter로 받은 부서 filter의 체크박스 선택 상태 유지
	function setCheckboxChecked(){
		let arrDeptName = ['AA부', 'BB부', 'CC부', 'DD부', 'EE부'];
		let arrChkDept = $(".deptOne");
		
		let url = new URL(location.href);
		let urlParams = url.searchParams;
		let arrDept = urlParams.getAll('deptno');

		let flagChk = false;
		let output = '';
		if(arrDept.length == 5 || arrDept.length == 0) {
			$("#chkDeptAll").prop("checked", "checked");
			$(arrChkDept).prop("checked", "checked");
		} else {
			for(let i = 0; i < arrChkDept.length; i++) {
				$(arrChkDept[Number(arrDept[i]) - 1]).prop("checked", "checked");
			} // end for
		} // end else
	} // setCheckboxChecked
</script>

<!-- 관리자를 새로 등록하여 관리자 리스트 조회 페이지로 온 경우 -->
<c:if test="${requestScope.flagAddResult ne null}">
	<script type="text/javascript">
		$(function (){
			if(${requestScope.flagAddResult }) {
				alert('관리자 등록에 성공하였습니다. 잠시 후 등록한 메일을 확인해주세요');
			} else {
				alert('관리자 등록에 실패하였습니다');
			} // else
		}) // $(document).ready(function() { })
	</script>
</c:if>

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
			<h3 class="nk-block-title page-title">관리자 관리</h3>
			<div class="nk-block-des text-soft"><p>관리자 리스트 조회</p></div>
		</div>
	</div>
</div>
<div class="nk-block">
	<div class="card card-bordered card-stretch">
		<form name="frmBoard" id="frmBoard" action="mgr_manager_list_frm.do">
			<div class="card-inner-group">
				<div class="card-inner position-relative card-tools-toggle">
					<div class="card-title-group">
						<div class="card-tools" data-select2-id="67">
							<div class="form-group">
								<div class="form-control-wrap">
									<div class="input-group">
										<input type="button" id="btnAllSearch" class="btn btn-dim btn-sm btn-secondary" value="전체 조회"/>
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
													<input type="button" id="btnAdd" class="btn btn-sm btn-primary" value="관리자 등록"/>
												</li>
												<li class="toggle-close">
													<a href="#" class="btn btn-icon btn-trigger toggle" data-target="cardTools">
														<em class="icon ni ni-arrow-left"></em>
													</a>
												</li>
												<li>
													<div class="dropdown2">
														<div id="dropdownFilter" class="btn btn-trigger btn-icon dropdown-toggle filterArea" data-bs-toggle="dropdown">
															<div class="dot dot-primary"></div>
															<em class="icon ni ni-filter-alt"></em>
														</div>
														<div id="filterDiv" class="filter-wg dropdown-menu dropdown-menu-end filterArea" style="min-width:200px;max-width:200px;position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate3d(0px, 37.6px, 0px);">
															<div class="dropdown-head">
																<span class="sub-title dropdown-title">필터</span>
															</div>
															<div class="dropdown-body dropdown-body-rg">
																<div class="row gx-6 gy-3">
																	<div class="col-12">
																		<div class="form-group">
																			<label class="overline-title overline-title-alt">부서 선택</label>
																			
																			<div id="divChkDept" style="vertical-align: middle;">
																				<input type="checkbox" class="dept" id="chkDeptAll"/><label>모든 부서</label><br/>
																				<input type="checkbox" name="deptno" class="dept deptOne" value="1"/><label>AA부</label><br/>
																				<input type="checkbox" name="deptno" class="dept deptOne" value="2"/><label>BB부</label><br/>
																				<input type="checkbox" name="deptno" class="dept deptOne" value="3"/><label>CC부</label><br/>
																				<input type="checkbox" name="deptno" class="dept deptOne" value="4"/><label>DD부</label><br/>
																				<input type="checkbox" name="deptno" class="dept deptOne" value="5"/><label>EE부</label><br/>
																			</div>
																		</div>
																	</div>
																	<div class="col-12">
																		<div class="form-group">
																			<button type="button" id="btnFilter" class="btn btn-secondary">필터 적용</button>
																		</div>
																	</div>
																</div>
															</div>
															<div class="dropdown-foot between">
																<a id="resetFilter" class="clickable">초기화</a>
															</div>
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
				<div class="" style="margin-top:10px;">검색된 총 관리자 수: <c:out value="${requestScope.totalCount }"/>명</div>
				</div>
				<div class="card-inner p-0" style="margin:0px auto; text-align: center;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">아이디</th>
								<th scope="col">이름</th>
								<th scope="col">닉네임</th>
								<th scope="col">부서</th>
								<th scope="col">입사일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${requestScope.list eq null or requestScope.currentPage > requestScope.totalPage}">
									<tr>
										<td colspan="6">조회된 결과가 없습니다</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="mgrDomain" items="${requestScope.list}" varStatus="i">
										<tr>
											<th scope="row"><c:out value="${requestScope.totalCount - ((requestScope.currentPage - 1) * requestScope.pageScale) - i.index }"/></th>
											<c:choose>
												<c:when test="${pageContext.request.queryString eq null or pageContext.request.queryString eq ''}">
													<td><a href="${pageContext.request.contextPath}/mgr/manager/mgr_manager_detail_frm.do?managerId=${mgrDomain.managerId}"><c:out value="${mgrDomain.managerId}"/></a></td>
												</c:when>
												<c:otherwise>
													<td><a href="${pageContext.request.contextPath}/mgr/manager/mgr_manager_detail_frm.do?${pageContext.request.queryString }&managerId=${mgrDomain.managerId}"><c:out value="${mgrDomain.managerId}"/></a></td>
												</c:otherwise>
											</c:choose>
											<td><c:out value="${mgrDomain.name}"/></td>
											<td><c:out value="${mgrDomain.nick}"/></td>
											<td><c:out value="${mgrDomain.dname}"/></td>
											<td><c:out value="${mgrDomain.inputDate}"/></td>
										</tr>
									</c:forEach>							
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<div class="card-inner">
					<div class="nk-block-between-md g-3">
						<div class="g" style="margin:0px auto;">
							${requestScope.pageNation }
						</div>
					</div>
					<div style="margin:0px auto; width:350px; height:70px; text-align:center; padding-top:20px;">
						<div class="form-group">
							<div class="form-control-wrap">
								<div class="input-group">
									<div class="input-group-prepend" style="width:120px;">
							 			<select id="field" class="form-select js-select2" name="field" id="field">
											<option value="0"${param.field eq 0 ? " selected='selected'" : ""}>아이디</option>
											<option value="1"${param.field eq 1 ? " selected='selected'" : ""}>닉네임</option>
										</select>
									</div>
									<input type="text" class="form-control" aria-label="Text input with dropdown button" id="keyword" name="keyword" value="${param.keyword }"/>
									<input type="button" id="btnSearch" class="btn btn-dim btn-sm btn-secondary" value="검색"/>
								</div>
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
<!-- 본문 끝 -->
<!-- 푸터 시작 -->
<c:import url="/WEB-INF/views/mgr/common/jsp/footer.jsp"/>
<!-- 푸터 끝 -->
</div>
</div>
</div>
<!-- dashlite 시작-->
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script> --%>
<!-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script> --%>
<div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div>
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-manager").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>