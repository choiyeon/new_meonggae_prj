package com.store.meonggae.user.join.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.store.meonggae.user.join.dao.JoinDAO;
import com.store.meonggae.user.join.vo.JoinVO;

@Service
public class JoinService {

	@Autowired
	private JoinDAO joinDAO;
	
	//아이디 중복 조회
	public boolean chkIdDup(String memId) {
		boolean flag = false;
		String result = joinDAO.chkIdDup(memId);
		if(result != null) {
			flag=true;
		}
		return flag;
	}//chkIdDup
	
	//닉네임 중복 조회
	public boolean chkNickDup(String nick) {
		boolean flag = false;
		String result = joinDAO.chkNickDup(nick);
		if(result != null) {
			flag=true;
		}
		return flag;
	}//chkIdDup
	
	//MEMBER insert
	public int insertMem(String nick) {
		return joinDAO.insertMem(nick);
	}//insertMem
	
	//MEMBER insert
	public int insertMemDetail(JoinVO joinVO) {
		//비밀번호 암호화
		PasswordEncoder pe = new BCryptPasswordEncoder();
		String encodePass = pe.encode(joinVO.getPassword());
		joinVO.setPassword(encodePass);
		return joinDAO.insertMemDetail(joinVO);
	}//insertMem
}
