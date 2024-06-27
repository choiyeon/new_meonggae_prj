package com.store.meonggae.my.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.store.meonggae.my.dao.DibsDAO;
import com.store.meonggae.my.dao.MypageMainDAO;
import com.store.meonggae.my.dao.PersonalDAO;
import com.store.meonggae.my.domain.GoodsDomain;
import com.store.meonggae.my.domain.PersonalDomain;
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
	 * 비번 검색
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
		
		PasswordEncoder pe = new BCryptPasswordEncoder();
		
		String encryptionPw = pe.encode(pw);
		
		PwVO pwVO = new PwVO(memNum, encryptionPw);
		cnt = pDAO.updatePw(pwVO);
		
		return cnt;
	}//modifyPw
	
}//class