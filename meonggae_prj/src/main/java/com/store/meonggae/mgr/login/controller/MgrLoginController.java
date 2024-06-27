package com.store.meonggae.mgr.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.store.meonggae.mgr.login.domain.MgrDomain;
import com.store.meonggae.mgr.login.service.MgrLoginService;
import com.store.meonggae.mgr.login.vo.MgrVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

@SessionAttributes({"mgr", "flagMgrLogin"})
@Controller
public class MgrLoginController {
	
	@Autowired(required=false)
	private MgrLoginService mls;
	
	public boolean chkIp(String ip) {
		List<String> listAllowIp = new ArrayList<String>();
		
		listAllowIp.add("0:0:0:0:0:0:0:1");
		listAllowIp.add("localhost");
		listAllowIp.add("127.0.0.1");
		listAllowIp.add("192.168.10.213");
		listAllowIp.add("192.168.10.214");
		listAllowIp.add("192.168.10.218");
		listAllowIp.add("192.168.10.219");
		listAllowIp.add("192.168.10.220");
		listAllowIp.add("192.168.10.210");
		listAllowIp.add("1.221.18.2");
		
		return listAllowIp.contains(ip);
	} // chkIp
	
	@RequestMapping(value="/mgr/login/mgr_login_frm.do", method={GET, POST})
	public String mgrLoginFrm(HttpServletRequest request) {
		String retDo = "mgr/login/mgr_login_frm";
		if(!chkIp(request.getRemoteAddr())) {
			retDo = "mgr/error/err-no-permission";
		} // end if
		return retDo;
	} // mgrLoginFrm
	
	@RequestMapping(value="/mgr/error/err-no-permission.do", method={GET, POST})
	public String errNoPermission() {
		return "redirect:mgr/error/err-no-permission.html";
	} // errNoPermission
	
	@RequestMapping(value="/mgr/login/mgr_main.do", method={GET, POST})
	public String mgrLoginProcess(MgrVO mgrVO, Model model, HttpServletRequest request) {
		
		String retDo = "forward:mgr_login_process.do";
		
		if(chkIp(request.getRemoteAddr())) {
			MgrDomain mgrDomain = mls.searchOneMgr(mgrVO);
			//System.out.println(mgrDomain);
			if(mgrDomain != null) {
				model.addAttribute("flagMgrLogin", true);
				model.addAttribute("mgr", mgrDomain);
			} else {
				model.addAttribute("flagMgrLogin", false);
			} // end else
		} else {
			retDo = "mgr/error/err-no-permission";
		} // end else
		
		return retDo;
	} // mgrLoginProcess
	
	@RequestMapping(value="/mgr/login/mgr_login_process.do", method={GET, POST})
	public String mgrLoginProcess() {
		return "mgr/dashboard/mgr_dashboard_frm";
	} // mgrLoginFrm
} // class
