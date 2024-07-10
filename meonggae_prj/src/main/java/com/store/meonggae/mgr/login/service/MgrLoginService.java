package com.store.meonggae.mgr.login.service;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base32;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.store.meonggae.mgr.dao.MgrLoginDAO;
import com.store.meonggae.mgr.login.domain.MgrDomain;
import com.store.meonggae.mgr.login.vo.MgrSecondAuthVO;
import com.store.meonggae.mgr.login.vo.MgrVO;

@Service
public class MgrLoginService {
	
	@Autowired(required=false)
	private MgrLoginDAO mlDAO;
	
	// 관리자 로그인시 허용 아이피 제한
	public boolean chkIp(String ip) {
		List<String> listAllowIp = new ArrayList<String>();
		
		listAllowIp.add("0:0:0:0:0:0:0:1");
		listAllowIp.add("localhost");
		listAllowIp.add("127.0.0.1");
		listAllowIp.add("192.168.10.213");
		listAllowIp.add("192.168.10.214");
		listAllowIp.add("192.168.10.218");
		listAllowIp.add("192.168.10.219");
		listAllowIp.add("192.168.10.220");
		listAllowIp.add("192.168.10.210");
		listAllowIp.add("211.63.89.135");
		listAllowIp.add("211.63.89.136");
		listAllowIp.add("211.63.89.140");
		listAllowIp.add("211.63.89.141");
		listAllowIp.add("211.63.89.132");
		listAllowIp.add("1.221.18.2");
		
		return listAllowIp.contains(ip);
	} // chkIp
	
	// 관리자 로그인
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
					if(mgrDomain.getPermission() != null && !mgrDomain.getPermission().equals("")) {
						mgrDomain.setPermission(te.decrypt(mgrDomain.getPermission()));
					} // end if
					if(mgrDomain.getEmail() != null && !mgrDomain.getEmail().equals("")) {
						mgrDomain.setEmail(te.decrypt(mgrDomain.getEmail()));
					} // end if
				} else {
					mgrDomain = null;
				} // end else
			} // end if
		} catch (PersistenceException e) {
			e.printStackTrace();
		} // end catch
		
		return mgrDomain;
	} // searchOneMgr
	
	// 관리자 2차 인증키 조회
	public String selectOneManager2ndAuthKey(String managerId) {
		String secondAuthKey = "";
		try {
			String key = "test1234";
			String salt = "123456";
			TextEncryptor te = Encryptors.text(key, salt);
			
			secondAuthKey = te.decrypt(mlDAO.selectOneManager2ndAuthKey(managerId));
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return secondAuthKey;
	} // selectOneManager2ndAuthKey
	
	// 관리자 2차 인증
	public boolean isSecondAuthCorrect(MgrSecondAuthVO mgrAuthVO) {
		boolean flagCheckCode = false;
		try {
			String secondAuthKey = selectOneManager2ndAuthKey(mgrAuthVO.getManager_id());
			long authKey = mgrAuthVO.getAuthkey();
			
			long l = new Date().getTime();
			long ll =  l / 30000;
			// 키, 코드, 시간으로 일회용 비밀번호가 맞는지 일치 여부 확인.
			flagCheckCode = checkCode(secondAuthKey, authKey, ll);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} // end catch
		
		return flagCheckCode;
	}
	
	// 일회용 비밀번호가 맞는지 일치 여부 확인.
	private boolean checkCode(String secret, long code, long t) throws NoSuchAlgorithmException, InvalidKeyException {
		Base32 codec = new Base32();
		byte[] decodedKey = codec.decode(secret);
		boolean flagCheckCode = false;
 
		// Window is used to check codes generated in the near past.
		// You can use this value to tune how far you're willing to go.
		int window = 2;
		for (int i = -window; i <= window; ++i) {
			long hash = verifyCode(decodedKey, t + i);
 
			if (hash == code) {
				flagCheckCode =  true;
				break;
			}
		}
 
		// The validation code is invalid.
		return flagCheckCode;
	}
	
	// checkCode 연산용
	private int verifyCode(byte[] key, long t)
			throws NoSuchAlgorithmException, InvalidKeyException {
		byte[] data = new byte[8];
		long value = t;
		for (int i = 8; i-- > 0; value >>>= 8) {
			data[i] = (byte) value;
		}
 
		SecretKeySpec signKey = new SecretKeySpec(key, "HmacSHA1");
		Mac mac = Mac.getInstance("HmacSHA1");
		mac.init(signKey);
		byte[] hash = mac.doFinal(data);
 
		int offset = hash[20 - 1] & 0xF;
 
		// We're using a long because Java hasn't got unsigned int.
		long truncatedHash = 0;
		for (int i = 0; i < 4; ++i) {
			truncatedHash <<= 8;
			// We are dealing with signed bytes:
			// we just keep the first byte.
			truncatedHash |= (hash[offset + i] & 0xFF);
		}
 
		truncatedHash &= 0x7FFFFFFF;
		truncatedHash %= 1000000;
 
		return (int) truncatedHash;
	}
} // class
