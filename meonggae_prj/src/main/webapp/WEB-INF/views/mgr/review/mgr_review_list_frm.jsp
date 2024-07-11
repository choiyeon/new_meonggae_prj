<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 후기 관리 - 리스트"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-06-02
*/%>

<c:set var="date" value="<%=new java.util.Date()%>" />
<c:set var="dateLastMonth" value="<%=new java.util.Date(new java.util.Date().getTime() - 60*60*24*1000*30L)%>"/>
<c:set var="strDate"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></c:set>
<c:set var="strDateLastMonth"><fmt:formatDate value="${dateLastMonth}" pattern="yyyy-MM-dd"/></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터 관리자</title>
<link rel="icon" href="${pageContext.request.contextPath}/mgr_common/images/favicon.png"/>
<!--bootstrap 시작-->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
<!--bootstrap 끝-->

<!-- dashlite css 시작-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<!--dashlite css 끝-->

<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/board.css" type="text/css" media="all" /> -->
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/main.css" type="text/css" media="all" /> -->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<!-- datepicker 시작-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$( function() {
		// 기본 사용
		//$( "#datepicker" ).datepicker();
		
		// 옵션 부여
		$( ".datepicker" ).datepicker({
			dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ], 
			dateFormat: "yy-mm-dd",
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			maxDate: "${strDate}",
			showMonthAfterYear: true
		});
	} );
</script>
<!-- datepicker 끝-->

<!-- datepicker css 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/mgr_common/assets/css/datepicker_pulse10.css">
<!-- datepicker css 끝 -->

<style type="text/css">
	
	/* datepicker 아이콘 가져오기 */
   .ui-widget-header .ui-icon { background-image: url('${pageContext.request.contextPath}/mgr_common/images/btns.png'); } 
	
</style>
<!-- 후기를 삭제한 경우 -->
<c:if test="${requestScope.flagDelete ne null}">
	<script type="text/javascript">
		$(function() {
			if(${requestScope.flagDelete }) {
				alert('후기 삭제에 성공하였습니다');
			} else {
				alert('후기 삭제에 실패하였습니다');
			} // else
		}); // $(document).ready(function() { })
	</script>
</c:if>
<script type="text/javascript">
	var nick = "${sessionScope.mgr.nick}";
	var managerId = "${sessionScope.mgr.manager_id}";
	var link = "${pageContext.request.contextPath}";
	$(function() {
		//callAjaxCategoryList(0, 0);
		//$("#selCategoryLower").prop("disabled", "disabled");
		
		// 상위 거래 카테고리 선택시
		$("#selCategoryUpper").change(function () {
// 			console.log($("#selCategoryUpper").val());
			if($("#selCategoryUpper").val() != null && $("#selCategoryUpper").val() != '') {
				callAjaxCategoryList($("#selCategoryUpper").val(), 1);
			}
			if($("#selCategoryUpper").val() == 0) {
				$("#selCategoryLower").html('<option value="">모든 하위 카테고리</option>');
				$("#selCategoryLower").prop("disabled", "disabled");
			} else {
				$("#selCategoryLower").removeAttr("disabled");
			}
		}); // end change
		
		// 필터 적용 버튼
		$("#btnFilter").click(function(){
			if($("#keyword").val() == null || $("#keyword").val().trim() == '') {
				$("#keyword").prop("disabled", "disabled");
				$("#field").prop("disabled", "disabled");
			} // end if
			disableInput();
			$("#frmBoard").submit();
		}); // click
		
		// 검색
		$("#btnSearch").click(function () {
			chkNull();
		}); // click
		
		// 검색
		$("#keyword").keydown(function (evt) {
			if(evt.which == 13) {
				chkNull();
			} // end if
		}); // keydown
		
		// 필터 초기화
		$("#resetFilter").click(function () {
			let url = new URL(location.href);
			url.searchParams.delete('parentCategoryNum');
			url.searchParams.delete('categoryNum');
			url.searchParams.delete('startDate');
			url.searchParams.delete('endDate');
			location.href = "${pageContext.request.contextPath}/mgr/review/mgr_review_list_frm.do" + url.search;
		}); // click
		
		// 전체 조회
		$("#btnAllSearch").click(function () {
			location.href = "${pageContext.request.contextPath}/mgr/review/mgr_review_list_frm.do";
		}); // click
		
	}); // $(document).ready(function() { })
	
	// 검색을 위한 null 체크
	function chkNull() {
		if($("#keyword").val().trim() != "") {
// 			if($("#chkDeptAll").is(":checked")) {
// 				$(".dept").prop("disabled", "disabled");
// 			} // end if
			disableInput();
			$("#frmBoard").submit();
		} // end if
	} // chkNull
	
	// form submit시 null인 거 안 넘어가게
	function disableInput() {
		if($("#selCategoryUpper").val() == null || $("#selCategoryUpper").val() == '') {
			$("#selCategoryUpper").prop("disabled", "disabled");
			$("#selCategoryLower").prop("disabled", "disabled");
		} // end if
		if($("#startDate").val() == null || $("#startDate").val() == '') {
			$("#startDate").prop("disabled", "disabled");
		} // end if
		if($("#endDate").val() == null || $("#endDate").val() == '') {
			$("#endDate").prop("disabled", "disabled");
		} // end if
	} // disableInput
	
	// 동적으로 카테고리 상위 하위 변경
	function callAjaxCategoryList(categoryNum, categoryType) {
		var param = {
				categoryNum: categoryNum
		}
		$.ajax({
			url: "${pageContext.request.contextPath}/mgr/review/mgr_review_category.do",
			type: "GET",
			data: param,
			dataType: "JSON",
			//async: false,
			error: function(xhr) {
				console.log(xhr.status + " / " + xhr.statusText);
				alert("문제가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다");
			}, 
			success: function(jsonObj) {
				let output = '';
				if(jsonObj.result){
					if(categoryType == 0) {
						output = '<option value="">모든 상위 카테고리</option>';
					} else {
						output = '<option value="">모든 하위 카테고리</option>';
					} // end if
					let arrCategory = JSON.parse(jsonObj.data);
					for (let i = 0; i < arrCategory.length; i++) {
						output += '<option value="' + arrCategory[i].categoryNum + '">' + arrCategory[i].categoryName + '</option>' 
					} // end for
					
					if(categoryType == 0) {
						$("#selCategoryUpper").html(output);
					} else {
						$("#selCategoryLower").html(output);
					} // end else
				} // end if
			} // success
		}); // ajax		
	} // callAjaxCategoryList
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
<div class="nk-content ">
<div class="container-fluid">
<div class="nk-content-inner">
<div class="nk-content-body">

