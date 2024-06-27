package com.store.meonggae.my.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.my.dao.DibsDAO;
import com.store.meonggae.my.dao.MypageMainDAO;
import com.store.meonggae.my.domain.GoodsDomain;

@Service
public class DibsService {
	
	@Autowired
	private DibsDAO dsDAO;
	
	/**
	 * 찜목록
	 */
	public List<GoodsDomain> searchAllDibsList(String memNum){
		List<GoodsDomain> list = null;
		
		try {
			list = dsDAO.selectAllDibsList(memNum);
		} catch (PersistenceException pe) {
				pe.printStackTrace();
			}//end catch
		
		return list;
	}//searchDibsList
	
}//class