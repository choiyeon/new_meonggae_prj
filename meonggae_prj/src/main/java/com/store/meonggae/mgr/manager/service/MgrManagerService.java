package com.store.meonggae.mgr.manager.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.zxing.WriterException;
import com.store.meonggae.mgr.common.service.EmailSender;
import com.store.meonggae.mgr.common.service.OTPUtil;
import com.store.meonggae.mgr.common.vo.EmailVO;
import com.store.meonggae.mgr.dao.MgrManagerDAO;
import com.store.meonggae.mgr.manager.domain.MgrEmailDomain;
import com.store.meonggae.mgr.manager.domain.MgrManagerDomain;
import com.store.meonggae.mgr.manager.vo.ManagerSearchVO;
import com.store.meonggae.mgr.manager.vo.MgrManagerVO;

@Service
public class MgrManagerService {
	
	@Autowired(required = false)
	private MgrManagerDAO mmDAO;
	@Autowired(required = false)
	private OTPUtil otpUtil;
	@Autowired(required = false)
	private EmailSender email;
	@Autowired(required = false)
	private TaskScheduler taskScheduler;

	
	// 검색된 관리자 수
	public int getTotalCount(ManagerSearchVO sVO) {
		int totalCount = 0;
		
		try {
			totalCount = mmDAO.selectOneManagerCount(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return totalCount;
	} // totalCount
	
	// 한 화면에 보여줄 게시물의 수
	public int getPageScale() {
		int pageScale = 10;
		return pageScale;
	} // pageScale
	
	// 총 페이지수
	public int getTotalPage(int totalCount, int pageScale) {
		return (int)Math.ceil((double)totalCount / pageScale);
	} // totalPage
	
	// 현재 페이지
	public int getCurrentPage(ManagerSearchVO sVO) {
		int currentPage = 1;
		
		String tempPage = sVO.getCurrentPage();
		if(tempPage != null) {
			try {
				currentPage = Integer.parseInt(tempPage); 
			} catch (NumberFormatException nfe) {
			} // end catch
		} // end if
		return currentPage;
	} // getCurrentPage
	
	// 게시물의 시작 번호
	public int getStartNum(int currentPage, int pageScale) {
		int startNum = (currentPage - 1) * pageScale + 1;
		return startNum;
	} // getStartNum
	
	// 게시물의 마지막 번호
	public int getEndNum(int startNum, int pageScale) {
		int endNum = startNum + pageScale - 1;
		return endNum;
	} // getEndNum
	
	// 검색된 리스트 조회
	public List<MgrManagerDomain> searchListManager(ManagerSearchVO sVO) {
		List<MgrManagerDomain> list = null;
		
		try {
			list = mmDAO.selectListManager(sVO);
			
			MgrManagerDomain mmDomain = null;
			
			String key = "test1234";
			String salt = "123456";
			TextEncryptor te = Encryptors.text(key, salt);
			
			for(int i = 0; i < list.size(); i++) {
				mmDomain = list.get(i);
				mmDomain.setName(te.decrypt(mmDomain.getName()));
			} // end for
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return list;
	} // searchManagerList
	
	// 전 관리자 이름 조회
	public List<MgrManagerDomain> searchListAllManagerName() {
		List<MgrManagerDomain> list = null;
		
		try {
			list = mmDAO.selectListAllManagerName();
			MgrManagerDomain mmDomain = null;
			
			String key = "test1234";
			String salt = "123456";
			TextEncryptor te = Encryptors.text(key, salt);
			
			for (int i = 0; i < list.size(); i++) {
				mmDomain = list.get(i);
				mmDomain.setName(te.decrypt(mmDomain.getName()));
			} // end for
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return list;
	} // searchListAllManagerName
	
	// 관리자 한 명 상세 조회
	public MgrManagerDomain searchOneManager (String managerId) {
		MgrManagerDomain mmDomain = null;
		
		try {
			mmDomain = mmDAO.selectOneManager(managerId);
			
			String key = "test1234";
			String salt = "123456";
			TextEncryptor te = Encryptors.text(key, salt);
			
			mmDomain.setName(te.decrypt(mmDomain.getName()));
			mmDomain.setBirth(te.decrypt(mmDomain.getBirth()));
			mmDomain.setTel(te.decrypt(mmDomain.getTel()));
			mmDomain.setAddr1(te.decrypt(mmDomain.getAddr1()));
			mmDomain.setAddr2(te.decrypt(mmDomain.getAddr2()));
			if(mmDomain.getParentManagerName() != null && mmDomain.getParentManagerName() != "") {
				mmDomain.setParentManagerName(te.decrypt(mmDomain.getParentManagerName()));
			} // end if
			if(mmDomain.getEmail() != null && mmDomain.getEmail() != "") {
				mmDomain.setEmail(te.decrypt(mmDomain.getEmail()));
			} // end if
			mmDomain.setPermission(te.decrypt(mmDomain.getPermission()));
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return mmDomain;
	} // searchOneManager
	
	// 관리자 등록시 아이디 중복 검사
	@SuppressWarnings("unchecked")
	public String searchOneManagerIdDuplicate(String managerId) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("dataSize", 0);
		jsonObj.put("date", sdf.format(new Date()));
		jsonObj.put("data", "");
		
		boolean flagCanUse = false;
		
		try {
			flagCanUse = mmDAO.selectOneManagerIdDuplicate(managerId);
			JSONObject jsonTemp = new JSONObject();
			jsonTemp.put("flagCanUse", flagCanUse);
			jsonObj.put("data", jsonTemp);
			jsonObj.put("dataSize", 1);
			jsonObj.put("result", true);
			
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}// end catch
		return jsonObj.toJSONString();
	} // searchOneManagerIdDuplicate
	
	// 관리자 등록시 닉네임 중복 검사
	@SuppressWarnings("unchecked")
	public String searchOneManagerNickDuplicate(String nick) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("dataSize", 0);
		jsonObj.put("date", sdf.format(new Date()));
		jsonObj.put("data", "");
		
		boolean flagCanUse = false;
		
		try {
			flagCanUse = mmDAO.selectOneManagerNickDuplicate(nick);
			JSONObject jsonTemp = new JSONObject();
			jsonTemp.put("flagCanUse", flagCanUse);
			jsonObj.put("data", jsonTemp);
			jsonObj.put("dataSize", 1);
			jsonObj.put("result", true);
			
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}// end catch
		return jsonObj.toJSONString();
	} // searchOneManagerIdDuplicate
	
	// 관리자 신규 등록
	public boolean addManagerProcess(MgrManagerVO mMgrVO, String serverName, String contextPath) {
		boolean flagAddResult = false;
		MgrEmailDomain mgrEmailDomain = null;
		
		if(mMgrVO.getParentManagerId() == null) {
			mMgrVO.setParentManagerId("");
		} // end if
			
		if(mMgrVO.getEmail() != null && !mMgrVO.getEmail().equals("")) {
			try {
				String key = "test1234";
				String salt = "123456";
				TextEncryptor te = Encryptors.text(key, salt);
				PasswordEncoder pe = new BCryptPasswordEncoder();
				String secretKey = "";
				String googleOTPAuthURL = "";
				
				mMgrVO.setPass(pe.encode(mMgrVO.getPass()));
				mMgrVO.setName(te.encrypt(mMgrVO.getName()));
				mMgrVO.setBirth(te.encrypt(mMgrVO.getBirth()));
				mMgrVO.setAddr1(te.encrypt(mMgrVO.getAddr1()));
				mMgrVO.setAddr2(te.encrypt(mMgrVO.getAddr2()));
				mMgrVO.setTel(te.encrypt(mMgrVO.getTel()));
				mMgrVO.setPermission(te.encrypt(mMgrVO.getPermission()));
				
				secretKey = otpUtil.getSecretKey();
				mMgrVO.setSecondAuthKey(te.encrypt(secretKey));
				
				googleOTPAuthURL = otpUtil.getGoogleOTPAuthURL(secretKey, mMgrVO.getManagerId(), "meonggae");
				
				String pathSys = "C:/dev/project/project3/git5/new_meonggae_prj/meonggae_prj/src/main/webapp/mgr_common/images";
				File file = new File(pathSys);
				file.mkdirs();
				
				final String timeNow = String.valueOf(new Date().getTime());
				otpUtil.getQRImage(googleOTPAuthURL, pathSys + "/qr_" + mMgrVO.getManagerId() + "_" + timeNow + ".png", 200, 200);
				final String managerId =  mMgrVO.getManagerId();
				final String emailAddr = mMgrVO.getEmail();
//				Thread.sleep(2000);
				new java.util.Timer().schedule( 
				        new java.util.TimerTask() {
				            @Override
				            public void run() {
				                // your code here
				            	sendMail(serverName, contextPath, managerId, emailAddr, timeNow);
				            }
				        }, 
				        30000 
				);
//				mgrEmailDomain = mmDAO.selectOneEmailAcoount("1");
//				
//				String keyMail = "krcosist";
//				String saltMail = "0234824632";
//				TextEncryptor teMail = Encryptors.text(keyMail, saltMail);
//
//				String senderEmail = teMail.decrypt(mgrEmailDomain.getSenderEmail());
//				String senderPassword = teMail.decrypt(mgrEmailDomain.getSenderPassword());
//				
//				StringBuilder sb = new StringBuilder();
//				sb.append("<div style='text-align: center;'><h4>멍게장터 구글 OTP 인증 링크</h4><div style='margin:0px auto; width:200px; height:200px; margin-top:5%'><img src='http://")
//				.append(serverName)
//				.append(contextPath)
//				.append("/mgr_common/images/qr_")
//				.append(mMgrVO.getManagerId())
//				.append(".png' width='200px' height='200px'></div><div style='margin-top:5%'><span>구글 Authenticator 어플리케이션에 등록해주시기 바랍니다</span></div></div>");
//				
//				EmailVO eVO = new EmailVO(0, mMgrVO.getEmail(), "멍게장터 관리자 인증 이메일", sb.toString(), senderEmail, senderPassword);
//				
//				email.mailSend(eVO, "html");
				mMgrVO.setEmail(te.encrypt(mMgrVO.getEmail()));
				
				mmDAO.insertManager(mMgrVO);
				
				flagAddResult = true;
			} catch (PersistenceException pe) {
				pe.printStackTrace();
			} catch (UnsupportedEncodingException uee) {
				uee.printStackTrace();
			} catch (WriterException we) {
				we.printStackTrace();
			} catch (IOException ioe) {
				ioe.printStackTrace();
			} // end catch 
		} // end if
		 
		return flagAddResult;
	} // addManagerProcess
	
	public void sendMail(String serverName, String contextPath, String managerId, String emailAddr, String timeNow) {
		MgrEmailDomain mgrEmailDomain = mmDAO.selectOneEmailAcoount("1");
		
		String keyMail = "krcosist";
		String saltMail = "0234824632";
		TextEncryptor teMail = Encryptors.text(keyMail, saltMail);

		String senderEmail = teMail.decrypt(mgrEmailDomain.getSenderEmail());
		String senderPassword = teMail.decrypt(mgrEmailDomain.getSenderPassword());
		
		StringBuilder sb = new StringBuilder();
		sb.append("<div style='text-align: center;'><h4>멍게장터 구글 OTP 인증 링크</h4><div style='margin:0px auto; width:200px; height:200px; margin-top:5%'><img src='http://")
		.append(serverName)
		.append(contextPath)
		.append("/mgr_common/images/qr_")
		.append(managerId)
		.append("_")
		.append(timeNow)
		.append(".png' width='200px' height='200px'></div><div style='margin-top:5%'><span>구글 Authenticator 어플리케이션에 등록해주시기 바랍니다</span></div></div>");
		
		EmailVO eVO = new EmailVO(0, emailAddr, "멍게장터 관리자 인증 이메일", sb.toString(), senderEmail, senderPassword);
		
		try {
			email.mailSend(eVO, "html");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
} // class
