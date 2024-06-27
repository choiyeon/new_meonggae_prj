package com.store.meonggae.user.join.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.user.join.vo.JoinVO;

@Component
public class JoinDAO {
	@Autowired
	private MybatisDAO mbDAO;
	
	//아이디 중복 조회
	public String chkIdDup(String memId)throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectOne("com.store.meonggae.join.idDup", memId);
		}
	};//chkIdDup
	//닉네임 중복 조회
	public String chkNickDup(String nick)throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectOne("com.store.meonggae.join.nickDup", nick);
		}
	};//chkNickDup
	//MEMBER insert
	public int insertMem(String nick)throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
			return ss.insert("com.store.meonggae.join.insertMem", nick);
		}
	};//insertMem
	//MEMBER_DETAIL insert
	public int insertMemDetail(JoinVO joinVO)throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
			return ss.insert("com.store.meonggae.join.insertMemDetail", joinVO);
		}
	};//insertMemDetail
	
}
