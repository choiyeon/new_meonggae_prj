<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	info="관리자 - 대시보드"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-06-01
*/%>

<c:set var="date" value="<%=new java.util.Date()%>" />
<c:set var="dateLastMonth" value="<%=new java.util.Date(new java.util.Date().getTime() - 60*60*24*1000*30L)%>"/>
<c:set var="strDate"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd" /></c:set>
<c:set var="strDateLastMonth"><fmt:formatDate value="${dateLastMonth}" pattern="yyyy-MM-dd"/></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터 관리자</title>
<link rel="icon" href="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/images/favicon.png"/>
<!--bootstrap 시작-->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
<!--bootstrap 끝-->

<!-- dashlite css 시작-->
<link rel="stylesheet" href="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<!--dashlite css 끝-->

<!-- <link rel="stylesheet" href="http://192.168.10.214${pageContext.request.contextPath}/common/css/board.css" type="text/css" media="all" /> -->
<!-- <link rel="stylesheet" href="http://192.168.10.214${pageContext.request.contextPath}/common/css/main.css" type="text/css" media="all" /> -->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<!-- datepicker 시작-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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

<!-- chart.js 시작 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script> -->
<!-- chart.js 끝 -->




<style type="text/css">

	/* datepicker 아이콘 가져오기 */
   .ui-widget-header .ui-icon { background-image: url('http://192.168.10.214${pageContext.request.contextPath}/mgr_common/images/btns.png'); } 
    
</style>

