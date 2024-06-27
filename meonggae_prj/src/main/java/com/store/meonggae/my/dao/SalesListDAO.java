package com.store.meonggae.my.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.my.domain.GoodsDomain;

@Component
public class SalesListDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	
	/**
	 * 판매중
	 */
	public List<GoodsDomain> selectAllSalesList(String memNum) throws PersistenceException{
		List<GoodsDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.salesList.allSalesList", memNum);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectAllSalesList
	
	/**
	 * 판매완료
	 */
	public List<GoodsDomain> selectAllSoldList(String memNum) throws PersistenceException{
		List<GoodsDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.salesList.allSoldList", memNum);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectAllSoldList
	
	/**
	 * 구매완료
	 */
	public List<GoodsDomain> selectAllBoughtList(String memNum) throws PersistenceException{
		List<GoodsDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.salesList.allBoughtList", memNum);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectAllBoughtList
	
}//class
