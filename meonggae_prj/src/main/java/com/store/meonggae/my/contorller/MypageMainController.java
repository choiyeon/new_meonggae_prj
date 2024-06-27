package com.store.meonggae.my.contorller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.meonggae.my.domain.GoodsDomain;
import com.store.meonggae.my.service.MypageMainService;
import com.store.meonggae.user.login.domain.LoginDomain;

@RequestMapping("/My/mypage")
@Controller
public class MypageMainController {
	
	@Autowired(required = false)
	private MypageMainService mm;
	
	/**
	 * 마이페이지 : 메인
	 */
	@GetMapping("/main/myPageMain_frm.do")
	public String mypageMain(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			return "/My/mypage/main/myPageMain_frm";
		}//end if
		
		String memNum = String.valueOf(userSession.getMemNum());
		
		//찜
		List<GoodsDomain> dibsList = mm.searchDibsList4(memNum);
		model.addAttribute("dibsList", dibsList);
		
		//판매완료
		List<GoodsDomain> soldList = mm.searchSoldList4(memNum);
		model.addAttribute("soldList", soldList);
		
		//구매완료
		List<GoodsDomain> boughtList = mm.searchBoughtList4(memNum);
		model.addAttribute("boughtList", boughtList);
		
		return "/My/mypage/main/myPageMain_frm";
	}//mypageMain
	
	
}//class
