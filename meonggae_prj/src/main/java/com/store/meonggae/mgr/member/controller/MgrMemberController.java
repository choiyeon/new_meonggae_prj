package com.store.meonggae.mgr.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.store.meonggae.mgr.common.service.BoardUtilService;
import com.store.meonggae.mgr.member.domain.MgrMemberDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberInqiryDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberLoginLogDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberPersonalDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberReportDomain;
import com.store.meonggae.mgr.member.domain.MgrMemberSteamDomain;
import com.store.meonggae.mgr.member.service.MgrMemberService;
import com.store.meonggae.mgr.member.vo.MgrMemberInquiySearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberReportSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberReviewSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberSteamSearchVO;
import com.store.meonggae.mgr.member.vo.MgrMemberSuspendVO;
import com.store.meonggae.mgr.review.domain.MgrReviewDomain;

@Controller
public class MgrMemberController {
	
	@Autowired(required = false)
	private MgrMemberService mmService;
	@Autowired(required = false)
	private BoardUtilService boardUtilService;
	
	// 회원 관리 리스트 조회
	@GetMapping("/mgr/member/mgr_member_list_frm.do")
	public String searchListMember(Model model, MgrMemberSearchVO sVO) {
		
		List<MgrMemberDomain> list = null;
		
		// 총 레코드의 수 얻기
		int totalCount = mmService.getTotalCount(sVO);
		// 한 화면에 보여줄 게시물의 수
		int pageScale = mmService.getPageScale();
		// 총 페이지수
		int totalPage = mmService.getTotalPage(totalCount, pageScale);
		// 현재 페이지
		int currentPage = mmService.getCurrentPage(sVO);
		
		// 게시물의 시작 번호
		int startNum = mmService.getStartNum(currentPage, pageScale);
		// 게시물의 끝번호
		int endNum = mmService.getEndNum(startNum, pageScale);

		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		
		list = mmService.searchListMemberList(sVO);

		String param = "";
		if(sVO.getKeyword() != null) {
			param = "&field=" + sVO.getField() + "&keyword=" + sVO.getKeyword();
		} // end if
		String pageNation = boardUtilService.pageNation("mgr/member/mgr_member_list_frm.do", param, totalPage, currentPage);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageScale", pageScale);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNation", pageNation);
		model.addAttribute("list", list);
		
