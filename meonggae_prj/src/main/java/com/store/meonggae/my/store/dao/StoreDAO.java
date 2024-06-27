package com.store.meonggae.my.store.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.my.store.VO.ReviewVO;
import com.store.meonggae.my.store.domain.ReviewDomain;
import com.store.meonggae.my.store.domain.StoreMainDomain;

@Component
public class StoreDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	
	/**
	 *  내상점 메인 판매상품 리스트
	 */
	public List<StoreMainDomain> selectSalesList(String nick) throws PersistenceException{
		List<StoreMainDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.store.storeSalesList", nick);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectSalesList
	
	/**
	 * 프로필사진 select
	 */
	public String selectProfile(String nick) throws PersistenceException{
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		String profile = ss.selectOne("com.store.meonggae.store.userProfile", nick);
		return profile;
	}//selectProfile
	
	/**
	 * 유저번호 select
	 */
	public String selectMemNum(String nick) throws PersistenceException{
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		String memNum = ss.selectOne("com.store.meonggae.store.userNum", nick);
		return memNum;
	}//selectMemNum
	
	/**
	 * 상점리뷰
	 */
	public List<ReviewDomain> selectReview(ReviewVO rVO) throws PersistenceException{
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		List<ReviewDomain> list = ss.selectList("com.store.meonggae.store.reviewList", rVO);
		return list;
	}//selectMemNum
	
	/**
	 * 별점 리스트
	 */
	public List<Double> selectStarScore(String nick) throws PersistenceException{
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		List<Double> list = ss.selectList("com.store.meonggae.store.starScore", nick);
		return list;
	}//selectMemNum
	
}//class
