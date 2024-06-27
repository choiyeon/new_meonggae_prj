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
		
		boolean flag = (mgr != null) && (flagMgrLogin != null ? (boolean)flagMgrLogin : false);	// session이 있으면 true, 없으면 false
		
		if(!flag) {	 // 세션이 없으면 로그인 폼으로 이동
			response.sendRedirect("http://localhost/meonggae_prj/mgr/login/mgr_login_frm.do");
		} // end if
		
		return flag;	// true: 다음으로 진행, false: 멈춤
	} // preHandle
}
