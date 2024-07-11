package com.store.meonggae.my.contorller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.meonggae.my.domain.MyReviewDomain;
import com.store.meonggae.my.domain.WriteReviewDomain;
import com.store.meonggae.my.pagination.PaginationUtil;
import com.store.meonggae.my.service.ReviewService;
import com.store.meonggae.my.store.VO.ReviewVO;
import com.store.meonggae.my.vo.WriteReviewVO;
import com.store.meonggae.user.login.domain.LoginDomain;

@RequestMapping("/My/mypage")
@Controller
public class ReviewController {
	
	@Autowired(required = false)
	private ReviewService rs;
	
	/**
	 * 마이페이지 : 리뷰
	 * @return
	 */
	@GetMapping("/review/review_frm.do")
	public String review(HttpServletRequest request,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			Model model) {
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			return "/My/mypage/main/myPageMain_frm";
		}//end if
		
		String memNum = String.valueOf(userSession.getMemNum());
		int totalCount = rs.searchReviewCount(memNum);
		
		if(totalCount > 10) {
			String param = "";
			String contextPath = request.getContextPath();
			String url = contextPath + "/My/mypage/review/review_frm.do";
			int totalPage = (int)Math.ceil((double)totalCount/10);
			String pagination = PaginationUtil.getInstance().pagiNation(url, param, totalPage, currentPage);
			model.addAttribute("pagination", pagination);
		}//if
		
		List<MyReviewDomain> myReviewList = rs.searchMyReview(memNum, currentPage);
		List<WriteReviewDomain> writeReviewList = rs.searchWriteReview(memNum);
		
		model.addAttribute("myReviewList", myReviewList);
		model.addAttribute("writeReviewList", writeReviewList);
		
		return "/My/mypage/review/review_frm";
	}//review
	
	/**
	 * 마이페이지 : 리뷰삭제 process
	 */
	@PostMapping("/review/delete_review_process.do")
	@ResponseBody
	public JSONObject doDeleteReview(HttpServletRequest request) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", "false");
		
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			jsonObj.put("result", "noSession");
	        return jsonObj;
		}//end if
		
		String goodsNum = request.getParameter("sendData");
		
		int cnt = rs.deleteReview(goodsNum);
		if(cnt == 2) {
			jsonObj.put("result", "true");
		}//if
		
		return jsonObj;
	}//deleteReview
	
	/**
	 * 마이페이지 : 리뷰작성 process
	 */
	@PostMapping("/review/write_review.do")
	@ResponseBody
	public JSONObject doInsertReview(HttpServletRequest request) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", "false");
		
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			jsonObj.put("result", "noSession");
	        return jsonObj;
		}//end if
		
		String memNum = String.valueOf(userSession.getMemNum());
		String goodsNum = request.getParameter("goodsNum");
		String contents = request.getParameter("reivewContents");
		String starScore = request.getParameter("starScore");
		
		int cnt = rs.writeReview(memNum, goodsNum, contents, starScore);
		if(cnt == 2) {
			jsonObj.put("result", "success");
		}//if
		
		return jsonObj;
	}//doInsertReview
	
}//class
