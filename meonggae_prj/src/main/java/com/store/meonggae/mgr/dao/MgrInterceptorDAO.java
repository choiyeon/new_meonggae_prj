package com.store.meonggae.mgr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.mgr.review.domain.MgrCategoryDomain;
import com.store.meonggae.mgr.review.domain.MgrReviewDomain;
import com.store.meonggae.mgr.review.vo.MgrReviewSearchVO;
import com.store.meonggae.mgr.review.vo.MgrReviewVO;

@Component
public class MgrInterceptorDAO {
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	// 검색된 리뷰의 수
	public int selectOneReviewCount( MgrReviewSearchVO sVO){
		
		int totalCnt = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCnt = ss.selectOne("com.store.meonggae.mgr.review.selectOneListCnt", sVO);
		
		mbDAO.closeHandler(ss);
		
		return totalCnt;
	} // selectManagerCount
	
	// 검색된 리뷰 리스트
	public List<MgrReviewDomain> selectListReview( MgrReviewSearchVO sVO ){
		
		List<MgrReviewDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		list = ss.selectList("com.store.meonggae.mgr.review.selectListReviewList", sVO);
		
		mbDAO.closeHandler(ss);
		
		return list;
	} // selectListManager
	
	// 상위 카테고리의 하위 카테고리 검색
	public List<MgrCategoryDomain> selectListCategoryList(int categoryNum) {
		List<MgrCategoryDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.review.selectListCategoryList", categoryNum);

		mbDAO.closeHandler(ss);
		
		return list;
	} // selectListCategoryList
	
	// 리뷰 하나 상세 조회
	public MgrReviewDomain selectOneReview(MgrReviewVO mrVO) {
		MgrReviewDomain mrDomain = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		mrDomain = ss.selectOne("com.store.meonggae.mgr.review.selectOneReview", mrVO);
		
		mbDAO.closeHandler(ss);
		
		return mrDomain;
	} // selectOneReview
	
	// 리뷰 삭제
	public int deleteReview(MgrReviewVO mrVO) {
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.delete("com.store.meonggae.mgr.review.deleteOneReview", mrVO);
	
		mbDAO.closeHandler(ss);
		
		return cnt;
	} // deleteReview
} // class