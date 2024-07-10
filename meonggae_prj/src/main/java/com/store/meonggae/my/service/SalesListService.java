package com.store.meonggae.my.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.my.dao.DibsDAO;
import com.store.meonggae.my.dao.MypageMainDAO;
import com.store.meonggae.my.dao.SalesListDAO;
import com.store.meonggae.my.domain.GoodsDomain;
import com.store.meonggae.my.pagination.PaginationUtil;
import com.store.meonggae.my.pagination.SearchVO;

@Service
public class SalesListService {
	
	@Autowired
	private SalesListDAO dsDAO;
	
	/**
	 * 판매중
	 */
	public List<GoodsDomain> searchAllSalesList(String memNum, int currentPage){
		List<GoodsDomain> list = null;
		
		try {
			SearchVO sVO = PaginationUtil.getInstance().startNum(memNum, currentPage, PaginationUtil.getInstance().pageScale());
			list = dsDAO.selectAllSalesList(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchAllSalesList
	
	/**
	 * 판매 상품 count
	 */
	public int searchSalesCount(String memNum){
		int cnt = 0;
		
		try {
			cnt = dsDAO.selectSalesCount(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//searchSalesCount
	
	/**
	 * 판매완료
	 */
	public List<GoodsDomain> searchAllSoldList(String memNum, int currentPage){
		List<GoodsDomain> list = null;
		
		try {
			SearchVO sVO = PaginationUtil.getInstance().startNum(memNum, currentPage, PaginationUtil.getInstance().pageScale());
			list = dsDAO.selectAllSoldList(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchAllSoldList
	
	/**
	 * 판매 완료 count
	 */
	public int searchSoldCount(String memNum){
		int cnt = 0;
		
		try {
			cnt = dsDAO.selectSalesCount(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//searchSoldCount
	
	/**
	 * 구매완료
	 */
	public List<GoodsDomain> searchAllBoughtList(String memNum, int currentPage){
		List<GoodsDomain> list = null;
		
		try {
			SearchVO sVO = PaginationUtil.getInstance().startNum(memNum, currentPage, PaginationUtil.getInstance().pageScale());
			list = dsDAO.selectAllBoughtList(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchAllBoughtList
	
	/**
	 * 구매 완료 count
	 */
	public int searchBoughtCount(String memNum){
		int cnt = 0;
		
		try {
			cnt = dsDAO.selectSalesCount(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//searchBoughtCount
	
}//class