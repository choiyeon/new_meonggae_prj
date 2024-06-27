package com.store.meonggae.user.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.meonggae.event.service.EventService;
import com.store.meonggae.event.domain.EventDomain;
import com.store.meonggae.event.vo.PagingVO;

@Controller
public class EventController {

    @Autowired
    private EventService eventService;

    @GetMapping("/event_page/event_main.do")
    public String eventMain(Model model, 
                            @RequestParam(defaultValue = "1") int currentPage, 
                            @RequestParam(required = false) String keyword, 
                            @RequestParam(required = false) String field) {
        PagingVO pVO = eventService.createPagingVO(keyword, field, currentPage);

        List<EventDomain> eventList = eventService.selectEvent(pVO);
        

        model.addAttribute("eventList", eventList);
        model.addAttribute("totalCnt", pVO.getTotalCount());
        model.addAttribute("pageScale", pVO.getPageScale());
        model.addAttribute("currentPage", pVO.getCurrentPage());
        model.addAttribute("totalPage", (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()));
        model.addAttribute("paging", eventService.pageNation("http://localhost//meonggae_prj/event_page/event_main.do", "", (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()), pVO.getCurrentPage()));
        
        
        return "event_page/event_main";
    }

    @GetMapping("/event_page/event_detail.do")
    public String eventDetail(Model model, @RequestParam("event-code") int eventNum, HttpSession session) {
        // 이벤트 상세 정보를 조회합니다.
        EventDomain eventDetail = eventService.selectDetailEvent(eventNum);
        
       
    	Object cntSession = session.getAttribute("cntFlag");
		boolean cntFlag = false;
		if (cntSession != null) {
			cntFlag = ((String)cntSession).contains(String.valueOf(eventNum));
		}

		if (!cntFlag) {
			eventService.updateCnt(eventNum);
			session.setAttribute("cntFlag", session.getAttribute("cntFlag")+ ","+eventNum);
		}
                
        model.addAttribute("eventDetail", eventDetail);
        model.addAttribute("cnt", eventDetail.getCnt());
        return "event_page/event_detail";
    }

    @GetMapping("/event_page/event_handler.do")
    public String eventHandler(Model model, 
    		@RequestParam("event-type") String eventType,
    		@RequestParam(defaultValue = "1") int currentPage, 
            @RequestParam(required = false) String keyword, 
            @RequestParam(required = false) String field ) {
    	PagingVO pVO = eventService.createPagingVO(keyword, field, currentPage);
    	List<EventDomain> eventList = eventService.selectEvent(pVO);
    	
    	List<EventDomain> filterByEndDate = new ArrayList<EventDomain>();
    	
    	LocalDate currentDate = LocalDate.now();
    	
    	for(EventDomain ed : eventList) {
    		LocalDate endDate = LocalDate.parse(ed.getEnd_date(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    		if(endDate.isAfter(currentDate)) {
    			filterByEndDate.add(ed);
    		}
    	}
    	
    	model.addAttribute("eventList", filterByEndDate);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("pageScale", pVO.getPageScale());
    	model.addAttribute("eventType", eventType);
    	model.addAttribute("totalPage", (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()));
    	model.addAttribute("paging", eventService.pageNation("http://localhost//meonggae_prj/event_page/event_main.do", "", (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()), pVO.getCurrentPage()));
    	
    	return "event_page/event_handler";
    }
}


/*
 * @Controller public class EventController {
 * 
 * @GetMapping("/event_page/event_main.do") public String event() { return
 * "event_page/event_main"; }
 * 
 * @GetMapping("/event_page/event_handler.do") public String eventHandler() {
 * return "/event_page/event_handler"; }
 * 
 * @GetMapping("/event_page/event_detail.do") public String eventDetail() {
 * return "/event_page/event_detail"; }
 * 
 * }
 */