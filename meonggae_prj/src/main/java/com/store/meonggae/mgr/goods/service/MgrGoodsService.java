package com.store.meonggae.mgr.goods.service;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.mgr.dao.MgrGoodsDAO;
import com.store.meonggae.mgr.goods.domain.MgrGoodsDomain;
import com.store.meonggae.mgr.goods.domain.MgrOtherGoodsDomain;
import com.store.meonggae.mgr.goods.domain.MgrSellerReviewDomain;
import com.store.meonggae.mgr.goods.vo.MgrGoodsSearchVO;

@Service
public class MgrGoodsService {
	@Autowired
	private MgrGoodsDAO mgDAO;
	
	// 검색된 리뷰 수
	public int getTotalCount(MgrGoodsSearchVO sVO) {
		int totalCount = 0;
		
		try {
			totalCount = mgDAO.selectOneGoodsCount(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return totalCount;
	} // totalCount

	// 한 화면에 보여줄 게시물의 수
	public int getPageScale() {
		int pageScale = 16;
		return pageScale;
	} // pageScale
	
	// 총 페이지수
	public int getTotalPage(int totalCount, int pageScale) {
		return (int)Math.ceil((double)totalCount / pageScale);
	} // totalPage
	
	// 현재 페이지
	public int getCurrentPage(MgrGoodsSearchVO sVO) {
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
	public List<MgrGoodsDomain> searchListGoodsList(MgrGoodsSearchVO sVO) {
		List<MgrGoodsDomain> list = null;
		try {
			list = mgDAO.selectListGoods(sVO);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return list;
	} // searchListReviewList
	
	// 상위 카테고리의 하위 카테고리 검색 
//	public List<MgrCategoryDomain> searchListCategoryList(int categoryNum) {
//		List<MgrCategoryDomain> list = null;
//		try {
//			list = mrDAO.selectListCategoryList(categoryNum);
//		} catch(PersistenceException pe) {
//			pe.printStackTrace();
//		} // end catch
//		
//		return list;
//	} // searchListReviewList
	
	// 카테고리 조회 - AJAX
//	@SuppressWarnings("unchecked")
//	public String searchListCategoryListAjax(int categoryNum) {
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
//		
//		JSONObject jsonObj = new JSONObject();
//		
//		jsonObj.put("result", false);
//		jsonObj.put("dataSize", 0);
//		jsonObj.put("date", sdf.format(new Date()));
//		jsonObj.put("data", "");
//		
//		try {
//			List<MgrCategoryDomain> list = mrDAO.selectListCategoryList(categoryNum);
//			
//			ObjectMapper objMapper = new ObjectMapper();
//			
//			jsonObj.put("data", objMapper.writeValueAsString(list));
//			jsonObj.put("dataSize", list.size());
//			jsonObj.put("result", true);
//		} catch (PersistenceException pe) {
//			pe.printStackTrace();
//		} catch (JsonProcessingException jpe) {
//			jpe.printStackTrace();
//		} // catch
//		return jsonObj.toJSONString();
//	} // searchListCategoryList
	
	// 물품 상세 조회
	public MgrGoodsDomain searchOneGoodsDetail(String goodsNum) {
		
		MgrGoodsDomain mgDomain = null;
		
		try {
			mgDomain = mgDAO.selectOneGoods(goodsNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return mgDomain;
	} // searchOneReviewDetail
	
	// 물품 삭제
	public int removeOneGoods(String goodsNum) {
		int cnt = 0;
		try {
			cnt = mgDAO.deleteGoods(goodsNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return cnt;
	} // removeReview
	
	// 판매자의 다른 물품 조회 (물품 상세 페이지)
	public List<MgrOtherGoodsDomain> searchListOtherGoods(int memNum) {
		List<MgrOtherGoodsDomain> list = null;
		
		try {
			list = mgDAO.selectListOtherGoods(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return list;
	} // searchListOtherGoods
	
	// 판매자에게 달린 후기 조회 (물품 상세 페이지)
	public List<MgrSellerReviewDomain> searchListSellerReview(int memNumSell) {
		List<MgrSellerReviewDomain> list = null;
		
		try {
			list = mgDAO.selectListSellerReview(memNumSell);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return list;
	} // searchListOtherGoods
} // class
