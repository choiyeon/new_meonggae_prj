package com.store.meonggae.visitor.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;

@Component
public class VisitorCntDAO {
	@Autowired(required = false)
	private MybatisDAO mbDAO;
	
	// 방문자수 증가
	public int mergeIntoVisitorCnt(boolean isMember) {
		int totalCnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		totalCnt = ss.update("com.store.meonggae.visitor.mergeIntoVisitorCnt", isMember);
		
		mbDAO.CloseHandler(ss);
		
		return totalCnt;
	} // mergeIntoVisitorCnt
} // class
