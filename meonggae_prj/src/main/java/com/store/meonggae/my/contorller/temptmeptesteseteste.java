package com.store.meonggae.my.contorller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class temptmeptesteseteste {
	
	public void email(String sendEmail) {
    	 // 발신자 이메일 계정 정보
        String username = "meonggae4@gmail.com"; // 발신자 네이버 이메일 주소
        String password = "ghvg ysln atak ssxr"; // 발신자 네이버 이메일 비밀번호

        // SMTP 서버 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true"); //SMTP 서버 인증을 사용하는 설정 (true - 외부에서 인증 설정)
        props.put("mail.smtp.starttls.enable", "true"); //TLS보안을 사용한 연결 설정
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP서버의 호스트명 설정 smtp.naver.com
        props.put("mail.smtp.port", "465"); //SMTP port는 587
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.enable", "true"); 

        // 세션 생성 : 이메일 메시지를 구성하고 전송하는 데 사용
        // Authenticator : SMTP서버에 인증에 필요한 사용자명과 비번을 전달하는 클래스
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
            	return new PasswordAuthentication(username, password);
            }
        });
        
        Random rd = new Random();
		StringBuilder Authentication = new StringBuilder();
		
		for(int i=0 ; i<6 ; i++) {
			if(rd.nextBoolean()) {
				Authentication.append(rd.nextInt(10));
			}else {
				Authentication.append((char)(rd.nextInt(26)+65));
			}//if
		}//for
        
		
		String pattern = "yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat( pattern );
		
        StringBuilder content = new StringBuilder();
        content.append("<html><head><meta charset=\"UTF-8\"></head><body>")
        
        		.append("<span style=\"font-weight: bold; font-size: 36px;\">")
        		.append(Authentication.toString())
        		.append("</span><br>")
        		.append("<span style=\"font-size: 18px;\">")
        		.append("인증문자를 입력해주세요.<br><br><br>")
        		.append("</span>")
        		.append("<span style=\"color: #A5A5A5;\">")
        		.append("본 메일의 전송시간<br>")
        		.append(sdf.format(new Date()))
        		.append("</span>")
        		
        		.append("</body></html>");

        try {
            // 메시지 구성
        	// MimeMessage : 메세지의 헤더 설정 - 발신자, 수신자, 제목, 내용 - 메타데이터 설정
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username)); // 발신자 이메일
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendEmail)); // 수신자 이메일
            
            message.setSubject("멍게장터 인증메일"); // 이메일 제목
            message.setText(content.toString()); // 내용
            message.setHeader("Content-Type", "text/html; charset=utf-8");
            
            // 이메일 전송
            // Transport : SMTP 서버와 통신하여 이메일 메세지를 전송하는 역할
            Transport.send(message);
            System.out.println("message sent successfully...");

        } catch (MessagingException e) {
            e.printStackTrace(); // 디버깅을 위해 스택 트레이스 출력
            throw new RuntimeException(e);
        }//end catch
        
	}//email

	public static void main(String[] args) {
		
		
//		String key = "test1234";
//		String salt = "123456";
		
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
		
//		String fileDir = "D:/meonggae_store_prj/meonggae_prj/src/main/webapp/profile-img";
//		
//		File old = new File(fileDir + "/3.jpg");
//		File newFile = new File(fileDir + "/3.png");
//		newFile.delete();
//		old.renameTo(newFile);
		
//		Random rd = new Random();
//		StringBuilder sb = new StringBuilder();
//		
//		for(int i=0 ; i<6 ; i++) {
//			if(rd.nextBoolean()) {
//				sb.append(rd.nextInt(10));
//			}else {
//				sb.append((char)(rd.nextInt(26)+65));
//			}
//		}
//		
//		System.out.println(sb.toString());
		
		
		new temptmeptesteseteste().email("dkdlflr@naver.com");
		
		
	}//main

}//class
