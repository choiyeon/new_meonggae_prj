<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원 탈퇴"%>
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

<script type="text/javascript">
	$(function(){
		$("#quitMemberBtn").click(function(){
			alert("탈퇴처리되었습니다.");
			
			//메인으로
			location.href="";
		});
		
		$("#mainBtn").click(function(){
			//메인으로
			location.href="http://localhost//meonggae_prj/index.do";
		});
	});//ready
</script>

<!-- 내용 시작 -->
<div class="container">

<div id="quit1">정말 탈퇴하시겠습니까?</div><br/>
<div id="quit2"> * 탈퇴 전 유의사항 *</div>
<div id="quit3">
탈퇴 시, 계정의 모든 정보는 삭제되며 재가입시에도 복구되지 않습니다.<br/>
유의사항을 숙지했고, 탈퇴를 원하시면 탈퇴 버튼을 눌러주세요.
</div><br/><br/>

<div style="text-align: center; margin-bottom: 200px;">
<input type="button" value="탈퇴" id="quitMemberBtn" class="btn btn-danger btn-lg"/>
<input type="button" value="메인으로" id="mainBtn" class="btn btn-outline-danger btn-lg"/>
</div>


</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:otherwise>
</c:choose>