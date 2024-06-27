package com.store.meonggae.mgr.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class MgrHeaderController {

	@GetMapping("/mgr/logout.do")
	public String logout(SessionStatus ss) {
		ss.setComplete();
		return "redirect:login/mgr_login_frm.do";	// 이거 그냥 쓰면 안 됨!!!
	} // adminMain
	
} // class
