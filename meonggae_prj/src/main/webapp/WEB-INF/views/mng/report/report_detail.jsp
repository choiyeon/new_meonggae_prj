<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="문의 상세보기"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://211.63.89.135/spring_mvc/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://211.63.89.135/spring_mvc/common/css/board.css" type="text/css" media="all" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
  
</style>
<script type="text/javascript">
    $(function(){
        $("#btnList").click(function(){
            location.href="http://211.63.89.135/spring_mvc/report/report_result.do?currentPage=${param.currentPage}";
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
<body>
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
                        <th class="narrow-th">신고자</th>
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
                        <td colspan="3" class="content-cell"><c:out value="${ rd.contents }"/></td>
                    </tr>
                </table>
                
                <form method="post" name="frmDetail" id="frmDetail">
                <input type="hidden" name="rep_num" value="${ rd.rep_num }"/>
                <table class="table table-bordered mt-3 answer-table">
                  
                    <tr>
                        <th class="narrow-th">신고처리내용</th>
                        <td class="content-cell">
                            <textarea name="process_contents" id="process_contents" class="form-control wide-textfield">${ rd.process_contents }</textarea>
                            <br/>
                            <c:if test="${ not empty rd.process_date }">
          					<c:out value="${rd.process_date }"/>
          					</c:if>
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
</body>
</html>