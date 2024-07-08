package com.store.meonggae.mng.report.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.store.meonggae.mng.report.domain.MngReportDomain;
import com.store.meonggae.mng.report.service.MngReportService;
import com.store.meonggae.mng.search.vo.SearchVO;


@Controller
public class MngReportController {

	@Autowired(required = false)
	private MngReportService rs;
	
	@GetMapping("/report/report_result.do")
	public String searchReport( 
			SearchVO sVO,Model model) {
			
		sVO.setStartNum(1);
		sVO.setEndNum(10);
		System.out.println("-------------------------------------"+sVO);
		
		List<MngReportDomain> list=rs.searchReport(sVO);
		
		model.addAttribute("listReport", list);
		
		return "report/report_result";
	}	
	

	@GetMapping("/report/report_detail.do")
    public String searchDetailReport(HttpServletRequest request, Model model) {
        String reportNum = request.getParameter("rep_num");
        MngReportDomain rd = rs.searchDetailReport(reportNum);

        model.addAttribute("rd", rd);

        return "report/report_detail";	
    }


	@PostMapping("/report/updateReport.do")
	public String updateReport(MngReportDomain rd, HttpSession session) {
		try {
			rs.updateReport(rd);
			session.setAttribute("message", "신고가 성공적으로 수정되었습니다.");
		} catch (PersistenceException pe) {
			pe.printStackTrace();
			session.setAttribute("message", "신고 수정에 실패하셨습니다.");
		}
		return "redirect:/report/report_detail.do?rep_num=" + rd.getRep_num();
	}
	
	
}
