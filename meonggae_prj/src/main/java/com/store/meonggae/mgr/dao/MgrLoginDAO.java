package com.store.meonggae.mgr.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.mgr.login.domain.MgrDomain;
import com.store.meonggae.mgr.login.vo.MgrVO;

@Component
public class MgrLoginDAO {
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	
	// 관리자 로그인 1차 
	public MgrDomain selectOneManager(MgrVO mgrVO) throws PersistenceException {
		MgrDomain mgrDomain = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		mgrDomain = ss.selectOne("com.store.meonggae.mgr.login.selectOneManager", mgrVO);
		mbDAO.closeHandler(ss);
		
		return mgrDomain;
	} // selectOneManager
	
	// 관리자 2차 인증 키 조회
	public String selectOneManager2ndAuthKey(String managerId) {
		String secondAuthKey = "";
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		secondAuthKey = ss.selectOne("com.store.meonggae.mgr.login.selectOneManager2ndAuthKey", managerId);
		return secondAuthKey;
	}
} // class
