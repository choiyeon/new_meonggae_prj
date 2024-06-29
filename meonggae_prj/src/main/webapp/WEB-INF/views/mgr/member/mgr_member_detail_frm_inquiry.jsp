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
					<!-- 탭4. 문의내역 시작 -->
					<div class="tab-pane active show" id="tabItem4" role="tabpanel">
						<div class="card card-stretch">
							<div class="card-inner-group">
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
																			<div class="input-daterange date-picker-range input-group" style="float:left; width:300px;">
																				<div class="input-group-addon">시작일</div>
																				<div class="form-control-wrap">
																					<div class="form-icon form-icon-left"><em class="icon ni ni-calendar"></em></div>
																					<input type="text" class="form-control date-picker" data-date-format="yyyy-mm-dd" maxlength="10">
																				</div>
																			</div>
																			<div class="input-daterange date-picker-range input-group" style="float:left;width:300px;">
																				<div class="input-group-addon">종료일</div>
																				<div class="form-control-wrap">
																					<div class="form-icon form-icon-left"><em class="icon ni ni-calendar"></em></div>
																					<input type="text" class="form-control date-picker" data-date-format="yyyy-mm-dd" maxlength="10">
																				</div>
																			</div>
																		</div>
																	</div>
																</li>
																<li class="nav-item">
																	<div class="card-title-group pb-3 g-2">
																		<div class="card-title card-title-sm">
																			<h6 class="title">처리상태</h6>
																		</div>
																		<div class="card-tools">
																			<div class="drodown">
																				<a href="#" class="dropdown-toggle dropdown-indicator btn btn-sm btn-outline-light btn-white" data-bs-toggle="dropdown" aria-expanded="false">전체</a>
																				<div class="dropdown-menu dropdown-menu-end dropdown-menu-xs" style="">
																					<ul class="link-list-opt no-bdr">
																						<li>
																							<a href="#">
																								<span>전체</span>
																							</a>
																						</li>
																						<li>
																							<a href="#">
																								<span>처리전</span>
																							</a>
																						</li>
																						<li>
																							<a href="#">
																								<span>처리완료</span>
																							</a>
																						</li>
																					</ul>
																				</div>
																			</div>
																		</div>						
																	</div>								
																</li>
																<li class="nav-item" style="margin-left:20px;">
																	<div class="card-title-group pb-3 g-2">
																		<div class="btn-wrap">
																			<span class="d-none d-md-block">
																				<button class="btn btn-light">적용하기</button>
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
										<div class="card-tools me-n1">
											<ul class="btn-toolbar gx-s1">
												<li>
													<div class="toggle-wrap">
														<a href="#" class="btn btn-icon btn-trigger toggle" data-target="cardTools">
															<em class="icon ni ni-menu-right"></em>
														</a>
														<div class="toggle-content" data-content="cardTools">
															<ul class="btn-toolbar gx-1">
																<li>
																	<div class="dropdown">
																		<a href="#" class="btn btn-trigger btn-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
																			<em class="icon ni ni-setting"></em>
																		</a>
																		<div class="dropdown-menu dropdown-menu-xs dropdown-menu-end" style="">
																			<ul class="link-check">
																				<li>
																					<span>리스트 수</span>
																				</li>
																				<li class="active">
																					<a href="#">10</a>
																				</li>
																				<li>
																					<a href="#">20</a>
																				</li>
																				<li>
																					<a href="#">50</a>
																				</li>
																			</ul>
																			<ul class="link-check">
																				<li>
																					<span>정렬</span>
																				</li>
																				<li class="active">
																					<a href="#">내림차순</a>
																				</li>
																				<li>
																					<a href="#">오름차순</a>
																				</li>
																			</ul>
																		</div>
																	</div>
																</li>
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
								<div class="card-inner p-0">
									<div class="nk-tb-list nk-tb-ulist">
										<div class="nk-tb-item nk-tb-head">
											<div class="nk-tb-col" style="width:8%;">
												<span class="sub-text">번호</span>
											</div>
											<div class="nk-tb-col tb-col-sm">
												<span class="sub-text">제목</span>
											</div>
											<div class="nk-tb-col tb-col-sm">
												<span class="sub-text">작성자</span>
											</div>
											<div class="nk-tb-col tb-col-xl">
												<span class="sub-text">작성일</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span class="sub-text">처리상태</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="sub-text">처리날짜</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">1</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:20</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:20</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">2</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:19</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span>2024.07.08 20:19:20</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">3</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">4</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:16</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">5</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:15</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">6</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:14</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-danger">처리전</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">7</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:13</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">처리 완료</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">8</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:12</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">처리 완료</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">9</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:11</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">처리 완료</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
											</div>
										</div>
										<div class="nk-tb-item">
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">10</span>
											</div>
											<div class="nk-tb-col">
												<span class="tb-lead">문의글 제목</span>
											</div>
											<div class="nk-tb-col tb-col-mb">
												<span class="tb-amount">김닉</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:10</span>
											</div>
											<div class="nk-tb-col tb-col-md">
												<span class="tb-status text-success">처리 완료</span>
											</div>
											<div class="nk-tb-col tb-col-lg">
												<span>2024.07.08 20:19:17</span>
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
											 			<select class="form-select js-select2 select2-hidden-accessible" data-select2-id="3" tabindex="-1" aria-hidden="true">
															<option value="title">문의 제목</option>
															<option value="content">문의 내용</option>
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
						</div>
					</div>
					<!-- 탭4. 문의내역 끝 -->
<%@ include file="mgr_member_detail_frm_lower.jsp" %>
