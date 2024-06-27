<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="비밀번호 수정"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
		</script>
	</c:when>
	<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<c:import url="http://localhost/meonggae_prj/common/My/css/css.jsp"/>

<!-- CSS -->
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/My/css/style_pw.css">
<!-- CSS -->

<style type="text/css">
</style>
<script type="text/javascript">
	$(function(){
		/* 변경 */
		$("#modifyBtn").click(function(){
			var inputdata1 = $("#pw1").val().trim();
			var inputdata2 = $("#pw2").val().trim();
			
			if( inputdata1 == "" ){
				alert("변경할 비밀번호를 입력해주세요.");
				return;
			}//end if
			if( inputdata2 == "" ){
				alert("변경할 비밀번호를 입력해주세요.");
				return;
			}//end if
			
			if( inputdata1 != inputdata2 ){
				alert("입력하신 비밀번호가 다릅니다. 다시 확인하고 입력해주세요.")
			}else{
				if(confirm("비밀번호를 변경할까요?")){
					$("#modiftPw").submit();
					alert("변경되었습니다");
				}//end if
			}//end else
		});
		
		/* 취소 */
		$("#cancleBtn").click(function(){
			self.close();
		});
	});//ready
</script>
</head>
<body>
<form id="modiftPw" action="http://localhost/meonggae_prj/My/mypage/personal/doPasswordModify.do" method="get">
	<div id="back">
		<div id="title">비밀번호 변경</div>
		<div id="subTitle">안전한 비밀번호로 내 정보를 보호하세요</div>
		<input type="password" id="pw1" name="pw1" placeholder="새 비밀번호" maxlength="50"><br/>
		<input type="password" id="pw2" name="pw2" placeholder="새 비밀번호 확인" maxlength="50">
		<div id="blank"> </div>
		<div id="btnWrap">
		<input type="button" value="변경" id="modifyBtn" class="btn btn-primary btn-sm"/>　
		<input type="button" value="취소" id="cancleBtn" class="btn btn-secondary btn-sm"/>
		</div>
	</div>
</form>
</body>
</html>

	</c:otherwise>
</c:choose>