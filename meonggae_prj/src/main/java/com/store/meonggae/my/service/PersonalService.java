package com.store.meonggae.my.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.store.meonggae.my.dao.PersonalDAO;
import com.store.meonggae.my.domain.PersonalDomain;
import com.store.meonggae.my.vo.PersonalInfoVO;
import com.store.meonggae.my.vo.PwVO;

@Service
public class PersonalService {
	
	@Autowired
	private PersonalDAO pDAO;
	
	/**
	 * 비번 검색
	 */
	public String searchPw(String memNum){
		String pw = "";
		
		try {
			pw = pDAO.selectPw(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return pw;
	}//searchPw
	
	/**
	 * 유저 정보 검색
	 */
	public PersonalDomain searchPersonal(String memNum){
		PersonalDomain pDomain = null;
		
		try {
			pDomain = pDAO.selectPersonal(memNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return pDomain;
	}//searchPersonal
	
	/**
	 * 비번 수정
	 */
	public int modifyPw(String memNum, String pw) {
		int cnt = 0;
		
		try {
			PasswordEncoder pe = new BCryptPasswordEncoder();
			String encryptionPw = pe.encode(pw);
			
			PwVO pwVO = new PwVO(memNum, encryptionPw);
			cnt = pDAO.updatePw(pwVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//modifyPw
	
	/**
	 * 닉네임 중복검색
	 */
	public boolean searchNick(String inputData) {
		Boolean flag = false;
		
		try {
			if(pDAO.selectNick(inputData)) { //사용가능하면
				flag = true;
			}//end if
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag; 
	}//searchNick
	
	/**
	 * 개인정보 수정
	 */
	public int modifyPersonalInfo(PersonalInfoVO piVO) {
		int cnt = 0;
		try {
			cnt = pDAO.updatePersonalInfo(piVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//modifyPersonalInfo
	
	/**
	 * 회원탈퇴
	 */
	public int modfiyMemberStatus(String memnum) {
		int cnt = 0;
		
		try {
			cnt = pDAO.updateMemberStatus(memnum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//modfiyMemberStatus
	
}//class