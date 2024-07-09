package com.store.meonggae.mgr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.stereotype.Component;

import com.store.meonggae.mgr.manager.domain.MgrEmailDomain;
import com.store.meonggae.mgr.manager.domain.MgrManagerDomain;
import com.store.meonggae.mgr.manager.vo.ManagerSearchVO;
import com.store.meonggae.mgr.manager.vo.MgrManagerVO;

@Component
public class MgrManagerDAO {
	
	@Autowired(required = false)
	private MyBatisDAO mbDAO;
	
	// 검색된 관리자의 수
	public int selectOneManagerCount( ManagerSearchVO sVO){
		
		int totalCnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		totalCnt = ss.selectOne("com.store.meonggae.mgr.manager.selectOneListCnt", sVO);
		
		return totalCnt;
	} // selectManagerCount
	
	// 검색된 관리자 리스트
	public List<MgrManagerDomain> selectListManager( ManagerSearchVO sVO ){
		
		List<MgrManagerDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.manager.selectListManager", sVO);

		return list;
	} // selectListManager
	
	// 관리자 이름 리스트 조회
	public List<MgrManagerDomain> selectListAllManagerName() {
		List<MgrManagerDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.mgr.manager.selectListAllManagerName");
		
		return list;
	} // selectListAllManagerName
	
	// 관리자 한 명 검색
	public MgrManagerDomain selectOneManager(String managerId) {
		MgrManagerDomain mmDomain = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		mmDomain = ss.selectOne("com.store.meonggae.mgr.manager.selectOneManager", managerId);

		return mmDomain;
	} // selectOneManager
	
	// 관리자 아이디 중복검사
	public boolean selectOneManagerIdDuplicate(String managerId) {
		boolean flagCanUse = false;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		flagCanUse = ss.selectOne("com.store.meonggae.mgr.manager.selectOneManagerIdDuplicate", managerId);
		return flagCanUse;
	} // selectOneManagerIdDuplicate
	
	// 관리자 닉네임 중복검사
	public boolean selectOneManagerNickDuplicate(String nick) {
		boolean flagCanUse = false;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		flagCanUse = ss.selectOne("com.store.meonggae.mgr.manager.selectOneManagerNickDuplicate", nick);
		return flagCanUse;
	} // selectOneManagerIdDuplicate
	
	// 관리자 신규 등록
	public void insertManager(MgrManagerVO mmVO) {
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		ss.insert("com.store.meonggae.mgr.manager.insertManager", mmVO);
	} // insertManager
	
	// 관리자 등록시 사용되는 메일 전송 계정
	public MgrEmailDomain selectOneEmailAcoount(String mailNum) {
		MgrEmailDomain mgrEmailDomain = null;
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		mgrEmailDomain = ss.selectOne("com.store.meonggae.mgr.manager.selectOneEmailAcoount", mailNum);
		return mgrEmailDomain;
	} // selectOneEmailAcoount
} // class