		return "mgr/member/mgr_member_list_frm";
	} // mgrDashFrm
	
	// 회원 관리 - 회원 상세 조회
	@GetMapping("/mgr/member/mgr_member_detail_frm_orig.do")
	public String searchOneMemberOriginal(Model model, @RequestParam(required=true, defaultValue="0") int memNum,
			@RequestParam(required=false, defaultValue="0") int t) {
		
		MgrMemberPersonalDomain memberPersonalDomain = mmService.selectOneMemberPersonal(memNum);
		
		model.addAttribute("memberPersonalDomain", memberPersonalDomain);
		return "mgr/member/mgr_member_detail_frm";
	}
	
	// 회원 관리 - 회원 상세 조회
	@GetMapping("/mgr/member/mgr_member_detail_frm.do")
	public String searchOneMember(Model model, @RequestParam(required=true, defaultValue="0") int memNum,
			@RequestParam(required=false, defaultValue="0") int t) {
		
		MgrMemberPersonalDomain memberPersonalDomain = mmService.selectOneMemberPersonal(memNum);
		
		model.addAttribute("memberPersonalDomain", memberPersonalDomain);
		
		String page = "";
		switch(t) {
		case 1:
			page = "forward:mgr_member_detail_frm_trade.do";
			break;
		case 2:
			page = "forward:mgr_member_detail_frm_report.do";
			break;
		case 3:
			page = "forward:mgr_member_detail_frm_inquiry.do";
			break;
		case 4:
			page = "forward:mgr_member_detail_frm_review.do";
			break;
		case 5:
			page = "forward:mgr_member_detail_frm_steam.do";
			break;
		case 6:
			page = "forward:mgr_member_detail_frm_log.do";
			break;
		case 7:
			page = "forward:mgr_member_detail_frm_suspend.do";
			break;
		default:
			page = "forward:mgr_member_detail_frm_personal.do";
		}
		return page;
	} // searchOneMember
	
	@GetMapping("/mgr/member/mgr_member_detail_frm_personal.do")
	public String searchOneMemberPersonal(Model model, @RequestParam(required=true, defaultValue="0") int memNum,
			@RequestParam(required=false, defaultValue="0") int t) {
		return "mgr/member/mgr_member_detail_frm_personal";
	}
	
	@GetMapping("/mgr/member/mgr_member_detail_frm_trade.do")
	public String searchOneMemberTrade(Model model, @RequestParam(required=true, defaultValue="0") int memNum,
			@RequestParam(required=false, defaultValue="0") int t) {
		return "mgr/member/mgr_member_detail_frm_trade";
	}
	
	@GetMapping("/mgr/member/mgr_member_detail_frm_report.do")
	public String searchOneMemberReport(Model model, @RequestParam(required=true, defaultValue="0") int memNum,
			@RequestParam(required=false, defaultValue="2") int t, MgrMemberReportSearchVO sVO) {
		
		List<MgrMemberReportDomain> list = null;
		
		// 총 레코드의 수 얻기
		int totalCount = mmService.getReportTotalCount(sVO);
		// 한 화면에 보여줄 게시물의 수
		int pageScale = mmService.getPageScale();
		// 총 페이지수
		int totalPage = mmService.getTotalPage(totalCount, pageScale);
		// 현재 페이지
		int currentPage = mmService.getCurrentPage(sVO);
		
		// 게시물의 시작 번호
		int startNum = mmService.getStartNum(currentPage, pageScale);
		// 게시물의 끝번호
		int endNum = mmService.getEndNum(startNum, pageScale);

		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		
		list = mmService.searchListReport(sVO);

		String param = "";
		if(sVO.getKeyword() != null) {
			param = "&t=2&memNum=" + memNum;
		} // end if
		String pageNation = boardUtilService.pageNation("mgr/member/mgr_member_list_frm.do", param, totalPage, currentPage);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageScale", pageScale);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNation", pageNation);
		model.addAttribute("list", list);
		
		return "mgr/member/mgr_member_detail_frm_report";
	}
	
	@GetMapping("/mgr/member/mgr_member_detail_frm_inquiry.do")
	public String searchOneMemberInquiry(Model model, @RequestParam(required=true, defaultValue="0") int memNum,
			@RequestParam(required=false, defaultValue="3") int t, MgrMemberInquiySearchVO sVO) {
		
		List<MgrMemberInqiryDomain> list = null;
		
		// 총 레코드의 수 얻기
		int totalCount = mmService.getInquiryTotalCount(sVO);
		// 한 화면에 보여줄 게시물의 수
		int pageScale = mmService.getPageScale();
		// 총 페이지수
		int totalPage = mmService.getTotalPage(totalCount, pageScale);
		// 현재 페이지
		int currentPage = mmService.getCurrentPage(sVO);
		
		// 게시물의 시작 번호
		int startNum = mmService.getStartNum(currentPage, pageScale);
		// 게시물의 끝번호
		int endNum = mmService.getEndNum(startNum, pageScale);

		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		
		list = mmService.searchListInquiry(sVO);

		String param = "";
		if(sVO.getKeyword() != null) {
			param = "&t=3&memNum=" + memNum;
		} // end if
		String pageNation = boardUtilService.pageNation("mgr/member/mgr_member_list_frm.do", param, totalPage, currentPage);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageScale", pageScale);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNation", pageNation);
		model.addAttribute("list", list);
		
		return "mgr/member/mgr_member_detail_frm_inquiry";
	}
	
	// 리뷰 리스트 폼
	@GetMapping("/mgr/member/mgr_member_detail_frm_review.do")
	public String searchOneMemberReview(Model model, @RequestParam(required=true, defaultValue="0") int memNum,
			@RequestParam(required=false, defaultValue="4") int t, MgrMemberReviewSearchVO sVO) {
		List<MgrReviewDomain> list = null;
		
		// 총 레코드의 수 얻기
		int totalCount = mmService.getReviewTotalCount(sVO);
		// 한 화면에 보여줄 게시물의 수
		int pageScale = mmService.getPageScale();
		// 총 페이지수
		int totalPage = mmService.getTotalPage(totalCount, pageScale);
		// 현재 페이지
		int currentPage = mmService.getCurrentPage(sVO);
		
		// 게시물의 시작 번호
		int startNum = mmService.getStartNum(currentPage, pageScale);
		// 게시물의 끝번호
		int endNum = mmService.getEndNum(startNum, pageScale);

		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		
		list = mmService.searchListReview(sVO);

		String param = "";
		if(sVO.getKeyword() != null) {
			param = "&t=4&memNum=" + memNum;
		} // end if
		String pageNation = boardUtilService.pageNation("mgr/member/mgr_member_list_frm.do", param, totalPage, currentPage);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageScale", pageScale);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNation", pageNation);
		model.addAttribute("list", list);
		
		return "mgr/member/mgr_member_detail_frm_review";
	}
	
	// 찜목록 폼
	@GetMapping("/mgr/member/mgr_member_detail_frm_steam.do")
	public String searchOneMemberSteam(Model model, @RequestParam(required=true, defaultValue="0") int memNum,
			@RequestParam(required=false, defaultValue="5") int t, MgrMemberSteamSearchVO sVO) {
		
		List<MgrMemberSteamDomain> list = null;
		
		// 총 레코드의 수 얻기
		int totalCount = mmService.getSteamTotalCount(sVO);
		// 한 화면에 보여줄 게시물의 수
		int pageScale = mmService.getPageScale(16);
		// 총 페이지수
		int totalPage = mmService.getTotalPage(totalCount, pageScale);
		// 현재 페이지
		int currentPage = mmService.getCurrentPage(sVO);
		
		// 게시물의 시작 번호
		int startNum = mmService.getStartNum(currentPage, pageScale);
		// 게시물의 끝번호
		int endNum = mmService.getEndNum(startNum, pageScale);

		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		
		list = mmService.searchListSteam(sVO);

		String param = "";
		if(sVO.getKeyword() != null) {
			param = "&t=5&memNum=" + memNum;
		} // end if
		String pageNation = boardUtilService.pageNation("mgr/member/mgr_member_list_frm.do", param, totalPage, currentPage);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageScale", pageScale);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNation", pageNation);
		model.addAttribute("list", list);
		return "mgr/member/mgr_member_detail_frm_steam";
	}
	
	// 로그인 로그 폼
	@GetMapping("/mgr/member/mgr_member_detail_frm_log.do")
	public String searchOneMembeLog(Model model, @RequestParam(required=true, defaultValue="0") int memNum,
			@RequestParam(required=false, defaultValue="6") int t, MgrMemberSearchVO sVO) {
		
		List<MgrMemberLoginLogDomain> list = null;
		sVO.setKeyword(String.valueOf(memNum));
		
		// 총 레코드의 수 얻기
		int totalCount = mmService.getLoginLogTotalCount(memNum);
		// 한 화면에 보여줄 게시물의 수
		int pageScale = mmService.getPageScale();
		// 총 페이지수
		int totalPage = mmService.getTotalPage(totalCount, pageScale);
		// 현재 페이지
		int currentPage = mmService.getCurrentPage(sVO);
		
		// 게시물의 시작 번호
		int startNum = mmService.getStartNum(currentPage, pageScale);
		// 게시물의 끝번호
		int endNum = mmService.getEndNum(startNum, pageScale);

		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		
		list = mmService.searchListLoginLog(sVO);

		String param = "";
		if(sVO.getKeyword() != null) {
			param = "&t=6&memNum=" + memNum;
		} // end if
		String pageNation = boardUtilService.pageNation("mgr/member/mgr_member_list_frm.do", param, totalPage, currentPage);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageScale", pageScale);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNation", pageNation);
		model.addAttribute("list", list);
		
		return "mgr/member/mgr_member_detail_frm_log";
	}
	
	// 정지 폼
	@GetMapping("/mgr/member/mgr_member_detail_frm_suspend.do")
	public String searchOneMembeSuspend(Model model, @RequestParam(required=true, defaultValue="0") int memNum,
			@RequestParam(required=false, defaultValue="7") int t) {
		return "mgr/member/mgr_member_detail_frm_suspend";
	}
	
	// 회원 정지
	@PostMapping("/mgr/member/mgr_member_suspend_process.do")
	public String updateOneMemberSuspend(MgrMemberSuspendVO suspendVO, RedirectAttributes redirectAttributes) {
		int cnt = mmService.updateOneMemberSuspend(suspendVO);
		boolean flagSuspend = cnt == 1 ? true : false;
		redirectAttributes.addFlashAttribute("flagSuspend", flagSuspend);
		return "redirect:mgr_member_detail_frm.do?t=7&memNum=" + suspendVO.getMemNum();
	} // updateOneMemberSuspend
	
	// 회원 정지 즉시 해제
	@PostMapping("/mgr/member/mgr_member_un_suspend_process.do")
	public String updateOneMemberUnSuspend(int memNum, RedirectAttributes redirectAttributes) {
		int cnt = mmService.updateOneMemberUnSuspend(memNum);
		boolean flagUnSuspend = cnt == 1 ? true : false;
		redirectAttributes.addFlashAttribute("flagUnSuspend", flagUnSuspend);
		return "redirect:mgr_member_detail_frm.do?t=7&memNum=" + memNum;
	} // updateOneMemberUnSuspend
} // class
