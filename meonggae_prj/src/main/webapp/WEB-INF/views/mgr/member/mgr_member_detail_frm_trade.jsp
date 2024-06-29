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
						<div class="card-inner">
							<div class="nk-block">
								<div class="nk-block-head">
									<h5 class="title">회원의 거래 내역</h5>
									<p>판매중, 판매완료, 구매완료 선택</p>
								</div>
							</div>
						</div>
						<!-- 거래내역 하위 탭 목록 시작 -->	
						<ul class="nav nav-tabs nav-tabs-mb-icon nav-tabs-card" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" href="#tabTradeItem1" data-bs-toggle="tab" aria-selected="true" role="tab">
									<em class="icon ni ni-user-circle"></em>
									<span>판매중</span>
								</a>
							</li>			
							<li class="nav-item">
								<a class="nav-link" href="#tabTradeItem2" data-bs-toggle="tab" aria-selected="flase" role="tab">
									<em class="icon ni ni-user-circle"></em>
									<span>판매완료</span>
								</a>
							</li>			
							<li class="nav-item">
								<a class="nav-link" href="#tabTradeItem3" data-bs-toggle="tab" aria-selected="flase" role="tab">
									<em class="icon ni ni-user-circle"></em>
									<span>구매완료</span>
								</a>
							</li>			
						</ul>			
						<!-- 거래내역 하위 탭 목록 끝 -->	
						<!-- 거래내역 탭 내용 시작 -->
						<div class="tab-content">
							<!-- 거래내역 탭1. 판매중 시작 -->
							<div class="tab-pane active show" id="tabTradeItem1" role="tabpanel">
								<div class="row g-gs">
									<c:forEach begin="1" end="16" varStatus="i">
			                        <div class="col-md-6 col-lg-5 col-xxl-3">
										<div class="card card-bordered">
											<div class="card-inner">
					                            <div class="single-product">
					                            	<div class="product-block">
					                            		<div class="myImg col-xxl-12" style="background-image: url(http://192.168.10.214${pageContext.request.contextPath}/user/products-img/product-${ i.index }.jpg);">
					                            		</div>
														<div class="product-description text-left" style="margin-top:20px;">
															<h6>여성의류${ i.index }</h6>
															<div style="overflow: hidden;">
																<h6 class="price" style="float: left;">1${ i.index },000원</h6>
																<p class="time-ago" style="float: right;">${ i.index }일전</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
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
													<div class="input-group-prepend" style="margin:0px auto;">
														<span class="input-group-text">상품명</span>
														<input type="text" class="form-control" aria-label="Text input with dropdown button">
														<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색">
													</div>
												</div>
											</div>
										</div>				
									</div>
								</div>
							</div>
							<!-- 거래내역 탭1. 판매중 끝 -->
							<!-- 거래내역 탭2. 판매 완료 시작 -->
							<div class="tab-pane" id="tabTradeItem2" role="tabpanel">
								<div class="row g-gs">
									<c:forEach begin="1" end="16" varStatus="i">
			                        <div class="col-md-6 col-lg-5 col-xxl-3">
										<div class="card card-bordered">
											<div class="card-inner">
					                            <div class="single-product">
					                            	<div class="product-block">
					                            		<div class="myImg col-xxl-12" style="background-image: url(http://192.168.10.214${pageContext.request.contextPath}/user/products-img/product-${ i.index }.jpg);">
					                            		</div>
														<div class="product-description text-left" style="margin-top:20px;">
															<h6>여성의류${ i.index }</h6>
															<div style="overflow: hidden;">
																<h6 class="price" style="float: left;">1${ i.index },000원</h6>
																<p class="time-ago" style="float: right;">${ i.index }일전</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
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
											 			<select class="form-select js-select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
															<option value="title">상품명</option>
															<option value="nick">구매자</option>
														</select>
													</div>
													<input type="text" class="form-control" aria-label="Text input with dropdown button">
													<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색">
												</div>
											</div>
										</div>				
									</div>
								</div>
							</div>
							<!-- 거래내역 탭2. 판매 완료 끝 -->
							<!-- 거래내역 탭3. 구매 완료 시작 -->
							<div class="tab-pane" id="tabTradeItem3" role="tabpanel">
								<div class="row g-gs">
									<c:forEach begin="1" end="16" varStatus="i">
			                        <div class="col-md-6 col-lg-5 col-xxl-3">
										<div class="card card-bordered">
											<div class="card-inner">
					                            <div class="single-product">
					                            	<div class="product-block">
					                            		<div class="myImg col-xxl-12" style="background-image: url(http://192.168.10.214${pageContext.request.contextPath}/user/products-img/product-${ i.index }.jpg);">
					                            		</div>
														<div class="product-description text-left" style="margin-top:20px;">
															<h6>여성의류${ i.index }</h6>
															<div style="overflow: hidden;">
																<h6 class="price" style="float: left;">1${ i.index },000원</h6>
																<p class="time-ago" style="float: right;">${ i.index }일전</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
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
											 			<select class="form-select js-select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
															<option value="title">상품명</option>
															<option value="nick">판매자</option>
														</select>
													</div>
													<input type="text" class="form-control" aria-label="Text input with dropdown button">
													<input type="button" class="btn btn-dim btn-sm btn-secondary" value="검색">
												</div>
											</div>
										</div>				
									</div>
								</div>
							</div>
							<!-- 거래내역 탭3. 구매 완료 끝 -->
						</div>
						<!-- 거래내역 탭 내용 끝 -->
					</div>
					<!-- 탭2. 거래내역 끝 -->
<%@ include file="mgr_member_detail_frm_lower.jsp" %>
