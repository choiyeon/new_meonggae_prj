package com.store.meonggae.mgr.common.service;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base32;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;

import com.store.meonggae.mgr.login.vo.MgrSecondAuthVO;

public class OtpTest {
	
	private String dbKey = "YJBQRASIY5OQSTAH7DKBQQVKQGMNTYIC";
	
	public void setDbKey (String dbKey) {
		this.dbKey = dbKey;
	}
	
	// 관리자 2차 인증키 조회
	public String selectOneManager2ndAuthKey(String managerId) {
		String secondAuthKey = this.dbKey;
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
	public static void main(String[] args) {
		OtpTest ot = new OtpTest();
		OTPUtil oUtil = new OTPUtil();
		String dbKey = oUtil.getSecretKey();
		ot.setDbKey(dbKey);
		//System.out.println(dbKey);
		MgrSecondAuthVO msaVO = new MgrSecondAuthVO("manager6", 231576);
		boolean flagCheckCode = ot.isSecondAuthCorrect(msaVO);
		//System.out.println(flagCheckCode);
	}

}
