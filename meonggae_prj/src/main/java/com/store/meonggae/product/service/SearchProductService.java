package com.store.meonggae.product.service;

import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.product.dao.SearchProductDAO;
import com.store.meonggae.product.domain.SearchProductDetailDomain;
import com.store.meonggae.product.domain.SearchProductDomain;
import com.store.meonggae.product.domain.SellerInfoDomain;
import com.store.meonggae.product.vo.SearchProductVO;

@Service
public class SearchProductService {

    @Autowired
    private SearchProductDAO spDAO;
    
    //상품 전체 조회
    public List<SearchProductDomain> selectAllProduct(){
    	return spDAO.selectAllProduct();
    }
    //상품전체조회 - 무한스크롤
    public List<SearchProductDomain> selectAllPrdInfiniteScroll(int start, int end){
    	return spDAO.selectAllPrdInfiniteScroll(start, end);
    }
    //최근 본 상품 조회
    public SearchProductDomain selectRecentProduct(String goodsNum){
    	return spDAO.selectRecentProduct(goodsNum);
    }
    //상품 키워드 검색
    public List<SearchProductDomain> selectPrdKey(String keyword){
    	return spDAO.selectPrdKey(keyword);
    }
    //상품 키워드&카테고리 검색
    public List<SearchProductDomain> selectPrdKeyCate(SearchProductVO spVO){
    	return spDAO.selectPrdKeyCate(spVO);
    }
    //상품 카테고리 검색 - 부모
    public List<SearchProductDomain> selectPrdCateP(String categoryNum){
    	return spDAO.selectPrdCateP(categoryNum);
    }
    //상품 카테고리 검색 - 자식
    public List<SearchProductDomain> selectPrdCate(String categoryNum){
    	return spDAO.selectPrdCate(categoryNum);
    }
    //상품 상세 조회
    public SearchProductDetailDomain selectPrdDetail(String goodsNum){
    	return spDAO.selectPrdDetail(goodsNum);
    }

    //키워드로 조회된 상품들의 카테고리 개수
    public Map<String, Long> cateCnt(List<SearchProductDomain> list) {
        // 카테고리별 개수 계산하여 맵으로 변환하고, 개수가 큰 순서대로 정렬
        Map<String, Long> cateCnt = list.stream()
                .collect(Collectors.groupingBy(SearchProductDomain::getCategoryNum, Collectors.counting()))
                .entrySet().stream()
                .sorted(Map.Entry.<String, Long>comparingByValue(Comparator.reverseOrder()))
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue,
                        (oldValue, newValue) -> oldValue, LinkedHashMap::new));

        return cateCnt;
    }
    //카테고리 번호로 카테고리 이름 조회하기
    public String selectCategoryName(String categoryNum) {
    	return spDAO.selectCategoryName(categoryNum);
    }
    
    //상점명 검색
    public List<SellerInfoDomain> selectStore(String keyword){
    	keyword = keyword.substring(1);
    	return spDAO.selectStore(keyword);
    }
}
