package com.store.meonggae.my.contorller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.oreilly.servlet.MultipartRequest;
import com.store.meonggae.my.domain.PersonalDomain;
import com.store.meonggae.my.service.PersonalService;
import com.store.meonggae.my.vo.PersonalInfoVO;
import com.store.meonggae.user.login.domain.LoginDomain;

@RequestMapping("/My/mypage")
@Controller
public class PersonalIfoController {
	
	private static String fileDir = "D:/new_meonggae_prj/meonggae_prj/src/main/webapp/profile-img";
	
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
		
		return "/My/mypage/personal/passwordChk_frm";
	}//personal
	
	/**
	 * 마이페이지 : 개인정보_비밀번호검증(ajax)
	 */
	@GetMapping("/personal/pwChk.do")
	@ResponseBody
	public JSONObject pwChk(HttpServletRequest request) {
		JSONObject jsonObj = new JSONObject();
		
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			jsonObj.put("result", "noSession");
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
	 * 마이페이지 : 개인정보_개인정보 수정페이지
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
		String emailId = pDomain.getEmail().substring(0, pDomain.getEmail().indexOf("@"));
		String emailDomain = pDomain.getEmail().substring(pDomain.getEmail().indexOf("@")+1);
		
		model.addAttribute("pDomain", pDomain);
		model.addAttribute("emailId", emailId);
		model.addAttribute("emailDomain", emailDomain);
		
		return "/My/mypage/personal/personalInfo_frm";
	}//personalInfo

	/**
	 * 마이페이지 : 개인정보_비밀번호 수정
	 */
	@GetMapping("/personal/passwordModify.do")
	public String passwordModify() {
		return "/My/mypage/personal/passwordModify";
	}//passwordModify
	
	/**
	 * 마이페이지 : 개인정보_비밀번호 수정 process
	 */
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
		
		ps.modifyPw(memNum, inputPw);
		
		return "/My/mypage/personal/close";
	}//passwordModify
	
	/**
	 * 마이페이지 : 닉네임 중복확인
	 */
	@GetMapping("/personal/chkNick.do")
	public String chkNick() {
		return "/My/mypage/personal/nick_chk";
	}//passwordModify
	
	/**
	 * 마이페이지 : 닉네임 중복확인 process
	 */
	@GetMapping("/personal/doChkNick.do")
	@ResponseBody
	public JSONObject doChkNick(@RequestParam("data") String nick) {
		JSONObject jsonObj = new JSONObject();
		
		if(ps.searchNick(nick)) {
			jsonObj.put("result", "true");
		}else {
			jsonObj.put("result", "false");
		}//end else
		
		return jsonObj;
	}//doChkNick
	
	/**
	 * 창 닫아버리기용...
	 */
	@GetMapping("/personal/close.do")
	public String close() {
		return "/My/mypage/personal/close";
	}//close
	
	/**
	 * 개인정보 수정 파일 업로드
	 */
	//@RequestMapping(value="/personal/update_personal_info_process.do", method=RequestMethod.POST)
	@PostMapping("/personal/update_personal_info_process.do")
	@ResponseBody
	public JSONObject updatePersonalInfo(HttpServletRequest request) throws Exception {
		JSONObject jsonObj = new JSONObject();
		
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		
		if(userSession == null) {
			jsonObj.put("result", "noSession");
			return jsonObj;
		}//end if
		
		String memNum = String.valueOf(userSession.getMemNum());
		String profile = userSession.getimg();
		
		
		// 파일업로드
		File saveDir = new File(fileDir);
		int tempSize =100*1024*1024;
		MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(),
				tempSize,"UTF-8");
		
		String fileName = mr.getFilesystemName("upfile"); //업로드 파일 이름(확장자까지)
		
		String profileName = "";
		Boolean fileFlag = false;
		
		if(fileName != null) {
			fileFlag = true ;
			
			File oldFile = new File(fileDir + "/" + fileName);
			int maxSize = 10*1024*1024;
			
			if(oldFile.length() > maxSize) { //업로드 제한
				oldFile.delete();
				jsonObj.put("result", "tooBig");
				return jsonObj;
			}//end if
			
			//이름바꾸기
			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
			profileName = memNum + "_" + now + fileName.substring(fileName.lastIndexOf("."), fileName.length());
			
			File newFile = new File(fileDir + "/" + profileName); //이름바꿀파일
			oldFile.renameTo(newFile);
			
			if(!profile.equals("default.png")) {
				File deleteFile = new File(fileDir + "/" + profile);
				deleteFile.delete();
			}else {
			}
		}//if 파일업로드 끝
		
		String nickname = mr.getParameter("nickname");
		String tel = mr.getParameter("phoneNumber");
		String zipcode = mr.getParameter("zipcode");
		String addr0 = mr.getParameter("addr0");
		String addr1 = mr.getParameter("addr1");
		String email = mr.getParameter("email_id") + "@" + mr.getParameter("email_domain");
		
		PersonalInfoVO piVO = new PersonalInfoVO();
		piVO.setMemnun(memNum);
		piVO.setNick(nickname);
		piVO.setTel(tel);
		piVO.setZipcode(zipcode);
		piVO.setAddr0(addr0);
		piVO.setAddr1(addr1);
		piVO.setEmail(email);
		
		if(fileFlag) {
			piVO.setProfile(profileName);
		}//if
		
		int cnt = ps.modifyPersonalInfo(piVO);
		jsonObj.put("result", "success");
		
		//세션에 설정해줘야함...
		userSession.setNick(nickname);
		if(fileFlag) {
			userSession.setimg(profileName);
		}//if
		
		session.setAttribute("user", userSession);
		
		return jsonObj;
	}//profileUploadProcess
	
	/**
	 * 회원탈퇴
	 */
	@GetMapping("/personal/quitMember.do")
	public String quitMember(HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			return "/My/mypage/main/myPageMain_frm";
		}//end if
		
		return "/My/mypage/personal/quitMember";
	}//quitMember
	
	/**
	 * 회원탈퇴 Process
	 */
	@GetMapping("/personal/quitProcess.do")
	@ResponseBody
	public JSONObject quitProcess(HttpServletRequest request) {
		JSONObject jsonObj = new JSONObject();
		
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			jsonObj.put("result", "noSession");
			return jsonObj;
		}//end if
		
		String memNum = String.valueOf(userSession.getMemNum());
		
		int cnt = ps.modfiyMemberStatus(memNum);
		if(cnt == 1) {
			jsonObj.put("result", "success");
		}//if
		
		return jsonObj;
	}//quitProcess
	
}//class