<script type="text/javascript">

	$(function() {
		
		// 상위 거래 카테고리 select
		topCategory();
		// 사용자수 요약 select
		userSummary();
		// 이벤트 조회수 현황
		eventView();
		// 신고 현황
		reportRecent();
		// 사이트 방문자수
		visitorStatistics();
		
		// 상위 거래 카테고리 select
		$("#cateTopSel").change(function() {
			topCategory();
		}); // change
		
		// 사용자수 요약 select
		$("#userSummarySel").change(function() {
			userSummary();
		}); // change
		
		// 이벤트 조회수 현황 select
		$("#eventViewSel").change(function() {
			eventView();
		}); // change
		
		// 사이트 방문자수
		$(".visitors").change(function() {
			visitorStatistics();
		}); // chang
		
		// 사이트 방문자수 datepicker 시작일
	//		$("#visitorStartDate").change(function() {
	//			chkOverToday($("#visitorStartDate"), $("#visitorEndDate"));
	//			chkStartLessThenEnd($("#visitorStartDate"), $("#visitorEndDate"));
	//		});
		// 사이트 방문자수 datepicker 종료일
	//		$("#visitorEndDate").change(function() {
	//			chkOverToday($("#visitorStartDate"), $("#visitorEndDate"));
	//			chkEndGreaterThenStart($("#visitorStartDate"), $("#visitorEndDate"));
	//		});
		
	}); // $(document).ready(function() { })
	
	// 상위 거래 카테고리
	function topCategory() {
		callAjaxTopCategory();
	} // topCategory
	
	// 사용자수 요약
	function userSummary() {
		callAjaxUserSummary();
	} // userSummary
	
	// 이벤트 조회수 현황
	function eventView() {
		callAjaxEventView();
	} // eventView
	
	// 신고 현황
	function reportRecent() {
		callAjaxReportRecent();
	} // reportRecent
	
	// 사이트 방문자수
	function visitorStatistics() {
		callAjaxVisitorStatistics();
	} // visitorStatistics
	
	// 상위 거래 카테고리 - ajax
	function callAjaxTopCategory() {
		var param = {
				period: $("#cateTopSel").val()
		}
		$.ajax({
			url: "http://localhost${pageContext.request.contextPath}/mgr/dashboard/top_category.do",
			type: "GET",
			data: param,
			dataType: "JSON",
			error: function(xhr) {
				console.log(xhr.status + " / " + xhr.statusText);
				alert("문제가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다");
			}, 
			success: function(jsonObj) {
				$("#totalTradeCnt").html(jsonObj.data.totalTradeCnt);
				//console.log(jsonObj);
				applyViewTopCategory(jsonObj);
			} // success
		}); // ajax
	} // callAjaxTopCategory
	
	// 사용자수 요약 - ajax
	function callAjaxUserSummary() {
		var param = {
				period: $("#userSummarySel").val()
		}
		$.ajax({
			url: "http://localhost${pageContext.request.contextPath}/mgr/dashboard/user_summary.do",
			type: "GET",
			data: param,
			dataType: "JSON",
			error: function(xhr) {
				console.log(xhr.status + " / " + xhr.statusText);
				alert("문제가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다");
			}, 
			success: function(jsonObj) {
				//console.log(jsonObj);
				//console.log(JSON.parse(jsonObj.data));
				applyViewUserSummary(jsonObj);
			} // success
		}); // ajax
	} // callAjaxUserSummary
	
	// 이벤트 조회수 현황 - ajax
	function callAjaxEventView() {
		var param = {
				type: $("#eventViewSel").val()
		}
		$.ajax({
			url: "http://localhost${pageContext.request.contextPath}/mgr/dashboard/event_view.do",
			type: "GET",
			data: param,
			dataType: "JSON",
			error: function(xhr) {
				console.log(xhr.status + " / " + xhr.statusText);
				alert("문제가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다");
			}, 
			success: function(jsonObj) {
				//console.log(jsonObj);
				//console.log(JSON.parse(jsonObj.data));
				applyViewEventView(jsonObj);
			} // success
		}); // ajax
	} // callAjaxEventView
	
	// 신고 현황 - ajax 
	function callAjaxReportRecent() {
		$.ajax({
			url: "http://localhost${pageContext.request.contextPath}/mgr/dashboard/report_recent.do",
			type: "GET",
			dataType: "JSON",
			error: function(xhr) {
				console.log(xhr.status + " / " + xhr.statusText);
				alert("문제가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다");
			}, 
			success: function(jsonObj) {
				//console.log(jsonObj);
				//console.log(JSON.parse(jsonObj.data));
				applyViewReportRecent(jsonObj);
			} // success
		}); // ajax
	} // callAjaxReportRecent
	
	// 사이트 방문자수 - ajax 
	function callAjaxVisitorStatistics() {
		var param = {
				visitorStartDate: $("#visitorStartDate").val(),
				visitorEndDate: $("#visitorEndDate").val(),
				visitorSel: $("#visitorSel").val()
		}
		$.ajax({
			url: "http://localhost${pageContext.request.contextPath}/mgr/dashboard/visitor_statistics.do",
			type: "GET",
			dataType: "JSON",
			data: param,
			error: function(xhr) {
				console.log(xhr.status + " / " + xhr.statusText);
				//alert("문제가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다");
			}, 
			success: function(jsonObj) {
				//console.log(jsonObj);
				//console.log(JSON.parse(jsonObj.data));
				applyViewVisitorStatistics(jsonObj);
				drawGraphVisitorStatistics(jsonObj);
			} // success
		}); // ajax
	} // callAjaxVisitorStatistics
	
	// 상위 거래 카테고리 - ajax 결과를 뷰에 적용
	function applyViewTopCategory (jsonObj) {
		let totalData = 0;
		let arrData = new Array();
		for(let i = 0; i < jsonObj.data.graph.length; i++) {
			totalData += jsonObj.data.graph[i].tradeCnt;
			arrData[i] = jsonObj.data.graph[i].tradeCnt;
		} // end for
		if (totalData == 0 && jsonObj.data.graph.length > 0) {
			for(i = 0; i < jsonObj.data.graph.length; i++) {
				arrData[i] = -1;
			} // end for
		} // end if
		var categoryData = {
				labels: [jsonObj.data.graph[0].categoryName, jsonObj.data.graph[1].categoryName, jsonObj.data.graph[2].categoryName, jsonObj.data.graph[3].categoryName],
				dataUnit: "건",
				legend: !1,
				datasets: [{
					borderColor: "#fff",
					backgroundColor: ["#798bff", "#b8acff", "#ffa9ce", "#f9db7b"],
					data: arrData
				}]
			};
		
		var selectCanvas = $("#topCategoryGraph");
		let chartStatus = Chart.getChart(selectCanvas);
		if(chartStatus !== undefined) {
			chartStatus.destroy();
		} // end if
		
		var chart = new Chart(selectCanvas, {
			type: "doughnut",
			data: {
				labels: categoryData.labels,
				datasets: categoryData.datasets
			},
			options: {
				plugins: {
					legend: {
						display: categoryData.legend || !1,
						labels: {
							boxWidth: 12,
							padding: 20,
							color: "#6783b8"
						}
					},
					tooltip: {
						enabled: totalData != 0 ? !0 : 0,
						rtl: true,
						callbacks: {
							label: function(a) {
								return "".concat(a.parsed, " ").concat(categoryData.dataUnit)
							}
						},
						backgroundColor: "#fff",
						borderColor: "#eff6ff",
						borderWidth: 2,
						titleFont: {
							size: 13
						},
						titleColor: "#6783b8",
						titleMarginBottom: 6,
						bodyColor: "#9eaecf",
						bodyFont: {
							size: 12
						},
						bodySpacing: 4,
						padding: 10,
						footerMarginTop: 0,
						displayColors: !1
					}
				},
				rotation: -1.5,
				cutoutPercentage: 70,
				maintainAspectRatio: !1
			} // end option
		}); // end chart
		
		let topCategoryLabel = $(".topCategoryLabel");
		let topCategoryValue = $(".topCategoryValue");
		for(i = 0; i < topCategoryLabel.length; i++) {
			$(topCategoryLabel[i]).html(jsonObj.data.graph[i].categoryName);
			$(topCategoryValue[i]).html(jsonObj.data.graph[i].tradeCnt + " <small>" + jsonObj.data.graph[i].tradePercent + "%</small>");
		} // end for
	} // applyViewTopCategory
	
	// 사용자수 요약 - ajax 결과를 뷰에 적용
	function applyViewUserSummary(jsonObj) {
		jsonData = JSON.parse(jsonObj.data);
		
		let sel = $("#userSummarySel").val();
		let colArr2d = [
			['오늘', '어제', '전일 대비'],
			['이번주', '저번주', '전주 대비'],
			['이번달', '저번달', '전달 대비']
		];
		let colArr = colArr2d[sel == 1 ? 0 : sel == 7 ? 1 : 2];
		
		let userSummaryCol =  $(".userSummaryCol");
		let userSummaryCntNow = $(".userSummaryCntNow");
		let userSummaryCntPrev = $(".userSummaryCntPrev");
		let userSummaryPercent = $(".userSummaryPercent");
		
		for(let i = 0; i < 3; i++) {
			$(userSummaryCol[i]).html(colArr[i]);
		} // end for

		let ratioChange = '';
		for(i = 0; i < 4; i++) {
			$(userSummaryCntNow[i]).html(jsonData[i].cnt_now);
			$(userSummaryCntPrev[i]).html(jsonData[i].cnt_prev);
			ratioChange = jsonData[i].ratio_change;
			if(ratioChange.startsWith('+')) {
				$(userSummaryPercent[i]).html('<span>' + ratioChange.substr(1) + '</span><span class="change down"><em class="icon ni ni-arrow-long-up"></em></span>');
			} else if(ratioChange.startsWith('-')) {
				$(userSummaryPercent[i]).html('<span>' + ratioChange.substr(1) + '</span><span class="change up"><em class="icon ni ni-arrow-long-down"></em></span>');
			} else if(ratioChange.startsWith('.')) {
				$(userSummaryPercent[i]).html('<span>-</span>');
			} else if(ratioChange.startsWith('*')) {
				$(userSummaryPercent[i]).html('<span>∞</span><span class="change down"><em class="icon ni ni-arrow-long-up"></em></span>');
			} else if(ratioChange.startsWith('/')) {
				$(userSummaryPercent[i]).html('<span>∞</span><span class="change up"><em class="icon ni ni-arrow-long-down"></em></span>');
			} // end else if
		} // end for
		drawGraphUserSummary(jsonData);
	} // applyViewUserSummary
	
	// 사용자수 요약 - 그래프
	function drawGraphUserSummary(jsonData, selector, set_data) {

		var canvasArr = $(".analytics-line-small");
		for(let i = 0; i < 4; i++) {
			let chartStatus = Chart.getChart($(canvasArr[i]));
			if(chartStatus !== undefined) {
				chartStatus.destroy();
			} // end if
		} // end for

		let colArr2nd = new Array();
		for(let j = 0; j < jsonData.length; j++) {
			let colArr = new Array();
			for(let i = 0; i < jsonData[j].graph.length; i++) {
				colArr[i] = jsonData[j].graph[i].col;
			} // end for
			colArr2nd[j] = colArr;
		} // end for
		
		let arrData2nd = new Array();
		for(let j = 0; j < jsonData.length; j++) {
			let arrData = new Array();
			k = 0;
			for(let i = 0; i < jsonData[j].graph.length; i++) {
				arrData[i] = jsonData[j].graph[i].cnt;
			} // end for
			arrData2nd[j] = arrData;
		} // end for
		//console.log('------');
		//console.log(arrData2nd);
		
		var OrganicSearchData = {
				labels: colArr2nd[0],
				dataUnit: "명",
				lineTension: .1,
				datasets: [{
					label: "Organic Search",
					color: "#798bff",
					background: 'rgb(121, 139, 255, 0.25)',
					data: arrData2nd[0]
				}]
			}, SocialMediaData = {
				labels: colArr2nd[1],
				dataUnit: "명",
				lineTension: .1,
				datasets: [{
					label: "Social Media",
					color: "#b8acff",
					background: 'rgb(184, 172, 255, 0.25)',
					data: arrData2nd[1]
				}]
			},
			ReferralsData = {
				labels: colArr2nd[2],
				dataUnit: "명",
				lineTension: .1,
				datasets: [{
					label: "Referrals",
					color: "#ffa9ce",
					background: 'rgb(255, 169, 206, 0.25)',
					data: arrData2nd[2]
				}]
			},
			OthersData = {
				labels: colArr2nd[3],
				dataUnit: "명",
				lineTension: .1,
				datasets: [{
					label: "Others",
					color: "#f9db7b",
					background: 'rgb(249, 219, 123, 0.25)',
					data: arrData2nd[3]
				}]
			}
		
		var $selector = $(selector || ".analytics-line-small");
		$selector.each(function() {
			for (var $self = $(this), _self_id = $self.attr("id"), _get_data = void 0 === set_data ? eval(_self_id) : set_data, selectCanvas = document.getElementById(_self_id).getContext("2d"), chart_data = [], i = 0; i < _get_data.datasets.length; i++) chart_data.push({
				label: _get_data.datasets[i].label,
				tension: _get_data.lineTension,
				backgroundColor: _get_data.datasets[i].background,
				fill: !0,
				borderWidth: 2,
				borderColor: _get_data.datasets[i].color,
				pointBorderColor: "transparent",
				pointBackgroundColor: "transparent",
				pointHoverBackgroundColor: "#fff",
				pointHoverBorderColor: _get_data.datasets[i].color,
				pointBorderWidth: 2,
				pointHoverRadius: 4,
				pointHoverBorderWidth: 2,
				pointRadius: 4,
				pointHitRadius: 4,
				data: _get_data.datasets[i].data
			});
			
			var chart = new Chart(selectCanvas, {
				type: "line",
				data: {
					labels: _get_data.labels,
					datasets: chart_data
				},
				options: {
					plugins: {
						legend: {
							display: _get_data.legend || !1,
							labels: {
								boxWidth: 12,
								padding: 20,
								color: "#6783b8"
							}
						},
						tooltip: {
							enabled: !0,
							//rtl: NioApp.State.isRTL,
							callbacks: {
								title: function() {
									return !1
								},
								label: function(a) {
									return "".concat(a.parsed.y, " ").concat(_get_data.dataUnit)
								}
							},
							backgroundColor: "#eff6ff",
							titleFont: {
								size: 11
							},
							titleColor: "#6783b8",
							titleMarginBottom: 6,
							bodyColor: "#9eaecf",
							bodyFont: {
								size: 9
							},
							bodySpacing: 4,
							padding: 6,
							footerMarginTop: 0,
							displayColors: !1
						}
					},
					maintainAspectRatio: !1,
					scales: {
						y: {
							display: !1,
							ticks: {
								beginAtZero: !1,
								font: {
									size: 12
								},
								color: "#9eaecf",
								padding: 0
							},
							grid: {
								color: 'rgb(82, 100, 132, 0.2)',
								tickLength: 0,
								zeroLineColor: 'rgb(82, 100, 132, 0.2)',
								drawTicks: !1
							}
						},
						x: {
							display: !1,
							ticks: {
								font: {
									size: 12
								},
								color: "#9eaecf",
								source: "auto",
								padding: 0,
								//reverse: NioApp.State.isRTL
							},
							grid: {
								color: "transparent",
								tickLength: 0,
								zeroLineColor: 'rgb(82, 100, 132, 0.2)',
								offset: !0,
								drawTicks: !1
							}
						}
					}
				}
			})
		})
	} // analyticsLineSmall

	// 이벤트 조회수 현황 - ajax 결과를 뷰에 적용
	function applyViewEventView(jsonObj) {
		let jsonData = JSON.parse(jsonObj.data);
		let output = '';
		if(jsonData.length == 0) {
			output += '<tr><td colspan="6">조회 결과 없음</td></tr>';
		} else {
			for(let i = 0; i < jsonData.length; i++) {
				output += '<tr><th scope="row">' + jsonData[i].rnum + '</th><td colspan="2">' + jsonData[i].title + '</td><td>' + jsonData[i].dateStart + '</td><td>' + jsonData[i].dateEnd + '</td><td>' + jsonData[i].cnt + '</td></tr>';
			} // end for
		} // end else
		$("#eventViewTbody").html(output);
	} // applyViewEventView
	
	// 신고 현황 - ajax 결과를 뷰에 적용
	function applyViewReportRecent(jsonObj){
		let jsonData = JSON.parse(jsonObj.data);

		let output = '';
		if(jsonData.length == 0) {
			output += '<td colspan="4">조회 결과 없음</td>';
		} else {
			for (let i = 0; i < jsonData.length; i++) {
				output += '<tr><th scope="row"><div class="user-avatar sm"><em class="icon ni ni-user-alt"></em></div></th><td>' + jsonData[i].storeName + '</td><td>' + jsonData[i].cnt + '</td><td>' + jsonData[i].dateReportRecent + '</td><td style="display:none;">' + jsonData[i].memNum + '</td><td style="display:none;">' + jsonData[i].repNum + '</td></tr>';
			} // end for
		} // end else
		$("#reportRecentTbody").html(output);
	} // applyViewReportRecent(jsonObj)

	// 사이트 방문자수 - ajax 결과를 뷰에 적용
	function applyViewVisitorStatistics(jsonObj) {
		let jsonData = JSON.parse(jsonObj.data);

		let colArr2nd = [
				[jsonData.userTotalCnt, jsonData.userTotalRatioChange],
				[jsonData.memberCnt, jsonData.memberRatioChange], 
				[jsonData.nonMemberCnt, jsonData.nonMemberRatioChange]
			];

		let visitorStatisticsValue = $(".visitorStatisticsValue");
		let visitorStatisticsPercent = $(".visitorStatisticsPercent");
		let ratioChange = '';
		for(let i = 0; i < 3; i++) {
			$(visitorStatisticsValue[i]).html(colArr2nd[i][0]);

			ratioChange = colArr2nd[i][1];
			if(ratioChange.startsWith('+')) {
				$(visitorStatisticsPercent[i]).html('<div class="change down"><em class="icon ni ni-arrow-long-up"></em>' + ratioChange.substr(1) + '</div>');
			} else if(ratioChange.startsWith('-')) {
				$(visitorStatisticsPercent[i]).html('<div class="change up"><em class="icon ni ni-arrow-long-down"></em>' + ratioChange.substr(1) + '</div>');
			} else if(ratioChange.startsWith('.')) {
				$(visitorStatisticsPercent[i]).html('<div class="change">-</div>');
			} else if(ratioChange.startsWith('*')) {
				$(visitorStatisticsPercent[i]).html('<div class="change down"><em class="icon ni ni-arrow-long-up"></em>∞</div>');
			} else if(ratioChange.startsWith('/')) {
				$(visitorStatisticsPercent[i]).html('<div class="change up"><em class="icon ni ni-arrow-long-down"></em>∞</div>');
			} // end else if
		} // end for
	} // applyViewVisitorStatistics

	// 사이트 방문자수 - 그래프
	function drawGraphVisitorStatistics(jsonObj, selector, set_data){
		let jsonData = JSON.parse(jsonObj.data);
		console.log(jsonObj);
		console.log(jsonData);

		var selectCanvas = $("#analyticOvData");
		let chartStatus = Chart.getChart(selectCanvas);
		if(chartStatus !== undefined) {
			chartStatus.destroy();
		} // end if

		let labelsArr = new Array();
		let allArr = new Array();
		let memArr = new Array();
		let nonMemArr = new Array();
		let dataLength = Object.keys(jsonData.graph).length
		for(let i = 0; i < dataLength; i++) {
			labelsArr[i] = jsonData.graph[i].col;
			allArr[i] = jsonData.graph[i].allCnt;
			memArr[i] = jsonData.graph[i].memCnt;
			nonMemArr[i] = jsonData.graph[i].nonMemCnt;
		} // end for

		if(dataLength > 2) {
			$("#visitorStatisticsAxis").html('<div class="chart-label">' + labelsArr[0] + '</div><div class="chart-label d-none d-sm-block">' + labelsArr[Math.floor(labelsArr.length / 2)] + '</div><div class="chart-label">' + labelsArr[labelsArr.length - 1] + '</div>');
		} else if (dataLength == 2) {
			$("#visitorStatisticsAxis").html('<div class="chart-label">' + labelsArr[0] + '</div><div class="chart-label d-none d-sm-block"></div><div class="chart-label">' + labelsArr[1] + '</div>');
		} else if (dataLength == 1) {
			$("#visitorStatisticsAxis").html('<div class="chart-label"></div><div class="chart-label d-none d-sm-block">' + labelsArr[0] + '</div><div class="chart-label"></div>');
		} 

	

		var analyticOvData = {
			labels: labelsArr,
			dataUnit: "명",
			lineTension: .1,
			datasets: [{
				label: "Current Month",
				color: "#c4cefe",
				dash: [5, 5],
				background: "transparent",
				data: nonMemArr
			}, {
				label: "Current Month",
				color: "#74B3F8",
				dash: [9, 9],
				background: "transparent",
				data: memArr
			}, {
				label: "Current Month",
				color: "#798bff",
				dash: [0, 0],
				background: "rgb(121, 139, 255, 0.15)",
				data: allArr
			}]
		};

		var $selector = $(selector || ".analytics-line-large");
		$selector.each(function() {
			for (var $self = $(this), _self_id = $self.attr("id"), _get_data = void 0 === set_data ? eval(_self_id) : set_data, selectCanvas = document.getElementById(_self_id).getContext("2d"), chart_data = [], i = 0; i < _get_data.datasets.length; i++) chart_data.push({
				label: _get_data.datasets[i].label,
				tension: _get_data.lineTension,
				backgroundColor: _get_data.datasets[i].background,
				fill: !0,
				borderWidth: 2,
				borderDash: _get_data.datasets[i].dash,
				borderColor: _get_data.datasets[i].color,
				pointBorderColor: "transparent",
				pointBackgroundColor: "transparent",
				pointHoverBackgroundColor: "#fff",
				pointHoverBorderColor: _get_data.datasets[i].color,
				pointBorderWidth: 2,
				pointHoverRadius: 4,
				pointHoverBorderWidth: 2,
				pointRadius: 4,
				pointHitRadius: 4,
				data: _get_data.datasets[i].data
			});
			var chart = new Chart(selectCanvas, {
				type: "line",
				data: {
					labels: _get_data.labels,
					datasets: chart_data
				},
				options: {
					plugins: {
						legend: {
							display: _get_data.legend || !1,
							labels: {
								boxWidth: 12,
								padding: 20,
								color: "#6783b8"
							}
						},
						tooltip: {
							enabled: !0,
							rtl: false,
							callbacks: {
								label: function(a) {
									return "".concat(a.parsed.y, " ").concat(_get_data.dataUnit)
								}
							},
							backgroundColor: "#fff",
							borderColor: "#eff6ff",
							borderWidth: 2,
							titleFont: {
								size: 13
							},
							titleColor: "#6783b8",
							titleMarginBottom: 6,
							bodyColor: "#9eaecf",
							bodyFont: {
								size: 12
							},
							bodySpacing: 4,
							padding: 10,
							footerMarginTop: 0,
							displayColors: !1
						}
					},
					maintainAspectRatio: !1,
					scales: {
						y: {
							display: !0,
							position: "left",
							ticks: {
								beginAtZero: !0,
								font: {
									size: 12
								},
								color: "#9eaecf",
								padding: 8,
								stepSize: 2400
							},
							grid: {
								color: "rgb(82, 100, 132, 0.2)",
								tickLength: 0,
								zeroLineColor: "rgb(82, 100, 132, 0.2)",
								drawTicks: !1
							}
						},
						x: {
							display: !1,
							ticks: {
								font: {
									size: 12
								},
								color: "#9eaecf",
								source: "auto",
								padding: 0,
								reverse: false
							},
							grid: {
								color: "transparent",
								tickLength: 0,
								zeroLineColor: "transparent",
								offset: !0,
								drawTicks: !1
							}
						}
					}
				}
			})
		})
	} // drawGraphVisitorStatistics
	











	
	
	
	
	
	
	
	
	
	
	// 날짜 선택 유효성 - 시작일이 종료일보다 작은지
	function chkStartLessThenEnd(dateStart, dateEnd) {
		let flag = true;
		if($(dateStart).val() > $(dateEnd).val()){
			$(dateStart).val( $(dateEnd).val());
			alert('시작일은 종료일보다 작아야합니다');
			flag = false;
		} // end if
		return flag;
	} // chkStartLessThenEnd
	
	// 날짜 선택 유효성 - 종료일이 시작일보다 큰지
	function chkEndGreaterThenStart(dateStart, dateEnd) {
		let flag = true;
		if($(dateEnd).val() < $(dateStart).val()){
			$(dateEnd).val( $(dateStart).val());
			alert('종료일은 시작일보다 커야합니다');
			flag = false;
		} // end if
		return flag;
	} // chkEndGreaterThenStart
	
	// 날짜 선택 유효성 - 선택 날짜가 오늘과 같거나 이전인지
	function chkOverToday(dateStart, dateEnd) {
		let flag = true;
		var now = new Date();
		var strNow = now.getFullYear() + '-' + lpad0(now.getMonth()+1) + '-' + lpad0(now.getDate());
		if($(dateStart).val() > strNow) {
			alert('오늘 날짜를 포함한 이전으로 선택해주세요');
			$(dateStart).val($(dateEnd).val());
			flag = false;
		} // end if
		if($(dateEnd).val() > strNow) {
			alert('오늘 날짜를 포함한 이전으로 선택 해주세요');
			$(dateEnd).val(strNow);
			flag = false;
		} // end if
		return flag;
	} // chkOverToday
	
	// 날짜 선택 유효성 - 0 붙이기
	function lpad0(number) {
		var temp = '';
		if(number < 10) {
			temp = '0' + number;
		} else { 
			temp = number;
		} // end else
		return temp;
	} // lpad0

