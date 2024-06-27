package com.store.meonggae.my.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.meonggae.my.store.domain.ReviewDomain;
import com.store.meonggae.my.store.domain.StoreMainDomain;
import com.store.meonggae.my.store.service.StoreService;

@RequestMapping("/My/store")
@Controller
public class StoreController {
	@Autowired(required = false)
	private StoreService ss;
	
	/**
	 * 내 상점 : 메인
	 */
	@GetMapping("/store_frm.do")
	public String storeMain(@RequestParam("nick") String nick, Model model) {
		
		List<StoreMainDomain> list = ss.searchSalesList(nick);
		model.addAttribute("listSales", list);
		
		String profile = ss.searchProfile(nick);
		model.addAttribute("profile", profile);
		
		return "My/store/store_frm";
	}//storeMain
	
	/**
	 * 내 상점 : 리뷰
	 */
	@GetMapping("/store_review_frm.do")
	public String storeReview(@RequestParam("nick") String nick, Model model) {
		
		String profile = ss.searchProfile(nick);
		List<ReviewDomain> list = ss.searchReviewList(nick, 1, 2);
		String nickCode = ss.searchMemNum(nick);
		model.addAttribute("profile", profile);
		model.addAttribute("listReview", list);
		model.addAttribute("nickCode", nickCode);
		
		List<Double> listStarScore = ss.searchStarScore(nick);
		double starScore = 0;
		for(int i=0 ; i<listStarScore.size() ; i++) {
			starScore += listStarScore.get(i);
		}//end for
		starScore = starScore/listStarScore.size();
		model.addAttribute("starScore", starScore);
		
		double scoreWidth = (starScore/5.0)*100;
		model.addAttribute("scoreWidth", scoreWidth);
		
		return "My/store/review_frm";
	}//storeReview
	
	/**
	 * 리뷰 더보기버튼...죽고십다
	 */
	@ResponseBody
	@RequestMapping(value="/store_more_review.do",method=RequestMethod.GET,produces = "application/json;charset=UTF-8")
	public List<ReviewDomain> moreReviewLoad(@RequestParam("nick") String nick,
								@RequestParam("startNum") int startNum,
								@RequestParam("endNum") int endNum,
								Model model) {
		
		List<ReviewDomain> list = ss.searchReviewList(nick, startNum, endNum);
		model.addAttribute("listReview", list);
		
		return list;
	}//moreReviewLoad
	
}//class
