<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="나의 후기"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 로그인 세션 설정 시작 -->
<c:choose>
	<c:when test="${ empty user }">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스입니다.");
			location.href="${pageContext.request.contextPath}/index.do";
		</script>
	</c:when>
	<c:otherwise>
<!-- 로그인 세션 설정 끝 -->

<!-- header -->
<c:import url="/common/My/css/css.jsp"/>
<c:import url="/WEB-INF/views/header/header.jsp"/>
<!-- header -->

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/My/css/style_mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/My/css/style_star.css?111">
<!-- CSS -->

<script type="text/javascript">
	var starScore = 0;

	$(function(){
		//X를 클릭하면 내용 리셋
		$("#reviewModal").on('hidden.bs.modal',function(e){
			$(this).find('form')[0].reset();
			$("#finalStarScore").text("별점을 입력해주세요!");
		});
		
		$("#reviewBtn").click(function(){
			if(!confirm("후기를 작성하시겠습니까?")){
				return;
			}//if
			
			$.ajax({
				url: "${pageContext.request.contextPath}/My/mypage/review/write_review.do",
				type: "POST",
				dataType: "JSON",
				data: {
					goodsNum: $("#goodsNum").val(),
					reivewContents: $("#reivewContents").val(),
					starScore: starScore
					},
				error: function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
				success: function(data){
					var result = data.result;
					
					if(result == "success"){
						alert("후기가 작성되었습니다");
						location.reload();
					}else if(result == "noSession"){
						alert("로그인이 필요한 서비스입니다.");
						location.href="${pageContext.request.contextPath}/index.do";
					}else{
						alert("오류가 발생하였습니다. 잠시 후에 다시 시도해주세요.");
					}//else
				}//success
			});//ajax
		});//click
		
	});//ready
	
	function star(score){
		starScore = score;
		
		output = score + "점";
		$("#finalStarScore").html(output);
		
	}//star
	
	function insertReview(goodsName, goodsNum) {
		var output = "구매 물품명 : " + goodsName;
		$("#boughtGoods").html(output);
		$("#goodsNum").val(goodsNum);
		$("#reviewModal").modal("show");
	}//insertReview
	
	function deleteReview(goodsNum) {
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}//if
		
		$.ajax({
			url: "${pageContext.request.contextPath}/My/mypage/review/delete_review_process.do",
			type: "POST",
			dataType: "JSON",
			data: {sendData : goodsNum},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success: function(data){
				var result = data.result;
				if(result = "true"){
					alert("삭제되었습니다.");
					location.reload();
				}else if(result == "noSession"){
					alert("로그인이 필요한 서비스입니다.");
					location.href="${pageContext.request.contextPath}/index.do";
				}else{
					alert("오류가 발생하였습니다. 다시 시도해주세요.");
				}//else
			}//success
		});//ajax
		
	}//deleteReview
</script>

<!-- 내용 시작 -->
<div class="container">
	<div id="mypageMenu" class="mypageMenu">
		<!-- 메뉴목록 -->
		<%
		String pageName = "review";
		pageContext.setAttribute("pageName", pageName);
		%>
		<%@ include file="../menuBar/mypageMenu.jsp" %>
		<div id="lowMenu" class="lowMenu">나의 후기</div>
		<hr id="menuBottonLine">
		<!-- 메뉴목록 -->
	</div>
		<div id="reviewLowMenu1" class="reviewLowMenu1">내가 쓴 후기</div>
		<div id="notice1" class="notice1">한번 작성한 후기는 수정할 수 없습니다.</div>
		
		<c:choose>
		<c:when test="${not empty myReviewList}">
		<table id="inquiryTable" class="table table-hover">
			<thead>
				<tr>
					<td style="width: 50%">후기</td>
					<td style="width: 8%">별점</td>
					<td style="width: 20%">거래자</td>
					<td style="width: 15%">작성일</td>
					<td style="width: 7%">삭제</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ myReviewList }" var="mr">
				<tr>
					<td><c:out value="${ mr.reviewContents }"/></td>
					<td>★<c:out value="${ mr.starScore }"/></td>
					<td><c:out value="${ mr.seller }"/></td>
					<td><fmt:formatDate value="${ mr.inputDate }" pattern="yyyy-MM-dd"/></td>
					<td>
					<input type="button" value="X" class="btn btn-danger btn-sm"
							onclick="deleteReview(${ mr.goodsNum })"/>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${ not empty pagination }">
			<div class="pagination" style="display: flex; justify-content: center;">${ pagination }</div>
		</c:if>
		</c:when>
		<c:otherwise>
			<div class="noGoodsDibs">
			작성한 리뷰가 없습니다!
			</div>
		</c:otherwise>
		</c:choose>
		
		<div id="reviewLowMenu2" class="reviewLowMenu2">작성 가능한 후기</div>
		
		<c:choose>
		<c:when test="${not empty writeReviewList}">
		<table id="inquiryTable" class="table table-hover">
			<thead>
				<tr>
					<td style="width: 80%">구매물품</td>
					<td style="width: 20%">거래자</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ writeReviewList }" var="wr">
				<tr>
					<td>
					<a href="javascript:void(0);" onclick="insertReview('${ wr.goodsName }', '${ wr.goodsNum }');">
					<c:out value="${ wr.goodsName }"/>
					</a>
					</td>
					<td><c:out value="${ wr.seller }"/></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:when>
		<c:otherwise>
			<div class="noGoodsDibs">
			작성 가능한 리뷰가 없습니다!
			</div>
		</c:otherwise>
		</c:choose>
		
		<!-- 리뷰작성 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="reviewModal" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h3><strong>후기 작성</strong></h3>
						<h5>별점과 한줄 후기를 남겨주세요!</h5>
						<div id="boughtGoods"></div>
					</div>
					<div class="modal-body">
						<form>
						<div class="starWrap">
							<div class="star-rating space-x-4 mx-auto">
								<input type="radio" id="5-stars" name="rating" value="5" onclick="star(5);"/>
								<label for="5-stars" class="star pr-4">★</label>
								<input type="radio" id="4-stars" name="rating" value="4" onclick="star(4);"/>
								<label for="4-stars" class="star">★</label>
								<input type="radio" id="3-stars" name="rating" value="3" onclick="star(3);"/>
								<label for="3-stars" class="star">★</label>
								<input type="radio" id="2-stars" name="rating" value="2" onclick="star(2);"/>
								<label for="2-stars" class="star">★</label>
								<input type="radio" id="1-star" name="rating" value="1" onclick="star(1);"/>
								<label for="1-star" class="star">★</label>
							</div>
							<div id="finalStarScore">별점을 입력해주세요!</div>
							<input type="hidden" id="goodsNum" name="goodsNum" value=""/>
							<input type="text" placeholder="한줄 후기를 작성해주세요." maxlength="1000" name="reivewContents" id="reivewContents"/><br/>
						</div>
						</form>
					</div>
					<div class="modal-footer">
						<div style="text-align: center">
							<input type="button" class="btn btn-success" data-dismiss="modal" id="reviewBtn" name="reviewBtn" value="후기작성"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 리뷰작성 -->
</div>
<!-- 내용 끝 -->

<!-- footer -->
<c:import url="/WEB-INF/views/footer/footer.jsp"/>
<!-- footer -->

	</c:otherwise>
</c:choose>