<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 물품 관리 - 물품 등록"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-06-02
*/%>

<c:set var="date" value="<%=new java.util.Date()%>" />
<c:set var="strDate"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터 관리자</title>
<link rel="icon" href="${pageContext.request.contextPath}/mgr_common/images/favicon.png"/>

<!-- dashlite css 시작-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<!--dashlite css 끝-->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<!-- datepicker 시작-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->
<script src="${pageContext.request.contextPath}/mgr_common/assets/js/jquery-ui.js"></script> <!-- datepicker가 div 뒤에 생기는 문제 방지 -->
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
	
 	span.invalid{display: none;}
 	.errMsg{color:#ff0000;}
 	
	/* datepicker 아이콘 가져오기 */
   .ui-widget-header .ui-icon { background-image: url('${pageContext.request.contextPath}/mgr_common/images/btns.png'); } 
	
</style>

<c:if test="${requestScope.flagDelete ne null}">
	<script type="text/javascript">
		$(function() {
			if(${requestScope.flagDelete }) {
				alert('물품 삭제에 성공하였습니다');
			} else {
				alert('물품 삭제에 실패하였습니다');
			} // else
		}); // $(document).ready(function() { })
	</script>
</c:if>

<script type="text/javascript">

	var nick = "${sessionScope.mgr.nick}";
	var managerId = "${sessionScope.mgr.manager_id}";
	var link = "${pageContext.request.contextPath}";
	$(function() {
		
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
			
			url.searchParams.delete('tradeMethodCode');
			url.searchParams.delete('qualityCode');
			url.searchParams.delete('location');
			url.searchParams.delete('minPrice');
			url.searchParams.delete('maxPrice');
			url.searchParams.delete('sellStatusCode');
			location.href = "${pageContext.request.contextPath}/mgr/goods/mgr_goods_list_frm.do" + url.search;
		}); // click
		
		// 전체 조회
		$("#btnAllSearch").click(function () {
			location.href = "${pageContext.request.contextPath}/mgr/goods/mgr_goods_list_frm.do";
		}); // click
	}); // $(document).ready(function() { })
	
	// 검색을 위한 null 체크
	function chkNull() {
		if($("#keyword").val().trim() != "") {
			disableInput();
			$("#frmBoard").submit();
		} // end if
	} // chkNull
	
	// form submit시 null인 거 안 넘어가게
	function disableInput() {
		if($("#selCategoryUpper").val() == null || $("#selCategoryUpper").val().trim() == '') {
			$("#selCategoryUpper").prop("disabled", "disabled");
			$("#selCategoryLower").prop("disabled", "disabled");
		} // end if
		if($("#selCategoryLower").val() == null || $("#selCategoryLower").val().trim() == '') {
			$("#selCategoryLower").prop("disabled", "disabled");
		} // end if
		if($("#startDate").val() == null || $("#startDate").val().trim() == '') {
			$("#startDate").prop("disabled", "disabled");
		} // end if
		if($("#endDate").val() == null || $("#endDate").val().trim() == '') {
			$("#endDate").prop("disabled", "disabled");
		} // end if
		
		if($("#tradeMethodCode").val() == null || $("#tradeMethodCode").val().trim() == '') {
			$("#tradeMethodCode").prop("disabled", "disabled");
		} // end if
		if($("#qualityCode").val() == null || $("#qualityCode").val().trim() == '') {
			$("#qualityCode").prop("disabled", "disabled");
		} // end if
		if($("#location").val() == null || $("#location").val().trim() == '') {
			$("#location").prop("disabled", "disabled");
		} // end if
		if($("#minPrice").val() == null || $("#minPrice").val().trim() == '') {
			$("#minPrice").prop("disabled", "disabled");
		} // end if
		if($("#maxPrice").val() == null || $("#maxPrice").val().trim() == '') {
			$("#maxPrice").prop("disabled", "disabled");
		} // end if
		if($("#sellStatusCode").val() == null || $("#sellStatusCode").val().trim() == '') {
			$("#sellStatusCode").prop("disabled", "disabled");
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

<!-- 사용자 상품 조회 CSS, 폰트 시작 -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/responsive.css">
<!-- 사용자 상품 조회 CSS, 폰트 끝 -->

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
			<h3 class="nk-block-title page-title">물품 관리</h3>
			<div class="nk-block-des text-soft"><p>물품 리스트</p></div>
		</div>
	</div>
</div>

<div class="nk-block">
	<div class="card card-bordered card-stretch">
		<div class="card-inner-group">
			<form name="frmBoard" id="frmBoard" action="mgr_goods_list_frm.do">
				<div class="card-inner position-relative card-tools-toggle">
					<div class="card-title-group">
						<div class="card-tools">
							<div class="form-inline flex-nowrap gx-5">
								<div class="row gy-4">
									<div class="col-sm-1">
										<div class="btn-wrap">
											<span class="d-none d-md-block">
												<input type="button" class="btn btn-light" id="btnAllSearch" value="전체 조회">
											</span>
										</div>
									</div>
									<hr style="color:#ffffff"/>
									<div class="col-sm-2">
										<div class="form-wrap">
											<div class="input-group-prepend" style="width:180px;">
												<select id="selCategoryUpper" class="form-select js-select2" name="parentCategoryNum">
													<option value="">모든 상위 카테고리</option>
													<c:forEach var="cate" items="${requestScope.listCategoryUpper}" varStatus="i">
													<option value='${cate.categoryNum }'${param.parentCategoryNum eq cate.categoryNum ? " selected='selected'" : ""}><c:out value="${cate.categoryName}"/></option>
													</c:forEach>
												</select>
											</div>	
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-wrap">
											<div class="input-group-prepend" style="width:180px;">
												<select id="selCategoryLower" class="form-select js-select2" name="categoryNum"${param.parentCategoryNum eq null ? " disabled='disabled'" : ""}>
													<option value="">모든 하위 카테고리</option>
													<c:if test="${requestScope.listCategoryLower ne null}">
													<c:forEach var="cate" items="${requestScope.listCategoryLower}" varStatus="i">
													<option value='${cate.categoryNum }'${param.categoryNum eq cate.categoryNum ? " selected='selected'" : ""}><c:out value="${cate.categoryName}"/></option>
													</c:forEach>
													</c:if>
												</select>
											</div>	
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-wrap">
											<div class="input-group-prepend" style="width:180px;">
												<select id="tradeMethodCode" class="form-select js-select2" name="tradeMethodCode">
													<option value="">모든 거래방식</option>
													<option value="P"${param.tradeMethodCode eq 'P' ? " selected='selected'" : ""}>택배</option>
													<option value="D"${param.tradeMethodCode eq 'D' ? " selected='selected'" : ""}>직거래</option>
												</select>
											</div>	
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-wrap">
											<div class="input-group-prepend" style="width:180px;">
												<select id="qualityCode" class="form-select js-select2" name="qualityCode">
													<option value="">모든 상품 품질</option>
													<option value="1"${param.qualityCode eq 1 ? " selected='selected'" : ""}>새상품 (미사용)</option>
													<option value="2"${param.qualityCode eq 2 ? " selected='selected'" : ""}>사용감없음</option>
													<option value="3"${param.qualityCode eq 3 ? " selected='selected'" : ""}>사용감적음</option>
													<option value="4"${param.qualityCode eq 4 ? " selected='selected'" : ""}>사용감많음</option>
													<option value="5"${param.qualityCode eq 5 ? " selected='selected'" : ""}>고장/파손 상품</option>
												</select>
											</div>	
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-wrap">
											<div class="input-group-prepend">
												<select id="location" class="form-select js-select2" name="location">
													<option value="">모든 지역</option>
													<option value="서울"${param.location eq '서울' ? " selected='selected'" : ""}>서울</option>
													<option value="경기"${param.location eq '경기' ? " selected='selected'" : ""}>경기</option>
													<option value="부산"${param.location eq '부산' ? " selected='selected'" : ""}>부산</option>
													<option value="대구"${param.location eq '대구' ? " selected='selected'" : ""}>대구</option>
													<option value="인천"${param.location eq '인천' ? " selected='selected'" : ""}>인천</option>
													<option value="광주"${param.location eq '광주' ? " selected='selected'" : ""}>광주</option>
													<option value="대전"${param.location eq '대전' ? " selected='selected'" : ""}>대전</option>
													<option value="울산"${param.location eq '울산' ? " selected='selected'" : ""}>울산</option>
													<option value="세종"${param.location eq '세종' ? " selected='selected'" : ""}>세종</option>
													<option value="강원"${param.location eq '강원' ? " selected='selected'" : ""}>강원</option>
													<option value="충청"${param.location eq '충청' ? " selected='selected'" : ""}>충청</option>
													<option value="전라"${param.location eq '전라' ? " selected='selected'" : ""}>전라</option>
													<option value="경상"${param.location eq '경상' ? " selected='selected'" : ""}>경상</option>
													<option value="제주"${param.location eq '제주' ? " selected='selected'" : ""}>제주</option>
												</select>
											</div>	
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<div class="form-control-wrap">
												<div class="input-daterange date-picker-range input-group">
													<div class="input-group-addon">등록일</div>
													<input type="text" id="startDate" name="startDate" class="form-control datepicker" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${param.startDate}">
													<div class="input-group-addon">~</div>
													<input type="text" id="endDate" name="endDate" class="form-control datepicker" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${param.endDate}">
												</div>
											</div>
										</div>
									</div>
									
									<div class="col-sm-3">
										<div class="form-group">
											<div class="form-control-wrap">
												<div class="input-daterange date-picker-range input-group">
													<div class="input-group-addon">최소가격</div>
													<input type="text" id="minPrice" name="minPrice" class="form-control" maxlength="10" value="${param.minPrice}">
													<div class="input-group-addon">최대가격</div>
													<input type="text" id="maxPrice" name="maxPrice" class="form-control"  maxlength="10" value="${param.maxPrice}">
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-wrap">
											<div class="input-group-prepend" style="width:180px;">
												<select id="sellStatusCode" class="form-select js-select2" name="sellStatusCode">
													<option value="">모든 판매 상태</option>
													<option value="N"${param.sellStatusCode eq 'N' ? " selected='selected'" : ""}>판매중</option>
													<option value="S"${param.sellStatusCode eq 'S' ? " selected='selected'" : ""}>판매 완료</option>
												</select>
											</div>	
										</div>
									</div>
									<hr style="color:#ffffff"/>
									<div class="col-sm-1">
										<div class="btn-wrap">
											<span class="d-none d-md-block">
												<input type="button" class="btn btn-dim btn-primary" id="btnFilter" value="적용하기">
											</span>
										</div>
									</div>
									<div class="col-sm-1">
										<div class="btn-wrap">
											<span class="d-none d-md-block">
												<input type="button" class="btn btn-outline-secondary" id="resetFilter" value="초기화">
											</span>
										</div>
									</div>
								</div>
							</div>	
						</div>
					</div>
					<div class="" style="margin-top:10px;">검색된 총 물품 수: <c:out value="${requestScope.totalCount }"/>개</div>
					</div>
				</div>
				<hr style="margin: 0px;"/>
				<div class="row g-gs">
					<c:choose>
						<c:when test="${requestScope.list eq null or requestScope.currentPage > requestScope.totalPage}">
							<h5>조회된 결과가 없습니다</h5>
						</c:when>
						<c:otherwise>
							<c:forEach var="mgrGoodsDomain" items="${requestScope.list }" varStatus="i">
								<div class="col-md-6 col-lg-5 col-xxl-3">
									<div class="card-inner">
										<div class="single-product">
											<div class="product-block">
												<c:choose>
													<c:when test="${pageContext.request.queryString eq null or pageContext.request.queryString eq ''}">
														<a href="${pageContext.request.contextPath}/mgr/goods/mgr_goods_detail_frm.do?&goodsNum=${mgrGoodsDomain.goodsNum}"><c:out value="${reviewDomain.content}"/>
													</c:when>
													<c:otherwise>
														<a href="${pageContext.request.contextPath}/mgr/goods/mgr_goods_detail_frm.do?${pageContext.request.queryString }&goodsNum=${mgrGoodsDomain.goodsNum}""><c:out value="${reviewDomain.content}"/>
													</c:otherwise>
												</c:choose>
												<!-- 상세페이지로 이동 -->
													<img src="${pageContext.request.contextPath}/products-img/${mgrGoodsDomain.img}" alt="" class="thumbnail">
													<div class="product-description">
														<p class="title">
														<c:if test="${mgrGoodsDomain.flagDelete}">
														<font style="color:#ff0000">(삭제됨)</font>
														</c:if>
														<c:out value="${mgrGoodsDomain.title}"/></p>
														<div style="overflow: hidden;">
															<p class="price" style="float: left;"><c:out value="${mgrGoodsDomain.price}"/> 원</p>
															<p class="location" style="float: left;"><i class="fa fa-map-marker" aria-hidden="true"></i><c:out value="${mgrGoodsDomain.location}"/></p>
															<p class="time-ago" style="float: right;"><c:out value="${mgrGoodsDomain.timeAgo}"/></p>
														</div>
													</div>
												</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
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
											<option value="0"${param.field eq 0 ? " selected='selected'" : ""}>판매자 닉네임</option>
											<option value="1"${param.field eq 1 ? " selected='selected'" : ""}>판매 상품명</option>
											<option value="2"${param.field eq 2 ? " selected='selected'" : ""}>판매 내용</option>
											<option value="3"${param.field eq 3 ? " selected='selected'" : ""}>구매자 닉네임</option>
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
<!-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script> -->
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/bundle_beauty_my.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script> --%>
<!-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script> --%>
<!-- <div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div> -->
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-goods").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>