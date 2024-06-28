package com.store.meonggae.mgr.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MgrMemberController {
	
//	@Autowired(required = false)
	
	// 회원 관리 리스트 조회
	@GetMapping("/mgr/member/mgr_member_list_frm.do")
	public String searchListMember() {
		return "mgr/member/mgr_member_list_frm";
	} // mgrDashFrm
	
	// 회원 관리 - 회원 상세 조회
	@GetMapping("/mgr/member/mgr_member_detail_frm.do")
	public String searchOneMember() {
		return "mgr/member/mgr_member_detail_frm";
	} // mgrDashFrm
}
