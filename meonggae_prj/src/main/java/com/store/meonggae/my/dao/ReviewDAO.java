package com.store.meonggae.my.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.my.domain.MyReviewDomain;
import com.store.meonggae.my.domain.WriteReviewDomain;
import com.store.meonggae.my.vo.WriteReviewVO;

@Component
public class ReviewDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	
	/**
	 * 내가 쓴 후기 리스트
	 */
	public List<MyReviewDomain> selectMyReview(String memNum) throws PersistenceException{
		List<MyReviewDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.Review.myReviewList", memNum);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectReview
	
	/**
	 * 작성 가능 리뷰
	 */
	public List<WriteReviewDomain> selectWriteReview(String memNum) throws PersistenceException{
		List<WriteReviewDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.Review.writeReviewList", memNum);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectWriteReview
	
	/**
	 * 리뷰 삭제
	 */
	public int deleteReview(String goodsNum) throws PersistenceException{
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.update("com.store.meonggae.Review.deleteReview", goodsNum);
		mbDAO.CloseHandler(ss);
		
		return cnt;
	}//deleteReview
	
	/**
	 * 리뷰 작성
	 */
	public int insertReview(WriteReviewVO wrVO) throws PersistenceException{
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.update("com.store.meonggae.Review.insertReview", wrVO);
		mbDAO.CloseHandler(ss);
		
		return cnt;
	}//insertReview
	
	
}//class
