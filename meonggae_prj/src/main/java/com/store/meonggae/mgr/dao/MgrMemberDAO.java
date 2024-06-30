package com.store.meonggae.mgr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.mgr.goods.domain.MgrGoodsDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberInqiryDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberLoginLogDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberPersonalDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberReportDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberSteamDomain;
import com.store.meonggae.mgr.member.vo.MgrMemberGoodsSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberInquiySearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberReportSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberReviewSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberSteamSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberSuspendVO;
import com.store.meonggae.mgr.review.domain.MgrReviewDomain;

@Component
public class MgrMemberDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	// 검색된 회원의 수
	public int selectOneMemberCount(MgrMemberSearchVO sVO) {

		int totalCnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCnt = ss.selectOne("com.store.meonggae.mgr.member.selectOneListCnt", sVO);
		
		return totalCnt;
	} // selectOneMemberCount
	
	// 검색된 회원 리스트
	public List<MgrMemberDomain> selectListMember(MgrMemberSearchVO sVO) {
		List<MgrMemberDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.member.selectListMember", sVO);
		
		return list;
	} // selectListMember
	
	// 회원 상세 조회 - 개인정보
	public MgrMemberPersonalDomain selectOneMemberPersonal(int memNum) {
		MgrMemberPersonalDomain mmpDomain = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		mmpDomain = ss.selectOne("com.store.meonggae.mgr.member.selectOneMemberPersonal", memNum);
		
		return mmpDomain;
	} // selectOneGoods
	
	// 회원 정지
	public int updateOneMemberSuspend(MgrMemberSuspendVO suspendVO) {
		int cnt = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.update("com.store.meonggae.mgr.member.updateOneMemberSuspend", suspendVO);
		return cnt;
	} // updateOneMemberSuspend
	
	// 회원 정지 즉시 해제
	public int updateOneMemberUnSuspend(int memNum) {
		int cnt = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.update("com.store.meonggae.mgr.member.updateOneMemberUnSuspend", memNum);
		return cnt;
	} // updateOneMemberUnSuspend
	
	// 검색된 회원의 로그인 로그 수
	public int selectOneMemberLoginLogCount(int memNum) {

		int totalCnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCnt = ss.selectOne("com.store.meonggae.mgr.member.selectOneLoginLogListCnt", memNum);
		
		return totalCnt;
	} // selectOneMemberLoginLogCount
	
	// 검색된 회원의 로그인 로그 리스트
	public List<MgrMemberLoginLogDomain> selectListLoginLog(MgrMemberSearchVO sVO) {
		List<MgrMemberLoginLogDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.member.selectListLoginLog", sVO);
		
		return list;
	} // selectListLoginLog
	
	// 검색된 회원의 찜목록 수
	public int selectOneSteamListCnt(MgrMemberSteamSearchVO sVO) {
		
		int totalCnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCnt = ss.selectOne("com.store.meonggae.mgr.member.selectOneSteamListCnt", sVO);
		
		return totalCnt;
	} // selectOneMemberLoginLogCount
	
	// 검색된 회원의 찜목록 리스트
	public List<MgrMemberSteamDomain> selectListSteam(MgrMemberSteamSearchVO sVO) {
		List<MgrMemberSteamDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.member.selectListSteam", sVO);
		
		return list;
	} // selectListLoginLog
	
	// 검색된 회원의 리뷰 목록 수
	public int selectOneReviewListCnt(MgrMemberReviewSearchVO sVO) {
		
		int totalCnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCnt = ss.selectOne("com.store.meonggae.mgr.member.selectOneReviewCnt", sVO);
		
		return totalCnt;
	} // selectOneMemberLoginLogCount
	
	// 검색된 회원의 리뷰 목록 리스트
	public List<MgrReviewDomain> selectListReview(MgrMemberReviewSearchVO sVO) {
		List<MgrReviewDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.member.selectListReview", sVO);
		
		return list;
	} // selectListLoginLog
	
	// 검색된 회원의 문의 목록 수
	public int selectOneInquiryListCnt(MgrMemberInquiySearchVO sVO) {
		
		int totalCnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCnt = ss.selectOne("com.store.meonggae.mgr.member.selectOneInquiryCnt", sVO);
		
		return totalCnt;
	} // selectOneMemberLoginLogCount
	
	// 검색된 회원의 리뷰 목록 리스트
	public List<MgrMemberInqiryDomain> selectListInquiry(MgrMemberInquiySearchVO sVO) {
		List<MgrMemberInqiryDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.member.selectListInquiry", sVO);
		
		return list;
	} // selectListLoginLog
	
	// 검색된 회원의 신고 목록 수
	public int selectOneReportListCnt(MgrMemberReportSearchVO sVO) {
		
		int totalCnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCnt = ss.selectOne("com.store.meonggae.mgr.member.selectOneReportCnt", sVO);
		
		return totalCnt;
	} // selectOneReportListCnt

	// 검색된 회원의 신고 목록 리스트
	public List<MgrMemberReportDomain> selectListReport(MgrMemberReportSearchVO sVO) {
		List<MgrMemberReportDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.member.selectListReport", sVO);
		
		return list;
	} // selectListReport
	
	// 검색된 회원의 거래내역 목록 수
	public int selectOneTradeListCnt(MgrMemberGoodsSearchVO sVO) {
		
		int totalCnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCnt = ss.selectOne("com.store.meonggae.mgr.member.selectOneTradeCnt", sVO);
		
		return totalCnt;
	} // selectOneReportListCnt
	
	// 검색된 회원의 거래내역 목록 리스트
	public List<MgrGoodsDomain> selectListTrade(MgrMemberGoodsSearchVO sVO) {
		List<MgrGoodsDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.member.selectListTrade", sVO);
		
		return list;
	} // selectListReport
} // class
