package com.store.meonggae.mng.event.controller;

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

import com.store.meonggae.mng.event.domain.MngEventDomain;
import com.store.meonggae.mng.event.service.MngEventService;
import com.store.meonggae.mng.report.domain.MngReportDomain;
import com.store.meonggae.mng.report.service.MngReportService;
import com.store.meonggae.mng.search.vo.SearchVO;


@Controller
public class MngEventController {

	@Autowired(required = false)
	private MngEventService es;
	

	@GetMapping("mng/event/event_result.do")
	public String searchReport(
	        @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
	        SearchVO sVO, Model model) {

	    // 한 페이지에 표시할 항목 수 고정
	    int pageSize = 4;

	    // 현재 페이지와 페이지당 항목 수를 기반으로 시작 번호와 끝 번호 계산
	    int startNum = (currentPage - 1) * pageSize + 1;
	    int endNum = currentPage * pageSize;

	    sVO.setStartNum(startNum);
	    sVO.setEndNum(endNum);
	    System.out.println("-------------------------------------" + sVO);

	    List<MngEventDomain> list = es.searchEvent(sVO);

	    // 총 게시글 수 가져오기 (예: DB에서 조회)
	    int totalRecords = es.getTotalCounts(sVO);

	    // 총 페이지 수 계산
	    int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

	    model.addAttribute("listEvent", list);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalRecords", totalRecords);

	    return "mng/event/event_result";
	}


	@GetMapping("mng/event/event_detail.do")
    public String searchDetailEvent(HttpServletRequest request, Model model) {
        String eventNum = request.getParameter("event_num");
        MngEventDomain ed = es.searchDetailEvent(eventNum);

        model.addAttribute("ed", ed);

        return "mng/event/event_detail";	
    }


	@PostMapping("mng/event/updateEvent.do")
	public String updateEvent(MngEventDomain ed, HttpSession session) {
		try {
			es.updateEvent(ed);
			session.setAttribute("message", "이벤트가 성공적으로 수정되었습니다.");
		} catch (PersistenceException pe) {
			pe.printStackTrace();
			session.setAttribute("message", "이벤트 수정에 실패하셨습니다.");
		}
		return "redirect:event_detail.do?event_num=" + ed.getEvent_num();
	}
	
	
}
