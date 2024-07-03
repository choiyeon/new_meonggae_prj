package com.store.meonggae.my.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.my.dao.ReviewDAO;
import com.store.meonggae.my.domain.MyReviewDomain;
import com.store.meonggae.my.domain.WriteReviewDomain;
import com.store.meonggae.my.vo.WriteReviewVO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO rDAO;
	
	/**
	 * 내가 쓴 후기 리스트
	 */
	public List<MyReviewDomain> searchMyReview(String memNum){
		List<MyReviewDomain> list = null;
		
		try {
			list = rDAO.selectMyReview(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchReview
	
	/**
	 * 작성 가능 리뷰
	 */
	public List<WriteReviewDomain> searchWriteReview(String memNum){
		List<WriteReviewDomain> list = null;
		
		try {
			list = rDAO.selectWriteReview(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchWriteReview
	
	/**
	 * 리뷰 삭제
	 */
	public int deleteReview(String goodsNum) {
		int cnt = 0;
		
		try {
			cnt = rDAO.deleteReview(goodsNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//deleteReview
	
	/**
	 * 리뷰 작성
	 */
	public int writeReview(WriteReviewVO wrVO) {
		int cnt = 0;
		
		try {
			cnt = rDAO.insertReview(wrVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//writeReview
	
}//class