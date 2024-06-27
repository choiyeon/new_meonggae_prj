<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="개인정보 수정"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			location.href="http://localhost/meonggae_prj/index.do";
		</script>
	</c:when>
	<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<!-- header -->
<c:import url="http://localhost/meonggae_prj/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/CSS/style.css">
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/My/css/style_mypage.css">
<!-- CSS -->

<!--다음 우편번호 API 시작-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--다음 우편번호 API 끝-->

<script type="text/javascript">
	$(function(){
		$("#applyBtn").click(function(){
			var ext = $("#upfile").val();
			
			if(ext ==""){
				alert("파일을 선택 해 주세요!!!!!!!!");
				return;
			}//end if
			
			var fileExtension = ext.substring(ext.lastIndexOf(".")+1).toUpperCase();
			
			if(!(fileExtension == "JPG" || fileExtension == "PNG" || fileExtension == "JPEG")){
				alert("업로드 불가능한 파일입니다.");
				return;
			}//end if
			
			
			if(confirm("수정된 정보를 적용하시겠습니까?")){
				$("#fileFrm").submit();
				//alert("적용되었습니다.");
			}//end if
		});
		
		$("#applyBtn1").click(function(){
			
				$("#fileFrm").submit();
		});
		
		// 취소버튼
		$("#quitBtn").click(function(){
			location.href="http://localhost/meonggae_prj/My/mypage/personal/quitMembership_frm.do";
		});
		
		// 비밀번호 변경
		$("#pwModifyBtn").click(function(){
			pwModify();
		});
		
		//우편번호 검색
	    $("#zipcode").click(function(){
	    	zipcodeApi();
	    });
		//우편번호 추가 검색
	    $("#addChk").click(function(){
	    	zipcodeApi();
	    });
		
		
		
	});//ready
	
	function pwModify(){
		var option = "width=400, height=260, scrollbars=no";
		
		window.open("http://localhost/meonggae_prj/My/mypage/personal/passwordModify.do",
				"비밀번호 변경",
				"width=401, height=261");
				//"width=400, height=260, top="+(window.screenY+100)+", left="+(window.screenX+100)+", scrollbars=no");
	}//pwModify
	
	//다음 우편번호 API 설정
	function zipcodeApi() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("addr0").value = roadAddr;
				document.getElementById("addr1").focus();	// 커서를 상세 주소 input으로 이동
			}
		}).open();
	};//zipcodeApi
</script>

<!-- 내용 시작 -->
<div class="container">
	<div id="mypageMenu" class="mypageMenu">
		<!-- 메뉴목록 -->
		<%
		String pageName = "personal";
		pageContext.setAttribute("pageName", pageName);
		%>
		<%@ include file="../menuBar/mypageMenu.jsp" %>
		<hr id="menuBottonLine">
		<!-- 메뉴목록 -->
	</div>
	
	<form id="fileFrm" action="upload_profile_process.do" method="post" enctype="multipart/form-data" >
	<table class="pTable" id="pTable">
		<tr>
			<td id="tableTitle1" class="tableTitle1">프로필 사진</td>
			<td>
			<img src="http://localhost/meonggae_prj/profile-img/${ user.img }" class="img-circle" style="width: 100px; height: 100px"/><br/><br/>
			<input type="file" name="upfile" id ="upfile">
			<div id="imgGuide">.png, .jpg, .jpge 확장자 파일만 등록 가능합니다.</div>
			</td>
		</tr>
		<tr>
			<td id="tableTitle2" class="tableTitle2">이름</td>
			<td>
			<label>${ pDomain.name }</label>
			</td>
		</tr>
		<tr>
			<td id="tableTitle2" class="tableTitle2">아이디</td>
			<td>
			<label>${ user.id }</label>
			</td>
		</tr>
		<tr>
			<td id="tableTitle2" class="tableTitle2">닉네임</td>
			<td>
			<input type="text" id="nickname" class="nickname" name="nickname" value="${ user.nick }" maxlength="12"/>
			<input type="button" value="닉네임 중복확인" id="nickChkBtn" class="btn btn-success"/>
			</td>
		</tr>
		<tr>
			<td id="tableTitle2" class="tableTitle2">비밀번호</td>
			<td>
			<input type="button" value="비밀번호 변경" id="pwModifyBtn" class="btn btn-info"/>
			</td>
		</tr>
		<tr>
			<td id="tableTitle3" class="tableTitle3">전화번호</td>
			<td>
			<input type="text" value="${ pDomain.tel }" id="phoneNumber" name="phoneNumber" class="phoneNumber" maxlength="11" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/><br/>
			<div id="imgGuide">전화번호는 -를 제외하고 입력해주세요.</div>
			</td>
		</tr>
		<tr>
			<td id="tableTitle3" class="tableTitle3">우편번호</td>
			<td>
				<input data-value="우편번호를 입력해주세요." type="text" class="zipcode essential" id="zipcode" name="zipcode" value="" readonly="readonly" maxlength="100" />
				<div class="space"></div>
				<input type="button" value="우편번호검색" class="btn btn-outline-dark" id="addChk"/>
			</td>
		</tr>
		<tr>
			<td id="tableTitle3" class="tableTitle3">주소</td>
			<td class="addr_td">
				<input data-value="주소를 입력해주세요." type="text" id="addr0" class="addr essential" name="addr0" value="${ pDomain.addr }" readonly="readonly" maxlength="100" size="50"/><br />
				<input data-value="상세주소를 입력해주세요." type="text" id="addr1" class="addr essential" name="addr1" value="${ pDomain.addrDetail }" style="margin-top:7px;" size="50"/>
			</td>
		</tr>
	</table>
	<br>
	<div id="btnWrap">
	<input type="button" value="적용" id="applyBtn" class="btn btn-danger btn-lg"/>
	<input type="button" value="취소" id="cancleBtn" class="btn btn-secondary btn-lg"/>
	</div>
	</form>
	
	<input type="button" value="회원 탈퇴" id="quitBtn" class="btn btn-light btn-sm"/>
	
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:otherwise>
</c:choose>