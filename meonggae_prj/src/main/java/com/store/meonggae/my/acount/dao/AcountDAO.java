package com.store.meonggae.my.acount.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.my.acount.vo.ChkAcountVO;
import com.store.meonggae.my.acount.vo.ChkPwAcountVO;
import com.store.meonggae.my.acount.vo.PwVO;

@Component
public class AcountDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	
	/**
	 *  계정정보 존재여부 확인
	 */
	public int selectAcount(ChkAcountVO caVO) throws PersistenceException{
		int count = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		count = ss.selectOne("com.store.meonggae.acount.chkAcount", caVO);
		mbDAO.CloseHandler(ss);
		
		return count;
	}//selectAcount
	
	/**
	 *  아이디 select
	 */
	public String selectId(ChkAcountVO caVO) throws PersistenceException{
		String id = "";
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		id = ss.selectOne("com.store.meonggae.acount.selectId", caVO);
		mbDAO.CloseHandler(ss);
		
		return id;
	}//selectAcount
	
	/**
	 *  계정정보 존재여부 확인(비밀번호 포함)
	 */
	public int selectPwAcount(ChkPwAcountVO cwaVO) throws PersistenceException{
		int count = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		count = ss.selectOne("com.store.meonggae.acount.chkAcountPw", cwaVO);
		mbDAO.CloseHandler(ss);
		
		return count;
	}//selectPwAcount
	
	/**
	 *  비밀번호 수정
	 */
	public int updatePw(PwVO pwVO) throws PersistenceException{
		int count = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		count = ss.update("com.store.meonggae.acount.updatePw", pwVO);
		mbDAO.CloseHandler(ss);
		
		return count;
	}//updatePw
	
}
