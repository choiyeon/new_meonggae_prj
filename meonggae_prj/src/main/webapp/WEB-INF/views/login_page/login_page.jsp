<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="로그인"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 구글 로그인 -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="504509258936-lr1798fsa95ac3nhhvmjh8erjvni6l6m.apps.googleusercontent.com.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			let id = $("#uid").val();
			let pass = $("#upw").val();
			if ((id.trim() == "") || (pass.trim() == "")) {
				alert("아이디와 비밀번호를 입력해주세요.");
				$("#uid").val("");
				$("#upw").val("");
				$("#uid").focus();
			} else {
				$("#loginFrm").submit();
			}//end else 
		});
	});
</script>
<title>로그인</title>
<!-- Bootstrap CSS -->

<!-- 나의 스타일 추가 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/common/CSS/login.css">

</head>
<body class="text-center">

	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
		<!--  login 폼 영역을 : loginBox -->
		<div id="loginBox">

			<!-- 로그인 페이지 타이틀 -->
			<div id="loginBoxTitle">멍게장터</div>
			<!-- 아이디, 비번, 버튼 박스 -->
			<form
				action="${pageContext.request.contextPath}/index.do/authenticate.do"
				method="post" id="loginFrm">
				<div id="inputBox">
					<div class="input-form-box">
						<span>아이디 </span> <input type="text" id="uid" name="uid" 
							class="form-control" required>
					</div>
					<div class="input-form-box">
						<span>비밀번호 </span> <input type="password" id="upw" name="upw" 
							class="form-control" required>
					</div>
					<div class="button-login-box">
						<!-- 카카오 로그인 버튼 시작 -->
						<a
							href="https://kauth.kakao.com/oauth/authorize?
							client_id=0738d40e4912047a5dbb57d8ca06a869&
							redirect_uri=${pageContext.request.contextPath}/login_page/kakao_test.do&
							response_type=code&
							prompt=login">
							<img
							src="${pageContext.request.contextPath}/common/images/kakao_login_medium_wide.png"
							width="222" alt="카카오 로그인 버튼">
						</a>
						<!-- 카카오 로그인 버튼 끝 -->
						<!-- 구글 로그인 버튼 시작 -->
					<!-- 	<div class="g-signin2"
							style="width: 280px; border-radius: 20px; height: 40px; padding-top: 10px; padding-bottom: 10px;"
							data-onsuccess="onSignIn" data-theme="dark"></div>
						<br> -->
						<!-- 구글 로그인 버튼 끝-->
						<a href="${pageContext.request.contextPath}/join_page/mem_join.do">소셜
							인증 없이 회원가입 하기</a><br>
						<a href="${pageContext.request.contextPath}/My/acount/acount.do">아이디/비밀번호 찾기</a>
						<div style="padding-top: 10px;">
							<input type="button" class="btn btn-success" id="login"
								value="로그인">
						</div>
					</div>
				</div>
			</form>
			<c:if test="${not empty error}">
				<p style="color: red;">${error}</p>
			</c:if>
		</div>
	</div>

	<!-- Bootstrap Bundle with Popper -->

</body>
</html>
