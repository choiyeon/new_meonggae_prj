package com.store.meonggae.mgr.review.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.store.meonggae.mgr.dao.MgrReviewDAO;
import com.store.meonggae.mgr.review.domain.MgrCategoryDomain;
import com.store.meonggae.mgr.review.domain.MgrReviewDomain;
import com.store.meonggae.mgr.review.vo.MgrReviewSearchVO;
import com.store.meonggae.mgr.review.vo.MgrReviewVO;

@Service
public class MgrReviewService {
	@Autowired
	private MgrReviewDAO mrDAO;
	
	// 검색된 리뷰 수
	public int getTotalCount(MgrReviewSearchVO sVO) {
		int totalCount = 0;
		
		try {
			totalCount = mrDAO.selectOneReviewCount(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return totalCount;
	} // totalCount

	// 한 화면에 보여줄 게시물의 수
	public int getPageScale() {
		int pageScale = 10;
		return pageScale;
	} // pageScale
	
	// 총 페이지수
	public int getTotalPage(int totalCount, int pageScale) {
		return (int)Math.ceil((double)totalCount / pageScale);
	} // totalPage
	
	// 현재 페이지
	public int getCurrentPage(MgrReviewSearchVO sVO) {
		int currentPage = 1;
		
		String tempPage = sVO.getCurrentPage();
		if(tempPage != null) {
			try {
				currentPage = Integer.parseInt(tempPage); 
			} catch (NumberFormatException nfe) {
			} // end catch
		} // end if
		return currentPage;
	} // getCurrentPage
	
	// 게시물의 시작 번호
	public int getStartNum(int currentPage, int pageScale) {
		int startNum = (currentPage - 1) * pageScale + 1;
		return startNum;
	} // getStartNum
	
	// 게시물의 마지막 번호
	public int getEndNum(int startNum, int pageScale) {
		int endNum = startNum + pageScale - 1;
		return endNum;
	} // getEndNum
	
	// 검색된 리스트 조회
	public List<MgrReviewDomain> searchListReviewList(MgrReviewSearchVO sVO) {
		List<MgrReviewDomain> list = null;
		try {
			list = mrDAO.selectListReview(sVO);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return list;
	} // searchListReviewList
	
	// 상위 카테고리의 하위 카테고리 검색 
	public List<MgrCategoryDomain> searchListCategoryList(int categoryNum) {
		List<MgrCategoryDomain> list = null;
		try {
			list = mrDAO.selectListCategoryList(categoryNum);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return list;
	} // searchListReviewList
	
	// 카테고리 조회 - AJAX
	@SuppressWarnings("unchecked")
	public String searchListCategoryListAjax(int categoryNum) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("dataSize", 0);
		jsonObj.put("date", sdf.format(new Date()));
		jsonObj.put("data", "");
		
		try {
			List<MgrCategoryDomain> list = mrDAO.selectListCategoryList(categoryNum);
			
			ObjectMapper objMapper = new ObjectMapper();
			
			jsonObj.put("data", objMapper.writeValueAsString(list));
			jsonObj.put("dataSize", list.size());
			jsonObj.put("result", true);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} catch (JsonProcessingException jpe) {
			jpe.printStackTrace();
		} // catch
		return jsonObj.toJSONString();
	} // searchListCategoryList
	
	// 리뷰 상세 조회
	public MgrReviewDomain searchOneReviewDetail(MgrReviewVO mrVO) {
		
		MgrReviewDomain mrDomain = null;
		
		try {
			mrDomain = mrDAO.selectOneReview(mrVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return mrDomain;
	} // searchOneReviewDetail
	
	// 리뷰 삭제
	public int removeReview(MgrReviewVO mrVO) {
		int cnt = 0;
		try {
			cnt = mrDAO.deleteReview(mrVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return cnt;
	} // removeReview
	
} // class
