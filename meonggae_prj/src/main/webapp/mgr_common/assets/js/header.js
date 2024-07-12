/**
 * 관리자 header 알림읽기
 */
var arrNoticeData = [];

$(function() {
	//필터 누르면 div 토글
	$(".dropdown").click(function () {
		let ind = $(this).index();
		console.log('바깥');
		if(ind == 0) {
			$("#dropLogout").toggle();	
			$("#dropNotification").hide();
		} else if (ind == 1) {
			$("#dropLogout").hide();	
			$("#dropNotification").toggle();
			if($("#dropNotification").css('display') != "none") {
				callAjaxSearchListNotice();
			} // end if
		} // end else if
	}); // click
	
	// 필터 영역 이외 누르면 div 숨기기
	$('html').click(function(e) {   
		if($(e.target).parents('.dropdown').length < 1 && !$(e.target).hasClass('dropdown')){   
			$("#dropLogout").hide();
			$("#dropNotification").hide();
		} // end if
	});

	// 알림 모두 읽음을 눌렀을 때
	$("#noticeReadAll").click(function() {
		callAjaxUpdateAllNoticeRead();
	}); // click

	// 알림이 있는 경우 종 모양 변경
	callAjaxIsNotice();
}); // $(document).ready(function() { })

// 알림이 있는지 확인하여 종모양 아이콘에 색깔 점으로 알려줌
function callAjaxIsNotice() {
	var param = {
		managerId: managerId
	}
	$.ajax({
		url: link + "/mgr/header/notice_is.do",
		type: "GET",
		data: param,
		dataType: "JSON",
		error: function(xhr) {
			console.log(xhr.status + " / " + xhr.statusText);
			alert("문제가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다");
		}, 
		success: function(jsonObj) {
			if(jsonObj.result) {
				if(jsonObj.data.flagNotice) {
					$("#iconNotification").removeClass("icon-status-info2");
				} else {
					if(!$("#iconNotification").hasClass("icon-status-info2")) {
						$("#iconNotification").addClass("icon-status-info2");
					} // end if
				} // end else
			} // end if
		} // success
	}); // ajax
} // callAjaxIsNotice

// 알림 리스트 조회하여 리스트 출력
function callAjaxSearchListNotice() {
	var param = {
		managerId: managerId
	}
	$.ajax({
		url: link + "/mgr/header/notice_list.do",
		type: "GET",
		data: param,
		dataType: "JSON",
		error: function(xhr) {
			console.log(xhr.status + " / " + xhr.statusText);
			alert("문제가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다");
		}, 
		success: function(jsonObj) {
			if(jsonObj.result) {
				let arrNotice = JSON.parse(jsonObj.data);
				let iconInquiry = '"icon icon-circle bg-success-dim ni ni-curve-down-left"';
				let iconReport = '"icon icon-circle bg-warning-dim ni ni-curve-down-right"';
				let noticeType = '';
				let icon = '';
				let output = '';
				arrNoticeData = [];
				if (arrNotice.length > 0) {
					for (let i = 0; i < arrNotice.length; i++) {
						arrNoticeData.push([arrNotice[i].noticeType, arrNotice[i].noticeNum]);
						noticeType = arrNotice[i].noticeType == 'I' ? '[문의]' : '[신고]';
						icon = arrNotice[i].noticeType == 'I' ? '<em class="icon icon-circle bg-warning-dim ni ni-curve-down-right"></em>' : '<em class="icon icon-circle bg-danger-dim ni ni-curve-down-right"></em>';
						output += '<div class="nk-notification-item dropdown-inner" onClick="callAjaxUpdateOneNoticeRead(arrNoticeData[' + i + ']);"><div class="nk-notification-icon">' + icon + '</div><div class="nk-notification-content"><div class="nk-notification-text">' + noticeType + '<span class="noticeTitle" style="cursor:pointer;">' + arrNotice[i].title + '</span></div><div class="nk-notification-time">' + arrNotice[i].timeAgo + '</div></div></div>';
						// callAjaxUpdateOneNoticeRead(arrNoticeData[$(this).index()]);
						// arrNoticeData[$(this).index()][2]
					} // end for
				} else {
					output = '<h6>알림이 존재하지 않습니다</h6>';
				} // end if
				$("#noticeList").html(output);
			} // end if
		} // success
	}); // ajax
} // callAjaxSearchListNotice

// 알림 리스트 조회하여 리스트 출력
function callAjaxUpdateAllNoticeRead() {
	var param = {
		managerId: managerId
	}
	$.ajax({
		url: link + "/mgr/header/notice_read_all.do",
		type: "GET",
		data: param,
		dataType: "JSON",
		error: function(xhr) {
			console.log(xhr.status + " / " + xhr.statusText);
			alert("문제가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다");
		}, 
		success: function(jsonObj) {
			if(jsonObj.result) {
				if(jsonObj.data.cnt > 0) {
					$("#noticeList").html('<h6>알림을 모두 읽었습니다</h6>');
				} // end if
			} // end if
		} // success
	}); // ajax
} // callAjaxSearchListNotice

function callAjaxUpdateOneNoticeRead(noticeData) {
	var param = {
		noticeType: noticeData[0],
		noticeNum: noticeData[1],
		managerId: managerId
	}
	$.ajax({
		url: link + "/mgr/header/notice_read_one.do",
		type: "GET",
		data: param,
		dataType: "JSON",
		error: function(xhr) {
			console.log(xhr.status + " / " + xhr.statusText);
			alert("문제가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다");
		}, 
		success: function(jsonObj) {
			if(jsonObj.result) {
				let link = '';
				if(param.noticeType == "I") {
					link = "/meonggae_prj/mng/inquiry/inquiry_detail.do?inquiry_num=" + param.noticeNum;
				} else {
					link = "/meonggae_prj/mng/report/report_detail.do?rep_num=" + param.noticeNum;
				} // end else
				location.href=link;
			} // end if
		} // success
	}); // ajax
}