</script>

</head>
<body class="nk-body bg-lighter npc-general has-sidebar no-touch nk-nio-theme">
<jsp:useBean id="mgr" class="com.store.meonggae.mgr.login.domain.MgrDomain" scope="session"/>
<jsp:setProperty property="*" name="mgr"/>
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
			<h3 class="nk-block-title page-title">대시보드</h3>
		</div>
	</div>
</div>
<div class="nk-block">
	<div class="row g-gs">
		<!-- 상위거래 카테고리 시작 -->
		<div class="col-xxl-6">
			<div class="card card-bordered h-100">
				<div class="card-inner">
					<div class="card-title-group pb-3 g-2">
						<div class="card-title card-title-sm">
							<h6 class="title">상위거래 카테고리</h6>
						</div>
						<div class="card-tools">
							<div class="drodown">
								<select class="btn btn-sm btn-outline-light" id="cateTopSel" >
									<option value="1">1 일</option>
									<option value="7">7 일</option>
									<option value="30" selected="selected">30 일</option>
								</select>
							</div>
						</div>						
					</div>
					<div class="traffic-channel">
						<div class="analytic-data analytic-ov-data">
							<div class="title">총 거래수</div>
							<div class="amount" id="totalTradeCnt"></div>
						</div>					
						<div class="traffic-channel-doughnut-ck">
							<!-- 상위 거래 카테고리 그래프 시작 -->
							<canvas class="analytics-doughnut" id="topCategoryGraph" style="display: block; box-sizing: border-box; height: 160px; width: 436px;" width="872" height="320"></canvas>
							<!-- 상위 거래 카테고리 그래프 끝 -->
						</div>
						<div class="traffic-channel-group g-2">
							<div class="traffic-channel-data">
								<div class="title">
									<span class="dot dot-lg sq" data-bg="#9cabff" style="background: rgb(156, 171, 255);"></span>
									<span class="topCategoryLabel"></span>
								</div>
								<div class="amount topCategoryValue"><small></small>
								</div>
							</div>
							<div class="traffic-channel-data">
								<div class="title">
									<span class="dot dot-lg sq" data-bg="#b8acff" style="background: rgb(184, 172, 255);"></span>
									<span class="topCategoryLabel"></span>
								</div>
								<div class="amount topCategoryValue"><small></small>
								</div>
							</div>
							<div class="traffic-channel-data">
								<div class="title">
									<span class="dot dot-lg sq" data-bg="#ffa9ce" style="background: rgb(255, 169, 206);"></span>
									<span class="topCategoryLabel"></span>
								</div>
								<div class="amount topCategoryValue"><small></small>
								</div>
							</div>
							<div class="traffic-channel-data">
								<div class="title">
									<span class="dot dot-lg sq" data-bg="#f9db7b" style="background: rgb(249, 219, 123);"></span>
									<span class="topCategoryLabel"></span>
								</div>
								<div class="amount topCategoryValue"><small></small>
								</div>
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>
		<!-- 상위거래 카테고리 끝 -->
		<!-- 사용자수 요약 시작 -->
		<div class="col-xxl-6">
			<div class="card card-bordered h-100">
				<div class="card-inner mb-n2">
					<div class="card-title-group">
						<div class="card-title card-title-sm">
							<h6 class="title">사용자수 요약</h6>
						</div>
						<div class="card-tools">
							<div class="drodown">
								<select class="btn btn-sm btn-outline-light" id="userSummarySel" >
									<option value="1">1 일</option>
									<option value="7">7 일</option>
									<option value="30" selected="selected">30 일</option>
								</select>
							</div>
						</div>	
					</div>
				</div>
				<div class="nk-tb-list is-loose traffic-channel-table">
					<div class="nk-tb-item nk-tb-head">
						<div class="nk-tb-col nk-tb-channel">
							<span>항목</span>
						</div>
						<div class="nk-tb-col nk-tb-sessions">
							<span class="userSummaryCol">오늘</span>
						</div>
						<div class="nk-tb-col nk-tb-prev-sessions">
							<span class="userSummaryCol">어제</span>
						</div>
						<div class="nk-tb-col nk-tb-change">
							<span class="userSummaryCol">전일 대비</span>
						</div>
						<div class="nk-tb-col nk-tb-trend tb-col-sm text-end">
							<span>추이</span>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col nk-tb-channel">
							<span class="tb-lead">방문자수</span>
						</div>
						<div class="nk-tb-col nk-tb-sessions">
							<span class="tb-sub tb-amount">
								<span class="userSummaryCntNow">4,305</span>
							</span>
						</div>
						<div class="nk-tb-col nk-tb-prev-sessions">
							<span class="tb-sub tb-amount">
								<span class="userSummaryCntPrev">4,129</span>
							</span>
						</div>
						<div class="nk-tb-col nk-tb-change">
							<span class="tb-sub userSummaryPercent">
								<span>4.29%</span>
								<span class="change up">
									<em class="icon ni ni-arrow-long-up"></em>
								</span>
							</span>
						</div>
						<div class="nk-tb-col nk-tb-trend text-end">
							<div class="traffic-channel-ck ms-auto">
								<canvas class="analytics-line-small" id="OrganicSearchData" style="display: block; box-sizing: border-box; height: 44px; width: 130px;" width="260" height="88"></canvas>
							</div>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col nk-tb-channel">
							<span class="tb-lead">회원수</span>
						</div>
						<div class="nk-tb-col nk-tb-sessions">
							<span class="tb-sub tb-amount">
								<span class="userSummaryCntNow">859</span>
							</span>
						</div>
						<div class="nk-tb-col nk-tb-prev-sessions">
							<span class="tb-sub tb-amount">
								<span class="userSummaryCntPrev">936</span>
							</span>
						</div>
						<div class="nk-tb-col nk-tb-change">
							<span class="tb-sub userSummaryPercent">
								<span>15.8%</span>
								<span class="change down">
									<em class="icon ni ni-arrow-long-down"></em>
								</span>
							</span>
						</div>
						<div class="nk-tb-col nk-tb-trend text-end">
							<div class="traffic-channel-ck ms-auto">
								<canvas class="analytics-line-small" id="SocialMediaData" style="display: block; box-sizing: border-box; height: 44px; width: 130px;" width="260" height="88"></canvas>
							</div>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col nk-tb-channel">
							<span class="tb-lead">가입자수</span>
						</div>
						<div class="nk-tb-col nk-tb-sessions">
							<span class="tb-sub tb-amount">
								<span class="userSummaryCntNow">482</span>
							</span>
						</div>
						<div class="nk-tb-col nk-tb-prev-sessions">
							<span class="tb-sub tb-amount">
								<span class="userSummaryCntPrev">793</span>
							</span>
						</div>
						<div class="nk-tb-col nk-tb-change">
							<span class="tb-sub userSummaryPercent">
								<span>41.3%</span>
								<span class="change down">
									<em class="icon ni ni-arrow-long-down"></em>
								</span>
							</span>
						</div>
						<div class="nk-tb-col nk-tb-trend text-end">
							<div class="traffic-channel-ck ms-auto">
								<canvas class="analytics-line-small" id="ReferralsData" style="display: block; box-sizing: border-box; height: 44px; width: 130px;" width="260" height="88"></canvas>
							</div>
						</div>
					</div>
					<div class="nk-tb-item">
						<div class="nk-tb-col nk-tb-channel">
							<span class="tb-lead">탈퇴자수</span>
						</div>
						<div class="nk-tb-col nk-tb-sessions">
							<span class="tb-sub tb-amount">
								<span class="userSummaryCntNow">138</span>
							</span>
						</div>
						<div class="nk-tb-col nk-tb-prev-sessions">
							<span class="tb-sub tb-amount">
								<span class="userSummaryCntPrev">97</span>
							</span>
						</div>
						<div class="nk-tb-col nk-tb-change">
							<span class="tb-sub userSummaryPercent">
								<span>12.6%</span>
								<span class="change up">
									<em class="icon ni ni-arrow-long-up"></em>
								</span>
							</span>
						</div>
						<div class="nk-tb-col nk-tb-trend text-end">
							<div class="traffic-channel-ck ms-auto">
								<canvas class="analytics-line-small" id="OthersData" style="display: block; box-sizing: border-box; height: 44px; width: 130px;" width="260" height="88"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
		<!-- 사용자수 요약 끝 -->
		<!-- 이벤트 조회수 현황 시작 -->
		<div class="col-xxl-6">
			<div class="card card-bordered h-100">
				<div class="card-inner mb-n2">
					<div class="card-title-group">
						<div class="card-title card-title-sm">
							<h6 class="title">이벤트 조회수 현황</h6>
						</div>
						<div class="card-tools">
							<div class="drodown">
								<select class="btn btn-sm btn-outline-light" id="eventViewSel" >
									<option value="0" selected="selected">진행중</option>
									<option value="1">종료됨</option>
									<option value="2">전체</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<table class="table">
					<thead class="table">
						<tr>
							<th scope="col">번호</th>
							<th scope="col" colspan="2">제목</th>
							<th scope="col">시작일</th>
							<th scope="col">종료일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody id="eventViewTbody">
						<tr>
							<th scope="row">1</th>
							<td colspan="2">이벤트 제목 1</td>
							<td>2024.06.02</td>
							<td>2024.07.15</td>
							<td>7777</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td colspan="2">이벤트 제목 2</td>
							<td>2024.06.02</td>
							<td>2024.07.15</td>
							<td>5555</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td colspan="2">이벤트 제목 3</td>
							<td>2024.06.02</td>
							<td>2024.07.15</td>
							<td>3333</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td colspan="2">이벤트 제목 4</td>
							<td>2024.06.02</td>
							<td>2024.07.15</td>
							<td>1111</td>
						</tr>
					</tbody>
				</table>
			</div>		
		</div>
		<!-- 이벤트 조회수 현황 끝 -->
		<!-- 신고 현황 시작 -->
		<div class="col-xxl-6">
			<div class="card card-bordered h-100">
				<div class="card-inner mb-n2">
					<div class="card-title-group">
						<div class="card-title card-title-sm">
							<h6 class="title">신고 현황</h6>
						</div>
					</div>
				</div>
				<table class="table">
					<thead class="table">
						<tr>
							<th scope="col" colspan="2" class="text-center">상점명</th>
							<th scope="col">총 신고 수</th>
							<th scope="col">최근 신고일</th>
							<th scope="col" style="display:none;"></th>
							<th scope="col" style="display:none;"></th>
						</tr>
					</thead>
					<tbody id="reportRecentTbody">
						<tr>
							<th scope="row"><div class="user-avatar sm"><em class="icon ni ni-user-alt"></em></div></th>
							<td>가나다라 상점</td>
							<td>5</td>
							<td>2024.06.02 15:23</td>
						</tr>
						<tr>
							<th scope="row"><div class="user-avatar sm"><em class="icon ni ni-user-alt"></em></div></th>
							<td>ABCD 상점</td>
							<td>4</td>
							<td>2024.06.01 14:23</td>
						</tr>
						<tr>
							<th scope="row"><div class="user-avatar sm"><em class="icon ni ni-user-alt"></em></div></th>
							<td>테스트 상점</td>
							<td>3</td>
							<td>2024.06.01 12:23</td>
						</tr>
					</tbody>
				</table>
			</div>		
		</div>
		<!-- 신고 현황 끝 -->
		<!-- 사이트 방문자수 시작 -->
		<div class="col-xxl-12">
			<div class="card card-bordered h-100">
				<div class="card-inner">
					<div class="card-title-group pb-3 g-2">
						<div class="card-title card-title-sm">
							<h6 class="title">사이트 방문자수</h6>
						</div>
						<div class="card-tools shrink-0 d-none d-sm-block">
							<ul class="nav nav-switch-s2 nav-tabs bg-white">
								<li class="nav-item">
									<div class="form-group">
										<div class="form-control-wrap">
											<div class="input-daterange date-picker-range input-group" style="float:left; width:300px;">
												<div class="input-group-addon">시작일</div>
												<div class="form-control-wrap">
