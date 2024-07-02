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

import com.store.meonggae.my.domain.InquiryCategoryDomain;
import com.store.meonggae.my.domain.InquiryDetailDomain;
import com.store.meonggae.my.domain.InquiryDomain;
import com.store.meonggae.my.domain.InquiryModifyDomain;
import com.store.meonggae.my.service.InquiryService;
import com.store.meonggae.my.vo.InquiryModifyVO;
import com.store.meonggae.my.vo.InquiryVO;
import com.store.meonggae.user.login.domain.LoginDomain;

@RequestMapping("/My/mypage")
@Controller
public class InquiryController {
	
	@Autowired(required = false)
	private InquiryService is;
	
	/**
	 * 마이페이지 : 1:1문의
	 */
	@GetMapping("/inquiry/inquiry_frm.do")
	public String inquiry(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			return "/My/mypage/main/myPageMain_frm";
		}//end if
		
		String memNum = String.valueOf(userSession.getMemNum());
		
		List<InquiryDomain> list = is.searchInquiryList(memNum);
		model.addAttribute("inquiryList", list);
		
		return "/My/mypage/inquiry/inquiry_frm";
	}//inquiry
	
	/**
	 * 마이페이지 : 1:1문의_상세보기
	 */
	@GetMapping("/inquiry/inquiry_detail.do")
	public String inquiryDetail(HttpServletRequest request, Model model,
								@RequestParam("inquiryNum") String inquiryNum) {
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			return "/My/mypage/main/myPageMain_frm";
		}//end if
		
		InquiryDetailDomain iDetailDomain = is.searchInquiryOne(inquiryNum);
		model.addAttribute("iDetailDomain", iDetailDomain);
		
		return "/My/mypage/inquiry/inquiry_detail_frm";
	}
	
	/**
	 * 마이페이지 : 1:1문의_문의 작성폼
	 */
	@GetMapping("/inquiry/inquiry_add_frm.do")
	public String inquiryAddFrm(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			return "/My/mypage/main/myPageMain_frm";
		}//end if
		List<InquiryCategoryDomain> list = is.searchCategory();
		model.addAttribute("categoryList", list);
		
		return "/My/mypage/inquiry/inquiry_add_frm";
	}
	
	/**
	 * 마이페이지 : 1:1문의_문의작성 process
	 */
	@PostMapping("/inquiry/inquiry_process.do")
	@ResponseBody
	public JSONObject insertInquirt(HttpServletRequest request) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", "false");
		
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			jsonObj.put("result", "noSession");
	        return jsonObj;
		}//end if
		
		String content = request.getParameter("content");
//		if(content.startsWith("<p>") && content.endsWith("</p>")) {
//			content = content.substring(3, content.length()-4);
//		}//if
		
		InquiryVO iVO = new InquiryVO();
		iVO.setMemnum(userSession.getMemNum());
		iVO.setTitle(request.getParameter("title"));
		iVO.setCategory(request.getParameter("category"));
		iVO.setContent(content);
		
		int cnt = is.inputInquiry(iVO);
		if(cnt != 0) {
			jsonObj.put("result", "success");
		}//if
		
		return jsonObj;
	}//insertInquirt
	
	/**
	 * 마이페이지 : 1:1문의_수정
	 */
	@PostMapping("/inquiry/inquiry_modify.do")
	public String modifyInquiry(HttpServletRequest request,
							@RequestParam("inquiryNum") String inquiryNum,
							Model model) {
		
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			return "/My/mypage/main/myPageMain_frm";
		}//end if
		
		List<InquiryCategoryDomain> list = is.searchCategory();
		model.addAttribute("categoryList", list);
		
		String flag = is.searchDeleteFlag(inquiryNum);
		if(flag == null) {
			model.addAttribute("deleteFlag", "false");
			return "/My/mypage/inquiry/inquiry_modify_frm";
		}//if
		
		InquiryModifyDomain imDomain = is.searchInquiryForUpdate(inquiryNum);
		model.addAttribute("inquiry", imDomain);
		
		return "/My/mypage/inquiry/inquiry_modify_frm";
	}//modifyInquiry
	
	/**
	 * 마이페이지 : 1:1문의_문의수정 process
	 */
	@PostMapping("/inquiry/inquiry_modify_process.do")
	@ResponseBody
	public JSONObject modifyInquiryProcess(HttpServletRequest request) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", "false");
		
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
			jsonObj.put("result", "noSession");
	        return jsonObj;
		}//end if
		
		String content = request.getParameter("content");
//		if(content.startsWith("<p>") && content.endsWith("</p>")) {
//			content = content.substring(3, content.length()-4);
//		}//if
		
		InquiryModifyVO imVO = new InquiryModifyVO();
		imVO.setInquiryNum(request.getParameter("num"));
		imVO.setTitle(request.getParameter("title"));
		imVO.setCategory(request.getParameter("category"));
		imVO.setContent(content);
		
		int cnt = is.updateInquiry(imVO);
		if(cnt != 0) {
			jsonObj.put("result", "success");
		}//if
		
		return jsonObj;
	}//insertInquirt
	
	/**
	 * 마이페이지 : 1:1문의_문의삭제 process
	 */
	@GetMapping("/inquiry/inquiry_delete.do")
	public String deleteInquiryProcess(HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginDomain userSession = (LoginDomain)session.getAttribute("user");
		
		if(userSession == null) {
	        return "/My/mypage/main/myPageMain_frm";
		}//end if
		
		is.deleteInquiry(request.getParameter("inquiryNum"));
		
		return "forward:/My/mypage/inquiry/inquiry_frm.do";
	}//deleteInquiryProcess
	
}//class