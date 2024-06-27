package com.store.meonggae.mgr.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.mgr.dashboard.domain.GoodsTradeRatioDomain;
import com.store.meonggae.mgr.dashboard.domain.ReportRecentDomain;
import com.store.meonggae.mgr.dashboard.domain.TopEventDomain;
import com.store.meonggae.mgr.dashboard.domain.UserGraphDomain;
import com.store.meonggae.mgr.dashboard.domain.UserSummaryDomain;
import com.store.meonggae.mgr.dashboard.domain.VisitorDomain;
import com.store.meonggae.mgr.dashboard.domain.VisitorGraphDomain;
import com.store.meonggae.mgr.dashboard.vo.SelOptionVO;
import com.store.meonggae.mgr.dashboard.vo.VisitorDatepickVO;
import com.store.meonggae.mgr.dashboard.domain.CategoryTopDomain;

@Component
public class MgrDashboardDAO {
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	//  상위 거래 카테고리 - 그래프
	public List<GoodsTradeRatioDomain> selectListCategoryRatio(int period) throws PersistenceException {
		List<GoodsTradeRatioDomain> listCateRatio = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		listCateRatio = ss.selectList("com.store.meonggae.mgr.dashboard.selectListCategoryRatio", period);
		
		mbDAO.closeHandler(ss);
		
		return listCateRatio;
	} // selectTopCategory
	
	// 상위 거래 카테고리 - 총 거래수
	public int selectOneCategoryTop(int period) throws PersistenceException {
		int totalTradeCnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		
		totalTradeCnt = ss.selectOne("com.store.meonggae.mgr.dashboard.selectOneCategoryTop", period);
		
		mbDAO.closeHandler(ss);
		
		return totalTradeCnt;
	} // selectTopCategory
	
//	public CategoryTopDomain selectOneCategoryTop(int period) throws PersistenceException {
//		CategoryTopDomain cateTopDomain = new CategoryTopDomain();
//		List<GoodsTradeRatioDomain> listCateRatio = null;
//		int totalTradeCnt = 0;
//		
//		SqlSession ss = mbDAO.getMyBatisHandler(false);
//		
//		listCateRatio = ss.selectList("com.store.meonggae.mgr.dashboard.selectListCategoryRatio", period);
//		totalTradeCnt = ss.selectOne("com.store.meonggae.mgr.dashboard.selectOneCategoryTop", period);
//		
//		cateTopDomain.setGraph(listCateRatio);
//		cateTopDomain.setTotalTradeCnt(totalTradeCnt);
//		
//		mbDAO.closeHandler(ss);
//		
//		return cateTopDomain;
//	} // selectTopCategory
	
	// 사용자수 요약
	public List<UserSummaryDomain> selectListUserSummary(int period) throws PersistenceException {
		
		List<UserSummaryDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.dashboard.selectListUserSummary", period);
		
		mbDAO.closeHandler(ss);
		
		return list;
	} // selectUserSummary
	
	// 사용자수 추이 - 방문자수
	public List<UserGraphDomain> selectListUserTendencyVisitor(int period) throws PersistenceException {
		
		List<UserGraphDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.dashboard.selectListUserTendencyVisitor", period);
		
		mbDAO.closeHandler(ss);
		
		return list;
	} // selectListUserTendencyVisitor
	
	// 사용자수 추이 - 회원수
	public List<UserGraphDomain> selectListUserTendencyMember(int period) throws PersistenceException {
		
		List<UserGraphDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.dashboard.selectListUserTendencyMember", period);
		
		mbDAO.closeHandler(ss);
		
		return list;
	} // selectListUserTendencyMember
	
	// 사용자수 추이 - 가입자수 or 탈퇴자수
	public List<UserGraphDomain> selectListUserTendencyJoinWithdraw(SelOptionVO selOptVO) throws PersistenceException {
		
		List<UserGraphDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.dashboard.selectListUserTendencyJoinWithdraw", selOptVO);
		
		mbDAO.closeHandler(ss);
		
		return list;
	} // selectListUserTendencyMember
	
	// 이벤트 조회수 현황
	public List<TopEventDomain> selectListTopEvent(int type) {
		
		List<TopEventDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.dashboard.selectListTopEvent", type);
		
		mbDAO.closeHandler(ss);
		
		return list;
	} // selectListTopEvent
	
	// 신고 현황
	public List<ReportRecentDomain> selectListReportRecent() {
		List<ReportRecentDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.dashboard.selectReportRecent");
		
		mbDAO.closeHandler(ss);
		
		return list;
	} // selectReportRecent
	
	// 사이트 방문자수 - 요약
	public VisitorDomain selectOneVisitorSummary(VisitorDatepickVO visitorDateVO) {
		VisitorDomain visitorDomain = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		visitorDomain = ss.selectOne("com.store.meonggae.mgr.dashboard.selectVisitorSummary", visitorDateVO);

		mbDAO.closeHandler(ss);
		
		return visitorDomain;
	} // searchVisitorStatistics
	
	// 사이트 방문자수 - 그래프
	public List<VisitorGraphDomain> selectListVisitorGraph(VisitorDatepickVO visitorDateVO) {
		List<VisitorGraphDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.dashboard.selectVisitorGraph", visitorDateVO);
		
		mbDAO.closeHandler(ss);
		
		return list;
	} // selectVisitorGraph
	
} // class
