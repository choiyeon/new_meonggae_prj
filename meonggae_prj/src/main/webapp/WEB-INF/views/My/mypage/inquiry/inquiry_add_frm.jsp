<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="1:1 문의"%>
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

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
<!-- include summernote css/js -->

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/My/css/style_mypage.css">
<!-- CSS -->


<script type="text/javascript">
	$(function(){
		
		$("#submitBtn").click(function(){
			
			if($("#title").val().trim() == ""){
				alert("제목은 필수 입력사항입니다.");
				return;
			}else if($("#category").val() == "N/A"){
				alert("문의 종류를 선택해주세요.");
				return;
			}else if($("#content").val().trim() == ""){
				alert("내용은 필수 입력사항입니다.");
				return;
			}//else
				
			if(!confirm("문의를 작성하시겠습니까?")){
				return;
			}//if
			
			$.ajax({
				url: "/meonggae_prj/My/mypage/inquiry/inquiry_process.do",
				type: "POST",
				data: {
					title: $("#title").val(),
					category: $("#category option:selected").val(),
					content: $("#content").val()
				},
				dataType: "JSON",
				error: function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				},
				success: function(data){
					var result = data.result;
					
					if(result == "success"){
						alert("문의가 정상적으로 등록되었습니다.");
						location.href="${pageContext.request.contextPath}/My/mypage/inquiry/inquiry_frm.do";
					}else if(result == "noSession"){
						alert("로그인이 필요한 서비스입니다.");
						location.href="${pageContext.request.contextPath}/index.do";
					}else{
						alert("오류가 발생하였습니다. 잠시 후에 다시 시도해주세요.");
					}
				}//success
			});//ajax    
			
			
		});//click
		
		$('#content').summernote({
			height: 500,
			width: 820,
			focus: true,
			lang: 'ko-KR',
			toolbar: [
				// [groupName, [list of button]]
				['style', ['bold', 'italic', 'underline', 'clear']],
				['fontsize', ['fontsize']],
				['color', ['color']],
				['para', ['ul', 'ol']]
			]
		});
	});//ready
</script>

<!-- 내용 시작 -->
<div class="container">
		<!-- 메뉴목록 -->
	<div id="mypageMenu" class="mypageMenu">
		<%
		String pageName = "inquiry";
		pageContext.setAttribute("pageName", pageName);
		%>
		<%@ include file="../menuBar/mypageMenu.jsp" %>
		
		<hr id="menuBottonLine">
	</div>
		<!-- 메뉴목록 -->
		
		<div class="inquiryStyle1">제목<br/>
		<input type="text" id="title" class="inquiryStyle2" placeholder="제목" maxlength="20"/><br/></div>
		
		<div class="inquiryStyle1">문의 종류<br/></div>
		<div style="width: 600px;">
		<select name="category" id="category" class="form-control">
			<option value="N/A">-- 문의 종류를 선택해주세요 --</option>
			<c:forEach items="${ categoryList }" var="cl">
			<option value="${ cl.categoryNum }">${ cl.name }</option>
			</c:forEach>
		</select><br/>
		</div>
		
		<div class="inquiryStyle1">문의 내용</div>
		<textarea id="content" class="ta"></textarea>
		<input type="button" value="글 작성" id="submitBtn" class="btn btn-primary btn-lg"/>
		
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:otherwise>
</c:choose>