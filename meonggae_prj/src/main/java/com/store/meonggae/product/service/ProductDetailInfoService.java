package com.store.meonggae.product.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.product.dao.ProductDetailInfoDAO;
import com.store.meonggae.product.domain.SearchReviewDomain;
import com.store.meonggae.product.domain.SellOtherPrdDomain;
import com.store.meonggae.product.domain.SellerInfoDomain;
import com.store.meonggae.product.vo.ReportVO;
import com.store.meonggae.product.vo.SteamVO;

@Service
public class ProductDetailInfoService {

    @Autowired
    private ProductDetailInfoDAO pdiDAO;
    
//	퀵메뉴 - 회원의 찜 개수
    public int countMemSteam(String memNum){
    	return pdiDAO.countMemSteam(memNum);
    }//countAllSteam
//	상품의 전체 찜 횟수 조회
    public int countAllSteam(String goodsNum){
    	return pdiDAO.countAllSteam(goodsNum);
    }//countAllSteam
//	회원의 찜 여부 조회 찜했으면 1 아니면 0	 
    public boolean checkMemSteam(SteamVO steamVO){
    	int checkResult = pdiDAO.checkMemSteam(steamVO);
        return checkResult == 1;//찜했으면 true 아니면 false
    }//checkMemSteam
    
    //찜 등록
    public int insertSteam(SteamVO steamVO) {
    	int insertSteam = 0;
    	//있다가 삭제되었던 값이 있는지 확인. 있으면 다시찜. 없으면 첫찜.
    	int checkResult = pdiDAO.checkFirstSteam(steamVO);
    	//첫 찜
    	if(checkResult == 0) {
    		insertSteam = pdiDAO.insertSteam(steamVO);
    	}else if(checkResult == 1){
    	//삭제했다가 다시 찜.
    		insertSteam = pdiDAO.updateSteamToY(steamVO);
    	}
    	return insertSteam;
    }//insertSteam
    
    //찜 삭제
    public int updateSteamToN(SteamVO steamVO) {
    	return pdiDAO.updateSteamToN(steamVO);
    }//updateSteamToN
    
    //신고하기 insert
    public void insertReport(ReportVO reportVO) {
    	pdiDAO.insertReport(reportVO);
    }//insertReport
    
    //판매자 정보 조회
    public SellerInfoDomain sellerInfo(int memNum) {
    	
    	return pdiDAO.sellerInfo(memNum);
    }//sellerInfo
    //판매자 다른 상품 조회
    public List<SellOtherPrdDomain> sellerOtherPrd(SteamVO steamVO) {
    	return pdiDAO.sellerOtherPrd(steamVO); 
    }//sellerOtherPrd
    //판매자 리뷰 조회
    public List<SearchReviewDomain> searchReview(int memNum) {
    	return pdiDAO.searchReview(memNum);
    }//searchReview
    
    //조회수 올리기
    public void updateCnt(String goodsNum) {
    	pdiDAO.updateCnt(goodsNum);
    }
    
}
