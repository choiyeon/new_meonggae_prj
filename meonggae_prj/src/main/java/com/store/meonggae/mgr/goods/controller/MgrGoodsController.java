package com.store.meonggae.mgr.goods.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.store.meonggae.mgr.common.service.BoardUtilService;
import com.store.meonggae.mgr.common.service.FilterParamService;
import com.store.meonggae.mgr.goods.domain.MgrGoodsDomain;
import com.store.meonggae.mgr.goods.domain.MgrOtherGoodsDomain;
import com.store.meonggae.mgr.goods.domain.MgrSellerReviewDomain;
import com.store.meonggae.mgr.goods.service.MgrGoodsService;
import com.store.meonggae.mgr.goods.vo.MgrGoodsSearchVO;
import com.store.meonggae.mgr.review.domain.MgrCategoryDomain;
import com.store.meonggae.mgr.review.service.MgrReviewService;

@Controller
public class MgrGoodsController {
	
	@Autowired(required = false)
	private MgrGoodsService mgService;
	@Autowired(required = false)
	private BoardUtilService boardUtilService;
	@Autowired(required = false)
	private MgrReviewService mrService;
	@Autowired(required = false)
	private FilterParamService filterService;
	
	// 물품 관리 - 리스트 조회
	@GetMapping("/mgr/goods/mgr_goods_list_frm.do")
	public String searchListGoods(Model model, MgrGoodsSearchVO sVO) {
		
		List<MgrGoodsDomain> list = null;
		
		// 총 레코드의 수 얻기
		int totalCount = mgService.getTotalCount(sVO);
		// 한 화면에 보여줄 게시물의 수
		int pageScale = mgService.getPageScale();
		// 총 페이지수
		int totalPage = mgService.getTotalPage(totalCount, pageScale);
		// 현재 페이지
		int currentPage = mgService.getCurrentPage(sVO);
		
		// 게시물의 시작 번호
		int startNum = mgService.getStartNum(currentPage, pageScale);
		// 게시물의 끝번호
		int endNum = mgService.getEndNum(startNum, pageScale);

		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		
		list = mgService.searchListGoodsList(sVO);
		
		String param = "";
		if(sVO.getKeyword() != null) {
			param = "&field=" + sVO.getField() + "&keyword=" + sVO.getKeyword();
		} // end if
		param += filterService.generateParam(sVO);
		String pageNation = boardUtilService.pageNation("mgr/goods/mgr_goods_list_frm.do", param, totalPage, currentPage);
		
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
		
		return "mgr/goods/mgr_goods_list_frm";
	} // searchReviewList
	
	// 물품 관리 - 상세 조회
	@GetMapping("/mgr/goods/mgr_goods_detail_frm.do")
	public String searchOneGoodsDetail(String goodsNum, Model model) {
		
		MgrGoodsDomain goodsDomain = mgService.searchOneGoodsDetail(goodsNum);
		List<MgrOtherGoodsDomain> listOtherGoods = mgService.searchListOtherGoods(goodsDomain.getMemNumSell());
		List<MgrSellerReviewDomain> listSellerReview = mgService.searchListSellerReview(goodsDomain.getMemNumSell());
		
		model.addAttribute("goodsDomain", goodsDomain);
		model.addAttribute("listOtherGoods", listOtherGoods);
		model.addAttribute("listSellerReview", listSellerReview);
		
		return "mgr/goods/mgr_goods_detail_frm";
	} // searchReviewDetail
	
	// 상위 카테고리의 하위 카테고리 검색
//	@ResponseBody
//	@GetMapping("/mgr/goods/mgr_goods_category.do")
//	@RequestMapping(value = "/mgr/goods/mgr_goods_category.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
//	public String searchListCategory(int categoryNum) {
//		return mgService.searchListCategoryListAjax(categoryNum);
//	} // searchListCategory
	
	// 물품 삭제
	@GetMapping("/mgr/goods/mgr_goods_delete_process.do")
	public String removeGoodsProcess(String goodsNum, MgrGoodsSearchVO sVO, RedirectAttributes redirectAttributes) {
		int cnt = mgService.removeOneGoods(goodsNum);
		boolean flagDelete = cnt == 1 ? true : false;
		
		redirectAttributes.addAttribute("parentCategoryNum", sVO.getParentCategoryNum());
		redirectAttributes.addAttribute("categoryNum", sVO.getCategoryNum());
		redirectAttributes.addAttribute("startDate", sVO.getStartDate());
		redirectAttributes.addAttribute("endDate", sVO.getEndDate());
		
		redirectAttributes.addAttribute("tradeMethodCode", sVO.getTradeMethodCode());
		redirectAttributes.addAttribute("qualityCode", sVO.getQualityCode());
		redirectAttributes.addAttribute("sellStatusCode", sVO.getSellStatusCode());
		redirectAttributes.addAttribute("location", sVO.getLocation());
		redirectAttributes.addAttribute("minPrice", sVO.getMinPrice());
		redirectAttributes.addAttribute("maxPrice", sVO.getMaxPrice());
		
		redirectAttributes.addFlashAttribute("flagDelete", flagDelete);
		
		return "redirect:mgr_goods_list_frm.do";
	} // removeReview
	
} // class
