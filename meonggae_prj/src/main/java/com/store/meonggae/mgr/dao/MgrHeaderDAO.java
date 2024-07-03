package com.store.meonggae.mgr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.mgr.header.domain.MgrNoticeDomain;
import com.store.meonggae.mgr.header.vo.MgrNoticeVO;

@Component
public class MgrHeaderDAO {
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	// 관리자가 안 읽은 알림이 존재하는지
	public boolean selectOneIsNotice(String managerId){
		
		boolean flagNotice = false;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		flagNotice = ss.selectOne("com.store.meonggae.mgr.header.selectOneIsNotice", managerId);
		
		return flagNotice;
	} // selectOneIsNotice
	
	// 관리자의 알림 리스트
	public List<MgrNoticeDomain> selectListNotice(String managerId){
		
		List<MgrNoticeDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.header.selectListNoticeList", managerId);
		
		return list;
	} // selectListNotice
	
	// 관리자의 알림 (문의) 모두 읽음
	public int updateAllInquiryNoticeRead(String managerId) {
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.update("com.store.meonggae.mgr.header.updateAllInquiryNoticeRead", managerId);
		
		return cnt;
	} // updateAllNoticeRead
	
	// 관리자의 알림 (신고) 모두 읽음
	public int updateAllReportNoticeRead(String managerId) {
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.update("com.store.meonggae.mgr.header.updateAllReportNoticeRead", managerId);
		
		return cnt;
	} // updateAllNoticeRead
	
	// 관리자의 알림 하나 읽음
	public int updateOneNoticeRead(MgrNoticeVO noticeVO) {
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.update("com.store.meonggae.mgr.header.updateOneNoticeRead", noticeVO);
		
		return cnt;
	} // updateOneNoticeRead
} // class