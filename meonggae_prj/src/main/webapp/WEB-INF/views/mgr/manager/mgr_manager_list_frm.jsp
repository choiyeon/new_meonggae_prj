<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 관리자 관리 - 리스트"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	
	
</style>

<script type="text/javascript">
	$(function() {
		
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
			<div class="nk-block-des text-soft"><p>관리자 리스트 조회</p></div>
		</div>
	</div>
</div>
<div class="nk-block">
	<div class="card card-bordered card-stretch">
		<div class="card-inner-group">
			<div class="card-inner position-relative card-tools-toggle">
				<div class="card-title-group">
					<div class="card-tools" data-select2-id="67">
						<div class="form-group">
							<div class="form-control-wrap">
								<div class="input-group">
									<input type="button" class="btn btn-dim btn-sm btn-secondary" value="관리자 등록"/>
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
											<li>
												<div class="dropdown">
													<a href="#" class="btn btn-trigger btn-icon dropdown-toggle" data-bs-toggle="dropdown">
														<div class="dot dot-primary"></div>
														<em class="icon ni ni-filter-alt"></em>
													</a>
													<div class="filter-wg dropdown-menu dropdown-menu-end" style="min-width:200px;max-width:200px;">
														<div class="dropdown-head">
															<span class="sub-title dropdown-title">필터</span>
														</div>
														<div class="dropdown-body dropdown-body-rg">
															<div class="row gx-6 gy-3">
																<div class="col-12">
																	<div class="form-group">
																		<label class="overline-title overline-title-alt">부서 선택</label>
																		<select class="form-select js-select2 select2-hidden-accessible" data-select2-id="4" tabindex="-1" aria-hidden="true">
																			<option value="any" data-select2-id="6">모든 부서</option>
																			<option value="investor">aa 부</option>
																			<option value="seller">bb 부</option>
																			<option value="buyer">cc 부</option>
																		</select>
																	</div>
																</div>
																<div class="col-12">
																	<div class="form-group">
																		<button type="button" class="btn btn-secondary">Filter</button>
																	</div>
																</div>
															</div>
														</div>
														<div class="dropdown-foot between">
															<a class="clickable" href="#">초기화</a>
														</div>
													</div>
												</div>
											</li>
											<li>
												<div class="dropdown">
													<a href="#" class="btn btn-trigger btn-icon dropdown-toggle" data-bs-toggle="dropdown">
														<em class="icon ni ni-setting"></em>
													</a>
													<div class="dropdown-menu dropdown-menu-xs dropdown-menu-end">
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
			<div class="card-inner p-0" style="margin:0px auto; text-align: center;">
				<div class="nk-tb-list nk-tb-ulist">
					<div class="nk-tb-item nk-tb-head">
						<div class="nk-tb-col" style="width:8%;">
							<span class="sub-text">번호</span>
						</div>
						<div class="nk-tb-col">
							<span class="sub-text">이름</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="sub-text">부서</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span class="sub-text">아이디</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span class="sub-text">닉네임</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span class="sub-text">입사일</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">1</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-lead">김관리</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">aa부</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>managerkim</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>김관리자</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.01.05</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">2</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">이관리</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">aa부</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>managerlee</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>이관리자</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.01.06</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">3</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">박관리</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">aa부</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>managerpark</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>박관리자</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.01.07</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">4</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">최관리</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">bb부</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>managerchoi</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>최관리자</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.01.08</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">5</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">정관리</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">bb부</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>managerjung</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>정관리자</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.01.10</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">6</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">강관리</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">bb부</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>managerkang</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>강관리자</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.02.05</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">7</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">조관리</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">cc부</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>managercho</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>조관리자</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.02.05</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">8</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">윤관리</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">cc부</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>manageryoon</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>윤관리자</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.03.05</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">9</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">장관리</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">cc부</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>managerjang</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>장관리자</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.03.08</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">10</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">임관리</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">cc부</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>managerlim</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>임관리자</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.04.05</span>
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
										<option value="name">이름</option>
										<option value="id">아이디</option>
										<option value="nick">닉네임</option>
										<option value="dname">부서명</option>
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
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script>
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script>
<!-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script>
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script>
<div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div>
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-manager").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>