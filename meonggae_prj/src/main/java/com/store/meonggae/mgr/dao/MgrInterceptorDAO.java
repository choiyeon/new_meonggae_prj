package com.store.meonggae.mgr.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MgrInterceptorDAO {
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	// 로그인한 관리자 권한 조회
	public String selectOneManagerPermission(String managerId){
		
		String permission = "";
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		permission = ss.selectOne("com.store.meonggae.mgr.interceptor.selectOneManagerPermission", managerId);
		mbDAO.closeHandler(ss);
		
		return permission;
	} // selectOneManagerPermission
} // class