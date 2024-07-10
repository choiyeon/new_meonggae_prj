<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 관리자 관리 - 관리자 상세 조회"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
 	span.invalid{display: none;}
	
</style>

<script type="text/javascript">
	var nick = "${sessionScope.mgr.nick}";
	var managerId = "${sessionScope.mgr.manager_id}";
	var link = "${pageContext.request.contextPath}";
	$(function() {
		
		// 닫기 -> 리스트로
		$("#btnClose").click(function() {
			let url = new URL(location.href);
			url.searchParams.delete('managerId');
			location.href = "${pageContext.request.contextPath}/mgr/manager/mgr_manager_list_frm.do" + url.search;
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
	<div class="nk-block-between">
		<div class="nk-block-head-content">
			<h3 class="nk-block-title page-title">관리자 관리</h3>
			<div class="nk-block-des text-soft"><p>관리자 상세 조회</p></div>
		</div>
	</div>
</div>

<div class="nk-block nk-block-lg" data-select2-id="10">
	<div class="col-xxl-6" style="margin:0px auto;">
		<div class="card card-bordered">
			<div class="card-inner card-inner-lg">
				<div class="nk-block-head nk-block-head-lg">
					<div class="nk-block-between">
						<div class="nk-block-head-content">
							<h4 class="nk-block-title">관리자 정보</h4>
						</div>
						<div class="nk-block-head-content align-self-start d-lg-none">
							<a href="#" class="toggle btn btn-icon btn-trigger mt-n1" data-target="userAside">
								<em class="icon ni ni-menu-alt-r"></em>
							</a>
						</div>
					</div>
				</div>
				<div class="nk-block">
					<div class="nk-data data-list">
						<div class="data-head">
							<h6 class="overline-title">개인 정보</h6>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label">이름</span>
								<span class="data-value"><c:out value="${requestScope.mgrManagerDomain.name }"/></span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label">생년월일</span>
								<span class="data-value"><c:out value="${requestScope.mgrManagerDomain.birth }"/></span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label">전화번호</span>
								<span class="data-value"><c:out value="${requestScope.mgrManagerDomain.tel }"/></span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label">성별</span>
								<span class="data-value">
								<c:choose>
									<c:when test="${requestScope.mgrManagerDomain.gender eq 'F' }">
									여
									</c:when>
									<c:otherwise>
									남
									</c:otherwise>
								</c:choose>
								</span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label">주소</span>
								<span class="data-value"><c:out value="${requestScope.mgrManagerDomain.addr1} ${' '} ${requestScope.mgrManagerDomain.addr2 }"/></span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
					</div>
					<div class="nk-data data-list">
						<div class="data-head">
							<h6 class="overline-title">사원 정보</h6>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label">아이디</span>
								<span class="data-value"><c:out value="${requestScope.mgrManagerDomain.managerId }"/></span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label">닉네임</span>
								<span class="data-value"><c:out value="${requestScope.mgrManagerDomain.nick }"/></span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label">권한</span>
								<span class="data-value">
								<c:choose>
									<c:when test="${requestScope.mgrManagerDomain.permission eq '11' }">
										모든 권한
									</c:when>
									<c:when test="${requestScope.mgrManagerDomain.permission eq '10' }">
										사용자 관리 권한
									</c:when>
									<c:when test="${requestScope.mgrManagerDomain.permission eq '01' }">
										문의, 후기 권한
									</c:when>
									<c:otherwise>
										대시보드 조회 권한
									</c:otherwise>
								</c:choose>
								</span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label">입사일</span>
								<span class="data-value"><c:out value="${requestScope.mgrManagerDomain.inputDate }"/></span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label">매니저명</span>
								<span class="data-value">
								<c:choose>
									<c:when test="${requestScope.mgrManagerDomain.parentManagerName eq null or requestScope.mgrManagerDomain.parentManagerName eq ''}">
										-
									</c:when>
									<c:otherwise>
										<c:out value="${requestScope.mgrManagerDomain.parentManagerName }"/>
									</c:otherwise>
								</c:choose>
								</span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6" style="margin:0px auto; padding-top:10px;">
					<div class="col-md-6" style="margin:0px auto;">
						<div class="form-group text-center">
							<button type="button" class="btn btn-lg btn-light" id="btnClose">닫기</button>
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
<!-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script> -->
<script src="${pageContext.request.contextPath}/mgr_common/assets/js/bundle_beauty_my.js?ver=3.2.3"></script>
<script src="${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script>
<!-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<script src="${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script>
<script src="${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script>
<div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div>
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-manager").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>