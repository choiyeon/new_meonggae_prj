<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원 탈퇴"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/common/CSS/style.css">
<link rel="stylesheet" href="../../common/My/css/style_acount.css">
<!-- CSS -->

<script type="text/javascript">
	var randomText = "";
	
	$(function(){
		
		$("#findID").click(function(){
			$("#pw").hide();
			$("#id").show();
		});
		
		$("#findPW").click(function(){
			$("#id").hide();
			$("#pw").show();
		});
		
		$("#idFindBtn").click(function(){
			if(chkData()){
				chkInputData();
			}
		});
		
		$("#pwFindBtn").click(function(){
			if(chkPwData()){
				chkInputDataPW();
			}
		});
		
		$("#chkNumBtn").click(function(){
			var inputText = $("#code").val();
			
			if(inputText != randomText){
				alert("인증문자가 일치하지 않습니다");
				return;
			}else if(inputText == randomText){
				$("#findIdFrm").submit();
			}
		});
		
		$("#chkNumBtn_pw").click(function(){
			var inputText = $("#code_pw").val();
			
			if(inputText != randomText){
				alert("인증문자가 일치하지 않습니다");
				return;
			}else if(inputText == randomText){
				$("#findPwFrm").submit();
			}
		});
		
		
	});//ready
	
	function chkInputData(){
		var name = $("#nameID").val();
		var email_id = $("#email_id").val();
		var email_domain = $("#email_domain").val();
		var email = email_id + "@" + email_domain;
		
		$.ajax({
			url: "${pageContext.request.contextPath}/My/acount/dataChk.do",
			type: "POST",
			data: {
				name : name,
				email : email
				},
			dataType: "JSON",
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success: function(data){
				if(data.result == "true"){
					alert("이메일로 인증번호가 전송되었습니다.");
					$("#codeDiv").show();
					$("#chkNumBtn").show();
					randomText = data.randomText;
					$("#finalName").val(name);
					$("#finalEmail").val(email);
				}
				if(data.result == "false"){
					alert("입력하신 정보에 해당하는 계정 정보가 존재하지 않습니다.\n정보를 확인해주세요.");
				}
				
			}//success
		});//ajax
		
	}//chkInputData
	
	function chkInputDataPW(){
		var name = $("#namePW").val();
		var id = $("#idPW").val();
		
		var email_id = $("#email_id_pw").val();
		var email_domain = $("#email_domain_pw").val();
		var email = email_id + "@" + email_domain;
		
		$.ajax({
			url: "${pageContext.request.contextPath}/My/acount/dataPwChk.do",
			type: "POST",
			data: {
				name : name,
				id : id,
				email : email
				},
			dataType: "JSON",
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success: function(data){
				if(data.result == "true"){
					alert("이메일로 인증번호가 전송되었습니다.");
					$("#codePwDiv").show();
					$("#chkNumBtn_pw").show();
					randomText = data.randomText;
					$("#finalId_pw").val(id);
				}
				if(data.result == "false"){
					alert("입력하신 정보에 해당하는 계정 정보가 존재하지 않습니다.\n정보를 확인해주세요.");
				}
				
			}//success
		});//ajax
		
	}//chkInputDataPW
	
	//아이디 입력창 검증
	function chkData(){
		if($("#nameID").val() == ""){
			alert("이름을 입력해주세요");
			$("#nameID").focus();
			return;
		}
		
		var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email_id = $("#email_id").val();
		var email_domain = $("#email_domain").val();
		var mail ="";
			
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
		
		if(!email_rule.test(mail)){
			alert("이메일을 형식에 맞게 입력해주세요.");
			return false;
		}
		
		return true;
	}//chkData
	
	//비밀번호 입력창 검증
	function chkPwData(){
		if($("#namePW").val() == ""){
			alert("이름을 입력해주세요");
			$("#namePW").focus();
			return;
		}
		
		if($("#idPW").val() == ""){
			alert("아이디를 입력해주세요");
			$("#idPW").focus();
			return;
		}
		
		var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email_id = $("#email_id_pw").val();
		var email_domain = $("#email_domain_pw").val();
		var mail ="";
			
		if(!email_id){
			alert("이메일을 입력해주세요");
			$("#email_id_pw").focus();
			return false;
		}
		if(!email_domain){
			alert("도메인을 입력해주세요");
			$("#email_domain_pw").focus();
			return false;
		}
		
		mail = email_id+"@"+email_domain;
		
		if(!email_rule.test(mail)){
			alert("이메일을 형식에 맞게 입력해주세요.");
			return false;
		}
		
		return true;
	}//chkPwData
	
	function setEmailDomain(domain){
		$("#email_domain").val(domain);
	}//setEmailDomain
	
	function setEmailDomain1(domain){
		$("#email_domain_pw").val(domain);
	}//setEmailDomain
