package com.store.meonggae.mgr.interceptor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MgrInterceptorContorller {
	
	// 관리자 로그인하지 않은 사람이 관리자 기능을 사용하려할 때
	@RequestMapping(value = "/error/err_no_manager_login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String noMgrLogin() {
		return "/mgr/error/err_no_mgr_login";
	}
	
	// 권한이 부족한 관리자가 상위 기능을 사용하려할 때
	@RequestMapping(value = "/error/err_no_permission.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String noEnoughPermission() {
		return "/mgr/error/err_no_permission";
	}
}
