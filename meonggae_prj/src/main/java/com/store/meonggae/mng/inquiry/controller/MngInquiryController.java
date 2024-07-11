package com.store.meonggae.mng.inquiry.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.store.meonggae.mng.inquiry.domain.MngInquiryDomain;
import com.store.meonggae.mng.inquiry.service.MngInquiryService;
import com.store.meonggae.mng.search.vo.SearchVO;


@Controller
public class MngInquiryController {

	@Autowired(required = false)
	private MngInquiryService is;
	
	@GetMapping("mng/inquiry/inquiry_result.do")
	public String searchInquiry( 
			SearchVO sVO,Model model) {
			
		sVO.setStartNum(1);
		sVO.setEndNum(10);
		System.out.println("-------------------------------------"+sVO);
		
		List<MngInquiryDomain> list=is.searchInquiry(sVO);
		
		model.addAttribute("listInquiry", list);
		
		return "mng/inquiry/inquiry_result";
	}	
	

	@GetMapping("mng/inquiry/inquiry_detail.do")
    public String searchDetailInquiry(HttpServletRequest request, Model model) {
        String inquiryNum = request.getParameter("inquiry_num");
        MngInquiryDomain id = is.searchDetailInquiry(inquiryNum);

        model.addAttribute("id", id);

        return "mng/inquiry/inquiry_detail";	
    }

	@PostMapping("mng/inquiry/updateInquiry.do")
	public String updateInquiry(MngInquiryDomain id, HttpSession session) {
		try {
			is.updateInquiry(id);
			session.setAttribute("message", "문의가 성공적으로 수정되었습니다.");
		} catch (PersistenceException pe) {
			pe.printStackTrace();
			session.setAttribute("message", "문의 수정에 실패하셨습니다.");
		}
		return "redirect:inquiry_detail.do?inquiry_num=" + id.getInquiry_num();
	}
	
	  //spring_mvc/inquiry/deleteInquiry.do
    @PostMapping("mng/inquiry/deleteInquiry.do")
    public String deleteInquiry(MngInquiryDomain id, HttpSession session) {
        try {
            is.deleteInquiry(id);
            session.setAttribute("message", "문의가 성공적으로 삭제되었습니다.");
            session.setAttribute("deleted", true); // 삭제 플래그 설정
        } catch (PersistenceException pe) {
            pe.printStackTrace();
            session.setAttribute("message", "문의 삭제에 실패하셨습니다.");
            session.setAttribute("deleted", true); // 실패해도 플래그 설정
        }
        return "redirect:inquiry_detail.do?inquiry_num="+ id.getInquiry_num();
    }
	
}
