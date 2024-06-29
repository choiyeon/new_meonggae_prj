<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 회원 관리 - 회원 상세 조회"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%/*
작성자: 김동섭
작성일: 2024-06-02
*/%>
<%@ include file="mgr_member_detail_frm_upper.jsp" %>
					<!-- 탭6. 찜목록 시작 -->
					<div class="tab-pane active show" id="tabItem6" role="tabpanel">
						<div class="row g-gs">
							<c:choose>
								<c:when test="${requestScope.list ne null or fn:length(requestScope.list) eq 0}">
									<h6>찜 목록이 없습니다</h6>
								</c:when>
								<c:otherwise>
									<c:forEach var="steamDomain" items="${requestScope.list }" varStatus="i">
			                        <div class="col-md-6 col-lg-5 col-xxl-3">
										<div class="card card-bordered">
											<div class="card-inner">
					                            <div class="single-product">
					                            	<div class="product-block">
					                            		<a href="${pageContext.request.contextPath}/mgr/goods/mgr_goods_detail_frm.do?goodsNum=${steamDomain.goodsNum}">
					                            		<div class="myImg col-xxl-12" style="background-image: url(http://192.168.10.214${pageContext.request.contextPath}/products-img/${steamDomain.img});">
					                            		</div>
														</a>
														<div class="product-description text-left" style="margin-top:20px;">
															<h6><a href="${pageContext.request.contextPath}/mgr/goods/mgr_goods_detail_frm.do?goodsNum=${steamDomain.goodsNum}"><c:out value="${steamDomain.title }"/></a></h6>
															<div style="overflow: hidden;">
																<h6 class="price" style="float: left;"><fmt:formatNumber value="${steamDomain.price }" pattern="#,###" />원</h6>
																<p class="time-ago" style="float: right;"><c:out value="${steamDomain.timeAgo }"/></p>
															</div>
														</div>
														<div class="product-description text-left">
															<div style="overflow: hidden;">
																<h6 class="price" style="float: left;font-weight:normal;">찜 ${steamDomain.steamFlag eq 'N' ? '<font color="#ffa500">해제</font> ' : ''}일시: <fmt:formatDate value="${steamDomain.inputDate}" pattern="yyyy-MM-dd HH:mm:ss" /></h6>
															</div>
														</div>
													</div>
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
										<form name="frmBoard" id="frmBoard" method="get" action="mgr_member_detail_frm.do">
											<div class="input-group">
												<input type="hidden" name="t" value="5"/>
												<input type="hidden" name="memNum" value="${param.memNum }"/>
												<div class="input-group-prepend" style="width:200px;">
										 			<select class="form-select js-select2" id="field" name="field">
														<option value="0"${param.field eq 0 ? " selected='selected'" : ""}>상품명</option>
														<option value="1"${param.field eq 1 ? " selected='selected'" : ""}>내용</option>
														<option value="2"${param.field eq 2 ? " selected='selected'" : ""}>판매자</option>
													</select>
												</div>
												<input type="text" class="form-control" aria-label="Text input with dropdown button" id="keyword" name="keyword" value="${param.keyword }">
												<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색" id="btnSearch">
											</div>
										</form>
									</div>
								</div>				
							</div>
						</div>
					</div>
					<!-- 탭6. 찜목록 끝 -->
<%@ include file="mgr_member_detail_frm_lower.jsp" %>
<script type="text/javascript">
	$(function () {
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
	}); // $(document).ready(function() { })
	
	// 검색을 위한 null 체크
	function chkNull() {
		if($("#keyword").val().trim() != "") {
			$("#frmBoard").submit();
		} // end if
	} // chkNull
</script>
