<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="관리자 - 물품 관리 - 물품 상세 조회"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-06-02
*/%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터 관리자</title>
<link rel="icon" href="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/images/favicon.png"/>

<!-- dashlite css 시작-->
<link rel="stylesheet" href="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<!--dashlite css 끝-->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">
	
 	span.invalid{display: none;}
 	.max-width-220{max-width:220px;}
 	.datepicker{ z-index: 3; position:relative;}
	
</style>

<script type="text/javascript">
	var nick = "${sessionScope.mgr.nick}";
	var managerId = "${sessionScope.mgr.manager_id}";
	var link = "http://localhost${pageContext.request.contextPath}";
	$(function() {
		
		// 닫기 -> 리스트로
		$("#btnClose").click(function() {
// 			let url = new URL(location.href);
// 			url.searchParams.delete('goodsNum');
// 			location.href = "${pageContext.request.contextPath}/mgr/goods/mgr_goods_list_frm.do" + url.search;
			history.back();
		}); // click
		
		// 삭제
		$("#btnDelete").click(function() {
			if(confirm('정말 삭제하시겠습니까?')) {
				let url = new URL(location.href);
				location.href = "${pageContext.request.contextPath}/mgr/goods/mgr_goods_delete_process.do" + url.search;
			} // end if
		}); // click
	}); // $(document).ready(function() { })
</script>

<!-- 사용자 상품 조회 CSS, 폰트 시작 -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/CSS/style.css">
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/CSS/responsive.css">
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
			<div class="nk-block-des text-soft"><p>물품 상세 조회</p></div>
		</div>
	</div>
</div>

