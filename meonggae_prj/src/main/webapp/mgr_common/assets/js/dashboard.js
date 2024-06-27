	$(function() {
		
		topCategory();
		
		// 상위 거래 카테고리 select
		$("#cateTopSel").change(function() {
			topCategory();
		}); // change
		
		// 사용자수 요약 select
		$("#userSummarySel").change(function() {
			userSummary();
		}); // change
		
		// 이벤트 조회수 현황
		$("#eventViewSel").change(function() {
			eventView();
		}); // change
		
		// 신고 현황
		reportRecent();
		
		// 사이트 방문자수
		$(".visitors").change(function() {
			visitorStatistics();
		}); // chang
		
		// 사이트 방문자수 datepicker 시작일
// 		$("#visitorStartDate").change(function() {
// 			chkOverToday($("#visitorStartDate"), $("#visitorEndDate"));
// 			chkStartLessThenEnd($("#visitorStartDate"), $("#visitorEndDate"));
// 		});
		// 사이트 방문자수 datepicker 종료일
// 		$("#visitorEndDate").change(function() {
// 			chkOverToday($("#visitorStartDate"), $("#visitorEndDate"));
// 			chkEndGreaterThenStart($("#visitorStartDate"), $("#visitorEndDate"));
// 		});
		
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
				console.log(jsonObj);
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
				console.log(jsonObj);
				console.log(JSON.parse(jsonObj.data));
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
				console.log(jsonObj);
				console.log(JSON.parse(jsonObj.data));
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
				console.log(jsonObj);
				console.log(JSON.parse(jsonObj.data));
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
				console.log(jsonObj);
				console.log(JSON.parse(jsonObj.data));
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
		console.log(jsonData);
	} // applyViewUserSummary
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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