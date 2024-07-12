<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
jQuery(document).ready(function($) {
	//검색버튼 클릭
	$("#search-btn").click(function(){
		//검색어가 없는 경우 아무일도 안 일어나지 않음.
		if($("#searchKey").val().trim()==""){
			return;//함수 종료.
		}else{
			searchPrd();
		}
	});
	
	//카테고리 로드
	loadCategories();
	
	//카테고리 토글
	$(".category-btn").click(function() {
		//카테고리 show 있는 경우
		if ($(".categories").hasClass("show")) {
			$(".categories").removeClass("show");
			$(".category-detail").removeClass("show");
			$(".fa-bars").removeClass("color-change");
		} else {
		//카테고리 show 없는 경우
			$(".categories").addClass("show");
			// .categories에 show 클래스가 있으면 .fa-bars에 color-change 클래스를 추가
			$(".fa-bars").addClass("color-change");
		}
	});//click

	//카테고리 상세 보이기
	$(".category-ul").on("mouseenter", "li", function() {
		//부모의 카테고리번호 가져오기
		var parentCategory = $(this).find(".parent-category").data("parentid");
		loadSubCategories(parentCategory);
		//서브 카테고리 show
        $(".category-detail").addClass("show");
	});//mouseenter
	
	//카테고리 상세 안 보이기
	$(".detail-ul").on("mouseleave", function() {
		$(".category-detail").removeClass("show");
	});//mouseleave
	
	//스크롤의 위치에 따라 카테고리 위치 변경
	$(window).scroll(function() {
		var scrollPosition = $(window).scrollTop();
		var topPosition = (scrollPosition > 8) ? '145px' : '216px';

		$(".categories, .category-detail").css({
			top: topPosition
		});
	});//scroll

	//이벤트 버튼
	$(".event-btn").click(function(){
		location.href="${pageContext.request.contextPath}/event_page/event_main.do";
	});
	
	//로그인 버튼
	$(".login-btn").click(function() {
        $.ajax({
            url: '${pageContext.request.contextPath}/login_page/login_page.do',
            type: 'GET',
            success: function(data) {
                $('#popupModal .modal-body').html(data);
                $('#popupModal').modal('show');
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            }
        });
	});
});//ready

//검색창 엔터키
function enterkey(event){
	if (event.which == 13) {
		event.preventDefault();//폼이 제출되지 않게 이벤트 기본동작 중단.
		if($("#searchKey").val().trim()==""){
			//검색어가 없는 경우 아무일도 안 일어나지 않음.
		}else{
			searchPrd();
		}
	}//end if
}//enterkey

//키워드로 검색하기
function searchPrd(){
	var keyword = $("#searchKey").val().trim();
	location.href = '${pageContext.request.contextPath}/main_page/search_contents.do?kw=' + keyword;
}//searchPrd


//카테고리 로드
function loadCategories(){
$.ajax({
	type: 'GET',
	url: '${pageContext.request.contextPath}/parentCategory.do',
	dataType:"json",
	success: function(response){
		updateCategoryList(response);
	},
	error: function(xhr){
		console.log('대분류 카테고리 요청 실패', xhr.status);
	}
});//ajax
};//loadCategories

//카테고리 대분류 생성
function updateCategoryList(categories){
	var $ul = $(".category-ul");
	$ul.empty();
	
	//json parsing
	$.each(categories, function(index, item){
		var $li = $("<li>");
		var $a = $("<a>").attr("href", '${pageContext.request.contextPath}/isParentCategory.do?cn=' + item.categoryNum)
						.addClass("parent-category")
						.attr("data-parentid", item.categoryNum)
						.text(item.name);
		$li.append($a);
		$ul.append($li);				
	});
};//updateCategoryList

//서브 카테고리 로드
function loadSubCategories(parentCategory){
$.ajax({
	url:'${pageContext.request.contextPath}/subCategory.do', 
	type:'GET',
	dataType:'json',
	data:{ Category:parentCategory },
	success: function(response){
		updateSubCategoryList(response);
	},
	error:function(xhr){
		console.log('소분류 카테고리 요청 실패', xhr.status);
	}
});
};//loadSubCategories

////카테고리 소분류 생성
function updateSubCategoryList(categories){
	var $ul = $(".detail-ul");
	$ul.empty();
	
	//json parsing
	$.each(categories, function(index, item){
		var $li = $("<li>");
		var $a = $("<a>").attr("href", '${pageContext.request.contextPath}/isParentCategory.do?cn=' + item.categoryNum)
						.addClass("sub-category")
						.attr("data-value", item.categoryNum)
						.text(item.name);
		$li.append($a);
		$ul.append($li);
	});
};//updateSubCategoryList

</script>