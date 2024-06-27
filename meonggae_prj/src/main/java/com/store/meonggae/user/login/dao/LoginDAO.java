package com.store.meonggae.user.login.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.user.login.domain.LoginDomain;
import com.store.meonggae.user.login.vo.LoginVO;

@Component
public class LoginDAO {
	@Autowired
	private MybatisDAO mbDAO;

	public LoginDomain login(LoginVO lVO) throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectOne("com.store.meonggae.user_login.selectOneUser", lVO);
		}

	}

	public void insertKakaoUser(LoginDomain user) throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
			ss.insert("com.store.meonggae.user_login.kakaoUserInsert", user);
			ss.insert("com.store.meonggae.user_login.KaKaoIdInsert", user);
			ss.commit();
		}
	}

}