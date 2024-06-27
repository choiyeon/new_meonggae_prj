<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 후기 관리 - 리스트"%>
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
			<h3 class="nk-block-title page-title">후기 관리</h3>
			<div class="nk-block-des text-soft"><p>후기 리스트 조회</p></div>
		</div>
	</div>
</div>
<div class="nk-block">
	<div class="card card-bordered card-stretch">
		<div class="card-inner-group">
			<div class="card-inner position-relative card-tools-toggle">
				<div class="card-title-group">
					<div class="card-tools" data-select2-id="67">
						<div class="form-inline flex-nowrap gx-3" data-select2-id="14">
							<div class="form-wrap w-200px">
								<div class="input-group-prepend" style="width:180px;">
									<select class="form-select js-select2 select2-hidden-accessible" data-search="on" data-select2-id="6" tabindex="-1" aria-hidden="true">
										<!-- data-select2-id="8" 같이 아이디를 주면 처음 두어번만 검색되고 이후엔 무한 searching 되면서 모든 옵션이 선택 안 되는 버그 있음 -->
										<option value="0">모든 카테고리</option>
										<option value="1">여성의류</option>
										<option value="2">남성의류</option>
										<option value="3">신발</option>
										<option value="4">가방/지갑</option>
										<option value="5">시계</option>
										<option value="6">쥬얼리</option>
										<option value="7">패션 악세서리</option>
										<option value="8">디지털</option>
										<option value="9">가전제품</option>
										<option value="10">스포츠/레저</option>
										<option value="11">차량/오토바이</option>
									</select>
								</div>	
							</div>
							<div class="btn-wrap">
								<span class="d-none d-md-block">
									<button class="btn btn-light">적용하기</button>
								</span>
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
						<div class="nk-tb-col tb-col-sm">
							<span class="sub-text">상품명</span>
						</div>
						<div class="nk-tb-col tb-col-sm">
							<span class="sub-text">카테고리</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="sub-text">후기 작성자</span>
						</div>
						<div class="nk-tb-col tb-col-xl">
							<span class="sub-text">내용</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
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
							<span class="tb-amount">상품명1</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">디지털</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-lead">김닉네임</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>후기 내용중 앞부분...</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>★★★★★</span>
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
							<span class="tb-lead">상품명2</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">디지털</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">이닉네임</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>후기 내용중 앞부분...</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>★★★★★</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.07.08 20:19:19</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">3</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">상품명3</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">디지털</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">박닉네임</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>후기 내용중 앞부분...</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>★★★★★</span>
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
							<span class="tb-lead">상품명4</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">디지털</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">최닉네임</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>후기 내용중 앞부분...</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>★★★★★</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.07.08 20:19:16</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">5</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">상품명5</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">디지털</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">정닉네임</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>후기 내용중 앞부분...</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>★★★★★</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.07.08 20:19:15</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">6</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">상품명6</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">디지털</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">강닉네임</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>후기 내용중 앞부분...</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>★★★★★</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.07.08 20:19:14</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">7</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">상품명7</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">디지털</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">조닉네임</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>후기 내용중 앞부분...</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>★★★★★</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.07.08 20:19:13</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">8</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">상품명8</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">디지털</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">윤닉네임</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>후기 내용중 앞부분...</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>★★★★★</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.07.08 20:19:12</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">9</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">상품명9</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">디지털</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">장닉네임</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>후기 내용중 앞부분...</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>★★★★★</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.07.08 20:19:11</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">10</span>
						</div>
						<div class="nk-tb-col">
							<span class="tb-lead">상품명10</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">디지털</span>
						</div>
						<div class="nk-tb-col tb-col-mb">
							<span class="tb-amount">임닉네임</span>
						</div>
						<div class="nk-tb-col tb-col-md">
							<span>후기 내용중 앞부분...</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>★★★★★</span>
						</div>
						<div class="nk-tb-col tb-col-lg">
							<span>2024.07.08 20:19:10</span>
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
						 			<select class="form-select js-select2">
										<option value="name">후기 작성자 닉네임</option>
										<option value="id">후기 내용</option>
										<option value="nick">판매자 닉네임</option>
										<option value="dname">판매 상품명</option>
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
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/bundle_beauty_my.js?ver=3.2.3"></script>
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script>
<!-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script>
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script>
<div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div>
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-review").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>