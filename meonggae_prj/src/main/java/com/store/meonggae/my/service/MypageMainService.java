package com.store.meonggae.my.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.my.dao.MypageMainDAO;
import com.store.meonggae.my.domain.GoodsDomain;

@Service
public class MypageMainService {
	
	@Autowired
	private MypageMainDAO mmDAO;
	
	/**
	 * 찜목록 4개
	 */
	public List<GoodsDomain> searchDibsList4(String memNum){
		List<GoodsDomain> list = null;
		
		try {
			list = mmDAO.selectDibsList(memNum);
		} catch (PersistenceException pe) {
				pe.printStackTrace();
			}//end catch
		
		return list;
	}//searchDibsList4
	
	/**
	 * 판매완료목록 4개
	 */
	public List<GoodsDomain> searchSoldList4(String memNum){
		List<GoodsDomain> list = null;
		
		try {
			list = mmDAO.selectSoldList(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchDibsList4
	
	/**
	 * 구매완료목록 4개
	 */
	public List<GoodsDomain> searchBoughtList4(String memNum){
		List<GoodsDomain> list = null;
		
		try {
			list = mmDAO.selectBoughtList(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchBoughtList4
	
	
}//class