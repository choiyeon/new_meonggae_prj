package com.store.meonggae.mgr.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

public class MgrInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Object mgr = WebUtils.getSessionAttribute(request, "mgr");
		Object flagMgrLogin = WebUtils.getSessionAttribute(request, "flagMgrLogin");
		Object mgrSecondAuth = WebUtils.getSessionAttribute(request, "mgrSecondAuth");
		
		boolean flag = (mgr != null) && (flagMgrLogin != null ? (boolean)flagMgrLogin : false) && (mgrSecondAuth != null ? (boolean)mgrSecondAuth : false);	// session이 있으면 true, 없으면 false
		
		StringBuilder sb = new StringBuilder("http://");
		sb.append(request.getServerName())
		.append(request.getContextPath())
		.append("/error/err_no_manager_login.do");
		
		if(!flag) {	 // 관리자 로그인을 수행하지 않고 관리 패널에 접근시 사용자 대시보드로 이동
			response.sendRedirect(sb.toString());
		} // end if
		
		return flag;	// true: 다음으로 진행, false: 멈춤
	} // preHandle
}
