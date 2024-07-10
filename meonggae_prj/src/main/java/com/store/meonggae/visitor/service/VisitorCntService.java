package com.store.meonggae.visitor.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.visitor.dao.VisitorCntDAO;

@Service
public class VisitorCntService {
	@Autowired(required = false)
	private VisitorCntDAO vcDAO;
	
	public int updateVisitorCnt(boolean isMember) {
		int cnt = 0;
		try {
			cnt = vcDAO.mergeIntoVisitorCnt(isMember);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return cnt;
	} // end updateVisitorCnt
} // class
