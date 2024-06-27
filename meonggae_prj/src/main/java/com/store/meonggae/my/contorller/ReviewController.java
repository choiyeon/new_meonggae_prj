package com.store.meonggae.my.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/My/mypage")
@Controller
public class ReviewController {
	
	/**
	 * 마이페이지 : 리뷰
	 * @return
	 */
	@GetMapping("/review/review_frm.do")
	public String review() {
		return "/My/mypage/review/review_frm";
	}
	
}//class
