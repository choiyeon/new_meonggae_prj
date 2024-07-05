package com.store.meonggae.product.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.product.domain.CategoryDomain;


@Component
public class CategoryDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	

	//카테고리 조회
	public List<CategoryDomain> selectCategory(String categoryNum)throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectList("com.store.meonggae.product.selectCategory", categoryNum);
		}
	};//selectCategory
	
	//입력된 카테고리번호가 부모인지 확인
	public String isParentCategory(String categoryNum)throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectOne("com.store.meonggae.product.isParentCategory", categoryNum);
		}
	};//isParentCategory
	
}