package com.store.meonggae.my.mail;

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

public class EMailSender {
	
	private static EMailSender es;
	
	private EMailSender () {
	}
	
	public static EMailSender getInstance() {
		if(es == null) {
			es = new EMailSender();
		}//if
		return es;
	}//getInstance
	
	public String email(String sendEmail) {
   	 // 발신자 이메일 계정 정보
       String username = "meonggae4@gmail.com";
       String password = "ghvg ysln atak ssxr";

       // SMTP 서버 설정
       Properties props = new Properties();
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.starttls.enable", "true");
       props.put("mail.smtp.host", "smtp.gmail.com");
       props.put("mail.smtp.port", "465");
       props.put("mail.smtp.ssl.protocols", "TLSv1.2");
       props.put("mail.smtp.ssl.enable", "true"); 

       Session session = Session.getInstance(props, new javax.mail.Authenticator() {
           protected PasswordAuthentication getPasswordAuthentication() {
           		return new PasswordAuthentication(username, password);
           }
       });
       
       Random rd = new Random();
       StringBuilder AuthenticationText = new StringBuilder();
       
       for(int i=0 ; i<6 ; i++) {
    	   if(rd.nextBoolean()) {
    		   AuthenticationText.append(rd.nextInt(10));
    	   }else {
    		   AuthenticationText.append((char)(rd.nextInt(26)+65));
    	   }//if
       }//for
       
       String pattern = "yyyy-MM-dd HH:mm:ss";
       SimpleDateFormat sdf = new SimpleDateFormat( pattern );

       StringBuilder content = new StringBuilder();
       content.append("<html><head><meta charset=\"UTF-8\"></head><body>")
        
       		.append("<span style=\"font-weight: bold; font-size: 36px;\">")
       		.append(AuthenticationText.toString())
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
           Message message = new MimeMessage(session);
           message.setFrom(new InternetAddress(username));
           message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendEmail));
           
           message.setSubject("멍게장터 인증번호");
           message.setText(content.toString());
           message.setHeader("Content-Type", "text/html; charset=utf-8");
           
           Transport.send(message);

       } catch (MessagingException e) {
           e.printStackTrace(); // 디버깅을 위해 스택 트레이스 출력
           throw new RuntimeException(e);
       }//end catch
       
       return AuthenticationText.toString();
	}//email
	
}//class