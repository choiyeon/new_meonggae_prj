package com.store.meonggae.mgr.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.store.meonggae.mgr.common.service.BoardUtilService;
import com.store.meonggae.mgr.common.service.FilterParamService;
import com.store.meonggae.mgr.review.domain.MgrCategoryDomain;
import com.store.meonggae.mgr.review.domain.MgrReviewDomain;
import com.store.meonggae.mgr.review.service.MgrReviewService;
import com.store.meonggae.mgr.review.vo.MgrReviewSearchVO;
import com.store.meonggae.mgr.review.vo.MgrReviewVO;

@Controller
public class MgrReviewController {
	
	@Autowired
	private MgrReviewService mrService;
	@Autowired
	private BoardUtilService boardUtilService;
	@Autowired(required = false)
	private FilterParamService filterService;

	// 리뷰 관리 - 리스트 조회
	@GetMapping("/mgr/review/mgr_review_list_frm.do")
	public String searchListReviewList(Model model, MgrReviewSearchVO sVO) {
		
		List<MgrReviewDomain> list = null;
		
		// 총 레코드의 수 얻기
		int totalCount = mrService.getTotalCount(sVO);
		// 한 화면에 보여줄 게시물의 수
		int pageScale = mrService.getPageScale();
		// 총 페이지수
		int totalPage = mrService.getTotalPage(totalCount, pageScale);
		// 현재 페이지
		int currentPage = mrService.getCurrentPage(sVO);
		
		// 게시물의 시작 번호
		int startNum = mrService.getStartNum(currentPage, pageScale);
		// 게시물의 끝번호
		int endNum = mrService.getEndNum(startNum, pageScale);

		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		
		list = mrService.searchListReviewList(sVO);
		
		String param = "";
		if(sVO.getKeyword() != null) {
			param = "&field=" + sVO.getField() + "&keyword=" + sVO.getKeyword();
		} // end if
		param += filterService.generateParam(sVO);
		String pageNation = boardUtilService.pageNation("mgr/review/mgr_review_list_frm.do", param, totalPage, currentPage);
		
		List<MgrCategoryDomain> listCategoryUpper = mrService.searchListCategoryList(0); 
		List<MgrCategoryDomain> listCategoryLower = null; 
		try {
			if(sVO.getParentCategoryNum() != null && sVO.getParentCategoryNum() != "") {
				listCategoryLower = mrService.searchListCategoryList(Integer.parseInt(sVO.getParentCategoryNum()));
			} // end if
		} catch (NumberFormatException nfe) {
		}
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNation", pageNation);
		model.addAttribute("list", list);
		model.addAttribute("listCategoryUpper", listCategoryUpper);
		model.addAttribute("listCategoryLower", listCategoryLower);
		
		return "mgr/review/mgr_review_list_frm";
	} // searchReviewList
	
	// 리뷰 관리 - 상세 조회
	@GetMapping("/mgr/review/mgr_review_detail_frm.do")
	public String searchOneReviewDetail(MgrReviewVO mrVO, Model model) {
		
		MgrReviewDomain reviewDomain = mrService.searchOneReviewDetail(mrVO);
		model.addAttribute("reviewDomain", reviewDomain);
		
		return "mgr/review/mgr_review_detail_frm";
	} // searchReviewDetail
	
	// 상위 카테고리의 하위 카테고리 검색
	@ResponseBody
	@GetMapping("/mgr/review/mgr_review_category.do")
	@RequestMapping(value = "/mgr/review/mgr_review_category.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String searchListCategory(int categoryNum) {
		return mrService.searchListCategoryListAjax(categoryNum);
	} // searchListCategory
	
	// 리뷰 삭제
	@GetMapping("/mgr/review/mgr_review_delete_process.do")
	public String removeReviewProcess(MgrReviewVO mrVO, MgrReviewSearchVO sVO, RedirectAttributes redirectAttributes) {
		int cnt = mrService.removeReview(mrVO);
		boolean flagDelete = cnt == 1 ? true : false;
		
		redirectAttributes.addAttribute("parentCategoryNum", sVO.getParentCategoryNum());
		redirectAttributes.addAttribute("categoryNum", sVO.getCategoryNum());
		redirectAttributes.addAttribute("startDate", sVO.getStartDate());
		redirectAttributes.addAttribute("endDate", sVO.getEndDate());
		redirectAttributes.addFlashAttribute("flagDelete", flagDelete);
		
		return "redirect:mgr_review_list_frm.do";
	} // removeReview
	
} // class
