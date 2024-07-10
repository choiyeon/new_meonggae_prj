<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="Insert info here"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%/*
작성자: 김동섭
작성일: 2024-07-10
*/%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="icon" href="${pageContext.request.contextPath}/common/tamcatIcon.ico"/>
		<title>Error 403</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css">
		<script>
		</script>
	</head>
	<body class="nk-body bg-white npc-general pg-error">
		<div class="nk-app-root">
			<div class="nk-main ">
				<div class="nk-wrap nk-wrap-nosidebar">
					<div class="nk-content ">
						<div class="nk-block nk-block-middle wide-xs mx-auto">
							<div class="nk-block-content nk-error-ld text-center" style="width:600px;">
								<h1 class="nk-error-head">403</h1>
								<h3 class="nk-error-title">접근이 거부되었습니다.</h3>
								<p class="nk-error-text">요청하신 페이지의 접근이 거부되었습니다. <br/>입력하신 페이지의 주소가 정확한지 다시 한 번 확인해주시기 바랍니다.</p>
								<a href="${pageContext.request.contextPath}/index.do" class="btn btn-lg btn-primary mt-2">메인으로</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>