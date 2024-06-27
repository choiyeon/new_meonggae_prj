package com.store.meonggae.my.store.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.my.store.VO.ReviewVO;
import com.store.meonggae.my.store.dao.StoreDAO;
import com.store.meonggae.my.store.domain.ReviewDomain;
import com.store.meonggae.my.store.domain.StoreMainDomain;

@Service
public class StoreService {
	
	@Autowired
	private StoreDAO sDAO;
	
	/**
	 * 판매중 목록
	 */
	public List<StoreMainDomain> searchSalesList(String nick){
		List<StoreMainDomain> list = null;
		
		try {
		list = sDAO.selectSalesList(nick);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchSalesList
	
	/**
	 * 프로필 사진 select
	 */
	public String searchProfile(String nick) {
		String profile = "";
		try {
			profile = sDAO.selectProfile(nick);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return profile;
	}//searchProfile
	
	/**
	 * 리뷰리스트 2개씩
	 */
	public List<ReviewDomain> searchReviewList(String nick, int startNum, int endNum){
		String memNum = "";
		List<ReviewDomain> list = null;
		
		try {
			memNum = sDAO.selectMemNum(nick);
			ReviewVO rVO = new ReviewVO(memNum, startNum, endNum);
			list = sDAO.selectReview(rVO);
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchReviewList
	
	/**
	 * 평균 별점
	 */
	public List<Double> searchStarScore(String nick){
		List<Double> list = null;
		
		try {
			list = sDAO.selectStarScore(nick);
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchStarScore
	
	/**
	 * 유저코드 select
	 */
	public String searchMemNum(String nick) {
		String memNum = "";
		try {
			memNum = sDAO.selectMemNum(nick);
		}catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return memNum;
	}//searchNickCode
	
}
