<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 검사</title>
<link rel="icon" href="http://localhost/meonggae_prj/common/tamcatIcon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->

<!-- sist스타일시트 -->
<link rel="stylesheet" href="https://www.sist.co.kr/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="https://www.sist.co.kr/css/board.css" type="text/css" media="all" />
<!-- sist스타일시트 -->
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/CSS/id_dup.css">
<script src ="../common/JS/id_dup.js"></script>

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

</head>
<body onload="document.board.id.focus();">

<div id="wrap">
	<div id="member" class="idCheck_wrap">
		<div id="mpop">
			<form name="board" method="get" action="id_dup.do">
					<h2>ID CHECK<br> <span>아이디 중복확인</span></h2>
<!-- 					<p>사용하고자 하는 아이디를 입력해주세요. <br />아이디 중복확인 후 사용 가능한 아이디로 선택해주세요.</p> -->
					<div class="bgBox">
						<dl class="conBox">
							<dd>
								<input type="text" id="id" name="id" maxlength="50" class="inw195" title="사용하실 아이디를 입력주세요." value="${param.id}" maxlength="20" readonly="readonly"/>
								<input type="text" style="display: none"/>
							</dd>
<!-- 							<dd> -->
<!-- 								<input type="button" onclick="idChk();" class="popcheckBtn btn btn-success" value="ID 중복확인" /> -->
<!-- 							</dd> -->
						</dl>
					</div>
			</form>
					<div id="dupResult">
						<c:if test="${ not empty param.id }">
							입력하신 아이디 [<strong><c:out value="${ param.id }"/></strong>]는
						<c:choose>
							<c:when test="${ result eq true }">
								사용<strong style="color:#E53E30"> 불가능</strong>합니다.
							</c:when>
							<c:otherwise>
								사용 <strong style="color:#0055FF">가능</strong> 합니다.<br>
<!-- 								<a id="btns" href="#" onclick="goSave();"><strong>사용하기</strong></a> -->
								<div style="margin: 10px 0 0 0">
								 <a href="#" id="btns" onclick="goSave();" class="button btnPush btnBlueGreen">사용하기</a>
								</div>
							</c:otherwise>
						</c:choose>
						</c:if>
					</div>
				<input type="hidden" id="loginChecked" value="true" />
		</div>
		<!-- //mpop -->
	</div>
	<!-- //member -->
</div>
</body>
</html>
