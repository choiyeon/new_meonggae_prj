package com.store.meonggae.mgr.header.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.store.meonggae.mgr.header.service.MgrHeaderService;
import com.store.meonggae.mgr.header.vo.MgrNoticeVO;

@Controller
public class MgrHeaderController {
	
	@Autowired(required = false)
	private MgrHeaderService mhService;
	
	// 로그아웃
	@RequestMapping(value = "/mgr/logout.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session, SessionStatus ss) {
		session.removeAttribute("mgr");
		session.removeAttribute("flagMgrLogin");
		session.invalidate();
		ss.setComplete();
		return "redirect:login/mgr_login_frm.do";	// 이거 그냥 쓰면 안 됨!!!
	} // adminMain
	
	// 관리자가 안 읽은 알림이 존재하는지
	@ResponseBody
	@GetMapping("/mgr/header/notice_is.do")
	public String searchIsNotice(String managerId) {
		return mhService.searchOneIsNotice(managerId);
	} // searchIsNotice
	
	// 관리자의 안 읽은 알림 리스트 조회
	@ResponseBody
	@GetMapping("/mgr/header/notice_list.do")
	public String searchListNotice(String managerId) {
		return mhService.searchListNotice(managerId);
	} // searchNotice
	
	// 관리자의 알림 모두 읽음 처리 
	@ResponseBody
	@GetMapping("/mgr/header/notice_read_all.do")
	public String updateAllNoticeRead(String managerId) {
		return mhService.updateAllNoticeRead(managerId);
	} // searchNotice
	
	// 관리자의 알림 하나 읽음 처리 
	@ResponseBody
	@GetMapping("/mgr/header/notice_read_one.do")
	public String updateOneNoticeRead(MgrNoticeVO noticeVO) {
		return mhService.updateOneNoticeRead(noticeVO);
	} // searchNotice
} // class
