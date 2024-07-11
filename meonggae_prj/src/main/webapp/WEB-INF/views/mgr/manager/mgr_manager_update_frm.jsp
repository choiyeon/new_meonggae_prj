<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 관리자 관리 - 관리자 수정"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-06-02
*/%>

<c:set var="date" value="<%=new java.util.Date()%>" />
<c:set var="strDate"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터 관리자</title>
<link rel="icon" href="${pageContext.request.contextPath}/mgr_common/images/favicon.png"/>
<!--bootstrap 시작-->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
<!--bootstrap 끝-->

<!-- dashlite css 시작-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<!--dashlite css 끝-->

<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/board.css" type="text/css" media="all" /> -->
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/main.css" type="text/css" media="all" /> -->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<!--다음 우편번호 API 시작-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function zipcodeApi() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addr1").value = roadAddr;
                document.getElementById("addr2").focus();	// 커서를 상세 주소 input으로 이동
            }
        }).open();
    }
</script>
<!--다음 우편번호 API 끝-->

<!-- datepicker 시작-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$( function() {
		// 기본 사용
		//$( "#datepicker" ).datepicker();
		
		// 옵션 부여
		$( ".datepicker" ).datepicker({
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ], 
			dateFormat: "yy-mm-dd",
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			maxDate: "${strDate}",
			showMonthAfterYear: true
		});
	} );
</script>
<!-- datepicker 끝-->

<!-- datepicker css 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/mgr_common/assets/css/datepicker_pulse10.css">
<!-- datepicker css 끝 -->

