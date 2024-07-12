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
					<!-- 탭5. 후기내역 시작 -->
					<div class="tab-pane active show" id="tabItem5" role="tabpanel">
						<div class="card card-stretch">
							<div class="card-inner-group">
								<form name="frmBoard" id="frmBoard" action="mgr_member_detail_frm.do">
									<input type="hidden" name="t" value="4"/>
									<input type="hidden" name="memNum" value="${param.memNum }"/>
									<div class="card-inner position-relative card-tools-toggle">
										<div class="card-title-group" data-select2-id="7">
											<div class="card-tools" data-select2-id="67">
												<div class="form-inline flex-nowrap gx-3" data-select2-id="14">
													<div class="form-wrap w-200px">
														<div class="input-group-prepend" style="width:180px;">
															<div class="card-tools shrink-0 d-none d-sm-block">
																<ul class="nav nav-switch-s2 nav-tabs bg-white">
																	<li class="nav-item">
																		<div class="card-title-group pb-3 g-2">
																			<div class="btn-wrap">
																				<span class="d-none d-md-block">
																					<input type="button" class="btn btn-light" id="btnAllSearch" value="전체 조회">
																				</span>
																			</div>
																		</div>								
																	</li>
																	<li class="nav-item" style="margin-left:20px;">
																		<div class="form-group">
																			<div class="form-control-wrap">
																				<div class="input-daterange date-picker-range input-group">
																					<div class="input-group-addon">리뷰 등록일</div>
																					<input type="text" id="startDate" name="startDate" class="form-control datepicker" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${param.startDate}">
																					<div class="input-group-addon">~</div>
																					<input type="text" id="endDate" name="endDate" class="form-control datepicker" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${param.endDate}">
																				</div>
																			</div>
																		</div>
																	</li>
																	<li class="nav-item" style="margin-left:20px;">
																		<div class="card-title-group pb-3 g-2">
																			<div class="btn-wrap">
																				<span class="d-none d-md-block">
																					<input type="button" class="btn btn-dim btn-primary" id="btnFilter" value="적용하기">
																				</span>
																			</div>
																		</div>								
																	</li>
																	<li class="nav-item" style="margin-left:20px;">
																		<div class="card-title-group pb-3 g-2">
																			<div class="btn-wrap">
																				<span class="d-none d-md-block">
																					<input type="button" class="btn btn-outline-secondary" id="resetFilter" value="초기화">
																				</span>
																			</div>
																		</div>								
																	</li>
																</ul>
															</div>								
														</div>	
													</div>
												</div>
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
									<c:set var="flagIsList" value="${not (requestScope.list eq null or fn:length(requestScope.list) eq 0)}"/>
									<div class="card-inner p-0">
										<div class="nk-tb-list nk-tb-ulist">
											<div class="nk-tb-item nk-tb-head">
												<div class="nk-tb-col" style="width:8%;">
													<span class="sub-text">번호</span>
												</div>
												<div class="nk-tb-col tb-col-xl">
													<span class="sub-text">내용</span>
												</div>
												<div class="nk-tb-col tb-col-lg">
													<span class="sub-text">작성자</span>
												</div>
												<div class="nk-tb-col tb-col-sm">
													<span class="sub-text">상품명</span>
												</div>
												<div class="nk-tb-col tb-col-sm">
													<span class="sub-text">판매자</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span class="sub-text">별점</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span class="sub-text">작성일</span>
												</div>
											</div>
											<c:if test="${flagIsList }">
											<c:forEach var="reviewDomain" items="${requestScope.list }" varStatus="i">
											<div class="nk-tb-item">
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount"><c:out value="${requestScope.totalCount - ((requestScope.currentPage - 1) * requestScope.pageScale) - i.index }"/></span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span><a href="${pageContext.request.contextPath}/mgr/review/mgr_review_detail_frm.do?memNum=${reviewDomain.memNumBuy }&goodsNum=${reviewDomain.goodsNum}"><c:out value="${reviewDomain.content }"/></a></span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span><c:out value="${reviewDomain.nickBuy }"/></span>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<div class="user-card">
														<div class="user-avatar bg-white">
															<span>
																<img src="${pageContext.request.contextPath}/products-img/${reviewDomain.goodsImg}" alt="" class="thumbnail">
															</span>
														</div>
														<div class="user-info">
															<span class="tb-lead"><a href="${pageContext.request.contextPath}/mgr/goods/mgr_goods_detail_frm.do?&goodsNum=${reviewDomain.goodsNum}" style="color:#364a63;"><c:out value="${reviewDomain.goodsTitle }"/></a></span>
														</div>
													</div>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount"><a href="${pageContext.request.contextPath}/mgr/member/mgr_member_detail_frm.do?memNum=${reviewDomain.memNumSell}" style="color:#364a63;"><c:out value="${reviewDomain.nickSell }"/></a></span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span><c:forEach begin="1" end="${reviewDomain.star}" varStatus="j">★</c:forEach>
													</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span><fmt:formatDate value="${reviewDomain.reviewInputDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
												</div>
											</div>
											</c:forEach>
											</c:if>
										</div>
										<c:if test="${not flagIsList}">
											<h6 style="text-align:center;margin:15px;">조회된 리뷰가 없습니다</h6>
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
															<option value="0"${param.field eq 0 ? " selected='selected'" : ""}>상품명</option>
															<option value="1"${param.field eq 1 ? " selected='selected'" : ""}>판매자</option>
															<option value="2"${param.field eq 2 ? " selected='selected'" : ""}>후기내용</option>
														</select>
													</div>
													<input type="text" class="form-control" aria-label="Text input with dropdown button" id="keyword" name="keyword" value="${param.keyword }">
													<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색" id="btnSearch">
												</div>
											</div>
										</div>				
									</div>
								</div>
								</form>
							</div>
						</div>
					</div>
					<!-- 탭5. 후기내역 끝 -->
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
	
 	span.invalid{display: none;}
 	.errMsg{color:#ff0000;}
 	
	/* datepicker 아이콘 가져오기 */
   .ui-widget-header .ui-icon { background-image: url('${pageContext.request.contextPath}/mgr_common/images/btns.png'); } 
	
</style>

<script type="text/javascript">
	$(function() {
		
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
			url.searchParams.delete('startDate');
			url.searchParams.delete('endDate');
			location.href = "${pageContext.request.contextPath}/mgr/member/mgr_member_detail_frm.do" + url.search;
		}); // click
		
		// 전체 조회
		$("#btnAllSearch").click(function () {
			location.href = "${pageContext.request.contextPath}/mgr/member/mgr_member_detail_frm.do?t=4&memNum=${param.memNum}";
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
		if($("#startDate").val() == null || $("#startDate").val() == '') {
			$("#startDate").prop("disabled", "disabled");
		} // end if
		if($("#endDate").val() == null || $("#endDate").val() == '') {
			$("#endDate").prop("disabled", "disabled");
		} // end if
	} // disableInput
</script>