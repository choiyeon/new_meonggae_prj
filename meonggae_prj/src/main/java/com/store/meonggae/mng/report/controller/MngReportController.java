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
import org.springframework.web.bind.annotation.RequestParam;

import com.store.meonggae.mng.inquiry.domain.MngInquiryDomain;
import com.store.meonggae.mng.report.domain.MngReportDomain;
import com.store.meonggae.mng.report.service.MngReportService;
import com.store.meonggae.mng.search.vo.SearchVO;


@Controller
public class MngReportController {

	@Autowired(required = false)
	private MngReportService rs;
	
//	@GetMapping("mng/report/report_result.do")
//	public String searchReport( 
//			SearchVO sVO,Model model) {
//			
//		sVO.setStartNum(1);
//		sVO.setEndNum(10);
//		System.out.println("-------------------------------------"+sVO);
//		
//		List<MngReportDomain> list=rs.searchReport(sVO);
//		
//		model.addAttribute("listReport", list);
//		
//		return "mng/report/report_result";
//	}	
	
	@GetMapping("mng/report/report_result.do")
	public String searchReport(
	        @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
	        SearchVO sVO, Model model) {

	    // 한 페이지에 표시할 항목 수 고정
	    int pageSize = 10;

	    // 현재 페이지와 페이지당 항목 수를 기반으로 시작 번호와 끝 번호 계산
	    int startNum = (currentPage - 1) * pageSize + 1;
	    int endNum = currentPage * pageSize;

	    sVO.setStartNum(startNum);
	    sVO.setEndNum(endNum);
	    System.out.println("-------------------------------------" + sVO);

	    List<MngReportDomain> list = rs.searchReport(sVO);

	    // 총 게시글 수 가져오기 (예: DB에서 조회)
	    int totalRecords = rs.getTotalCounts(sVO);

	    // 총 페이지 수 계산
	    int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

	    model.addAttribute("listReport", list);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalRecords", totalRecords);

	    return "mng/report/report_result";
	}


	@GetMapping("mng/report/report_detail.do")
    public String searchDetailReport(HttpServletRequest request, Model model) {
        String reportNum = request.getParameter("rep_num");
        MngReportDomain rd = rs.searchDetailReport(reportNum);

        model.addAttribute("rd", rd);

        return "mng/report/report_detail";	
    }


	@PostMapping("mng/report/updateReport.do")
	public String updateReport(MngReportDomain rd, HttpSession session) {
		try {
			rs.updateReport(rd);
			session.setAttribute("message", "신고가 성공적으로 수정되었습니다.");
		} catch (PersistenceException pe) {
			pe.printStackTrace();
			session.setAttribute("message", "신고 수정에 실패하셨습니다.");
		}
		return "redirect:report_detail.do?rep_num=" + rd.getRep_num();
	}
	
	
}
