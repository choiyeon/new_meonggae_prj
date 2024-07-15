<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 로그인 폼"%>
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
<link rel="icon" href="${pageContext.request.contextPath}/mgr_common/images/favicon.png"/>
<!--bootstrap 시작-->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
<!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>-->
<!--bootstrap 끝-->

<!-- dashlite 시작-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<!--dashlite 끝-->

<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/board.css" type="text/css" media="all" />-->
<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/main.css" type="text/css" media="all" />-->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">
	
	
	
</style>
<c:if test="${requestScope.flagSecondAuthOk ne null and requestScope.flagSecondAuthOk eq false }">
<script type="text/javascript">
alert('인증번호가 유효하지 않습니다');
</script>
</c:if>
<script type="text/javascript">

	$(function() {
		$("#authKey").focus();
		$("#btn").click(function() {
			chkNull();
		}); // click
		$("#authKey").keydown(function (evt) {
			if(evt.which == 13) {
				chkNull();
			} // end if
		}); // keydown
	}); // $(document).ready(function() { })
	
	function chkNull() {
		let flag = true;
		const regex = /^\d{6}$/;
		let authKey = $("#authKey").val();
		
		if((authKey == null) || authKey == ""){
			alert("인증번호를 입력해주세요");
			flag = false;
			return;
		} // end if
		if(!regex.test(authKey)) {
			alert("인증번호는 6자리 숫자입니다");
			flag = false;
			return;
		} // end if
		
		if(flag) {
			$("#secondAuthKey").submit();
		}
	} // chkNull

</script>

</head>
<body class="nk-body bg-white npc-general pg-auth no-touch nk-nio-theme">
	<div class="nk-app-root">
		<div class="nk-main ">
			<div class="nk-wrap nk-wrap-nosidebar">
				<div class="nk-content ">
					<div class="absolute-top-right d-lg-none p-3 p-sm-5">
						<a href="#" class="toggle btn-white btn btn-icon btn-light" data-target="athPromo">
							<em class="icon ni ni-info"></em>
						</a>
					</div>
					<div class="nk-block nk-block-middle nk-auth-body">
						<div class="brand-logo pb-5">
							<div class="logo-link text-center">
								<img class="logo-light logo-img logo-img-lg" src="${pageContext.request.contextPath}/mgr_common/images/logo.png" srcset="${pageContext.request.contextPath}/mgr_common/images/logo.png 2x" alt="logo">
								<img class="logo-dark logo-img logo-img-lg" src="${pageContext.request.contextPath}/mgr_common/images/logo.png" srcset="${pageContext.request.contextPath}/mgr_common/images/logo.png 2x" alt="logo-dark">
							</div>
						</div>
						<div class="nk-block-head">
							<div class="nk-block-head-content">
								<h5 class="nk-block-title">관리자 이차인증</h5>
								<div class="nk-block-des">
									<p>구글 OTP의 인증번호를 입력해주세요</p>
								</div>
							</div>
						</div>
						<form id="secondAuthKey" name="secondAuthKey" method="post" action="mgr_second_auth_process.do" class="form-validate is-alter" autocomplete="off" novalidate="novalidate">
							<input type="text" style="display:none;"/>
							<div class="form-group">
								<div class="form-label-group">
									<label class="form-label" for="email-address">인증번호</label>
								</div>
								<div class="form-control-wrap">
<!-- 									<input autocomplete="off" type="text" class="form-control form-control-lg" id="authKey" name="authKey" placeholder="인증번호를 입력해주세요" value="123456"> -->
									<input autocomplete="off" type="text" class="form-control form-control-lg" id="authKey" name="authKey" placeholder="인증번호를 입력해주세요" value="">
								</div>
							</div>
							<div>
							</div>
							<div class="form-group">
								<input type="button" class="btn btn-lg btn-primary btn-block" id="btn" value="확인"/>
							</div>
						</form>
					</div>
					<div class="nk-block nk-auth-footer">
						<div class="nk-block-between">
						</div>
						<div class="mt-3">
							<p>© 2024 meonggae. All Rights Reserved.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- dashlite 시작-->
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/bundle_beauty_my.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script> --%>
<!-- dashlite 끝-->
</body>
</html>