<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="개인정보 수정"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			location.href="${pageContext.request.contextPath}/index.do";
		</script>
	</c:when>
	<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<!-- header -->
<c:import url="/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/My/css/style_mypage.css">
<!-- CSS -->

<!--다음 우편번호 API 시작-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--다음 우편번호 API 끝-->

<script type="text/javascript">
	$(function(){
		//확인버튼
		$("#applyBtn").click(function(){
			var ext = $("#upfile").val();
			
			if(ext == ""){ //파일이 없으면 파일이 없는채로 insert
				chkNull();
			}
			if(ext != ""){ //파일이 있을 때
				var fileExtension = ext.substring(ext.lastIndexOf(".")+1).toUpperCase();
				if(!(fileExtension == "JPG" || fileExtension == "PNG" || fileExtension == "JPEG")){
					alert("업로드 불가능한 파일입니다.");
					return;
				}//end if
				chkNull();
			}
		});
		
		// 닉네임 변경
		$("#nickChkBtn").click(function(){
			chkNick();
		});
		
		// 비밀번호 변경
		$("#pwModifyBtn").click(function(){
			pwModify();
		});
		
		/* 프로필 프리뷰 */
		$("#upfile").change(fileSelect);
		
		/* 프로필 선택 버튼 */
		$("#upfileBtn").click(function(){
			$("#upfile").click();
		});
		
		// 회원탈퇴
		$("#quitBtn").click(function(){
			location.href = "quitMember.do";
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
	
	function chkNull(){
		
		var nickname = $("#nickname").val();
		var phoneNumber = $("#phoneNumber").val();
		var zipcode = $("#zipcode").val();
		var addr0 = $("#addr0").val();
		var addr1 = $("#addr1").val();
		
		if(nickname == ""){
			alert("닉네임을 입력해주세요.");
			return;
		}
		if(phoneNumber == ""){
			alert("전화번호를 입력해주세요.");
			return;
		}
		if(zipcode == ""){
			alert("우편번호를 입력해주세요.");
			return;
		}
		if(addr0 == ""){
			alert("주소를 입력해주세요.");
			return;
		}
		if(addr1 == ""){
			alert("상세주소를 입력해주세요.");
			return;
		}
		
		var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email_id =$("#email_id").val();
		var email_domain =$("#email_domain").val();
		var mail = "";
		
		if(!email_id){
			alert("이메일을 입력해주세요");
			$("#email_id").focus();
			return false;
		}
		if(!email_domain){
			alert("도메인을 입력해주세요");
			$("#email_domain").focus();
			return false;
		}
		
		mail = email_id+"@"+email_domain;
		$("#mail").val(mail);

		if(!email_rule.test(mail)){
			alert("이메일을 형식에 맞게 입력해주세요.");
			return false;
		}
		
		submit();
	}//chkNull
	
	function setEmailDomain(domain){
		$("#email_domain").val(domain);
	}
	
	function submit(){
		if(confirm("수정된 정보를 적용하시겠습니까?")){
			
			var form = $('#personalFrm')[0];
			var formData = new FormData(form);
			
			$.ajax({
				url: "${pageContext.request.contextPath}/My/mypage/personal/update_personal_info_process.do",
				type: "POST",
				data: formData,
				dataType: "JSON",
				contentType : false,
				processData : false,
				error: function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				},
				success: function(data){
					if(data.result == "success"){
						alert("변경되었습니다.");
						location.href = location.href;
					}
					if(data.result == "noSession"){
						alert("로그인이 필요한 서비스입니다.");
						location.href="${pageContext.request.contextPath}/index.do";
					}
					if(data.result == "tooBig"){
						alert("업로드한 파일의 크기가 큽니다. 다른 이미지를 올려주세요.")
					}
				}//success
			});//ajax    

		}//end if
	}//chkNull
	
	function chkNick(){
		window.open("${pageContext.request.contextPath}/My/mypage/personal/chkNick.do",
				"닉네임 중복확인",
				"width=501, height=281");
	}//pwModify
	
	function pwModify(){
		window.open("${pageContext.request.contextPath}/My/mypage/personal/passwordModify.do",
				"비밀번호 변경",
				"width=501, height=276");
	}//pwModify
	
	const autoHyphen = (target) => {
	    target.value = target.value
	     .replace(/[^0-9]/g, '')
	     .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}//자동하이픈
	
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
	
	function fileSelect(e){
		
		var files = e.target.files;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#profileImg").attr("src", e.target.result);
		}
		reader.readAsDataURL(files[0]);
		
	}//사진 미리보기
	
	
	
	
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
	
	<form id="personalFrm" method="post" enctype="multipart/form-data" >
	<table class="pTable" id="pTable">
		<tr>
			<td id="tableTitle1" class="tableTitle1">프로필 사진</td>
			<td>
			<img src="${pageContext.request.contextPath}/profile-img/${ user.img }" class="img-circle" style="width: 100px; height: 100px" id="profileImg" name="profileImg" onError="this.src='${pageContext.request.contextPath}/common/My/image/loading.png';"/>
			<input type="file" name="upfile" id="upfile" accept=".jpg, .jpge, .png"/>
			<input type="button" name="upfileBtn" id="upfileBtn" value="프로필 사진 변경" class="btn btn-warning"/>
			<div id="imgGuide">.png, .jpg, .jpge 확장자 파일만 등록 가능합니다.</div>
			</td>
		</tr>
		<tr>
			<td id="tableTitle2" class="tableTitle2">이름</td>
			<td>
			<label><c:out value="${ pDomain.name }"/></label>
			</td>
		</tr>
		<tr>
			<td id="tableTitle2" class="tableTitle2">아이디</td>
			<td>
			<label><c:out value="${ user.id }"/></label>
			</td>
		</tr>
		<tr>
			<td id="tableTitle2" class="tableTitle2">닉네임</td>
			<td>
			<input type="text" id="nickname" class="nickname" name="nickname" value="${ user.nick }" readonly/>
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
			<input type="tel" value="${ pDomain.tel }" id="phoneNumber" name="phoneNumber" class="phoneNumber" maxlength="13" onfocus="this.placeholder=''" oninput="autoHyphen(this)" pattern="010-[0-9]{3,4}-[0-9]{4}" autocomplete="off"/><br/>
			</td>
		</tr>
		<tr>
			<td id="tableTitle3" class="tableTitle3">이메일</td>
			<td>
			<input type="text" id="email_id" name="email_id" value="${ emailId }" title="이메일 아이디" placeholder="email" maxlength="18" /> @ 
			<input type="text" id="email_domain" name="email_domain" value="${ emailDomain }" title="이메일 도메인" maxlength="18"/>
			<select class="select" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;">
			    <option value="">직접입력</option>
			    <option value="naver.com">naver.com</option>
			    <option value="gmail.com">gmail.com</option>
			    <option value="hanmail.net">hanmail.net</option>
			    <option value="hotmail.com">hotmail.com</option>
			    <option value="korea.com">korea.com</option>
			    <option value="nate.com">nate.com</option>
			    <option value="yahoo.com">yahoo.com</option>
			</select><br>
			<div id="imgGuide">이메일은 비밀번호 찾기에 사용됩니다. 정확히 입력해주세요!</div>
			</td>
		</tr>
		<tr>
			<td id="tableTitle3" class="tableTitle3">우편번호</td>
			<td>
				<input data-value="우편번호를 입력해주세요." type="text" class="zipcode essential" id="zipcode" name="zipcode" value="${ pDomain.zipcode }" readonly="readonly" maxlength="100" />
				<div class="space"></div>
				<input type="button" value="우편번호검색" class="btn btn-outline-dark" id="addChk"/>
			</td>
		</tr>
		<tr>
			<td id="tableTitle3" class="tableTitle3">주소</td>
			<td class="addr_td">
				<input data-value="주소를 입력해주세요." type="text" id="addr0" class="addr essential" name="addr0" value="${ pDomain.addr }" readonly="readonly" maxlength="100" size="50"/><br />
				<input data-value="상세주소를 입력해주세요." type="text" id="addr1" class="addr essential" name="addr1" value="${ pDomain.addrDetail }" style="margin-top:7px;" size="50" maxlength="100" />
			</td>
		</tr>
	</table>
	<br>
	<div id="btnWrap">
	<input type="button" value="적용" id="applyBtn" class="btn btn-danger btn-lg"/>
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