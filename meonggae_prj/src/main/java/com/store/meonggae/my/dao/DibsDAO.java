package com.store.meonggae.my.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.my.domain.GoodsDomain;

@Component
public class DibsDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	
	/**
	 * 찜목록 전부 팔린 물건은 보여지지 않음
	 */
	public List<GoodsDomain> selectAllDibsList(String memNum) throws PersistenceException{
		List<GoodsDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.dibs.allDibsList", memNum);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectDibsList
	
}
