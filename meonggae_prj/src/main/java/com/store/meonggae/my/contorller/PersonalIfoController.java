package com.store.meonggae.my.contorller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.store.meonggae.my.domain.PersonalDomain;
import com.store.meonggae.my.service.PersonalService;
import com.store.meonggae.user.login.domain.LoginDomain;

@RequestMapping("/My/mypage")
@Controller
public class PersonalIfoController {
	
	@Autowired(required = false)
	private PersonalService ps;
	
	/**
	 * 마이페이지 : 개인정보_비밀번호검증
	 */
	@GetMapping("/personal/passwordChk_frm.do")
	public String personal(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			return "/My/mypage/main/myPageMain_frm";
		}//end if
		
		//String memNum = String.valueOf(userSession.getMemNum());
		
		return "/My/mypage/personal/passwordChk_frm";
	}//personal
	
	/**
	 * 마이페이지 : 개인정보_비밀번호검증
	 * 비밀번호 확인(ajax)
	 */
	@GetMapping("/personal/pwChk.do")
	@ResponseBody
	public JSONObject pwChk(HttpServletRequest request) {
		JSONObject jsonObj = new JSONObject();
		
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			jsonObj.put("result", "false");
	        return jsonObj;
		}//end if
		
		String memNum = String.valueOf(userSession.getMemNum());
		String inputPw = request.getParameter("sendData"); //입력비번
		String originPw = ps.searchPw(memNum); //db비번
		
		PasswordEncoder pe = new BCryptPasswordEncoder();
		if(pe.matches(inputPw, originPw)) {
			jsonObj.put("result", "true");
		}else {
			jsonObj.put("result", "false");
		}//end else
		
		return jsonObj;
	}//pwChk
	
	/**
	 * 마이페이지 : 개인정보_수정
	 * @return
	 */
	@GetMapping("/personal/personalInfo_frm.do")
	public String personalInfo(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			return "/My/mypage/main/myPageMain_frm";
		}//end if
		
		String memNum = String.valueOf(userSession.getMemNum());
		
		PersonalDomain pDomain = ps.searchPersonal(memNum);
		model.addAttribute("pDomain", pDomain);
		
		return "/My/mypage/personal/personalInfo_frm";
	}//personalInfo
	
	/**
	 * 마이페이지 : 개인정보_회원탈퇴
	 */
	@GetMapping("/personal/quitMembership_frm.do")
	public String quitMembership() {
		return "/My/mypage/personal/quitMembership_frm";
	}//quitMembership
	
	/**
	 * 개인정보 수정 파일 업로드
	 */
	//@PostMapping("/personal/upload_profile_process.do")
	@RequestMapping(value="/personal/upload_profile_process.do", method=RequestMethod.POST)
	// 1. httpservletRequest 받기
	public String profileUploadProcess(HttpServletRequest request, Model model) throws IOException {
		
		File saveDir = new File("D:/meonggae_store_prj/meonggae_prj/src/main/webapp/profile-img");
		int tempSize =100*1024*1024;
		MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(),
				tempSize,"UTF-8");
		
		String oriName = mr.getOriginalFileName("upfile");
		String fsName = mr.getFilesystemName("upfile");
		
		File tempFile = new File(saveDir.getAbsolutePath() + "/" + fsName);
		int maxSize = 10*1024*1024;
		boolean uploadflag = false;
		
		if(tempFile.length() > maxSize) { //업로드 제한
			tempFile.delete();
			uploadflag = true;
		}//end if
		
		model.addAttribute("fileName", oriName);
		model.addAttribute("uploadflag", !uploadflag);
		
		return "/My/mypage/personal/personalInfo_frm";
	}//profileUploadProcess
	
	/**
	 * 마이페이지 : 개인정보_비밀번호수정
	 */
	@GetMapping("/personal/passwordModify.do")
	public String passwordModify() {
		return "/My/mypage/personal/passwordModify";
	}//passwordModify
	
	@GetMapping("/personal/doPasswordModify.do")
	public String doPasswordModify(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			return "/My/mypage/main/myPageMain_frm";
		}//end if
		
		String memNum = String.valueOf(userSession.getMemNum());
		
		//view에서 받은 비밀번호
		String inputPw = request.getParameter("pw1");
		
		int cnt = ps.modifyPw(memNum, inputPw);
		System.out.println(cnt + "건 업데이트");
		
		return "";
	}//passwordModify
	
	
}//class
