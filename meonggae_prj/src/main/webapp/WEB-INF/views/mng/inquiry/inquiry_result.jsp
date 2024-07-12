<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="문의 리스트 조회"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 리스트 조회</title>
<link rel="icon" href="${pageContext.request.contextPath}/mgr_common/images/favicon.png"/>
<!--bootstrap 시작-->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
<!--bootstrap 끝-->

<!-- dashlite css 시작-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<!--dashlite css 끝-->

<!-- <link rel="stylesheet" href="http://211.63.89.136${pageContext.request.contextPath}/common/css/board.css" type="text/css" media="all" /> -->
<!-- <link rel="stylesheet" href="http://211.63.89.136${pageContext.request.contextPath}/common/css/main.css" type="text/css" media="all" /> -->

<!--jquery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jquery CDN 끝-->

<style type="text/css">
	
	.card-header {
        min-height: 120px; /* 카드 헤더의 최소 높이를 설정합니다 */
        display: flex;
        align-items: center;
        margin-top: 0px; /* 상단 헤더와 겹치지 않도록 상단 여백 추가 */
        margin-bottom: 0px;
    }
 
   	.card {
   	 	margin-top: 68px;
   	}

	#frmBoard {
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	.total-count {
		margin-top: 16px;
		margin-bottom: 16px;
	}
	
	.pagenation {
		margin-top: 8px;
		font-size: 18px;
	}
	
	
</style>
<script type="text/javascript">
	var nick = "${sessionScope.mgr.nick}";
	var managerId = "${sessionScope.mgr.manager_id}";
	var link = "${pageContext.request.contextPath}";

	$(function(){
	
		
		$("#btnSearch").click(function(){
			chkNull();
		});//click
		
		$("#btnAllSearch").click(function(){
			location.href="${pageContext.request.contextPath}/mng/inquiry/inquiry_result.do?currentPage=1";
		});//click	
		
		$("#keyword").keydown(function( evt ){
			if( evt.which == 13 ){
				chkNull();
			}//end if
		});//keydown
		
	});//ready
	
	function chkNull(){
		if($("#keyword").val().trim() != ""){
			//alert("검색키워드를 입력해주세요")
			$("#frmBoard").submit();
		}//end if
	}//chkNull
	
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
<div class="container mt-5">
    <div class="card">
		<div class="card-header">
		       <h4>문의 리스트 조회</h4>
		</div>
		
	 <div class="card-body">	
		<div class="total-count">
		 총 게시글 수 : <strong><c:out value="${ totalRecords }"/></strong>  개<br>
		</div>
		<c:catch var="e">
	<table class="table table-hover">
		<tr>
		<th style="width: 80px">문의번호</th>
		<th style="width: 200px">제목</th>
		<th style="width: 120px">회원번호</th>
		<th style="width: 120px">작성일</th>
		<th style="width: 200px">답변상태</th>
		</tr>
	<c:if test="${ empty requestScope.listInquiry }">
	<tr>
		<td colspan="5" style="text-align: center">
		  문의가 존재하지 않습니다.
		</td>
	</tr>
	</c:if>
	<c:forEach var="id" items="${ requestScope.listInquiry }" varStatus="i">
	<tr>
		<td><c:out value="${ id.inquiry_num }"/></td>
		<td><a href="inquiry_detail.do?inquiry_num=${ id.inquiry_num }"><c:out value="${ id.title }"/></a></td>
		<td><c:out value="${ id.mem_num }"/></td>
		<td><c:out value="${ id.input_date }"/></td>
		<td><c:out value="${ id.answer_flag }"/></td>
	</tr>
	</c:forEach>
	</table>
</c:catch>
<c:if test="${ not empty e }">
오류가 발생했습니다.
</c:if>

 		 <!-- 페이지네이션 -->
 		 <div class="pagenation">
            <div style="text-align: center;" >
                <c:forEach begin="1" end="${ totalPages }" var="i">
                    <a href="inquiry_result.do?currentPage=${ i }&field=${ param.field }&keyword=${ param.keyword }">${ i }</a>
                </c:forEach>
            </div>
           </div>
    
    <!-- 키워드 검색 -->
	<div style="text-align: center;">
		<form action="inquiry_result.do" method="get" name="frmBoard" id="frmBoard">
			<select name="field" id="field">
			<option value="0"${ param.field eq 0?" selected='selected'":"" }>제목</option>
			<option value="1"${ param.field eq 1?" selected='selected'":"" }>내용</option>
			</select>
			<input type="text" name="keyword" id="keyword" value="${ param.keyword }" style="width: 230px"/>
			<input type="button" value="검색" id="btnSearch" class="btn btn-info btn-sm"/>
			<input type="button" value="전체글" id="btnAllSearch" class="btn btn-info btn-sm"/>
			<input type="hidden" name="currentPage" value="${ param.currentPage }"/>
			<input type="text" style="display: none;"/>
		</form>
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
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script> --%>
<!-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script> --%>
<div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div>
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-inquiry").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>	
</body>
</html>