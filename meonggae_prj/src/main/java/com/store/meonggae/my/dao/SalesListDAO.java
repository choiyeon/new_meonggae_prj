package com.store.meonggae.my.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.my.domain.GoodsDomain;
import com.store.meonggae.my.pagination.SearchVO;

@Component
public class SalesListDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	
	/**
	 * 판매중
	 */
	public List<GoodsDomain> selectAllSalesList(SearchVO sVO) throws PersistenceException{
		List<GoodsDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.salesList.allSalesList", sVO);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectAllSalesList
	
	/**
	 *  판매중 count
	 */
	public int selectSalesCount(String memnum) throws PersistenceException{
		int count = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		count = ss.selectOne("com.store.meonggae.salesList.salesCount", memnum);
		mbDAO.CloseHandler(ss);
		
		return count;
	}//selectCount
	
	/**
	 * 판매완료
	 */
	public List<GoodsDomain> selectAllSoldList(SearchVO sVO) throws PersistenceException{
		List<GoodsDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.salesList.allSoldList", sVO);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectAllSoldList
	
	/**
	 *  판매완료 count
	 */
	public int selectSoldCount(String memnum) throws PersistenceException{
		int count = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		count = ss.selectOne("com.store.meonggae.salesList.soldCount", memnum);
		mbDAO.CloseHandler(ss);
		
		return count;
	}//selectCount
	
	/**
	 * 구매완료
	 */
	public List<GoodsDomain> selectAllBoughtList(SearchVO sVO) throws PersistenceException{
		List<GoodsDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.salesList.allBoughtList", sVO);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectAllBoughtList
	
	/**
	 *  구매완료 count
	 */
	public int selectBoughtCount(String memnum) throws PersistenceException{
		int count = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		count = ss.selectOne("com.store.meonggae.salesList.boughtCount", memnum);
		mbDAO.CloseHandler(ss);
		
		return count;
	}//selectCount
	
}//class