<div class="nk-block">
	<div class="card card-bordered card-stretch">
		<div class="card-inner-group">
			<div class="container">
				<div class="short-description">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="product-thumbnail">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="thumb-main-image">
											<a href="">
												<img src="${pageContext.request.contextPath}/products-img/${ goodsDomain.img }" alt="">
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<h1 class="product-title">
								<c:out value="${ goodsDomain.title }"/></h1>
								<h3><c:if test="${goodsDomain.flagDelete }"><font style="color:#ff0000">(삭제됨)</font></c:if></h3>
								<div class="price">
									<span><fmt:formatNumber value="${goodsDomain.price }" pattern="#,###" />원</span>
								</div>
								<div class="col-md-9 col-sm-9">
									<ul class="product-info-btn">
										<li>
											<a>
												<i class="fa fa-heart-o"></i> <c:out value="${ goodsDomain.steamCnt}"/> </a>
										</li>
										<li>
											<a>
												<i class="fa fa-eye"></i> <c:out value="${ goodsDomain.cnt}"/> </a>
										</li>
										<li>
											<a>
												<i class="fa fa-clock-o"></i> ${goodsDomain.timeAgo} </a>
										</li>
									</ul>
								</div>
								<div class="product-info-status">
									<ul>
										<li>상품상태 :<span class="strong-text">
										<c:choose>
											<c:when test="${goodsDomain.qualityCode eq 1}">새상품(미사용)</c:when>
											<c:when test="${goodsDomain.qualityCode eq 2}">사용감없음</c:when>
											<c:when test="${goodsDomain.qualityCode eq 3}">사용감적음</c:when>
											<c:when test="${goodsDomain.qualityCode eq 4}">사용감많음</c:when>
											<c:when test="${goodsDomain.qualityCode eq 5}">고장/파손 상품</c:when>
										</c:choose>
										</span>
										</li>
										<li>배송비 : <span class="strong-text">${goodsDomain.deliveryFee}</span>
										</li>
										<li>직거래지역 : <span class="strong-text">${goodsDomain.location}</span>
										</li>
									</ul>
								</div>
								<div class="wish-talk-btn">
									<input type="button" id="btnDelete" class="btn btn-danger" value="삭제하기">
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr/>
				<div class="container">
					<div class="row">
						<div class="row g-gs">
							<div class="col-md-7">
								<div class="product-desc">
									<h3>상품정보</h3>
									<p> ${goodsDomain.detail} </p>
								</div>
							</div>
							<div class="col-md-5 border">
								<div class="product-desc ">
									<h3>판매자 정보</h3>
								</div>
								<div class="product-sellerStyle">
									<button class="store-btn">
										<div class="profile">
											<img class="profile-pic" src="${pageContext.request.contextPath}/profile-img/${ goodsDomain.profileImg }" alt="판매하기 이미지">
											<c:choose>
												<c:when test="${goodsDomain.profileImg eq null or goodsDomain.profileImg eq '' }">
													<img class="buyer-pic" src="${pageContext.request.contextPath}/common/images/default.png" alt="판매하기 이미지">
												</c:when>
												<c:when test="${ fn:startsWith(goodsDomain.profileImg, 'http')}">
													<img class="buyer-pic" src="${goodsDomain.profileImg}" alt="판매하기 이미지">
												</c:when>
												<c:otherwise>
													<img class="buyer-pic" src="${pageContext.request.contextPath}/profile-img/${ goodsDomain.profileImg }" alt="판매하기 이미지">
												</c:otherwise>
											</c:choose>
										</div> <c:out value="${goodsDomain.nickSell}"/>
									</button>
									<div class="seller-other-products">
										<c:choose>
											<c:when test="${requestScope.listOtherGoods eq null or fn:length(requestScope.listOtherGoods) eq 0}">
												<h6>판매자의 다른 상품이 없습니다</h6>
											</c:when>
											<c:otherwise>
												<c:forEach var="otherGoodsDomain" items="#{requestScope.listOtherGoods }" varStatus="i">
													<div class="other-product">
														<a href="${pageContext.request.contextPath}/mgr/goods/mgr_goods_detail_frm.do?&goodsNum=${otherGoodsDomain.goodsNum}">
															<img src="${pageContext.request.contextPath}/products-img/${ otherGoodsDomain.img }" alt="" class="other-product-thumbnail">
															<span class="other-product-price"><fmt:formatNumber value="${otherGoodsDomain.price }" pattern="#,###" />원</span>
														</a>
													</div>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="other-products-more">
										<a href="${pageContext.request.contextPath}/mgr/goods/mgr_goods_list_frm.do?field=0&keyword=${goodsDomain.nickSell}">판매자의 상품 더보기 ></a>
									</div>
								</div>
								<div class="product-desc">
									<h3>상점후기</h3>
								</div>
								<div class="product-reviewStyle">
									<c:choose>
										<c:when test="${requestScope.listSellerReview eq null or fn:length(requestScope.listSellerReview) eq 0}">
											<h6>등록된 후기가 없습니다</h6>
										</c:when>
										<c:otherwise>
											<c:forEach var="sellerReviewDomain" items="${requestScope.listSellerReview }" varStatus="i">
												<div class="one-review">
													<button class="buyer-btn">
														<div class="buyer-profile">
															<c:choose>
																<c:when test="${sellerReviewDomain.img eq null or sellerReviewDomain.img eq '' }">
																	<img class="buyer-pic" src="${pageContext.request.contextPath}/common/images/default.png" alt="판매하기 이미지">
																</c:when>
																<c:when test="${ fn:startsWith(sellerReviewDomain.img, 'http')}">
																	<img class="buyer-pic" src="${sellerReviewDomain.img}" alt="판매하기 이미지">
																</c:when>
																<c:otherwise>
																	<img class="buyer-pic" src="${pageContext.request.contextPath}/profile-img/${ sellerReviewDomain.img }" alt="판매하기 이미지">
																</c:otherwise>
															</c:choose>
														</div> <c:out value="${sellerReviewDomain.nick }"/>
													</button>
													<div class="ratings">
														<c:forEach begin="1" end="${sellerReviewDomain.star }" varStatus="j">
														<i class="fa fa-star"></i>
														</c:forEach>
														<p class="review-time-ago" style="float: right;">${sellerReviewDomain.timeAgo }</p>
													</div>
													<p><c:out value="${sellerReviewDomain.content }"/></p>
												</div>
											</c:forEach>
											<div class="review-more">
												<a href="${pageContext.request.contextPath}/mgr/review/mgr_review_list_frm.do?field=2&keyword=${goodsDomain.nickSell}">상점후기 더보기 ></a>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12" style="margin:0px auto; padding-top:10px;">
					<div class="card card-inner">
						<div class="form-group text-center">
							<button type="button" class="btn btn-light btn-lg" id="btnClose">목록으로</button>
						</div>
					</div>
				</div>
			</div>
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
<!-- <script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script> -->
<%-- <script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/bundle_beauty_my.js?ver=3.2.3"></script> --%>
<%-- <script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script> --%>
<!-- <script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<%-- <script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script> --%>
<%-- <script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script> --%>
<div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div>
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-goods").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>