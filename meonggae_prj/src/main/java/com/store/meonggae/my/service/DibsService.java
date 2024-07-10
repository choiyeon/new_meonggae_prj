package com.store.meonggae.my.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.my.dao.DibsDAO;
import com.store.meonggae.my.dao.MypageMainDAO;
import com.store.meonggae.my.domain.GoodsDomain;
import com.store.meonggae.my.pagination.PaginationUtil;
import com.store.meonggae.my.pagination.SearchVO;

@Service
public class DibsService {
	
	@Autowired
	private DibsDAO dsDAO;
	
	/**
	 * 찜목록
	 */
	public List<GoodsDomain> searchAllDibsList(String memNum, int currentPage){
		List<GoodsDomain> list = null;
		
		try {
			SearchVO sVO = PaginationUtil.getInstance().startNum(memNum, currentPage, PaginationUtil.getInstance().pageScale());
			list = dsDAO.selectAllDibsList(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchDibsList
	
	/**
	 * 판매 상품 갯수
	 */
	public int searchCount(String memNum){
		int cnt = 0;
		
		try {
			cnt = dsDAO.selectCount(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//searchCount
	
}//class