<style type="text/css">
	
 	span.invalid{display: none;}
 	.errMsg{color:#ff0000;}
 	
	/* datepicker 아이콘 가져오기 */
   .ui-widget-header .ui-icon { background-image: url('${pageContext.request.contextPath}/mgr_common/images/btns.png'); } 
	
</style>

<script type="text/javascript">
	var nick = "${sessionScope.mgr.nick}";
	var managerId = "${sessionScope.mgr.manager_id}";
	var link = "${pageContext.request.contextPath}";

	$(function() {
		
		$(".errMsg").hide();
			
		// 아이디 중복확인 버튼
		$("#idChk").click(function() {
			window.open('${pageContext.request.contextPath}/mgr/manager/mgr_manager_id_dup.do', 'idDup', 
					'width=550, height=340, top=' + (window.screenY + 100) + ', left=' + (window.screenX + 100));
		}); // click
			
		// 닉네임 중복확인 버튼
		$("#nickChk").click(function() {
			window.open('${pageContext.request.contextPath}/mgr/manager/mgr_manager_nick_dup.do', 'nickDup', 
					'width=550, height=340, top=' + (window.screenY + 100) + ', left=' + (window.screenX + 100));
		}); // click
		
		// 뒤로가기 버튼
		$("#btnBack").click(function() {
			history.back();
		}); // click
		
		// 등록 버튼
		$("#btnSubmit").click(function(){
			let arrInvalid = $("input.invalid");
			let arrLabel = $("span.invalid");
			for(let i = 0; i < arrInvalid.length; i++) {
				if($(arrInvalid[i]).val() == null || $(arrInvalid[i]).val().trim() == '') {
					alert($(arrLabel[i]).text());
					return;
				} // end if
			} // end for
			if(!$(".gender").is(":checked")){
				alert('성별은 필수 선택입니다');
				return;
			} // end if
			
			// 이메일 합쳐서 하나로
			$("#email").val($("#email1").val() + '@' + $("#email2").val())
			
			$("#frm").submit();
		}); // click
		
		// 비밀번호
		$("#pass").keyup(function() {
// 			console.log('change');
			if(strongPassword($("#pass").val())) {
// 				console.log('hide');
				$(".passNotGood").hide();
			} else {
// 				console.log('show');
				$(".passNotGood").show();
			} // end else 
		}); // change
		
		// 비밀번호 확인 - 값이 변경될 때마다 비교
		$("#pass-check").keyup(function() {
			if(isPasswordMatch($("#pass").val(), $("#pass-check").val())) {
				$(".passNotEqual").hide();
			} else {
				$(".passNotEqual").show();
			} // end else 
		}); // change
		
		// 주소 체크
		$("#addChk").click(function() {
			zipcodeApi();
		}); // click
		
		// 전화번호 하이픈
		$("#tel").keyup(function(){
			$(this).val($(this).val().replace(/[^0-9]/gi, "").replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`));
		}); // keyup
		
	}); // $(document).ready(function() { })
	
	// 비밀번호 n자 이상, 영문, 숫자, 특문.
	function strongPassword (str) {
		console.log('flag: ' + /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#])[A-Za-z\d@$!%*#]{minLength,}$/.test(str));
		return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#])[A-Za-z\d@$!%*#]{8,}$/.test(str);
	} // strongPassword
	
	// 비밀번호 확인
	function isPasswordMatch (pass1, pass2) {
		return pass1 === pass2;
	} // isPasswordMatch
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
			<div class="nk-block-des text-soft"><p>관리자 수정</p></div>
		</div>
	</div>
</div>

<div class="nk-block nk-block-lg" data-select2-id="10">
	<div class="col-xxl-6" style="margin:0px auto;">
		<div class="card card-bordered" data-select2-id="9">
			<div class="card-inner" data-select2-id="8">
				<form action="mgr_manager_add_process.do" id="frm" class="form-validate" method="post" novalidate="novalidate" data-select2-id="7">
					<div class="row g-gs" data-select2-id="6">
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">아이디</label>
									<div class="form-control-wrap">
										<div class="input-group">
											<input type="text" class="form-control invalid" id="managerId" name="managerId" readonly='readonly' value="${requestScope.mgrManagerDomain.managerId }">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">이름</label>
									<div class="form-control-wrap">
<!-- 										<input type="text" class="form-control invalid" id="name" name="name" value="정관리"> -->
										<input type="text" class="form-control invalid" id="name" name="name" value="${requestScope.mgrManagerDomain.name }">
										<span class="invalid">이름은 필수 입력입니다.</span>
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
<!-- 											<input type="text" class="form-control invalid" id="nick" name="nick" readonly value="관리자6"> -->
											<input type="text" class="form-control invalid" id="nick" name="nick" readonly value="${requestScope.mgrManagerDomain.nick }">
											<span class="invalid">닉네임은 필수 입력입니다.</span>
											<button type="button" class="btn btn-light" id="nickChk">중복확인</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">이메일</label>
									<div class="row gy-4">
										<div class="col-sm-6">
											<div class="form-control-wrap">
												<div class="input-group">
<!-- 													<input type="text" class="form-control invalid" id="email1" value="sd8273k"> -->
<%-- 													<input type="text" class="form-control invalid" id="email1" value='${requestScope.mgrManagerDomain.email}'> --%>
													<input type="text" class="form-control invalid" id="email1" value='${fn:substring(requestScope.mgrManagerDomain.email, 0, fn:indexOf(requestScope.mgrManagerDomain.email, "@"))}'>
													<span class="invalid">이메일은 필수 입력입니다.</span>
												</div>
											</div>
										</div>
										<div class="col-sm-6" style="text-align:center;">
											<div class="input-group">
												<div class="input-group-prepend"><span class="input-group-text" id="basic-addon1">@</span></div>
<!-- 												<input type="text" class="form-control invalid" list="selecEmail" id="email2" value="gmail.com"> -->
												<input type="text" class="form-control invalid" list="selecEmail" id="email2" value='${fn:substring(requestScope.mgrManagerDomain.email, fn:indexOf(requestScope.mgrManagerDomain.email, "@") + 1, fn:length(requestScope.mgrManagerDomain.email))}'>
												<datalist id="selecEmail">
													<option value='직접 입력'>직접 입력</option>
													<option value='naver.com'>naver.com</option>
													<option value='daum.net'>daum.net</option>
													<option value='gmail.com'>gmail.com</option>
													<option value='hotmail.com'>hotmail.com</option>
													<option value='nate.com'>nate.com</option>
													<option value='korea.com'>korea.com</option>
													<option value='mungae.com'>mungae.com</option>
												</datalist>
												<span class="invalid">이메일은 필수 입력입니다.</span>
											</div>
										</div>
										<input type="hidden" id="email" name="email"/>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-topics">부서</label>
									<div class="form-control-wrap ">
										<select class="form-select js-select2" name="deptno">
											<option value="1"${requestScope.mgrManagerDomain.deptno eq '1' ? " selected='selected'" : ""}>AA부</option>
											<option value="2"${requestScope.mgrManagerDomain.deptno eq '2' ? " selected='selected'" : ""}>BB부</option>
											<option value="3"${requestScope.mgrManagerDomain.deptno eq '3' ? " selected='selected'" : ""}>CC부</option>
											<option value="4"${requestScope.mgrManagerDomain.deptno eq '4' ? " selected='selected'" : ""}>DD부</option>
											<option value="5"${requestScope.mgrManagerDomain.deptno eq '5' ? " selected='selected'" : ""}>EE부</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-topics">매니저 선택</label>
									<div class="form-control-wrap ">
										<select class="form-select js-select2" name="parentManagerId">
											<option value="">--- 선택 ---</option>
											<option value=""${requestScope.mgrManagerDomain.parentManagerId eq null or requestScope.mgrManagerDomain.parentManagerId eq '' ? " selected='selected'" : "" }>--- 매니저 없음 ---</option>
											<c:forEach var="mgr" items="${requestScope.listManager }" varStatus="i">
												<option value="${mgr.managerId }"${requestScope.mgrManagerDomain.parentManagerId eq mgr.managerId ? " selected='selected'" : "" }><c:out value="${mgr.name } (${mgr.managerId })"/></option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">관리 권한</label>
									<div class="form-control-wrap">
										<select class="form-select js-select2" name="permission">
											<option value="10"${requestScope.mgrManagerDomain.permission eq "10" ? " selected='selected'" : "" }>사용자 관리 전체</option>
											<option value="01"${requestScope.mgrManagerDomain.permission eq "01" ? " selected='selected'" : "" }>문의, 후기 관리</option>
											<option value="00"${requestScope.mgrManagerDomain.permission eq "00" ? " selected='selected'" : "" }>대시보드 조회</option>
										</select>
<!-- 										<span id="fv-topics-error" class="invalid">이 항목은 필수 입력입니다.</span> -->
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
	<!-- 									<span class="invalid">이 항목은 필수 입력입니다.</span> -->
	<!-- 								</div> -->
									
									<div class="form-control-wrap">
									  <div class="form-icon form-icon-left">
									    <em class="icon ni ni-calendar"></em>
									  </div>
									  <input type="text" id="birth" class="form-control datepicker visitors" readonly data-date-format="yyyy-mm-dd" maxlength="10" name="birth" value="${requestScope.mgrManagerDomain.birth }"/>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-phone">성별</label>
									<div class="form-control-wrap">
										<div style="vertical-align:middle;">
											<input type="radio" class="gender" name="gender" value="M" style="width:15px; height:15px;"${requestScope.mgrManagerDomain.gender eq 'M' ? " checked='checked'" : "" }/><label style="vertical-align:top; margin-left:5px;">남자</label>
											<input type="radio" class="gender" name="gender" value="F" style="width:15px; height:15px; margin-left:15px;"${requestScope.mgrManagerDomain.gender eq 'F' ? " checked='checked' " : "" }/><label style="vertical-align:top; margin-left:5px;">여자</label>
										</div>
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
<!-- 											<input type="text" class="form-control invalid" maxlength="13" id="tel" name="tel" value="010-1212-9898"/> -->
											<input type="text" class="form-control invalid" maxlength="13" id="tel" name="tel" value="${requestScope.mgrManagerDomain.tel}"/>
											<span class="invalid">전화번호는 필수 입력입니다.</span>
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
										<div class="input-group">
											<input type="text" class="form-control invalid" id="addr1" name="addr1" readonly value="${requestScope.mgrManagerDomain.addr1}">
<!-- 											<input type="text" class="form-control invalid" id="addr1" name="addr1" readonly value="서울시 강남구 역삼동"> -->
											<span class="invalid">주소는 필수 입력입니다.</span>
											<input type="button" class="btn btn-light" id="addChk" value="우편번호검색"></input>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-6" style="margin:0px auto;">
								<div class="form-group">
									<label class="form-label" for="fv-full-name">상세주소</label>
									<div class="form-control-wrap">
<!-- 										<input type="text" class="form-control invalid" id="addr2" name="addr2" value="한독빌등 8층 7"> -->
										<input type="text" class="form-control invalid" id="addr2" name="addr2" value="${requestScope.mgrManagerDomain.addr2}">
										<span class="invalid">상세주소는 필수 입력입니다.</span>
									</div>
								</div>
							</div>
						</div>
						<div style="padding-top:20px;"></div>
						<div class="col-md-6" style="margin:0px auto;">
							<div class="row gy-4">
								<div class="col-md-4">
									<div class="form-group text-center">
										<input type="button" class="btn btn-lg btn-primary" id="btnSubmit" value="등록"></input>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group text-center">
										<input type="reset" class="btn btn-lg btn-light" value="취소"></input>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group text-center">
										<input type="button" class="btn btn-lg btn-outline-secondary" id="btnBack" value="뒤로가기"></input>
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
<!-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script> -->
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/bundle_beauty_my.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script> --%>
<!-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script> --%>
<!-- <div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div> -->
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-manager").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>