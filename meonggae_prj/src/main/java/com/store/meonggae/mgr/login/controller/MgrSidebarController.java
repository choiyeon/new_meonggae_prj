package com.store.meonggae.mgr.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MgrSidebarController {
	
	// 사이드바 - 대시보드
	@GetMapping("/mgr/dashboard/mgr_dashboard_frm.do")
	public String mgrDashFrm() {
		return "mgr/dashboard/mgr_dashboard_frm";
	} // mgrDashFrm
	
	// 사이드바 - 회원 관리
	@GetMapping("/mgr/member/mgr_member_list_frm.do")
	public String mgrMemberFrm() {
		return "mgr/member/mgr_member_list_frm";
	} // mgrDashFrm
	
	// 사이드바 - 리뷰 관리
	@GetMapping("/mgr/review/mgr_review_list_frm.do")
	public String mgrReviewFrm() {
		return "mgr/review/mgr_review_list_frm";
	} // mgrDashFrm
	
	// 사이드바 - 물품 관리
//	@GetMapping("/mgr/product/mgr_product.do")
//	public String mgrGoodsFrm() {
//		return "mgr/product/mgr_product_list";
//	} // mgrDashFrm
	
	// 사이드바 - 관리자 관리
	@GetMapping("/mgr/manager/mgr_manager_list_frm.do")
	public String mgrManagerFrm() {
		return "mgr/manager/mgr_manager_list_frm";
	} // mgrDashFrm
} // class
