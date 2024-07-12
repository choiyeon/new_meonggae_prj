<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="문의 상세보기"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 상세보기</title>
<link rel="icon" href="${pageContext.request.contextPath}/mgr_common/images/favicon.png"/>

<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->

<!-- dashlite css 시작-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<!--dashlite css 끝-->

<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/board.css" type="text/css" media="all" /> -->
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/main.css" type="text/css" media="all" /> -->

<!--jquery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jquery CDN 끝-->

<style type="text/css">
    body {
        font-family: Arial, sans-serif;
    }
    .table th, .table td {
        vertical-align: middle;
    }
    .content-cell {
        height: 200px; /* 문의 내용 칸과 답변 내용 칸의 높이를 높입니다 */
    }
    .wide-textfield {
        width: 100%; /* 텍스트 필드의 너비를 100%로 설정 */
        height: 80%; /* 텍스트 필드의 높이를 100%로 설정 */
    }
    .narrow-th {
        width: 150px; /* th 요소의 기본 가로 넓이를 줄입니다 */
    }
    
    .answer-table th {
        width: 150px; /* 답변 테이블의 th 요소의 가로 넓이를 조정합니다 */
    }
    
    .table-bordered th {
        background-color: #F8F8F8; /* 테이블 내 th 요소의 배경색 */
    }
    
    .card-header {
        min-height: 100px; /* 카드 헤더의 최소 높이를 설정합니다 */
        display: flex;
        align-items: center;
        margin-top: 0px; /* 상단 헤더와 겹치지 않도록 상단 여백 추가 */
        margin-bottom: 14px;
    }
   
   	.card {
   	 	margin-top: 40px;
   	}
   	
  
</style>
<script type="text/javascript">
	var nick = "${sessionScope.mgr.nick}";
	var managerId = "${sessionScope.mgr.manager_id}";
	var link = "${pageContext.request.contextPath}";
	
    $(function(){
        $("#btnList").click(function(){
            location.href="${pageContext.request.contextPath}/mng/report/report_result.do?currentPage=1";
        });

        $("#btnUpdate").click(function(){
            if(confirm("글을 수정하시겠습니까?")){
                chkNull();
            }
        });

        
        <c:if test="${not empty sessionScope.message}">
            alert("${sessionScope.message}");
            <c:remove var="message" scope="session" />
        </c:if>
    });

    function chkNull(){
        if($("#process_contents").val().trim()==""){
            alert("내용은 필수입력");
            $("#process_contents").focus();
            return;
        }
        $("#frmDetail")[0].action="updateReport.do";
        $("#frmDetail").submit();
    }
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
            <h4>신고 상세보기</h4>
        </div>
        <div class="card-body">
            
                <table class="table table-bordered">
                    <tr>
                        <th class="narrow-th">신고번호</th>
                        <td><c:out value="${ rd.rep_num }"/></td>
                        <th class="narrow-th">제목</th>
                        <td><c:out value="${ rd.title }"/></td>
                    </tr>
                    <tr>
                        <th class="narrow-th">회원번호</th>
                        <td><c:out value="${ rd.mem_num_rep }"/></td>
                        <th class="narrow-th">작성일</th>
                        <td><c:out value="${ rd.input_date }"/></td>
                    </tr>
                    <tr>
                    	<th class="narrow-th">상품번호</th>
                        <td><c:out value="${ rd.goods_num }"/></td>
                    </tr>
                    <tr>
                        <th class="narrow-th">신고내용</th>
                        <td colspan="3" class="content-cell"><c:out value="${ rd.contents }" escapeXml="false"/>
                        </td>
                    </tr>
                </table>
                
                <form method="post" name="frmDetail" id="frmDetail">
                <input type="hidden" name="rep_num" value="${ rd.rep_num }"/>
                <table class="table table-bordered mt-3 answer-table">
                  
                     <tr>
                        <th class="narrow-th">신고처리작성일</th>
                        <td>
                         <c:if test="${ not empty rd.process_date }">
                         <c:out value="${ rd.process_date }"/>
                         </c:if>
                         </td>
                    </tr>
                    <tr>
                        <th class="narrow-th">신고처리내용</th>
                        <td class="content-cell">
                            <textarea name="process_contents" id="process_contents" class="form-control wide-textfield">${ rd.process_contents }</textarea>
                        </td>
                    </tr>
                </table>
                
                <div class="text-center mt-3">
                    <input type="button" value="글수정" class="btn btn-success" id="btnUpdate"/>
                    <input type="button" value="글목록" class="btn btn-primary" id="btnList"/>
                </div>
            </form>
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
		$("#sidebar-report").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>	
</body>
</html>