<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 회원 관리 - 회원 상세 조회"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%/*
작성자: 김동섭
작성일: 2024-06-02
*/%>
<%@ include file="mgr_member_detail_frm_upper.jsp" %>
					<!-- 탭2. 거래내역 시작 -->
					<div class="tab-pane active show" id="tabItem2" role="tabpanel">
						<form name="frmBoard" id="frmBoard" action="mgr_member_detail_frm.do">
							<input type="hidden" name="t" value="${param.t }"/>
							<input type="hidden" name="memNum" value="${param.memNum }"/>
							<div class="card-inner">
								<div class="nk-block">
									<div class="nk-block-head">
										<h5 class="title">회원의 거래 내역</h5>
										<p>판매 내역, 구매 내역 선택</p>
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
																	<select id="selCategoryLower" class="form-select js-select2 filterInput" name="categoryNum"${param.parentCategoryNum eq null ? " disabled='disabled'" : ""}>
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
																	<select id="tradeMethodCode" class="form-select js-select2 filterInput" name="tradeMethodCode">
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
																	<select id="qualityCode" class="form-select js-select2 filterInput" name="qualityCode">
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
																	<select id="location" class="form-select js-select2 filterInput" name="location">
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
														<div class="col-sm-4">
															<div class="form-group">
																<div class="form-control-wrap">
																	<div class="input-daterange date-picker-range input-group">
																		<div class="input-group-addon">시작일</div>
																		<input type="text" id="startDate" name="startDate" class="form-control datepicker filterInput" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${param.startDate}">
																		<div class="input-group-addon">종료일</div>
																		<input type="text" id="endDate" name="endDate" class="form-control datepicker filterInput" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${param.endDate}">
																	</div>
																</div>
															</div>
														</div>
														
														<div class="col-sm-3">
															<div class="form-group">
																<div class="form-control-wrap">
																	<div class="input-daterange date-picker-range input-group">
																		<div class="input-group-addon">최소가격</div>
																		<input type="text" id="minPrice" name="minPrice" class="form-control filterInput" maxlength="10" value="${param.minPrice}">
																		<div class="input-group-addon">최대가격</div>
																		<input type="text" id="maxPrice" name="maxPrice" class="form-control filterInput"  maxlength="10" value="${param.maxPrice}">
																	</div>
																</div>
															</div>
														</div>
														<c:if test="${param.trade eq null or param.trade eq 'S' }">
														<div class="col-sm-2">
															<div class="form-wrap">
																<div class="input-group-prepend" style="width:180px;">
																	<select id="sellStatusCode" class="form-select js-select2 filterInput" name="sellStatusCode">
																		<option value="">모든 판매 상태</option>
																		<option value="N"${param.sellStatusCode eq 'N' ? " selected='selected'" : ""}>판매중</option>
																		<option value="S"${param.sellStatusCode eq 'S' ? " selected='selected'" : ""}>판매 완료</option>
																	</select>
																</div>	
															</div>
														</div>
														</c:if>
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
									</div>
								</div>
							</div>
							<!-- 거래내역 하위 탭 목록 시작 -->	
							<ul class="nav nav-tabs nav-tabs-mb-icon nav-tabs-card" role="tablist">
								<li class="nav-item nav-link trade${param.trade eq null or param.trade eq 'S' ? ' active' : '' }">
										<em class="icon ni ni-user-circle"></em>
										<span>판매 내역</span>
								</li>			
								<li class="nav-item nav-link trade${param.trade eq 'B' ? ' active' : '' }">
									<em class="icon ni ni-user-circle"></em>
									<span>구매 내역</span>
								</li>			
							</ul>			
							<!-- 거래내역 하위 탭 목록 끝 -->	
							<!-- 거래내역 탭 내용 시작 -->
							<div class="tab-content">
								<!-- 거래내역 탭1. 판매중 시작 -->
								<c:set var="flagIsList" value="${not (requestScope.list eq null or fn:length(requestScope.list) eq 0)}"/>
								<div class="tab-pane active show" id="tabTradeItem1" role="tabpanel">
									<div class="row g-gs">
										<c:if test="${flagIsList }">
										<c:forEach var="goodsDomain" items="${requestScope.list }" varStatus="i">
				                        <div class="col-md-6 col-lg-5 col-xxl-3">
											<div class="card card-bordered">
												<div class="card-inner">
						                            <div class="single-product">
						                            	<div class="product-block">
						                            		<a href="${pageContext.request.contextPath}/mgr/goods/mgr_goods_detail_frm.do?goodsNum=${goodsDomain.goodsNum}">
						                            		<div class="myImg col-xxl-12" style="background-image: url(${pageContext.request.contextPath}/products-img/${ goodsDomain.img });">
						                            		</div></a>
															<div class="product-description text-left" style="margin-top:20px;">
																<h6><a href="${pageContext.request.contextPath}/mgr/goods/mgr_goods_detail_frm.do?goodsNum=${goodsDomain.goodsNum}"><c:out value="${goodsDomain.title }"/></a></h6>
																<div style="overflow: hidden;">
																	<h6 class="price" style="float: left;"><fmt:formatNumber value="${goodsDomain.price }" pattern="#,###" />원</h6>
																	<p class="time-ago" style="float: right;"><c:out value="${goodsDomain.timeAgo }"/></p>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										</c:forEach>
										</c:if>
										<c:if test="${not flagIsList }">
											<h6>조회된 상품이 없습니다</h6>
										</c:if>
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
												 				<c:if test="${not (param.trade eq null or param.trade eq 'S')}">
																<option value="0"${param.field eq 0 ? " selected='selected'" : ""}>판매자 닉네임</option>
																</c:if>
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
								</div>
							</div>
							<!-- 거래내역 탭 내용 끝 -->
						</form>
					</div>
					<!-- 탭2. 거래내역 끝 -->
<%@ include file="mgr_member_detail_frm_lower.jsp" %>

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
	
	/* datepicker 아이콘 가져오기 */
   .ui-widget-header .ui-icon { background-image: url('${pageContext.request.contextPath}/mgr_common/images/btns.png'); } 
	
</style>

<script type="text/javascript">
	$(function() {
		
		// 판매중 / 판매내역 탭 선택시
		$(".trade").click(function() {
			let url = new URL(location.href);
			if($(this).index() == 0) {
				url.searchParams.set('trade', 'S');
			} else {
				url.searchParams.set('trade', 'B');
				url.searchParams.delete('sellStatusCode');
			} // end else
			location.href='${pageContext.request.contextPath}/mgr/member/mgr_member_detail_frm.do' + url.search;
		}); // click
		
		// 상위 거래 카테고리 선택시
		$("#selCategoryUpper").change(function () {
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
			location.href = "${pageContext.request.contextPath}/mgr/member/mgr_member_detail_frm.do" + url.search;
		}); // click
		
		// 전체 조회
		$("#btnAllSearch").click(function () {
			location.href = "${pageContext.request.contextPath}/mgr/member/mgr_member_detail_frm.do?t=1&memNum=${param.memNum}";
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
		
		let arrFilterInput = $(".filterInput");
		for(let i = 0; i < arrFilterInput.length; i++) {
			if($(arrFilterInput[i]).val() == null || $(arrFilterInput[i]).val().trim() == '') {
				$(arrFilterInput[i]).prop("disabled", "disabled");
			} // end if
		} // end for
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