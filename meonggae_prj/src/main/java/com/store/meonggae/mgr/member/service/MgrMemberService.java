package com.store.meonggae.mgr.member.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.mgr.common.service.MaskingService;
import com.store.meonggae.mgr.common.vo.MgrSearchVO;
import com.store.meonggae.mgr.dao.MgrMemberDAO;
import com.store.meonggae.mgr.member.domain.MgrMemberDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberInqiryDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberLoginLogDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberPersonalDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberReportDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberSteamDomain;
import com.store.meonggae.mgr.member.vo.MgrMemberInquiySearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberReportSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberReviewSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberSteamSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberSuspendVO;
import com.store.meonggae.mgr.review.domain.MgrReviewDomain;

@Service
public class MgrMemberService {
	@Autowired(required = false)
	private MgrMemberDAO mmDAO;
	@Autowired(required = false)
	private MaskingService maskingService;
	
	// 검색된 회원 수
	public int getTotalCount(MgrMemberSearchVO sVO) {
		int totalCount = 0;
		
		try {
			totalCount = mmDAO.selectOneMemberCount(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return totalCount;
	} // getTotalCount
	
	// 한 화면에 보여줄 게시물의 수
	public int getPageScale() {
		int pageScale = 10;
		return pageScale;
	} // pageScale
	
	// 한 화면에 보여줄 게시물의 수
	public int getPageScale(int pageScale) {
		return pageScale;
	} // pageScale
	
	// 총 페이지수
	public int getTotalPage(int totalCount, int pageScale) {
		return (int)Math.ceil((double)totalCount / pageScale);
	} // totalPage
	
	// 현재 페이지
	public int getCurrentPage(MgrMemberSearchVO sVO) {
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
	
	// 현재 페이지
	public int getCurrentPage(MgrSearchVO sVO) {
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
	public List<MgrMemberDomain> searchListMemberList(MgrMemberSearchVO sVO) {
		List<MgrMemberDomain> list = null;
		try {
			list = mmDAO.selectListMember(sVO);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return list;
	} // searchListReviewList
	
	// 회원 상세 조회 - 개인정보
	public MgrMemberPersonalDomain selectOneMemberPersonal(int memNum) {
		
		MgrMemberPersonalDomain mmpDomain = null;
		
		try {
			mmpDomain = mmDAO.selectOneMemberPersonal(memNum);
			if(mmpDomain.getName() != null) {
				mmpDomain.setName(maskingService.nameMasking(mmpDomain.getName()));
			} // end if
			if(mmpDomain.getTel() != null) {
				mmpDomain.setTel(maskingService.phoneMasking(mmpDomain.getTel()));
			} // end if
			if(mmpDomain.getAddr() != null) {
				mmpDomain.setAddr(maskingService.addressMasking(mmpDomain.getAddr()));
			} // end if
			if(mmpDomain.getBirth() != null) {
				mmpDomain.setBirth(maskingService.birthMasking(mmpDomain.getBirth()));
			} // end if
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} // end catch
		
		return mmpDomain;
	} // selectOneMemberPersonal
	
	// 회원 정지
	public int updateOneMemberSuspend(MgrMemberSuspendVO suspendVO) {
		int cnt = 0;
		try {
			cnt = mmDAO.updateOneMemberSuspend(suspendVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return cnt;
	} // updateOneMemberSuspend
	
	// 회원 정지 즉시 해제
	public int updateOneMemberUnSuspend(int memNum) {
		int cnt = 0;
		try {
			cnt = mmDAO.updateOneMemberUnSuspend(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return cnt;
	} // updateOneMemberSuspend
	
	// 검색된 회원의 로그인 로그 수
	public int getLoginLogTotalCount(int memNum) {
		int totalCount = 0;
		
		try {
			totalCount = mmDAO.selectOneMemberLoginLogCount(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return totalCount;
	} // getLoginLogTotalCount
	
	// 검색된 회원의 로그인 로그 리스트 조회
	public List<MgrMemberLoginLogDomain> searchListLoginLog(MgrMemberSearchVO sVO) {
		List<MgrMemberLoginLogDomain> list = null;
		try {
			list = mmDAO.selectListLoginLog(sVO);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return list;
	} // searchListLoginLog
	
	// 검색된 회원의 찜목록 수
	public int getSteamTotalCount(MgrMemberSteamSearchVO sVO) {
		int totalCount = 0;
		
		try {
			totalCount = mmDAO.selectOneSteamListCnt(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return totalCount;
	} // getLoginLogTotalCount
	
	// 검색된 회원의 찜목록 리스트 조회
	public List<MgrMemberSteamDomain> searchListSteam(MgrMemberSteamSearchVO sVO) {
		List<MgrMemberSteamDomain> list = null;
		try {
			list = mmDAO.selectListSteam(sVO);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return list;
	} // searchListLoginLog
	
	// 현재 페이지
	public int getCurrentPage(MgrMemberSteamSearchVO sVO) {
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
	
	// 검색된 회원의 리뷰 수
	public int getReviewTotalCount(MgrMemberReviewSearchVO sVO) {
		int totalCount = 0;
		
		try {
			totalCount = mmDAO.selectOneReviewListCnt(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return totalCount;
	} // getLoginLogTotalCount
	
	// 검색된 회원의 리뷰 리스트 조회
	public List<MgrReviewDomain> searchListReview(MgrMemberReviewSearchVO sVO) {
		List<MgrReviewDomain> list = null;
		try {
			list = mmDAO.selectListReview(sVO);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return list;
	} // searchListLoginLog
	
	// 검색된 회원의 문의 수
	public int getInquiryTotalCount(MgrMemberInquiySearchVO sVO) {
		int totalCount = 0;
		
		try {
			totalCount = mmDAO.selectOneInquiryListCnt(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return totalCount;
	} // getLoginLogTotalCount
	
	// 검색된 회원의 문의 리스트 조회
	public List<MgrMemberInqiryDomain> searchListInquiry(MgrMemberInquiySearchVO sVO) {
		List<MgrMemberInqiryDomain> list = null;
		try {
			list = mmDAO.selectListInquiry(sVO);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return list;
	} // searchListLoginLog
	
	// 검색된 회원의 신고 수
	public int getReportTotalCount(MgrMemberReportSearchVO sVO) {
		int totalCount = 0;
		
		try {
			totalCount = mmDAO.selectOneReportListCnt(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return totalCount;
	} // getLoginLogTotalCount
	
	// 검색된 회원의 신고 리스트 조회
	public List<MgrMemberReportDomain> searchListReport(MgrMemberReportSearchVO sVO) {
		List<MgrMemberReportDomain> list = null;
		try {
			list = mmDAO.selectListReport(sVO);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return list;
	} // searchListLoginLog
} // class
