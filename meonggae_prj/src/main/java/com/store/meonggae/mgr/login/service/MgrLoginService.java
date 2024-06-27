package com.store.meonggae.mgr.login.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.store.meonggae.mgr.dao.MgrLoginDAO;
import com.store.meonggae.mgr.login.domain.MgrDomain;
import com.store.meonggae.mgr.login.vo.MgrVO;

@Service
public class MgrLoginService {
	
	@Autowired(required=false)
	private MgrLoginDAO mlDAO;
	
	public MgrDomain searchOneMgr(MgrVO mgrVO) {
		
		MgrDomain mgrDomain = null;
		
		try {
			mgrDomain = mlDAO.selectOneManager(mgrVO);
			if (mgrDomain != null) {
				PasswordEncoder pe = new BCryptPasswordEncoder();
				
				if(pe.matches(mgrVO.getPass(), mgrDomain.getPass())) {
					String key = "test1234";
					String salt = "123456";
					TextEncryptor te = Encryptors.text(key, salt);
					
					mgrDomain.setPass("");
					mgrDomain.setPermission(te.decrypt(mgrDomain.getPermission()));
					mgrDomain.setEmail(te.decrypt(mgrDomain.getEmail()));
				} else {
					mgrDomain = null;
				} // end else
			} // end if
		} catch (PersistenceException e) {
			e.printStackTrace();
		} // end catch
		
		return mgrDomain;
	} // searchOneMgr
} // class
