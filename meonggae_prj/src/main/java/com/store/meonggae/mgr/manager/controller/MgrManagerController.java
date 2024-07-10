package com.store.meonggae.mgr.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.store.meonggae.mgr.common.service.BoardUtilService;
import com.store.meonggae.mgr.common.service.FilterParamService;
import com.store.meonggae.mgr.manager.domain.MgrManagerDomain;
import com.store.meonggae.mgr.manager.service.MgrManagerService;
import com.store.meonggae.mgr.manager.vo.ManagerSearchVO;
import com.store.meonggae.mgr.manager.vo.MgrManagerVO;

@Controller
public class MgrManagerController {
	
	@Autowired
	private MgrManagerService mmService;
	@Autowired
	private BoardUtilService boardUtilService;
	@Autowired(required = false)
	private FilterParamService filterService;
	
	// 관리자 - 관리자 관리 - 조회 리스트
	@GetMapping("/mgr/manager/mgr_manager_list_frm.do")
	public String searchListManager(ManagerSearchVO sVO, Model model) {
		
		List<MgrManagerDomain> list = null;
		
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
				
		list = mmService.searchListManager(sVO);
		
		String param = "";
		if(sVO.getKeyword() != null) {
			param = "&field=" + sVO.getField() + "&keyword=" + sVO.getKeyword();
		} // end if
		param += filterService.generateParam(sVO);
		String pageNation = boardUtilService.pageNation("mgr/manager/mgr_manager_list_frm.do", param, totalPage, currentPage);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNation", pageNation);
		model.addAttribute("list", list);
		
		return "mgr/manager/mgr_manager_list_frm";
	} // searchManagerList
	
	// 관리자 - 관리자 관리 - 상세 조회
	@GetMapping("/mgr/manager/mgr_manager_detail_frm.do")
	public String searchOneManager(String managerId, Model model) {
		MgrManagerDomain mmDomain = mmService.searchOneManager(managerId);
		
		model.addAttribute("mgrManagerDomain", mmDomain);
		
		return "/mgr/manager/mgr_manager_detail_frm";
	} // searchOneManager
	
	// 관리자 - 관리자 관리 - 관리자 등록 폼
	@GetMapping("/mgr/manager/mgr_manager_add_frm.do")
	public String managerAddFrm(Model model) {
		
		List<MgrManagerDomain> listManager = mmService.searchListAllManagerName();
		model.addAttribute("listManager", listManager);
		
		return "/mgr/manager/mgr_manager_add_frm";
	} // searchOneManager
	
	// 관리자 - 관리자 관리 - 관리자 등록 - 아이디 중복확인
	@GetMapping("/mgr/manager/mgr_manager_id_dup.do")
	public String managerAddIdDuplicate() {
		
		return "mgr/manager/mgr_manager_id_dup";
	} // managerAddIdDuplicate
	
	// 관리자 - 관리자 관리 - 관리자 등록 - 아이디 중복확인 - AJAX
	@GetMapping("/mgr/manager/mgr_manager_id_dup_chk.do")
	@ResponseBody
	public String managerAjaxAddIdDuplicate(String managerId) {
		
		return mmService.searchOneManagerIdDuplicate(managerId);
	} // managerAddIdDuplicate
	
	// 관리자 - 관리자 관리 - 관리자 등록 - 닉네임 중복확인
	@GetMapping("/mgr/manager/mgr_manager_nick_dup.do")
	public String managerAddNickDuplicate() {
		
		return "mgr/manager/mgr_manager_nick_dup";
	} // managerAddIdDuplicate
	
	// 관리자 - 관리자 관리 - 관리자 등록 - 닉네임 중복확인 - AJAX
	@GetMapping("/mgr/manager/mgr_manager_nick_dup_chk.do")
	@ResponseBody
	public String managerAjaxAddNickDuplicate(String nick) {
		
		return mmService.searchOneManagerNickDuplicate(nick);
	} // managerAddIdDuplicate
	
	// 관리자 - 관리자 관리 - 관리자 등록 - 추가 process
	@PostMapping("/mgr/manager/mgr_manager_add_process.do")
	public String addManagerProcess(MgrManagerVO mMgrVO, RedirectAttributes redirectAttributes) {
		boolean flagAddResult = mmService.addManagerProcess(mMgrVO);
		
		redirectAttributes.addFlashAttribute("flagAddResult", flagAddResult);
		
		return "redirect:mgr_manager_list_frm.do";
	} // managerAddProcess
	
	// 관리자 - 관리자 관리 - 관리자 등록 폼
	@GetMapping("/mgr/manager/mgr_manager_add_frm_test.do")
	public String managerAddFrm2(Model model) {
		
		List<MgrManagerDomain> listManager = mmService.searchListAllManagerName();
		model.addAttribute("listManager", listManager);
		
		return "/mgr/manager/mgr_manager_add_frm_test";
	} // searchOneManager
} // class
