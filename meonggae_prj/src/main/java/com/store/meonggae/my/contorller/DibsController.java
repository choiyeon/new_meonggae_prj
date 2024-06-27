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
import com.store.meonggae.my.service.DibsService;
import com.store.meonggae.user.login.domain.LoginDomain;

@RequestMapping("/My/mypage")
@Controller
public class DibsController {
	
	@Autowired(required = false)
	private DibsService ds;
	
	/**
	 * 마이페이지 : 찜목록
	 * @return
	 */
	@GetMapping("/dibs/dibsGoods_frm.do")
	public String dibs(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			return "/My/mypage/main/myPageMain_frm";
		}//end if
		
		String memNum = String.valueOf(userSession.getMemNum());
		
		//찜
		List<GoodsDomain> allDibsList = ds.searchAllDibsList(memNum);
		model.addAttribute("allDibsList", allDibsList);
		
		return "/My/mypage/dibs/dibsGoods_frm";
	}
	
}//class
