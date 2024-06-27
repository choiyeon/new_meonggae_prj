<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="마이페이지 메인"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			location.href="http://localhost/meonggae_prj/index.do";
		</script>
	</c:when>
	<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<!-- header -->
<c:import url="http://localhost/meonggae_prj/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/CSS/style.css">
<link rel="stylesheet" href="http://localhost/meonggae_prj/common/My/css/style_mypage.css?">
<!-- CSS -->

<script type="text/javascript">
	$(function(){
		
	});//ready
</script>

<!-- 내용 시작 -->
<div class="container">
	<div id="mypageMenu" class="mypageMenu">
		<!-- 메뉴목록 -->
		<%
		String pageName = "mypage";
		pageContext.setAttribute("pageName", pageName);
		%>
		<%@ include file="../menuBar/mypageMenu.jsp" %>
		<hr id="menuBottonLine">
		<!-- 메뉴목록 -->
	</div>
		
	<a href="http://localhost/meonggae_prj/My/mypage/dibs/dibsGoods_frm.do">
	<div id="dibListTitle" class="dibList">♥ 찜 목록</div>
	</a>
	
	<div id="dibList" class="dibList">
	<c:choose>
	<c:when test="${not empty dibsList}">
	
		<div class="row">
			<div class="tab-content">
				<div class="tab-pane active" id="trending">
					<c:forEach items="${ dibsList }" var="is">
					<div class="col-md-3 col-sm-4">
						<div class="single-product">
							<div class="product-block">
								<a href="http://localhost/meonggae_prj/main_page/products_detail.do?goodsNum=${ is.goodsNum }">
									<img src="http://localhost/meonggae_prj/products-img/${ is.img }" class="thumbnail">
									<div class="product-description text-left">
										<p class="title">${ is.name }</p>
										<div style="overflow: hidden;">
										<p class="price" style="float: left;">${ is.price }원</p>
										<p class="time-ago" style="float: right;">${ is.inputDate }</p>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="noGoodsDibs">
		찜한 상품이 없습니다!
		</div>
	</c:otherwise>
	</c:choose>
	</div>
	
	<a href="http://localhost/meonggae_prj/My/mypage/sales_list/soldDetails_frm.do">
	<div id="soldListTitle" class="soldList">판매 완료 목록</div>
	</a>
	
	<div id="soldList" class="soldList">
	<c:choose>
	<c:when test="${not empty soldList}">
	
		<div class="row">
			<div class="tab-content">
				<div class="tab-pane active" id="trending">
					<c:forEach items="${ soldList }" var="is">
					<div class="col-md-3 col-sm-4">
						<div class="single-product">
							<div class="product-block">
								<a href="http://localhost/meonggae_prj/main_page/products_detail.do?goodsNum=${ is.goodsNum }">
									<img src="http://localhost/meonggae_prj/products-img/${ is.img }" class="thumbnail">
									<div class="product-description text-left">
										<p class="title">${ is.name }</p>
										<div style="overflow: hidden;">
										<p class="price" style="float: left;">${ is.price }원</p>
										<p class="time-ago" style="float: right;">${ is.inputDate }</p>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="noGoodsSold">
		판매 완료된 상품이 없습니다!
		</div>
	</c:otherwise>
	</c:choose>
	</div>
	
	<a href="http://localhost/meonggae_prj/My/mypage/sales_list/boughtDetails_frm.do">
	<div id="boughtListTitle" class="boughtList">구매 완료 목록</div>
	</a>
	
	<div id="boughtList" class="boughtList">
	<c:choose>
	<c:when test="${not empty boughtList}">
	
		<div class="row">
			<div class="tab-content">
				<div class="tab-pane active" id="trending">
					<c:forEach items="${ boughtList }" var="is">
					<div class="col-md-3 col-sm-4">
						<div class="single-product">
							<div class="product-block">
								<a href="http://localhost/meonggae_prj/main_page/products_detail.do?goodsNum=${ is.goodsNum }">
									<img src="http://localhost/meonggae_prj/products-img/${ is.img }" class="thumbnail">
									<div class="product-description text-left">
										<p class="title">${ is.name }</p>
										<div style="overflow: hidden;">
										<p class="price" style="float: left;">${ is.price }원</p>
										<p class="time-ago" style="float: right;">${ is.inputDate }</p>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="noGoodsBought">
		구매 완료한 상품이 없습니다!
		</div>
	</c:otherwise>
	</c:choose>
	</div>
	
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:otherwise>
</c:choose>