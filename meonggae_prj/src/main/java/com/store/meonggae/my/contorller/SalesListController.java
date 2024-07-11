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
import com.store.meonggae.my.service.SalesListService;
import com.store.meonggae.user.login.domain.LoginDomain;

@RequestMapping("/My/mypage")
@Controller
public class SalesListController {
	
	@Autowired(required = false)
	private SalesListService sl;
	
	/**
	 * 마이페이지 : 거래내역_판매중
	 */
	@GetMapping("/sales_list/salesDetails_frm.do")
	public String salesDetailSales(HttpServletRequest request,
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
		String url = contextPath + "/My/mypage/sales_list/salesDetails_frm.do";
		int totalPage = (int)Math.ceil((double)sl.searchSalesCount(memNum)/PaginationUtil.getInstance().pageScale());
		String pagination = PaginationUtil.getInstance().pagiNation(url, param, totalPage, currentPage);
		model.addAttribute("pagination", pagination);
		
		List<GoodsDomain> salesList = sl.searchAllSalesList(memNum, currentPage);
		model.addAttribute("salesList", salesList);
		
		return "/My/mypage/sales_list/salesDetails_frm";
	}//salesDetailSales
	
	/**
	 * 마이페이지 : 거래내역_판매완료
	 */
	@GetMapping("/sales_list/soldDetails_frm.do")
	public String salesDetailSold(HttpServletRequest request,
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
		String url = contextPath + "/My/mypage/sales_list/soldDetails_frm.do";
		int totalPage = (int)Math.ceil((double)sl.searchSoldCount(memNum)/PaginationUtil.getInstance().pageScale());
		String pagination = PaginationUtil.getInstance().pagiNation(url, param, totalPage, currentPage);
		model.addAttribute("pagination", pagination);
		
		List<GoodsDomain> soldList = sl.searchAllSoldList(memNum, currentPage);
		model.addAttribute("soldList", soldList);
		
		return "/My/mypage/sales_list/soldDetails_frm";
	}//salesDetailSold
	
	/**
	 * 마이페이지 : 거래내역_구매완료
	 */
	@GetMapping("/sales_list/boughtDetails_frm.do")
	public String salesDetailBought(HttpServletRequest request,
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
		String url = contextPath + "/My/mypage/sales_list/boughtDetails_frm.do";
		int totalPage = (int)Math.ceil((double)sl.searchBoughtCount(memNum)/PaginationUtil.getInstance().pageScale());
		String pagination = PaginationUtil.getInstance().pagiNation(url, param, totalPage, currentPage);
		model.addAttribute("pagination", pagination);
		
		List<GoodsDomain> boughtList = sl.searchAllBoughtList(memNum, currentPage);
		model.addAttribute("boughtList", boughtList);
		
		return "/My/mypage/sales_list/boughtDetails_frm";
	}//salesDetailBought
	
}//class