<!-- 													<div class="form-icon form-icon-left"><em class="icon ni ni-calendar"></em></div> -->
													<input type="text" id="visitorStartDate" class="form-control datepicker visitors" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${strDateLastMonth }"/>
<%-- 													<input type="text" id="visitorStartDate" class="form-control date-picker datepicker visitors" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${strDateLastMonth }"/> --%>
												</div>
											</div>
											<div class="input-daterange date-picker-range input-group" style="float:left;width:300px;margin-left:10px;">
<!-- 											<div class="input-daterange date-picker-range input-group" style="float:left;width:300px;"> -->
										
												<div class="input-group-addon">종료일</div>
												<div class="form-control-wrap">
													<div class="form-icon form-icon-left"><em class="icon ni ni-calendar"></em></div>
													<input type="text" id="visitorEndDate" class="form-control datepicker visitors" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${strDate }"/>
<%-- 													<input type="text" id="visitorEndDate" class="form-control date-picker datepicker visitors" readonly="readonly" data-date-format="yyyy-mm-dd" maxlength="10" value="${strDate }"/> --%>
												</div>
											
											</div>
										</div>
									</div>
								</li>
								<li class="nav-item" style="margin-left:10px;">
<!-- 								<li class="nav-item"> -->
									<div class="card-title-group pb-3 g-2">
										<div class="card-title card-title-sm">
											<h6 class="title">간격</h6>
										</div>
										<div class="card-tools">
											<div class="drodown">
												<select class="btn btn-sm btn-outline-light visitors" id="visitorSel" >
													<option value="0" selected="selected">일</option>
													<option value="1">주</option>
													<option value="2">월</option>
												</select>
											</div>
										</div>						
									</div>								
								</li>
							</ul>
						</div>
					</div>
					<div class="analytic-ov">
						<div class="analytic-data-group analytic-ov-group g-3">
							<div class="analytic-data analytic-ov-data">
								<div class="title">총 방문자수</div>
								<div class="amount visitorStatisticsValue">2.57K</div>
								<div class="visitorStatisticsPercent">
									<div class="change up">
										<em class="icon ni ni-arrow-long-up"></em>12.37%
									</div>
								</div>
							</div>
							<div class="analytic-data analytic-ov-data">
								<div class="title">회원 방문자</div>
								<div class="amount visitorStatisticsValue">1.01K</div>
								<div class="visitorStatisticsPercent">
									<div class="change up">
										<em class="icon ni ni-arrow-long-up"></em>17.74%
									</div>
								</div>
							</div>
							<div class="analytic-data analytic-ov-data">
								<div class="title">비회원 방문자</div>
								<div class="amount visitorStatisticsValue">1.56K</div>
								<div class="visitorStatisticsPercent">
									<div class="change down">
										<em class="icon ni ni-arrow-long-down"></em>2.37%
									</div>
								</div>
							</div>
						</div>
						<div class="analytic-ov-ck">
							<canvas class="analytics-line-large" id="analyticOvData" style="display: block; box-sizing: border-box; height: 175px; width: 521px;" width="1043" height="350"></canvas>
						</div>
						<div class="chart-label-group ms-5" id="visitorStatisticsAxis">
							<div class="chart-label">01 Jan, 2020</div>
							<div class="chart-label d-none d-sm-block">15 Jan, 2020</div>
							<div class="chart-label">30 Jan, 2020</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 사이트 방문자수 끝 -->
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
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/bundle_beauty_my.js?ver=3.2.3"></script> --%>
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/beauty_my/scripts.js?ver=3.2.3"></script> --%>
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script> --%>
<!-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script> --%>
<%-- <script src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script> --%>
<div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div>
<!-- dashlite 끝-->
<script type="text/javascript">
	$(function() {
		$("#sidebar-dashboard").addClass("active current-page");
	}); // $(document).ready(function() { })
</script>
</body>
</html>