<div class="nk-block-head nk-block-head-sm">
	<div class="nk-block-between">
		<div class="nk-block-head-content">
			<h3 class="nk-block-title page-title">후기 관리</h3>
			<div class="nk-block-des text-soft"><p>후기 리스트 조회</p></div>
		</div>
	</div>
</div>
<div class="nk-block">
	<div class="card card-bordered card-stretch">
		<div class="card-inner-group">
			<form name="frmBoard" id="frmBoard" action="mgr_review_list_frm.do"> 
				<div class="card-inner position-relative card-tools-toggle">
					<div class="card-title-group">
						<div class="card-tools" data-select2-id="67">
							<div class="form-inline flex-nowrap gx-5" data-select2-id="14">
								<div class="btn-wrap">
									<span class="d-none d-md-block">
										<input type="button" class="btn btn-light" id="btnAllSearch" value="전체 조회"/>
									</span>
								</div>
								<div class="form-wrap w-200px">
									<div class="input-group-prepend" style="width:180px;">
										<select id="selCategoryUpper" class="form-select js-select2" name="parentCategoryNum">
											<option value=''>모든 상위 카테고리</option>
											<c:forEach var="cate" items="${requestScope.listCategoryUpper}" varStatus="i">
											<option value='${cate.categoryNum }'${param.parentCategoryNum eq cate.categoryNum ? " selected='selected'" : ""}><c:out value="${cate.categoryName}"/></option>
											</c:forEach>
										</select>
									</div>	
								</div>
								<div class="form-wrap w-200px">
									<div class="input-group-prepend" style="width:180px;">
										<select id="selCategoryLower" class="form-select js-select2" name="categoryNum"${param.parentCategoryNum eq null ? " disabled='disabled'" : ""} >
											<option value=''>모든 하위 카테고리</option>
											<c:if test="${requestScope.listCategoryLower ne null}">
											<c:forEach var="cate" items="${requestScope.listCategoryLower}" varStatus="i">
											<option value='${cate.categoryNum }'${param.categoryNum eq cate.categoryNum ? " selected='selected'" : ""}><c:out value="${cate.categoryName}"/></option>
											</c:forEach>
											</c:if>
										</select>
									</div>	
								</div>
								<div class="form-control-wrap">
									<div class="input-daterange date-picker-range input-group" style="float:left; width:300px;">
										<div class="input-group-addon">시작일</div>
										<div class="form-control-wrap">
											<div class="form-icon form-icon-left"><em class="icon ni ni-calendar"></em></div>
											<input type="text" id="startDate" name="startDate" class="form-control datepicker" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${param.startDate}"/>
										</div>
									</div>
									<div class="input-daterange date-picker-range input-group" style="float:left;width:300px;margin-left:10px;">
										<div class="input-group-addon">종료일</div>
										<div class="form-control-wrap">
											<div class="form-icon form-icon-left"><em class="icon ni ni-calendar"></em></div>
											<input type="text" id="endDate" name="endDate" class="form-control datepicker" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${param.endDate}"/>
										</div>
									</div>
								</div>
								<div class="btn-wrap">
									<span class="d-none d-md-block">
										<input type="button" class="btn btn-light" id="btnFilter" value="적용하기"/>
									</span>
								</div>
								<div class="btn-wrap">
									<span class="d-none d-md-block">
										<input type="button" class="btn btn-outline-secondary" id="resetFilter" value="초기화"/>
									</span>
								</div>
							</div>
						</div>
						<div class="card-tools me-n1">
							<ul class="btn-toolbar gx-s1">
								<li>
									<div class="toggle-wrap">
										<a href="#" class="btn btn-icon btn-trigger toggle" data-target="cardTools">
											<em class="icon ni ni-menu-right"></em>
										</a>
										<div class="toggle-content" data-content="cardTools">
											<ul class="btn-toolbar gx-1">
											</ul>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="card-search search-wrap" data-search="search">
						<div class="card-body">
							<div class="search-content">
								<a href="#" class="search-back btn btn-icon toggle-search" data-target="search">
									<em class="icon ni ni-arrow-left"></em>
								</a>
								<input type="text" class="form-control border-transparent form-focus-none" placeholder="Search by user or email">
								<button class="search-submit btn btn-icon">
									<em class="icon ni ni-search"></em>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card-inner p-0" style="margin:0px auto; text-align: center;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">내용</th>
								<th scope="col">후기 작성자</th>
								<th scope="col">상품명</th>
								<th scope="col">카테고리</th>
								<th scope="col">별점</th>
								<th scope="col">작성일</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${requestScope.list eq null or requestScope.currentPage > requestScope.totalPage}">
									<tr>
										<td colspan="8">조회된 결과가 없습니다</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="reviewDomain" items="${requestScope.list}" varStatus="i">
										<tr>
											<th scope="row"><c:out value="${requestScope.totalCount - ((requestScope.currentPage - 1) * requestScope.pageScale) - i.index }"/></th>
											
											<c:choose>
												<c:when test="${pageContext.request.queryString eq null or pageContext.request.queryString eq ''}">
													<td><a href="${pageContext.request.contextPath}/mgr/review/mgr_review_detail_frm.do?memNum=${reviewDomain.memNumBuy }&goodsNum=${reviewDomain.goodsNum}"><c:out value="${reviewDomain.content}"/></a></td>
												</c:when>
												<c:otherwise>
													<td><a href="${pageContext.request.contextPath}/mgr/review/mgr_review_detail_frm.do?${pageContext.request.queryString }&memNum=${reviewDomain.memNumBuy }&goodsNum=${reviewDomain.goodsNum}"><c:out value="${reviewDomain.content}"/></a></td>
												</c:otherwise>
											</c:choose>
											<td><c:out value="${reviewDomain.nickBuy}"/></td>
											<td><c:out value="${reviewDomain.goodsTitle}"/></td>
											<td><c:out value="${reviewDomain.categoryName}"/></td>
											<td><c:out value="${reviewDomain.star}"/></td>
											<td><c:out value="${reviewDomain.reviewInputDate}"/></td>
											<c:choose>
												<c:when test="${reviewDomain.deleteFlag }">
													<td style="color:#ff0000;">삭제됨</td>
												</c:when>
												<c:otherwise>
													<td>-</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				
				</div>
				<div class="card-inner">
					<div class="nk-block-between-md g-3">
						<div class="g" style="margin:0px auto;">
							${requestScope.pageNation }
						</div>
					</div>
					<div style="margin:0px auto; width:650px; height:70px; text-align:center; padding-top:20px;">
						<div class="form-group">
							<div class="form-control-wrap">
								<div class="input-group">
									<div class="input-group-prepend" style="width:200px;">
							 			<select class="form-select js-select2" id="field" name="field">
											<option value="0"${param.field eq 0 ? " selected='selected'" : ""}>후기 작성자 닉네임</option>
											<option value="1"${param.field eq 1 ? " selected='selected'" : ""}>후기 내용</option>
											<option value="2"${param.field eq 2 ? " selected='selected'" : ""}>판매자 닉네임</option>
											<option value="3"${param.field eq 3 ? " selected='selected'" : ""}>판매 상품명</option>
										</select>
									</div>
									<input type="text" class="form-control" aria-label="Text input with dropdown button" id="keyword" name="keyword" value="${param.keyword }">
									<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색" id="btnSearch"/>
								</div>
							</div>
						</div>				
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

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
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/bundle_beauty_my.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script> --%>
<!-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script> --%>
<div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div>
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-review").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>