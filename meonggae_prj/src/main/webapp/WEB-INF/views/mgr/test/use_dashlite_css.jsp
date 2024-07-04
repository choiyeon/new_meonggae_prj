<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="dashlite 사용 (bootstrap css 주석)"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-05-30
*/%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dashlite 사용 (bootstrap css 주석)</title>
<link rel="icon" href="http://211.63.89.136${pageContext.request.contextPath}/mgr/images/favicon.png"/>
<!--bootstrap 시작-->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->

<!-- dashlite 시작-->
<link rel="stylesheet" href="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<!--dashlite 시작-->

<link rel="stylesheet" href="http://211.63.89.136${pageContext.request.contextPath}/common/css/board.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://211.63.89.136${pageContext.request.contextPath}/common/css/main.css" type="text/css" media="all" />

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
<body>

<div>
<div class="custom-control custom-switch">    <input type="checkbox" class="custom-control-input" id="customSwitch1">    <label class="custom-control-label" for="customSwitch1">Switch</label></div><div class="custom-control custom-control-lg custom-switch">    <input type="checkbox" class="custom-control-input" id="customSwitch2">    <label class="custom-control-label" for="customSwitch2">Switch</label></div>
</div>

</body>
</html>