</script>

<!-- 내용 시작 -->
<div class="container">
		<div class="btnWrap">
		<input type="button" id="findID" name="findID" value="아이디 찾기"/>
		<input type="button" id="findPW" name="findPW" value="비밀번호 찾기"/><br>
		</div>
		
		<div class="contentWrap">
			<div id="id">
				<h2>아이디 찾기</h2><br>
				<dl>
					<dt>
					<label id="label">이름</label>
					</dt>
					<dd>
					<input type="text" id="nameID">
					</dd><br>
					
					<dt>
					<label id="label">이메일</label>
					</dt>
					<dd>
					<input type="text" id="email_id" class="form_w200" value="" title="이메일 아이디" placeholder="이메일" maxlength="18" /> @ 
					<input type="text" id="email_domain" class="form_w200" value="" title="이메일 도메인" placeholder="이메일 도메인" maxlength="18"/> 
					<select class="select" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;">
					    <option value="">-선택-</option>
					    <option value="naver.com">naver.com</option>
					    <option value="gmail.com">gmail.com</option>
					    <option value="hanmail.net">hanmail.net</option>
					    <option value="hotmail.com">hotmail.com</option>
					    <option value="korea.com">korea.com</option>
					    <option value="nate.com">nate.com</option>
					</select>
					</dd>
				</dl>
				<div id="center">
					<input type="button" value="인증번호 받기" id="idFindBtn" class="btn btn-warning"/>　
				</div>
				<div class="codeDiv" id="codeDiv">
					<input type="text" id="code" name="code" maxlength="6" placeholder="인증번호 6자리 입력"/>
				</div>
				<div id="center">
				<form action="find_result_id.do" method="post" id="findIdFrm" name="findIdFrm">
					<input type="hidden" value="" id="finalName" name="finalName"/>
					<input type="hidden" value="" id="finalEmail" name="finalEmail"/>
					<input type="button" value="확인" id="chkNumBtn" class="btn btn-primary"/>
				</form>
				</div>
			</div>
			<!--------------------------------------------------------------------------->
			<div id="pw">
				<h2>비밀번호 찾기</h2>
				<div id="void"> </div>
				<dl>
					<dt>
					<label id="label">이름</label>
					</dt>
					<dd>
					<input type="text" id="namePW">
					</dd><br>
					
					<dt>
					<label id="label">아이디</label>
					</dt>
					<dd>
					<input type="text" id="idPW">
					</dd><br>
					
					<dt>
					<label id="label">이메일</label>
					</dt>
					<dd>
					<input type="text" id="email_id_pw" class="form_w200" value="" title="이메일 아이디" placeholder="이메일" maxlength="18" /> @ 
					<input type="text" id="email_domain_pw" class="form_w200" value="" title="이메일 도메인" placeholder="이메일 도메인" maxlength="18"/> 
					<select class="select" title="이메일 도메인 주소 선택" onclick="setEmailDomain1(this.value);return false;">
					    <option value="">-선택-</option>
					    <option value="naver.com">naver.com</option>
					    <option value="gmail.com">gmail.com</option>
					    <option value="hanmail.net">hanmail.net</option>
					    <option value="hotmail.com">hotmail.com</option>
					    <option value="korea.com">korea.com</option>
					    <option value="nate.com">nate.com</option>
					</select>
					</dd>
				</dl>
				<div id="center">
					<input type="button" value="인증번호 받기" id="pwFindBtn" class="btn btn-warning"/>　
				</div>
				<div class="codePwDiv" id="codePwDiv">
					<input type="text" id="code_pw" name="code_pw" maxlength="6" placeholder="인증번호 6자리 입력"/>
				</div>
				<div id="center">
				<form action="find_result_pw.do" method="post" id="findPwFrm" name="findPwFrm">
					<input type="hidden" value="" id="finalId_pw" name="finalId_pw"/>
					<input type="button" value="확인" id="chkNumBtn_pw" class="btn btn-primary"/>
				</form>
				</div>
			</div>
		</div>
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->