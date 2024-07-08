package com.store.meonggae.user.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.store.meonggae.product.domain.CategoryDomain;
import com.store.meonggae.product.domain.SearchProductDetailDomain;
import com.store.meonggae.product.domain.SearchProductDomain;
import com.store.meonggae.product.domain.SearchReviewDomain;
import com.store.meonggae.product.domain.SellOtherPrdDomain;
import com.store.meonggae.product.domain.SellerInfoDomain;
import com.store.meonggae.product.service.CategoryService;
import com.store.meonggae.product.service.SearchProductService;
import com.store.meonggae.product.service.ProductDetailInfoService;
import com.store.meonggae.event.domain.EventDomain;
import com.store.meonggae.event.service.EventService;
import com.store.meonggae.product.vo.SearchProductVO;
import com.store.meonggae.product.vo.SteamVO;
import com.store.meonggae.user.login.domain.LoginDomain;

@Controller
public class MainController {

	@Autowired
	private SearchProductService SearchProductService;
	@Autowired
	private CategoryService CategoryService;
	@Autowired
	private ProductDetailInfoService ProductDetailInfoService;
	@Autowired
	private EventService EventService;

	@RequestMapping(value = "/index.do", method = { GET, POST })
	public String main(Model model) {
		// 전체상품 조회
		List<SearchProductDomain> list = SearchProductService.selectAllProduct();
		// 이벤트 캐러셀 조회
		List<EventDomain> eventList = EventService.eventCarousel();
		model.addAttribute("prdAllList", list);
		model.addAttribute("eventList", eventList);
		return "main_page/main_contents";
	}

	/*
	 * @GetMapping("/index.do") public String goToMain() {
	 * 
	 * return "main_page/main_contents"; }
	 */

	// 검색페이지 이동
	@GetMapping("/main_page/search_contents.do")
	public String searchContents(@RequestParam(name = "kw", required = false) String kw,
			@RequestParam(name = "cn", required = false) String cn,
			@RequestParam(name = "isP", required = false) String isP, Model model) {
		List<SearchProductDomain> list = null;
		List<SellerInfoDomain> storeList = null;

		if (kw != null && kw.startsWith("@")) {
			// 상점명 검색
			storeList = SearchProductService.selectStore(kw);
		} else {

			if (kw != null && cn == null && isP == null) {
				// 키워드만 있는 경우
				list = SearchProductService.selectPrdKey(kw);
			} else if (kw != null && cn != null) {
				// 키워드 & 카테고리 둘다 있는 경우
				SearchProductVO spVo = new SearchProductVO(kw, cn);
				list = SearchProductService.selectPrdKeyCate(spVo);
			} else if (kw == null && cn != null && isP != null) {
				// 카테고리만 있는 경우
				if ("T".equals(isP.trim())) {
					// 부모 카테고리인 경우
					list = SearchProductService.selectPrdCateP(cn);
				} else if ("F".equals(isP.trim())) {
					// 자식 카테고리인 경우
					list = SearchProductService.selectPrdCate(cn);
				} // end if
			} // end if

			Map<String, Long> cateCnt = SearchProductService.cateCnt(list);
			model.addAttribute("searchPrdlist", list);// 조회 결과 리스트
			model.addAttribute("cateCnt", cateCnt);// 조회된 상품들의 카테고리 카운팅
		} // end else
		
		model.addAttribute("storeList", storeList);// 조회 결과 리스트
		model.addAttribute("keyword", kw);// 검색된 키워드 검색창에 유지
		if (cn != null) {
			String categoryName = SearchProductService.selectCategoryName(cn);
			model.addAttribute("categoryName", categoryName);// 검색된 키워드 검색창에 유지
		}

		return "main_page/search_contents";
	}

	// 상세페이지 이동
	@GetMapping("/main_page/products_detail.do")
	public String productDetail(HttpSession session, @RequestParam(name = "goodsNum", required = false) String goodsNum,
			Model model, HttpServletResponse response) {
		// 조회한 페이지인지 확인
		Object cntSession = session.getAttribute("cntFlag");
		boolean cntFlag = false;
		if (cntSession != null) {
			cntFlag = ((String) cntSession).contains(goodsNum);
			// 세션에 goodsNum(문자열)이 포함되어있는지 확인.
			// 포함되어있으면 그 페이지는 이미 조회했으므로 조회수 안 올림.
		} // end if
			// 조회수 올리기
		if (!cntFlag) {
			ProductDetailInfoService.updateCnt(goodsNum);
			session.setAttribute("cntFlag", session.getAttribute("cntFlag") + "," + goodsNum);
		} // end if
			// 사용자 정보를 세션에서 가져옴
		LoginDomain loginUser = (LoginDomain) session.getAttribute("user");
		

		// 상품 상세 조회
		SearchProductDetailDomain spd = SearchProductService.selectPrdDetail(goodsNum);

		// 대분류 카테고리에 속한 상품인지 확인 true면 대분류상품, false면 소분류 상품
		boolean isP = CategoryService.isParentCategory(spd.getCategoryNum());

		// 대분류 리스트
		List<CategoryDomain> parentCateList = CategoryService.selectParentCategory();
		// 소분류된 상품일 경우
		if (!isP) {
			// 소분류 리스트
			List<CategoryDomain> subCateList = CategoryService.selectSubCategory(spd.getParentCategoryNum());
			model.addAttribute("subCateList", subCateList);
		}
		// 상품의 전체 찜 횟수 조회
		int countSteam = ProductDetailInfoService.countAllSteam(goodsNum);
		spd.setCountSteam(countSteam);
		
		// 회원의 찜 여부 조회
		if (loginUser != null) {
			SteamVO steamVo = new SteamVO(spd.getGoodsNum(), loginUser.getMemNum());
			boolean checkMemSteam = ProductDetailInfoService.checkMemSteam(steamVo);
			model.addAttribute("checkMemSteam", checkMemSteam);
		} // end if

		// 판매자 정보
		SellerInfoDomain sellerInfo = ProductDetailInfoService.sellerInfo(spd.getMemNumSell());
		
		// 판매자 다른상품
		SteamVO steamVo2 = new SteamVO(spd.getGoodsNum(), spd.getMemNumSell());
		List<SellOtherPrdDomain> sellerOtherPrdList = ProductDetailInfoService.sellerOtherPrd(steamVo2);

		// 판매자 리뷰
		List<SearchReviewDomain> searchReviewList = ProductDetailInfoService.searchReview(spd.getMemNumSell());
		
		// 판매자와 로그인한 사용자가 동일인인지
		if (loginUser != null) {
			model.addAttribute("isSellerEqMe", loginUser.getMemNum() == sellerInfo.getMemNum());
		} // end if
		
		model.addAttribute("user", loginUser);
		model.addAttribute("spd", spd);
		model.addAttribute("parentCateList", parentCateList);
		model.addAttribute("sellerInfo", sellerInfo);
		model.addAttribute("sellerOtherPrdList", sellerOtherPrdList);
		model.addAttribute("searchReviewList", searchReviewList);
		
		Cookie cookie =  new Cookie("goodsNum", goodsNum);
        cookie.setMaxAge(60 * 60 * 2);
        cookie.setPath("/");
        cookie.setSecure(false);
        response.addCookie(cookie);

		return "main_page/products_detail";
	}

	// 로그인
	@GetMapping("/login_page/login_page.do")
	public String login() {

		return "/login_page/login_page";
	}

	// 회원가입
	@GetMapping("/join_page/mem_join.do")
	public String join(@RequestParam(name = "result", required = false) String result, Model model) {
		model.addAttribute("result", result);
		return "/join_page/mem_join";
	}
}
