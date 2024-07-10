package com.store.meonggae.my.contorller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.meonggae.my.domain.GoodsDomain;
import com.store.meonggae.my.pagination.PaginationUtil;
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
	public String dibs(HttpServletRequest request,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			Model model) {
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			return "/My/mypage/main/myPageMain_frm";
		}//end if
		
		String memNum = String.valueOf(userSession.getMemNum());
		String param = "";
		String contextPath = request.getContextPath();
		String url = contextPath + "/My/mypage/dibs/dibsGoods_frm.do";
		int totalPage = (int)Math.ceil((double)ds.searchCount(memNum)/PaginationUtil.getInstance().pageScale());
		String pagination = PaginationUtil.getInstance().pagiNation(url, param, totalPage, currentPage);
		model.addAttribute("pagination", pagination);
		
		//찜
		List<GoodsDomain> allDibsList = ds.searchAllDibsList(memNum, currentPage);
		model.addAttribute("allDibsList", allDibsList);
		
		return "/My/mypage/dibs/dibsGoods_frm";
	}
	
}//class
