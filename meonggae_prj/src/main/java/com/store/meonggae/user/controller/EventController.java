package com.store.meonggae.user.controller;

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

    //이벤트 메인 페이지 이동
    @GetMapping("/event_page/event_main.do")
    public String eventMain(Model model, 
    						@RequestParam(name = "event-type", required = false) String eventType,
                            @RequestParam(name = "currentPage", defaultValue = "1") int currentPage, 
                            @RequestParam(name = "keyword", required = false) String keyword, 
                            @RequestParam(name = "field", required = false) String field) {
    	PagingVO pVO = eventService.createPagingVO(keyword, field, currentPage);
    	if("진행중".equals(eventType)) {
    		pVO.setEventStatus("1");
    	}else if("종료".equals(eventType)) {
    		pVO.setEventStatus("2");
    	}
    	System.out.println("pVO : " + pVO);
        List<EventDomain> eventList = eventService.selectEvent(pVO);
        System.out.println("eventMain eventList : " + eventList);
        
        String param = "";
        if( keyword != null && field != null ) {
        	param = "&keyword="+keyword+"&field="+field;
        }

        model.addAttribute("eventList", eventList);
        model.addAttribute("totalCnt", pVO.getTotalCount());
        model.addAttribute("pageScale", pVO.getPageScale());
        model.addAttribute("currentPage", pVO.getCurrentPage());
        model.addAttribute("totalPage", (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()));
        model.addAttribute("paging", eventService.pageNation("http://localhost//meonggae_prj/event_page/event_main.do", param, (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()), pVO.getCurrentPage()));
        
        
        return "event_page/event_main";
    }//eventMain

    //이벤트 상세
    @GetMapping("/event_page/event_detail.do")
    public String eventDetail(Model model, @RequestParam("event-code") int eventNum, HttpSession session) {
        // 이벤트 상세 정보를 조회합니다.
        EventDomain eventDetail = eventService.selectDetailEvent(eventNum);
        
       
    	Object cntSession = session.getAttribute("cntFlag");
		boolean cntFlag = false;
		if (cntSession != null) {
			cntFlag = ((String)cntSession).contains(String.valueOf(eventNum));
		}//end if

		if (!cntFlag) {
			eventService.updateCnt(eventNum);
			session.setAttribute("cntFlag", session.getAttribute("cntFlag")+ ","+eventNum);
		}//end if
                
        model.addAttribute("eventDetail", eventDetail);
        model.addAttribute("cnt", eventDetail.getCnt());
        return "event_page/event_detail";
    }//eventDetail

    //이벤트 핸들러 - 페이지네이션
    @GetMapping("/event_page/event_handler.do")
    public String eventHandler(Model model, 
    		@RequestParam(name = "event-type", required = true) String eventType,
    		@RequestParam(name = "currentPage", defaultValue = "1") int currentPage, 
            @RequestParam(name = "keyword", required = false) String keyword, 
            @RequestParam(name = "field", required = false) String field) {
    	System.out.println("[handler] eventType : " + eventType + " / currentPage : " +currentPage + " / keyword : " + keyword + " / field : " +  field);
    	PagingVO pVO = eventService.createPagingVO(keyword, field, currentPage);
    	if("진행중".equals(eventType)) {
    		pVO.setEventStatus("1");
    	}else if("종료".equals(eventType)) {
    		pVO.setEventStatus("2");
    	}
    	System.out.println("pVO : " + pVO);
    	List<EventDomain> eventList = eventService.selectEvent(pVO);
    	System.out.println("eventList : " + eventList);
    	
    	model.addAttribute("eventList", eventList);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("pageScale", pVO.getPageScale());
    	model.addAttribute("eventType", eventType);
    	model.addAttribute("totalPage", (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()));
    	model.addAttribute("paging", eventService.pageNation("http://localhost//meonggae_prj/event_page/event_main.do", "", (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()), pVO.getCurrentPage()));
    	
    	return "event_page/event_handler";
    }//eventHandler
    
    //이벤트 핸들러 - 페이지네이션
    @GetMapping("/event_page/onGO.do")
    public String onGoing(Model model, 
    		@RequestParam(name = "event-type", required = true) String eventType,
    		@RequestParam(name = "currentPage", defaultValue = "1") int currentPage, 
    		@RequestParam(name = "keyword", required = false) String keyword, 
    		@RequestParam(name = "field", required = false) String field) {
    	System.out.println("[onGoing] eventType : " + eventType + " / currentPage : " +currentPage + " / keyword : " + keyword + " / field : " +  field);
    	PagingVO pVO = eventService.createPagingVO(keyword, field, currentPage);
    	if("진행중".equals(eventType)) {
    		pVO.setEventStatus("1");
    	}else if("종료".equals(eventType)) {
    		pVO.setEventStatus("2");
    	}
    	System.out.println("onGoing pVO : " + pVO);
    	List<EventDomain> eventList = eventService.selectEvent(pVO);
    	System.out.println("onGoing eventList : " + eventList);
    	
    	model.addAttribute("eventList", eventList);
    	model.addAttribute("currentPage", currentPage);
    	model.addAttribute("pageScale", pVO.getPageScale());
    	model.addAttribute("eventType", eventType);
    	model.addAttribute("totalPage", (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()));
    	model.addAttribute("paging", eventService.pageNation("http://localhost//meonggae_prj/event_page/event_main.do", "", (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()), pVO.getCurrentPage()));
    	
    	return "event_page/on_going_content";
    }//onGoing
}//class