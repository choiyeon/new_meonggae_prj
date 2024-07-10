package com.store.meonggae.mgr.common.service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import de.taimos.totp.TOTP;
import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.binary.Hex;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.SecureRandom;

@Service
public class OTPUtil {
	
    // 최초 개인키 생성 시 사용하는 메소드
    public String getSecretKey() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[20];
        random.nextBytes(bytes);
        Base32 base32 = new Base32();
        return base32.encodeToString(bytes);
    }

    // OTP검증 요청 때마다 개인키로 OTP 생성하는 메소드
    public String getTOTPCode(String secretKey) {
        Base32 base32 = new Base32();
        byte[] bytes = base32.decode(secretKey);
        String hexKey = Hex.encodeHexString(bytes);
        return TOTP.getOTP(hexKey);
    }

    // 개인키, 계정명(유저ID), 발급자(회사명)을 받아서 구글OTP 인증용 링크를 생성하는 메소드
    public String getGoogleOTPAuthURL(String secretKey, String account, String issuer) {
        try {
            return "otpauth://totp/"
                    + URLEncoder.encode(issuer + ":" + account, "UTF-8").replace("+", "%20")
                    + "?secret=" + URLEncoder.encode(secretKey, "UTF-8").replace("+", "%20")
                    + "&issuer=" + URLEncoder.encode(issuer, "UTF-8").replace("+", "%20");
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    // url, 파일생성할경로, 높이px, 폭px을 받아서 QR코드 이미지를 생성하는 메소드
    public void getQRImage(String googleOTPAuthURL, String filePath, int height, int width) throws WriterException, IOException {
        BitMatrix matrix = new MultiFormatWriter().encode(googleOTPAuthURL, BarcodeFormat.QR_CODE, width, height);
        try (FileOutputStream out = new FileOutputStream(filePath)) {
            MatrixToImageWriter.writeToStream(matrix, "png", out);
        }
    }
    
    // url, 높이px, 폭px을 받아서 QR코드 이미지를 생성하는 메소드
    public byte[] getQRImage(String googleOTPAuthURL, int height, int width) throws WriterException, IOException {
    	ByteArrayOutputStream pngOutputStream = null;
    	
    	BitMatrix matrix = new MultiFormatWriter().encode(googleOTPAuthURL, BarcodeFormat.QR_CODE, width, height);
    	
    	try {
    		pngOutputStream = new ByteArrayOutputStream();
    		MatrixToImageWriter.writeToStream(matrix, "PNG", pngOutputStream);
    	} catch (IOException ioe) {
    		ioe.printStackTrace();
    	} finally {
			if(pngOutputStream != null) { pngOutputStream.close();}
		} // end finally
    	
        return pngOutputStream.toByteArray();
    } // getQRImage
    
//    public static void main(String[] args) {
//    	OTPUtil otp = new OTPUtil();
//    	
//    	String account = "managertest";
//    	String issuer = "meonggae";
//    	int height = 200;
//    	int width = 200;
//    	String filePath = "C:/dev/test.png";
//    	
//    	System.out.println("최초 개인키 생성 시 사용하는 메소드");
//    	String secretKey = otp.getSecretKey();
//    	System.out.println("getSecretKey(): " + secretKey);
//    	
//    	System.out.println("OTP검증 요청 때마다 개인키로 OTP 생성하는 메소드");
//    	String totpCode = otp.getTOTPCode(secretKey);
//    	System.out.println("getSecretKey(secretKey): " + totpCode);
//    	
//    	System.out.println("개인키, 계정명(유저ID), 발급자(회사명)을 받아서 구글OTP 인증용 링크를 생성하는 메소드");
//    	String googleOTPAuthURL = otp.getGoogleOTPAuthURL(secretKey, account, issuer);
//    	System.out.println("getGoogleOTPAuthURL(secretKey, account, issuer): " + googleOTPAuthURL);
//    	
//    	System.out.println("url, 파일생성할경로, 높이px, 폭px을 받아서 QR코드 이미지를 생성하는 메소드");
//    	try {
//			otp.getQRImage(googleOTPAuthURL, filePath, height, width);
//		} catch (WriterException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//    }
}