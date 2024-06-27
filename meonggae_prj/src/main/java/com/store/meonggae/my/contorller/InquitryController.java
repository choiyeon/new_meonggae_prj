package com.store.meonggae.my.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/My/mypage")
@Controller
public class InquitryController {
	
	/**
	 * 마이페이지 : 1:1문의
	 * @return
	 */
	@GetMapping("/inquiry/inquiry_frm.do")
	public String inquiry() {
		return "/My/mypage/inquiry/inquiry_frm";
	}
	
	/**
	 * 마이페이지 : 1:1문의_상세보기
	 * @return
	 */
	@GetMapping("/inquiry/inquiry_detail_frm.do")
	public String inquiryDetail() {
		return "/My/mypage/inquiry/inquiry_detail_frm";
	}
	
	/**
	 * 마이페이지 : 1:1문의_문의작성폼
	 * @return
	 */
	@GetMapping("/inquiry/inquiry_add_frm.do")
	public String inquiryAddFrm() {
		return "/My/mypage/inquiry/inquiry_add_frm";
	}
	
}//class
