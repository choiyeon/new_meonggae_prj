package com.store.meonggae.mgr.interceptor.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.stereotype.Service;

import com.store.meonggae.mgr.dao.MgrInterceptorDAO;

@Service
public class MgrInterceptorService {
	
	@Autowired(required = false)
	private MgrInterceptorDAO miDAO;
	
	// 로그인한 관리자 권한 조회
	public String searchOneManagerPermission(String managerId) {
		String permissionEncrypt = "";
		String permissionDecrypt = "";
				
		try {
			permissionEncrypt = miDAO.selectOneManagerPermission(managerId);
			
			String key = "test1234";
			String salt = "123456";
			TextEncryptor te = Encryptors.text(key, salt);

			permissionDecrypt = te.decrypt(permissionEncrypt);
			
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return permissionDecrypt;
	} // totalCount
} // class
