package com.store.meonggae.my.contorller;

import java.io.File;

import org.apache.logging.log4j.core.util.PasswordDecryptor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.password.PasswordEncoder;

public class temptmeptesteseteste {

	public static void main(String[] args) {
		
		
		String key = "test1234";
		String salt = "123456";
		
//		// 1. 암호화 객체 생성
//		TextEncryptor te = Encryptors.text(key, salt);
//		
//		// 2. 암호화 (DB에 insert)
//		String inputData = "qwer1234!";
//		
//		String cipherInputData = te.encrypt(inputData);
//		System.out.println("암호화후 : " + cipherInputData);
//		
//		// 3. 복호화 (사용자에게 보여질 때)
//		String DBData = "uuCDR3KMJjm0CvRQuAyfbK89577+dind4m7/WLxoOE4eTtBKMHZgelfM/SooF0qa";
//		
//		String pDBData = te.decrypt(DBData);
//		System.out.println("복호화후 : " + pDBData);
//		
//		String temp1 = "143cd7937d467988b533bfbb75db724c68f31f5351ca198019bf2a823b7318c7";
//		String temp2 = "qwer1234!";
		
//		//암호화
//		PasswordEncoder pe = new BCryptPasswordEncoder();
//		String input = "444";
//		String output = pe.encode(input);
//		System.out.println(output);
//		System.out.println(pe.matches(input, output));
//		
//		//복호화
//		System.out.println(pe.matches("444", output));
		
		String fileDir = "D:/meonggae_store_prj/meonggae_prj/src/main/webapp/profile-img";
		
		File old = new File(fileDir + "/3.jpg");
		File newFile = new File(fileDir + "/3.png");
		newFile.delete();
		old.renameTo(newFile);
		
	
		
	}

}
