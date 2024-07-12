<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
		$(function() {
			// Intersection Observer 옵션 설정
		    const options = {
		        root: null, // 타겟의 가시성을 뷰포트(Viewport)로 설정
		        rootMargin: "-100px 0px 0px 0px", // 뷰포트 주변의 여백 (상, 우, 하, 좌)
		        threshold: 0 // 타겟의 가시성이 0%일 때 콜백 실행
		    };

		    const observerIntersection = (callback) => {
		        const observer = new IntersectionObserver((entries) => {
		            entries.forEach(entry => {
		                if(entry.isIntersecting) {
		                    callback(); // 타겟이 감지되면 콜백 함수 호출
		                }
		            });
		        }, options);

		        return observer;
		    }

		    let page = 1; // 페이지 번호 초기화
		    let size = 10; // 한 페이지에 표시할 아이템 개수
		    const itemContainer = $('.single-products'); // 아이템을 추가할 div 컨테이너

		    const callNextPage = () => {
		        addList(); // 다음 페이지 아이템을 불러오는 함수 호출
		    };

		    const observer = observerIntersection(callNextPage); // Intersection Observer 생성 및 초기화

		    function addList() {
		    	//추가 리스트 불러오기
		        $.ajax({
		            url: 'infiniteScroll.do',
		            data: { page: page, size: size },
		            method: 'GET',
		            dataType: 'json',
		            beforeSend: function(){
		            	// AJAX 요청 전 로딩 표시
		            	$("#listEnd").after('<div class="loading-container" style="width: 100%; text-align: center;">' +
		                                    '<div class="loading"></div>' +
		                                    '<div id="loading-text">loading</div>' +
		                                    '</div>');
		            },
		            success: function(result) {
		            	console.log(result);
		                if(result.length === 0 || result == '') {
		                	// 리스트가 비어있으면 감지 div 숨기기
		                    $("#listEnd").hide();
		                } else {
		                	var newItems = '';
		                	// 결과 데이터를 반복 처리하여 아이템 생성 및 추가
		                    $.each(result, function(index, pd) {
		                    	newItems += '<div class="single-product prevent-overflow">' +
	                            '<div class="product-block">' +
	                            '<a href="main_page/products_detail.do?goodsNum=' + pd.goodsNum + '">' +
	                            '<img src="${pageContext.request.contextPath}/products-img/' + pd.imgName + '" alt="" class="thumbnail">' +
	                            '<div class="product-description">' +
	                            '<p class="title">' + pd.goodsName + '</p>' +
	                            '<div style="overflow: hidden;">' +
	                            '<p class="price" style="float: left;">' + pd.priceFm + '원</p>' +
	                            '<p class="location" style="float: left;"><i class="fa fa-map-marker" aria-hidden="true"></i>' + pd.locationStr + '</p>' +
	                            '<p class="time-ago" style="float: right;">' + pd.timeAgo + '</p>' +
	                            '</div>' +
	                            '</div>' +
	                            '</a>' +
	                            '</div>' +
	                            '</div>';
		                    });
		                        // 새로운 아이템을 컨테이너에 추가
		                        itemContainer.append(newItems);
							
							// 기존의 감지 div 삭제
		                    $("#listEnd").remove();
		                    // 새로운 감지 div 생성
		                    var newItem2 = '<div id="listEnd"></div>';
		                    // 새로운 감지 div를 컨테이너에 추가
		                    itemContainer.append(newItem2);
		                    page++; // 페이지 번호 증가

		                    // 새로운 #listEnd를 감지하기 위해 Intersection Observer 다시 설정
		                    observer.observe(document.querySelector("#listEnd"));
		                }//end else 리스트가 비어있지 않음.
		            },
		            error: function(xhr) {
		               console.log('추가 리스트 불러오기 실패', xhr.status);
		            },
		            complete: function () {
		            	// AJAX 요청 완료 후 로딩 숨김
		            	$(".loading-container").remove();
		            }
		        });
		    }
			
			// 초기에 #listEnd를 감시하기 위해 Intersection Observer 설정
		    observer.observe(document.querySelector("#listEnd"));
		    
		    
		    
		    
		    
		    
		    
		//****************** 퀵메뉴 js ****************************************//
		    var currentPosition = parseInt($(".quickmenu").css("top"));
		  	$(window).scroll(function() {
		    	var position = $(window).scrollTop(); 
		    	$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
		  	});//scroll
		});//ready

</script>
