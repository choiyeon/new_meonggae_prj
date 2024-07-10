package com.store.meonggae.mgr.common.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.google.zxing.WriterException;
import com.store.meonggae.mgr.common.vo.EmailVO;

@Service
public class EmailSender {
	
    /**
     * 네이버 메일로 메일 전송
     * @param eVO 메일 제목, 내용, 수신자 메일 주소
     * @param contentType html: html태그 해석되게 전송, 그 외: text로 전송
     * @throws UnsupportedEncodingException
     * @throws NoSuchAlgorithmException
     * @throws GeneralSecurityException
     */
    public void mailSend(EmailVO eVO, String contentType) throws UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException { // 발신자 이메일 계정 정보
    	Properties prop = new Properties();
    	
    	// 발신자 계정 정보
        final String username = eVO.getSenderEmail(); // 발신자 네이버 이메일 주소
        final String password = eVO.getSenderPassword(); // 발신자 네이버 이메일 비밀번호

        // SMTP 서버 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");			// SMTP 서버 인증을 사용하는 설정 (true: 외부에서 인증 설정)
        props.put("mail.smtp.starttls.enable", "true");	// TLS 보안을 사용한 연결 설정
        props.put("mail.smtp.host", "smtp.naver.com");	// SMTP 서버의 호스트명 설정 (smtp.naver.com)
        props.put("mail.smtp.port", "587");				// SMTP port: 587

        // 세션 생성 : 이메일 메시지를 구성하고 전송하는 데 사용
        // Authenticator: SMTP 서버 인증에 필요한 사용자명과 비번을 전달하는 클래스
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
            	return new PasswordAuthentication(username, password);
            }
        });

        try {
            // 메시지 구성
        	// MimeMessage: 메시지의 헤더 설정 - 발신자, 수신자, 제목, 내용 - 메타 데이터 설정
        	MimeMessage message = new MimeMessage(session);
        	
            message.setFrom(new InternetAddress(username)); // 발신자 이메일
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(eVO.getEmail())); // 수신자 이메일
            message.setSubject(eVO.getSubject()); // 이메일 제목
            
            switch(contentType.toLowerCase().trim()) {
            case "html":
            	message.setContent(eVO.getContent(), "text/html;charset=UTF-8");
            	break;
            default:
            	message.setText(eVO.getContent());
            } // end switch
            

            // 이메일 전송
            // Transport: SMTP 서버와 통신하여 이메일 메시지를 전송하는 역할
            //	 서버와 연결 관리
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace(); // 디버깅을 위해 스택 트레이스 출력
            throw new RuntimeException(e);
        } // end catch
    } // mailSend
    
} // class