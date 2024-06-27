package com.store.meonggae.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@GetMapping("/My/mypage/main/mypage.do")
	public String myPage() {	
		
		return "/My/mypage/main/myPageMain_frm";
	}
}
