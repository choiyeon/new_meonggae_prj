package com.store.meonggae.my.acount.service;

import java.util.Random;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.store.meonggae.my.acount.dao.AcountDAO;
import com.store.meonggae.my.acount.vo.ChkAcountVO;
import com.store.meonggae.my.acount.vo.ChkPwAcountVO;
import com.store.meonggae.my.acount.vo.PwVO;
import com.store.meonggae.my.dao.DibsDAO;

@Service
public class AcountService {
	
	@Autowired
	private AcountDAO acDAO;
	
	/**
	 * 계정정보 존재여부 확인
	 */
	public int searchAcount(String name, String email){
		int cnt = 0;
		
		ChkAcountVO caVO = new ChkAcountVO(name, email);
		
		try {
			cnt = acDAO.selectAcount(caVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//searchAcount
	
	/**
	 * 아이디 select
	 */
	public String searchID(String name, String email){
		String id = "";
		
		ChkAcountVO caVO = new ChkAcountVO(name, email);
		
		try {
			id = acDAO.selectId(caVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return id;
	}//searchID
	
	/**
	 * 계정정보 존재여부 확인(비밀번호 포함)
	 */
	public int searchPwAcount(String name, String id, String email){
		int cnt = 0;
		
		ChkPwAcountVO cwaVO = new ChkPwAcountVO(name, id, email);
		
		try {
			cnt = acDAO.selectPwAcount(cwaVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//searchPwAcount
	
	
	/**
	 * 비밀번호 수정
	 */
	public int modifyPw(String id, String pw){
		int cnt = 0;
		
		try {
			PasswordEncoder pwe = new BCryptPasswordEncoder();
			String encryptionpw = pwe.encode(pw.toString());
			
			PwVO pwVO = new PwVO(id, encryptionpw);
			cnt = acDAO.updatePw(pwVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//modifyPw
	
}//class