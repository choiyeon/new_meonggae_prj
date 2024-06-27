package com.store.meonggae.mgr.dashboard.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.meonggae.mgr.dashboard.service.MgrDashboardService;
import com.store.meonggae.mgr.dashboard.vo.VisitorDatepickVO;

@Controller
public class MgrDashboardController {
	
	@Autowired(required = false)
	private MgrDashboardService mds;
	
	// 대시보드 - 상위 거래 카테고리
	@ResponseBody
	@RequestMapping(value = "/mgr/dashboard/top_category.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String searchTopCategory(@RequestParam(defaultValue = "30") int period) {
		
		return mds.searchCategoryTop(period);
	} // searchTopCategory
	
	// 대시보드 - 사용자수 요약
	@ResponseBody
	@RequestMapping(value = "/mgr/dashboard/user_summary.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String searchUserSummary(@RequestParam(defaultValue = "30") int period) {
		
		return mds.searchUserSummary(period);
	} // searchTopCategory
	
	// 대시보드 - 이벤트 조회수
	@ResponseBody
	@RequestMapping(value = "/mgr/dashboard/event_view.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String searchTopEvent(@RequestParam(defaultValue = "0") int type) {
		
		return mds.searchTopEvent(type);
	} // searchTopCategory
	
	// 대시보드 - 신고 현황
	@ResponseBody
	@RequestMapping(value = "/mgr/dashboard/report_recent.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String searchReportRecent() {
		
		return mds.searchReportRecent();
	} // searchTopCategory
	
	// 대시보드 - 사이트 방문자수
	@ResponseBody
	@RequestMapping(value = "/mgr/dashboard/visitor_statistics.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String searchVisitorStatistics(
			@RequestParam String visitorStartDate, @RequestParam String visitorEndDate, @RequestParam String visitorSel) {
		VisitorDatepickVO visitorDateVO = new VisitorDatepickVO(visitorStartDate, visitorEndDate, visitorSel);
		return mds.searchVisitorStatistics(visitorDateVO);
	} // searchVisitorStatistics
	
} // class
