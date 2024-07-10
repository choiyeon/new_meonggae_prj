<%@page import="java.io.IOException"%>
<%@page import="com.google.zxing.WriterException"%>
<%@page import="com.store.meonggae.mgr.common.service.OTPUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="Insert info here"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%/*
작성자: 김동섭
작성일: 2024-07-05
*/%>
<%

OTPUtil otp = new OTPUtil();

String account = "super";
String issuer = "meonggae";
int height = 200;
int width = 200;
String filePath = "C:/dev/";

System.out.println("최초 개인키 생성 시 사용하는 메소드");
String secretKey = otp.getSecretKey();
System.out.println("getSecretKey(): " + secretKey);

System.out.println("OTP검증 요청 때마다 개인키로 OTP 생성하는 메소드");
String totpCode = otp.getTOTPCode(secretKey);
System.out.println("getSecretKey(secretKey): " + totpCode);

System.out.println("개인키, 계정명(유저ID), 발급자(회사명)을 받아서 구글OTP 인증용 링크를 생성하는 메소드");
String googleOTPAuthURL = otp.getGoogleOTPAuthURL(secretKey, account, issuer);
System.out.println("getGoogleOTPAuthURL(secretKey, account, issuer): " + googleOTPAuthURL);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.214/spring_mvc/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->

<!--<link rel="stylesheet" href="http://192.168.10.214/spring_mvc/common/css/board.css" type="text/css" media="all" />-->
<!--<link rel="stylesheet" href="http://192.168.10.214/spring_mvc/common/css/main.css" type="text/css" media="all" />-->

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
<%
System.out.println("url, 파일생성할경로, 높이px, 폭px을 받아서 QR코드 이미지를 생성하는 메소드");
otp.getQRImage(googleOTPAuthURL, filePath, height, width);
%>
</div>

</body>
</html>