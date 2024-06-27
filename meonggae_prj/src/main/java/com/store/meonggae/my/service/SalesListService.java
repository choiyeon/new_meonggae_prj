package com.store.meonggae.my.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.my.dao.DibsDAO;
import com.store.meonggae.my.dao.MypageMainDAO;
import com.store.meonggae.my.dao.SalesListDAO;
import com.store.meonggae.my.domain.GoodsDomain;

@Service
public class SalesListService {
	
	@Autowired
	private SalesListDAO dsDAO;
	
	/**
	 * 판매중
	 */
	public List<GoodsDomain> searchAllSalesList(String memNum){
		List<GoodsDomain> list = null;
		
		try {
			list = dsDAO.selectAllSalesList(memNum);
		} catch (PersistenceException pe) {
				pe.printStackTrace();
			}//end catch
		
		return list;
	}//searchAllSalesList
	
	/**
	 * 판매완료
	 */
	public List<GoodsDomain> searchAllSoldList(String memNum){
		List<GoodsDomain> list = null;
		
		try {
			list = dsDAO.selectAllSoldList(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchAllSoldList
	
	/**
	 * 구매완료
	 */
	public List<GoodsDomain> searchAllBoughtList(String memNum){
		List<GoodsDomain> list = null;
		
		try {
			list = dsDAO.selectAllBoughtList(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchAllBoughtList
	
}//class