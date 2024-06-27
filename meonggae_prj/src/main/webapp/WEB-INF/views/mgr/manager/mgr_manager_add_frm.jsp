<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 관리자 관리 - 관리자 등록"%>
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
			<div class="nk-block-des text-soft"><p>관리자 등록</p></div>
		</div>
	</div>
</div>

<div class="nk-block nk-block-lg" data-select2-id="10">
	<div class="col-xxl-6" style="margin:0px auto;">
		<div class="card card-bordered" data-select2-id="9">
			<div class="card-inner" data-select2-id="8">
				<form action="#" class="form-validate" novalidate="novalidate" data-select2-id="7">
					<div class="row g-gs" data-select2-id="6">
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">아이디</label>
									<div class="form-control-wrap">
										<div class="input-group">
											<input type="text" class="form-control invalid" id="fv-full-name" name="fv-full-name" required="" aria-describedby="fv-full-name-error" aria-invalid="true">
											<button type="button" class="btn btn-light">중복확인</button>
											<span id="fv-full-name-error" class="invalid">이 항목은 필수 입력입니다.</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">비밀번호</label>
									<div class="form-control-wrap">
										<a tabindex="-1" href="#" class="form-icon form-icon-right passcode-switch" data-target="password">
											<em class="passcode-icon icon-show icon ni ni-eye"></em>
											<em class="passcode-icon icon-hide icon ni ni-eye-off"></em>
										</a>
										<input autocomplete="new-password" type="password" class="form-control invalid" id="password" name="password" required="" aria-describedby="fv-full-name-error" aria-invalid="true">
	<!-- 									<input type="password" class="form-control invalid" id="fv-full-name" name="fv-full-name" required="" aria-describedby="fv-full-name-error" aria-invalid="true"> -->
										<span id="fv-full-name-error" class="invalid">이 항목은 필수 입력입니다.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">비밀번호 확인</label>
									<div class="form-control-wrap">
	<!-- 									<a tabindex="-1" href="#" class="form-icon form-icon-right passcode-switch" data-target="password-check"> -->
	<!-- 										<em class="passcode-icon icon-show icon ni ni-eye"></em> -->
	<!-- 										<em class="passcode-icon icon-hide icon ni ni-eye-off"></em> -->
	<!-- 									</a> -->
										<input autocomplete="new-password" type="password" class="form-control invalid" id="password-check" name="password-check" required="" aria-describedby="fv-full-name-error" aria-invalid="true">
	<!-- 									<input type="password" class="form-control invalid" id="fv-full-name" name="fv-full-name" required="" aria-describedby="fv-full-name-error" aria-invalid="true"> -->
										<span id="fv-full-name-error" class="invalid">이 항목은 필수 입력입니다.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">이름</label>
									<div class="form-control-wrap">
										<input type="text" class="form-control invalid" id="fv-full-name" name="fv-full-name" required="" aria-describedby="fv-full-name-error" aria-invalid="true">
										<span id="fv-full-name-error" class="invalid">이 항목은 필수 입력입니다.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">닉네임</label>
									<div class="form-control-wrap">
										<div class="input-group">
											<input type="text" class="form-control invalid" id="fv-full-name" name="fv-full-name" required="" aria-describedby="fv-full-name-error" aria-invalid="true">
											<span id="fv-full-name-error" class="invalid">이 항목은 필수 입력입니다.</span>
											<button type="button" class="btn btn-light">중복확인</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-topics">부서</label>
									<div class="form-control-wrap ">
	<!-- 									<select class="form-select js-select2 select2-hidden-accessible invalid" id="fv-topics" name="fv-topics" data-placeholder="Select a option" required="" data-select2-id="fv-topics" tabindex="-1" aria-hidden="true" aria-describedby="fv-topics-error"> -->
	<!-- 										<option label="empty" value="" data-select2-id="2"></option> -->
	<!-- 										<option value="fv-gq" data-select2-id="16">aa 부</option> -->
	<!-- 										<option value="fv-tq" data-select2-id="17">bb 부</option> -->
	<!-- 										<option value="fv-ab" data-select2-id="18">cc 부</option> -->
	<!-- 									</select> -->
										<select class="form-select js-select2 select2-hidden-accessible" data-select2-id="4" tabindex="-1" aria-hidden="true" data-placeholder="부서 선택">
											<option value="" style="display:none;"></option>
											<option value="investor">aa 부</option>
											<option value="seller">bb 부</option>
											<option value="buyer">cc 부</option>
										</select>
										<span id="fv-topics-error" class="invalid">이 항목은 필수 입력입니다.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">관리 권한</label>
									<div class="form-control-wrap">
										<select class="form-select js-select2 select2-hidden-accessible" data-select2-id="5" tabindex="-1" aria-hidden="true" data-placeholder="권한 선택">
											<option value="" style="display:none;"></option>
											<option value="1">사용자 관리 전체</option>
											<option value="2">문의, 후기 관리</option>
										</select>
										<span id="fv-topics-error" class="invalid">이 항목은 필수 입력입니다.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">생년월일</label>
	<!-- 								<div class="form-control-wrap"> -->
	<!-- 									<input type="text" class="form-control invalid" id="fv-full-name" name="fv-full-name" required="" aria-describedby="fv-full-name-error" aria-invalid="true"> -->
	<!-- 									<span id="fv-full-name-error" class="invalid">이 항목은 필수 입력입니다.</span> -->
	<!-- 								</div> -->
									
									<div class="form-control-wrap">
									  <div class="form-icon form-icon-left">
									    <em class="icon ni ni-calendar"></em>
									  </div>
									  <input type="text" class="form-control date-picker invalid"  id="fv-full-name" name="fv-full-name" required="" aria-describedby="fv-full-name-error" aria-invalid="true" data-date-format="yyyy-mm-dd" maxlength="10">
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-phone">성별</label>
									<div class="form-control-wrap">
										<ul class="custom-control-group">
											<li>
												<div class="custom-control custom-radio custom-control-pro no-control">
													<input type="radio" class="custom-control-input invalid" name="fv-sex" id="sex-male" required="" aria-describedby="fv-sex-error">
													<label class="custom-control-label" for="sex-male">남자</label>
													<span id="fv-sex-error" class="invalid">이 항목은 필수 입력입니다.</span>
												</div>
											</li>
											<li>
												<div class="custom-control custom-radio custom-control-pro no-control">
													<input type="radio" class="custom-control-input invalid" name="fv-sex" id="sex-female" required="">
													<label class="custom-control-label" for="sex-female">여자</label>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-phone">전화번호</label>
									<div class="form-control-wrap">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text" id="fv-phone">+82</span>
											</div>
											<input type="text" class="form-control valid" required="" aria-invalid="true" maxlength="14">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">주소</label>
									<div class="form-control-wrap">
										<input type="text" class="form-control invalid" id="fv-full-name" name="fv-full-name" required="" aria-describedby="fv-full-name-error" aria-invalid="true">
										<span id="fv-full-name-error" class="invalid">이 항목은 필수 입력입니다.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">상세주소</label>
									<div class="form-control-wrap">
										<input type="text" class="form-control invalid" id="fv-full-name" name="fv-full-name" required="" aria-describedby="fv-full-name-error" aria-invalid="true">
										<span id="fv-full-name-error" class="invalid">이 항목은 필수 입력입니다.</span>
									</div>
								</div>
							</div>
						</div>
						<div style="padding-top:20px;"></div>
						<div class="col-md-6" style="margin:0px auto;">
							<div class="row gy-4">
								<div class="col-md-6">
									<div class="form-group text-center">
										<button type="submit" class="btn btn-lg btn-primary">등록</button>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group text-center">
										<button type="button" class="btn btn-lg btn-light">취소</button>
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
		$("#sidebar-manager").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>