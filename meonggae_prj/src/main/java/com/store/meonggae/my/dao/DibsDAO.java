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
public class DibsDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	
	/**
	 * 찜목록 전부 팔린 물건은 보여지지 않음
	 */
	public List<GoodsDomain> selectAllDibsList(SearchVO sVO) throws PersistenceException{
		List<GoodsDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.dibs.allDibsList", sVO);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectDibsList
	
	/**
	 *  찜한상품 총 갯수
	 */
	public int selectCount(String memNum) throws PersistenceException{
		int count = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		count = ss.selectOne("com.store.meonggae.dibs.dibsCount", memNum);
		mbDAO.CloseHandler(ss);
		
		return count;
	}//selectCount
	
}
