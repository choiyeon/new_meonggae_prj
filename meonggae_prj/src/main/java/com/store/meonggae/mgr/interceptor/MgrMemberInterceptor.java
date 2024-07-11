package com.store.meonggae.mgr.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.store.meonggae.mgr.interceptor.service.MgrInterceptorService;
import com.store.meonggae.mgr.login.domain.MgrDomain;

public class MgrMemberInterceptor implements HandlerInterceptor {

	@Autowired(required = false)
	private MgrInterceptorService miService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Object mgrObj = WebUtils.getSessionAttribute(request, "mgr");
		MgrDomain mgrDomain = null;
		String permission = ""; 
		boolean flag = false;
		
		if(mgrObj != null) {
			mgrDomain = (MgrDomain)mgrObj;
			permission = miService.searchOneManagerPermission(mgrDomain.getManager_id());	
			flag = permission.equals("10") || permission.equals("11");
		} // end if
		
		StringBuilder sb = new StringBuilder("http://");
		sb.append(request.getServerName())
		.append(request.getContextPath())
		.append("/error/err_no_permission.do");
		
		if(!flag) {	 // 관리자 권한이 충분하지 않으면 대시보드로 이동
			response.sendRedirect(sb.toString());
		} // end if
		
		return flag;
	} // preHandle
} // class