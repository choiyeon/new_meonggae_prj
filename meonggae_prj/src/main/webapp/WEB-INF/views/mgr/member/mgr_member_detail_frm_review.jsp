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
									<input type="hidden" name="t" value="5"/>
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
									<div class="card-inner p-0">
										<div class="nk-tb-list nk-tb-ulist">
											<div class="nk-tb-item nk-tb-head">
												<div class="nk-tb-col" style="width:8%;">
													<span class="sub-text">번호</span>
												</div>
												<div class="nk-tb-col tb-col-sm">
													<span class="sub-text">상품명</span>
												</div>
												<div class="nk-tb-col tb-col-sm">
													<span class="sub-text">판매자</span>
												</div>
												<div class="nk-tb-col tb-col-xl">
													<span class="sub-text">내용</span>
												</div>
												<div class="nk-tb-col tb-col-lg">
													<span class="sub-text">작성자</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span class="sub-text">별점</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span class="sub-text">작성일</span>
												</div>
											</div>
											<div class="nk-tb-item">
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">1</span>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<div class="user-card">
														<div class="user-avatar bg-primary">
															<span></span>
														</div>
														<div class="user-info">
															<span class="tb-lead">상품명</span>
														</div>
													</div>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">이닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>후기 내용</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>김닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>★★★★★</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>2024.07.08 20:19:19</span>
												</div>
											</div>
											<div class="nk-tb-item">
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">2</span>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<div class="user-card">
														<div class="user-avatar bg-primary">
															<span></span>
														</div>
														<div class="user-info">
															<span class="tb-lead">상품명</span>
														</div>
													</div>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">이닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>후기 내용</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>김닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>★★★★★</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>2024.07.08 20:19:19</span>
												</div>
											</div>
											<div class="nk-tb-item">
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">3</span>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<div class="user-card">
														<div class="user-avatar bg-primary">
															<span></span>
														</div>
														<div class="user-info">
															<span class="tb-lead">상품명</span>
														</div>
													</div>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">이닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>후기 내용</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>김닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>★★★★★</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>2024.07.08 20:19:19</span>
												</div>
											</div>
											<div class="nk-tb-item">
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">4</span>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<div class="user-card">
														<div class="user-avatar bg-primary">
															<span></span>
														</div>
														<div class="user-info">
															<span class="tb-lead">상품명</span>
														</div>
													</div>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">이닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>후기 내용</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>김닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>★★★★★</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>2024.07.08 20:19:19</span>
												</div>
											</div>
											<div class="nk-tb-item">
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">5</span>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<div class="user-card">
														<div class="user-avatar bg-primary">
															<span></span>
														</div>
														<div class="user-info">
															<span class="tb-lead">상품명</span>
														</div>
													</div>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">이닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>후기 내용</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>김닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>★★★★★</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>2024.07.08 20:19:19</span>
												</div>
											</div>
											<div class="nk-tb-item">
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">6</span>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<div class="user-card">
														<div class="user-avatar bg-primary">
															<span></span>
														</div>
														<div class="user-info">
															<span class="tb-lead">상품명</span>
														</div>
													</div>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">이닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>후기 내용</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>김닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>★★★★★</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>2024.07.08 20:19:19</span>
												</div>
											</div>
											<div class="nk-tb-item">
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">7</span>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<div class="user-card">
														<div class="user-avatar bg-primary">
															<span></span>
														</div>
														<div class="user-info">
															<span class="tb-lead">상품명</span>
														</div>
													</div>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">이닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>후기 내용</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>김닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>★★★★★</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>2024.07.08 20:19:19</span>
												</div>
											</div>
											<div class="nk-tb-item">
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">8</span>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<div class="user-card">
														<div class="user-avatar bg-primary">
															<span></span>
														</div>
														<div class="user-info">
															<span class="tb-lead">상품명</span>
														</div>
													</div>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">이닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>후기 내용</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>김닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>★★★★★</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>2024.07.08 20:19:19</span>
												</div>
											</div>
											<div class="nk-tb-item">
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">9</span>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<div class="user-card">
														<div class="user-avatar bg-primary">
															<span></span>
														</div>
														<div class="user-info">
															<span class="tb-lead">상품명</span>
														</div>
													</div>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">이닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>후기 내용</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>김닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>★★★★★</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>2024.07.08 20:19:19</span>
												</div>
											</div>
											<div class="nk-tb-item">
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">10</span>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<div class="user-card">
														<div class="user-avatar bg-primary">
															<span></span>
														</div>
														<div class="user-info">
															<span class="tb-lead">상품명</span>
														</div>
													</div>
												</div>
												<div class="nk-tb-col tb-col-mb">
													<span class="tb-amount">이닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>후기 내용</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>김닉</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>★★★★★</span>
												</div>
												<div class="nk-tb-col tb-col-md">
													<span>2024.07.08 20:19:19</span>
												</div>
											</div>
											
										</div>
									</div>
									<div class="card-inner">
									<div class="nk-block-between-md g-3">
										<div class="g" style="margin:0px auto;">
											<ul class="pagination justify-content-center justify-content-md-start">
												<li class="page-item">
													<a class="page-link" href="#">처음 페이지로</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&lt;&lt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">4</a>
												</li>
												<li class="page-item active">
													<a class="page-link" href="#">5</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">6</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">&gt;&gt;</a>
												</li>
												<li class="page-item">
													<a class="page-link" href="#">마지막 페이지로</a>
												</li>
											</ul>
										</div>
									</div>
									<div style="margin:0px auto; width:650px; height:70px; text-align:center; padding-top:20px;">
										<div class="form-group">
											<div class="form-control-wrap">
												<div class="input-group">
													<div class="input-group-prepend" style="width:200px;">
											 			<select class="form-select js-select2">
															<option value="title">상품명</option>
															<option value="content">판매자</option>
															<option value="content">후기내용</option>
														</select>
													</div>
													<input type="text" class="form-control" aria-label="Text input with dropdown button">
													<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색">
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
<script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/jquery-ui.js"></script> <!-- datepicker가 div 뒤에 생기는 문제 방지 -->
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
<link rel="stylesheet" href="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/css/datepicker_pulse10.css">
<!-- datepicker css 끝 -->

<style type="text/css">
	
 	span.invalid{display: none;}
 	.errMsg{color:#ff0000;}
 	
	/* datepicker 아이콘 가져오기 */
   .ui-widget-header .ui-icon { background-image: url('http://192.168.10.214${pageContext.request.contextPath}/mgr_common/images/btns.png'); } 
	
</style>
