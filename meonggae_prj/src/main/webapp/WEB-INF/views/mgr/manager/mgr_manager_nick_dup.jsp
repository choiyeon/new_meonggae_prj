<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 관리자 관리 - 관리자 등록 - 닉네임 중복 확인"%>
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
	var nick = "${sessionScope.mgr.nick}";
	var managerId = "${sessionScope.mgr.manager_id}";
	var link = "http://localhost${pageContext.request.contextPath}";
	$(function() {
		
		// 중복확인 버튼 클릭
		$("#btn").click(function() {
			
			let minLength = 3;
			let maxLength = 12;
			
			let id = $('#id').val();
			
			if(idLength(id, minLength, maxLength)) {
				if(callAjaxCanUseId(id)) {
					if(confirm('이 닉네임은 사용 가능한 닉네임입니다. 사용하시겠습니까?')) {
						$(opener.document).find('#nick').val($("#id").val());
						self.close();
					} // end if
				} else {
					alert('이미 사용중인 닉네임입니다');
				} // end else
			} else {
				alert('닉네임은 3자 이상 12자 이하');
			} // end else
		}); // click
	}); // $(document).ready(function() { })
	
	// ajax - 관리자 아이디 중복 확인
	function callAjaxCanUseId(nick) {
		var flagCanUse = false;
		var param = {
				nick: nick
		}
		$.ajax({
			url: "http://localhost${pageContext.request.contextPath}/mgr/manager/mgr_manager_nick_dup_chk.do",
			type: "GET",
			data: param,
			async: false, 
			dataType: "JSON",
			error: function(xhr) {
				console.log(xhr.status + " / " + xhr.statusText);
				alert("문제가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다");
			}, 
			success: function(jsonObj) {
				if(jsonObj.result) {
					flagCanUse = jsonObj.data.flagCanUse;
				} // end if 	
			} // success
		}); // ajax
		
		return flagCanUse;
	} // callAjaxIsId
	
	// 닉네임 글자수 제한
	function idLength(value, minLength, maxLength) {
		return value.length >= minLength && value.length <= maxLength
	} // idLength
</script>

</head>
<body class="nk-body bg-lighter npc-general has-sidebar no-touch nk-nio-theme">
<div class="nk-app-root">
<div class="nk-main ">

<!-- 본문 시작 -->
<div class="nk-content ">
<div class="container-fluid">
<div class="nk-content-inner">
<div class="nk-content-body">

<div class="nk-block-head nk-block-head-sm">
	<div class="nk-block-between">
		<div class="nk-block-head-content">
			<h3 class="nk-block-title page-title">관리자 닉네임 중복 확인</h3>
			<div class="nk-block-des text-soft"><p>닉네임은 3자 이상 12자 이하</p></div>
		</div>
	</div>
</div>

<div class="nk-block nk-block-lg" data-select2-id="10">
	<div class="col-xxl-6" style="margin:0px auto;">
		<div class="card card-bordered" data-select2-id="9">
			<div class="card-inner" data-select2-id="8">
				<div id="inputWrap">
					<div style="width:300px; margin:0px auto; text-align:center;">
						<form name="subFrm" style="margin:0px auto; text-align:cetner;">
							<input type="text" id="id" name="id" class="inputTxt inputIdtype"/>
							<input type="button" value="중복확인" id="btn" class="btn btn-secondary"/>
						</form>
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
</div>
</div>
<!-- dashlite 시작-->
<!-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script> -->
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/bundle_beauty_my.js?ver=3.2.3"></script> --%>
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script> --%>
<!-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script> --%>
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script> --%>
<div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div>
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-manager").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>