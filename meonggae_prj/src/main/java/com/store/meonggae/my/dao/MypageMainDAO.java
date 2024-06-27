package com.store.meonggae.my.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.my.domain.GoodsDomain;

@Component
public class MypageMainDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	
	/**
	 * 찜목록 4개. 팔린 물건은 보여지지 않음
	 */
	public List<GoodsDomain> selectDibsList(String memNum) throws PersistenceException{
		List<GoodsDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mypageMain.dibsList", memNum);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectDibsList
	
	/**
	 * 판매완료목록 4개.
	 */
	public List<GoodsDomain> selectSoldList(String memNum) throws PersistenceException{
		List<GoodsDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mypageMain.soldList", memNum);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectSoldList
	
	/**
	 * 구매완료목록 4개.
	 */
	public List<GoodsDomain> selectBoughtList(String memNum) throws PersistenceException{
		List<GoodsDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mypageMain.boughtList", memNum);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectBoughtList
	
	
}
