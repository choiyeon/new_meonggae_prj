<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="비밀번호 수정"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			location.href="${pageContext.request.contextPath}/My/mypage/personal/close.do";
		</script>
	</c:when>
	<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<c:import url="/common/My/css/css.jsp"/>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/My/css/style_pw.css?1233">
<!-- CSS -->

<style type="text/css">
</style>
<script type="text/javascript">
	var nick = "";
	$(function(){
		/* 중복확인버튼 */
		$("#chkBtn").click(function(){
			nick = $("#nick").val().trim();
			chk(nick);
		});//click
		
		/* 엔터 */
		$("#nick").keydown(function( evt ){
			if (evt.which === 13) {
				nick = $("#nick").val().trim();
				chk(nick);
			}//if
		});//keydown
		
		/* 취소 */
		$("#cancleBtn").click(function(){
			self.close();
		});//click
		
		/* 사용하기버튼 */
		$("#selectNick").click(function(){
			opener.window.document.getElementById("nickname").value = nick;
			self.close();
		});//click
	});//ready
	
	function chk(nick){
		if( nick == "" ){
			alert("변경할 닉네임을 입력해주세요.");
			return;
		}//end if
		
		$.ajax({
			url: "${pageContext.request.contextPath}/My/mypage/personal/doChkNick.do",
			type: "GET",
			dataType: "JSON",
			data: {data : nick},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success: function(data){
				var result = data.result;
				var output = "이미 사용중인 닉네임입니다.";
				
				if(result == "true"){
					output = "사용 가능한 닉네임입니다."
					output += "<br/>"
					output += "사용하시려면 사용 하기 버튼을 눌러주세요."
					
					$("#output").html(output);
					$("#selectNick").show();
				}else{
					output = "이미 사용중인 닉네임입니다.";
					$("#output").html(output);
					$("#selectNick").hide();
				}//else
			}//success
		});//ajax
	}//chk
</script>
</head>
<body>
<form id="chkNick" action="${pageContext.request.contextPath}/My/mypage/personal/doChkNick.do" method="get">
	<div id="backNick">
		<div id="title">닉네임 변경</div>
		<div id="subTitle">사용 가능한 닉네임을 검색해주세요.</div>
		<input type="text" id="nick" name="nick" placeholder="닉네임" maxlength="20"><br/>
		<input type="text" style="display: none">
		<div id="output"> </div>
		<div id="btnWrap">
			<input type="button" value="사용하기" id="selectNick" class="selectNick"/>　
			<input type="button" value="중복 확인" id="chkBtn" class="btn1"/>　
			<input type="button" value="취소" id="cancleBtn" class="btn2"/>
		</div>
	</div>
</form>
</body>
</html>

	</c:otherwise>
</c:choose>