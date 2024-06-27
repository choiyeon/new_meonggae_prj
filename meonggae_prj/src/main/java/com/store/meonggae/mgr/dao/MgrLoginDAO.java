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
	
	public MgrDomain selectOneManager(MgrVO mgrVO) throws PersistenceException {
		MgrDomain mgrDomain = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		mgrDomain = ss.selectOne("com.store.meonggae.mgr.login.selectOneManager", mgrVO);
		mbDAO.closeHandler(ss);
		
		return mgrDomain;
	} // selectOneManager
} // class
