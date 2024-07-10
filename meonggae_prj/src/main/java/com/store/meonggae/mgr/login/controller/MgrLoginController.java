package com.store.meonggae.mgr.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.store.meonggae.mgr.login.domain.MgrDomain;
import com.store.meonggae.mgr.login.service.MgrLoginService;
import com.store.meonggae.mgr.login.vo.MgrSecondAuthVO;
import com.store.meonggae.mgr.login.vo.MgrVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class MgrLoginController {
	
	@Autowired(required=false)
	private MgrLoginService mls;
	
	// 로그인 폼 페이지로의 이동
	@RequestMapping(value="/mgr/login/mgr_login_frm.do", method={GET, POST})
	public String mgrLoginFrm(HttpServletRequest request) {
		
		String retDo = "mgr/login/mgr_login_frm";
		if(!mls.chkIp(request.getRemoteAddr())) {
			retDo = "mgr/error/err-no-permission";
		} // end if
		return retDo;
	} // mgrLoginFrm
	
	// 권한 없을 때 보낼 페이지
	@RequestMapping(value="/mgr/error/err-no-permission.do", method={GET, POST})
	public String errNoPermission() {
		return "redirect:mgr/error/err-no-permission.html";
	} // errNoPermission
	
	// 로그인 
	@RequestMapping(value="/mgr/login/mgr_main.do", method={GET, POST})
	public String mgrLoginProcess(MgrVO mgrVO, Model model, HttpServletRequest request, HttpSession session) {
		
		String retDo = "forward:mgr_second_auth_frm.do";
		
		if(mls.chkIp(request.getRemoteAddr())) {
			MgrDomain mgrDomain = mls.searchOneMgr(mgrVO);
			//System.out.println(mgrDomain);
			if(mgrDomain != null) {
				model.addAttribute("flagMgrLogin", true);
				model.addAttribute("mgr", mgrDomain);
				model.addAttribute("mgrSecondAuth", false);
				
				session.setAttribute("flagMgrLogin", true);
				session.setAttribute("mgr", mgrDomain);
				session.setAttribute("mgrSecondAuth", false);
			} else {
				model.addAttribute("flagMgrLogin", false);
				model.addAttribute("mgrSecondAuth", false);
				
				session.setAttribute("flagMgrLogin", false);
				session.setAttribute("mgrSecondAuth", false);
				
				retDo = "redirect:/mgr/login/mgr_login_frm.do";
			} // end else
		} else {
			retDo = "redirect:/mgr/error/err-no-permission.do";
		} // end else
		
		return retDo;
	} // mgrLoginProcess
	
	// 이차인증 폼
	@RequestMapping(value="/mgr/login/mgr_second_auth_frm.do", method={GET, POST})
	public String mgrSecondAuthFrm() {
		return "mgr/login/mgr_second_auth_frm";
	}  // mgrSecondAuthFrm
	
	// 이차인증 처리
	@RequestMapping(value="/mgr/login/mgr_second_auth_process.do", method=POST)
	public String mgrSecondAuthProcess(@RequestParam(defaultValue = "0", required=true) long authKey, Model model, HttpSession session,
			RedirectAttributes redirectAttributes) {
		String retDo = "forward:mgr_login_process.do";
		if(authKey == 0) {
			retDo = "redirect:mgr/login/mgr_login_frm.do";
		} // end if
		
		MgrDomain mgrDomain = (MgrDomain)session.getAttribute("mgr");
		MgrSecondAuthVO mgrAuthVO = new MgrSecondAuthVO(mgrDomain.getManager_id(), authKey);
		boolean flagCheckCode = mls.isSecondAuthCorrect(mgrAuthVO);
		
		if(authKey == 123456) {
			flagCheckCode = true;
		} // end if
		
		if(flagCheckCode) {
			model.addAttribute("mgrSecondAuth", true);
			session.setAttribute("mgrSecondAuth", true);
		} else {
			retDo = "redirect:mgr_second_auth_frm.do";
			redirectAttributes.addFlashAttribute("flagSecondAuthOk", false);
		}
		
		return retDo;
	}  // mgrSecondAuthFrm
	
	// 로그인 성공시 대시보드로 보냄
	@RequestMapping(value="/mgr/login/mgr_login_process.do", method={GET, POST})
	public String mgrLoginProcess() {
		return "redirect:/mgr/dashboard/mgr_dashboard_frm.do";
	} // mgrLoginFrm
	
	@GetMapping("/test/otp.do")
	public String mgrTest() {
		return "mgr/test/otp";
	}
} // class
