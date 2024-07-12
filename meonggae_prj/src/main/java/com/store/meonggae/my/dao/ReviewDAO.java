package com.store.meonggae.my.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.my.domain.MyReviewDomain;
import com.store.meonggae.my.domain.WriteReviewDomain;
import com.store.meonggae.my.pagination.SearchVO;
import com.store.meonggae.my.vo.StarScoreVO;
import com.store.meonggae.my.vo.WriteReviewVO;

@Component
public class ReviewDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	
	/**
	 * 내가 쓴 후기 리스트
	 */
	public List<MyReviewDomain> selectMyReview(SearchVO sVO) throws PersistenceException{
		List<MyReviewDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.Review.myReviewList", sVO);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectReview
	
	/**
	 *  리뷰 count
	 */
	public int reviewCount(String memnum) throws PersistenceException{
		int count = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		count = ss.selectOne("com.store.meonggae.Review.myReviewCount", memnum);
		mbDAO.CloseHandler(ss);
		
		return count;
	}//reviewCount
	
	/**
	 * 작성 가능 리뷰
	 */
	public List<WriteReviewDomain> selectWriteReview(String memnum) throws PersistenceException{
		List<WriteReviewDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.Review.writeReviewList", memnum);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectWriteReview
	
	/**
	 * 리뷰 삭제
	 */
	public int deleteReview(String goodsNum) throws PersistenceException{
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt += ss.update("com.store.meonggae.Review.deleteReview", goodsNum);
		cnt += ss.update("com.store.meonggae.Review.deleteStarScore", goodsNum);
		mbDAO.CloseHandler(ss);
		
		return cnt;
	}//deleteReview
	
	/**
	 * 리뷰 작성
	 */
	public int insertReview(WriteReviewVO wrVO, StarScoreVO ssVO) throws PersistenceException{
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt += ss.update("com.store.meonggae.Review.insertReview", wrVO);
		cnt += ss.update("com.store.meonggae.Review.insertStar", ssVO);
		mbDAO.CloseHandler(ss);
		
		return cnt;
	}//insertReview
	
	
}//class
