<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 후기 관리 - 후기 상세 조회"%>
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
	
 	span.invalid{display: none;}
 	.max-width-220{max-width:220px;}
	
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
			<div class="nk-block-des text-soft"><p>후기 상세 조회</p></div>
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
							<h4 class="nk-block-title">후기 정보</h4>
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
							<h6 class="overline-title">후기 정보</h6>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label max-width-220">작성자</span>
								<span class="data-value">김닉네임</span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label max-width-220">작성일</span>
								<span class="data-value">2024.07.07 12:00:00</span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label max-width-220">내용</span>
								<div class="col-md-12">
									<div class="form-group">
										<div class="form-control-wrap">
											<textarea class="form-control" id="fv-message" name="fv-message" readonly="readonly">후기 내용이 여기 적혀있음</textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
					</div>
					<div class="nk-data data-list">
						<div class="data-head">
							<h6 class="overline-title">상품 정보</h6>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label max-width-220">판매자</span>
								<span class="data-value">이닉네임</span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label max-width-220">상품명</span>
								<img src="http://192.168.10.214${pageContext.request.contextPath}/mgr/images/goods_000001.jpg" style="max-width:15%; height:auto;"/>
								<span class="data-value">한 번 밖에 안 쓴 아메리카노</span>
							</div>
							<div class="data-col data-col-end" style="width:1px;">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label max-width-220">상품 등록일</span>
								<span class="data-value">2024.07.05 12:00:00</span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
						<div class="data-item">
							<div class="data-col">
								<span class="data-label max-width-220">상품 거래일</span>
								<span class="data-value">2024.07.06 12:00:00</span>
							</div>
							<div class="data-col data-col-end">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6" style="margin:0px auto; padding-top:10px;">
					<div class="form-group text-center">
						<button type="button" class="btn btn-light">닫기</button>
						<button type="button" class="btn btn-danger" style="margin-left:15%;">삭제</button>
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
		$("#sidebar-review").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>