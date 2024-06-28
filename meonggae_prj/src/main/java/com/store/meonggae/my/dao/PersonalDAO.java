package com.store.meonggae.my.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.my.domain.GoodsDomain;
import com.store.meonggae.my.domain.PersonalDomain;
import com.store.meonggae.my.vo.PersonalInfoVO;
import com.store.meonggae.my.vo.PwVO;

@Component
public class PersonalDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	
	/**
	 * 비번조회
	 */
	public String selectPw(String memNum) throws PersistenceException{
		String result = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		result = ss.selectOne("com.store.meonggae.personal.selectPw", memNum);
		mbDAO.CloseHandler(ss);
		
		return result;
	}//selectDibsList
	
	/**
	 * 개인정보 조회
	 */
	public PersonalDomain selectPersonal(String memNum) throws PersistenceException{
		PersonalDomain pDomain = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		pDomain = ss.selectOne("com.store.meonggae.personal.selectPersonal", memNum);
		mbDAO.CloseHandler(ss);
		
		return pDomain;
	}//selectPersonal
	
	/**
	 * 비밀번호 업데이트
	 */
	public int updatePw(PwVO pwVO) throws PersistenceException{
		int cnt = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.update("com.store.meonggae.personal.updatePw", pwVO);
		mbDAO.CloseHandler(ss);
		
		return cnt;
	}//selectPersonal
	
	/**
	 * 닉네임 중복확인(닉네임 검색)
	 */
	public Boolean selectNick(String inputData) throws PersistenceException{
		Boolean flag = false;
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		String result = ss.selectOne("com.store.meonggae.personal.selectNick", inputData);
		mbDAO.CloseHandler(ss);
		if(result == null) {
			flag = true;
		}//if
		
		return flag;
	}//selectNick
	
	/**
	 * 개인정보 수정
	 */
	public int updatePersonalInfo(PersonalInfoVO piVO) throws PersistenceException{
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.update("com.store.meonggae.personal.updateMemberDetail", piVO);
		
		if(piVO.getProfile() == null) {
			cnt += ss.update("com.store.meonggae.personal.updateMember", piVO);
		}else {
			cnt += ss.update("com.store.meonggae.personal.updateMemberNick", piVO);
		}//else
		mbDAO.CloseHandler(ss);
		
		return cnt;
	}//updatePersonalInfo
	
	/**
	 * 탈퇴
	 */
	public int updateMemberStatus(String memnum) throws PersistenceException{
		int cnt = 0;
		
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.update("com.store.meonggae.personal.quitMember", memnum);
		mbDAO.CloseHandler(ss);
		
		return cnt;
	}//updateMemberStatus
	
}//class
