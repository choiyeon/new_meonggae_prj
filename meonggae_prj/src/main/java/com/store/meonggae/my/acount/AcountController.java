package com.store.meonggae.my.acount;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

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

import com.store.meonggae.my.acount.service.AcountService;
import com.store.meonggae.my.mail.EMailSender;

@RequestMapping("/My/acount")
@Controller
public class AcountController {
	@Autowired(required = false)
	private AcountService as;
	
	/**
	 * 계정찾기
	 */
	@GetMapping("/acount.do")
	public String acount() {
		
		return "My/acount/acount";
	}//storeMain
	
	/**
	 * 계정정보 존재여부 확인
	 */
	@PostMapping("/dataChk.do")
	@ResponseBody
	public JSONObject doChkIdData(@RequestParam("name") String name,
								@RequestParam("email") String email) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", "false");
		
		if(as.searchAcount(name, email) != 0) {
			String randomText = "";
			randomText = EMailSender.getInstance().email(email);
			
			jsonObj.put("result", "true");
			jsonObj.put("randomText", randomText);
		}//if
		
		return jsonObj;
	}//doChkIdData
	
	/**
	 * 아이디 select
	 */
	@PostMapping("/find_result_id.do")
	public String findId(HttpServletRequest request, Model model) {
		
		String name = request.getParameter("finalName");
		String email = request.getParameter("finalEmail");
		
		String id = as.searchID(name, email);
		model.addAttribute("id", id);
		
		return "/My/acount/find_result";
	}//findId
	
	/**
	 * 계정정보(비밀번호포함) 존재여부 확인
	 */
	@PostMapping("/dataPwChk.do")
	@ResponseBody
	public JSONObject doChkPwData(@RequestParam("name") String name,
			@RequestParam("id") String id,
			@RequestParam("email") String email) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", "false");
		
		if(as.searchPwAcount(name, id, email) != 0) {
			String randomText = "";
			randomText = EMailSender.getInstance().email(email);
			
			jsonObj.put("result", "true");
			jsonObj.put("randomText", randomText);
		}//if
		
		return jsonObj;
	}//doChkPwData
	
	/**
	 * 임시 비밀번호로 update
	 */
	@PostMapping("/find_result_pw.do")
	public String findPw(HttpServletRequest request, Model model) {
		
		String id = request.getParameter("finalId_pw");
		Random rd = new Random();
		StringBuilder pw = new StringBuilder();
		
		for(int i=0 ; i<8 ; i++) {
			if(rd.nextBoolean()) {
				pw.append(rd.nextInt(10));
			}else {
				pw.append((char)(rd.nextInt(26)+65));
			}//if
		}//for
		
		as.modifyPw(id, pw.toString());
		model.addAttribute("pw", pw);
		
		return "/My/acount/find_result";
	}//findId
	
}//class
