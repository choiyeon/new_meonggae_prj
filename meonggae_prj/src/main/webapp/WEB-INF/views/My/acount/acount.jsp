<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원 탈퇴"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="http://localhost/meonggae_prj/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/CSS/style.css">
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/My/css/style_acount.css?asdfasfd">
<!-- CSS -->

<script src="../../common/My/js/acount.js"></script>

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