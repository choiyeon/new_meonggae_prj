<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 리스트 조회</title>
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
	
	 .card {
        margin-bottom: 20px;
        cursor: pointer;
        transition: background-color 0.2s;
        border-radius: 6px; /* 모서리를 둥글게 만듭니다 */
        overflow: hidden; /* 이미지 둥근 모서리를 카드와 일치시키기 위해 추가 */
    }
    .card:hover {
        background-color: rgba(0, 0, 0, 0.1);
    }
    
    .card-img-top {
        border-radius: 6px 6px 0 0; /* 카드의 이미지 상단 모서리도 둥글게 만듭니다 */
    }
    
    .tabs {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }
    .tabs button {
        padding: 10px 20px;
        border: none;
        background-color: #f1f1f1;
        cursor: pointer;
        font-size: 1em;
    }
    .tabs button.active {
        background-color: #ddd;
    }
    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 0px;
    }
    .pagination a {
        margin: 0 5px;
        padding: 10px 15px;
        border: 1px solid #ddd;
        text-decoration: none;
        color: #007bff;
    }
    .pagination a:hover {
        background-color: #ddd;
    }
    .card-body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .card-title, .card-text, .badge {
        margin: 5px 0;
    }
    
    .col-md-5 {
    	margin-top: 80px;
    }
    
     .button-container {
        padding-top: 40px; 
      	padding-right: 130px;
      	padding-bottom: 0px;
    }
    
    
     .row.custom-row {
        justify-content: center; /* row 안의 콘텐츠들을 중앙으로 정렬 */
    }
  
    .banner {
        background-color: #f1f1f1;
        height: 100px;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        font-size: 1.5em;
        font-weight: bold;
        margin-top: 40px;
        font-size: 24px;
    }
    
    .pagenation {
		margin-top: 10px;
		font-size: 24px;
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
			location.href="${pageContext.request.contextPath}/mng/event/event_result.do?currentPage=1";
		});//click	
		
		$("#btnWrite").click(function(){
			location.href="${pageContext.request.contextPath}/mng/event/event_write.do";
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
   <div class="banner">이벤트 리스트 조회</div>
   
    <div class="row custom-row">
        <c:forEach var="ed" items="${ requestScope.listEvent }" varStatus="i">
            <div class="col-md-5">
             <a href="event_detail.do?event_num=${ed.event_num}" class="text-decoration-none text-dark">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/common/images/${ed.img}" style="width: 100%; height: auto;" class="card-img-top" alt="Event Image">
                    <div class="card-body">
                        <h5 class="card-title">${ed.title}</h5>
                        <p class="card-text">이벤트 기간 : ${ed.start_date} ~ ${ed.end_date}</p>               
                    </div>
                    
                    
                </div>
                </a>             
            </div>
        </c:forEach>
    </div>
    
	  
	  <!-- 페이지네이션 -->
 		<div class="pagenation">
            <div style="text-align: center;">
                <c:forEach begin="1" end="${ totalPages }" var="i">
                    <a href="event_result.do?currentPage=${ i }&field=${ param.field }&keyword=${ param.keyword }">${ i }</a>
                </c:forEach>
            </div>
           </div>
           
      <!-- 키워드 검색 -->            
		<div style="text-align:  center;">
			<form action="event_result.do" method="get" name="frmBoard" id="frmBoard">
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
		$("#sidebar-event").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
	
</body>
</html>