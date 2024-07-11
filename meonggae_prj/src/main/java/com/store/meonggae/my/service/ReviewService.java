package com.store.meonggae.my.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.my.dao.ReviewDAO;
import com.store.meonggae.my.domain.MyReviewDomain;
import com.store.meonggae.my.domain.WriteReviewDomain;
import com.store.meonggae.my.pagination.PaginationUtil;
import com.store.meonggae.my.pagination.SearchVO;
import com.store.meonggae.my.vo.StarScoreVO;
import com.store.meonggae.my.vo.WriteReviewVO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO rDAO;
	
	/**
	 * 내가 쓴 후기 리스트
	 */
	public List<MyReviewDomain> searchMyReview(String memnum, int currentPage){
		List<MyReviewDomain> list = null;
		
		try {
			SearchVO sVO = PaginationUtil.getInstance().startNum(memnum, currentPage, 10);
			list = rDAO.selectMyReview(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchReview
	
	/**
	 * 리뷰 count
	 */
	public int searchReviewCount(String memnum){
		int cnt = 0;
		
		try {
			cnt = rDAO.reviewCount(memnum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//searchReviewCount
	
	/**
	 * 작성 가능 리뷰
	 */
	public List<WriteReviewDomain> searchWriteReview(String memnum){
		List<WriteReviewDomain> list = null;
		
		try {
			list = rDAO.selectWriteReview(memnum);
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
	public int writeReview(String memNum, String goodsNum, String contents, String starScore) {
		int cnt = 0;
		
		try {
			WriteReviewVO wrVO = new WriteReviewVO(memNum, goodsNum, contents);
			StarScoreVO ssVO = new StarScoreVO(memNum, goodsNum, starScore);
			
			cnt = rDAO.insertReview(wrVO, ssVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//writeReview
	
}//class