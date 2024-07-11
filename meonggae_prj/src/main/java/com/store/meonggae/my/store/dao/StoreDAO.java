package com.store.meonggae.my.store.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.my.pagination.SearchVO;
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
	public List<StoreMainDomain> selectSalesList(SearchVO sVO) throws PersistenceException{
		List<StoreMainDomain> list = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.store.storeSalesList", sVO);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectSalesList
	
	/**
	 *  내상점 메인 판매상품 리스트 갯수
	 */
	public int selectCount(String nick) throws PersistenceException{
		int count = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		count = ss.selectOne("com.store.meonggae.store.storeSalesListCount", nick);
		mbDAO.CloseHandler(ss);
		
		return count;
	}//selectCount
	
	/**
	 * 프로필사진 select
	 */
	public String selectProfile(String nick) throws PersistenceException{
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		String profile = ss.selectOne("com.store.meonggae.store.userProfile", nick);
		mbDAO.CloseHandler(ss);
		
		return profile;
	}//selectProfile
	
	/**
	 * 유저번호 select
	 */
	public String selectMemNum(String nick) throws PersistenceException{
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		String memNum = ss.selectOne("com.store.meonggae.store.userNum", nick);
		mbDAO.CloseHandler(ss);
		
		return memNum;
	}//selectMemNum
	
	/**
	 * 상점리뷰
	 */
	public List<ReviewDomain> selectReview(ReviewVO rVO) throws PersistenceException{
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		List<ReviewDomain> list = ss.selectList("com.store.meonggae.store.reviewList", rVO);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectMemNum
	
	/**
	 * 별점 리스트
	 */
	public List<Double> selectStarScore(String nick) throws PersistenceException{
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		List<Double> list = ss.selectList("com.store.meonggae.store.starScore", nick);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectMemNum
	
}//class
