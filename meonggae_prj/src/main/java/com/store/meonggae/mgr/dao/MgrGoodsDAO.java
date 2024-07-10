package com.store.meonggae.mgr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.mgr.goods.domain.MgrGoodsDomain;
import com.store.meonggae.mgr.goods.domain.MgrOtherGoodsDomain;
import com.store.meonggae.mgr.goods.domain.MgrSellerReviewDomain;
import com.store.meonggae.mgr.goods.vo.MgrGoodsSearchVO;

@Component
public class MgrGoodsDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	// 검색된 물품의 수
	public int selectOneGoodsCount(MgrGoodsSearchVO sVO) {

		int totalCnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCnt = ss.selectOne("com.store.meonggae.mgr.goods.selectOneListCnt", sVO);
		
		return totalCnt;
	} // selectOneGoodsCount
	
	// 검색된 물품 리스트
	public List<MgrGoodsDomain> selectListGoods(MgrGoodsSearchVO sVO) {
		List<MgrGoodsDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.goods.selectListGoods", sVO);
		
		return list;
	} // selectListGoods
	
	// 물품 상세 조회
	public MgrGoodsDomain selectOneGoods(String goodsNum) {
		MgrGoodsDomain mgDomain = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		mgDomain = ss.selectOne("com.store.meonggae.mgr.goods.selectOneGoods", goodsNum);
		
		return mgDomain;
	} // selectOneGoods
	
	// 물품 삭제
	public int deleteGoods(String goodsNum) {
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.delete("com.store.meonggae.mgr.goods.deleteOneGoods", goodsNum);
		
		return cnt;
	} // deleteReview
	
	// 판매자의 다른 물품 조회 (물품 상세 페이지)
	public List<MgrOtherGoodsDomain> selectListOtherGoods(int memNum) {
		List<MgrOtherGoodsDomain> list= null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.goods.selectListOtherGoods", memNum);
		
		return list;
	} // selectListOtherGoods
	
	// 판매자에게 달린 후기 조회 (물품 상세 페이지)
	public List<MgrSellerReviewDomain> selectListSellerReview(int memNumSell) {
		List<MgrSellerReviewDomain> list= null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.goods.selectListSellerReview", memNumSell);
		
		return list;
	} // selectListSellerReview
} // class
