package com.store.meonggae.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
    						@RequestParam(name = "event-type", required = true, defaultValue = "진행중") String eventType,
                            @RequestParam(name = "currentPage", defaultValue = "1") int currentPage, 
                            @RequestParam(name = "keyword", required = false) String keyword, 
                            @RequestParam(name = "field", required = false) String field,
                            HttpServletRequest request) {
    	PagingVO pVO = eventService.createPagingVO(keyword, field, currentPage, eventType);
    	
        
        String param = "";
        if( keyword != null && field != null ) {
        	param += "&keyword="+keyword+"&field="+field;
        }
        if( eventType != null ) {
        	param += "&event-type="+eventType;
        }
        List<EventDomain> eventList = eventService.selectEvent(pVO);

        String contextPath = request.getContextPath();
        String url = contextPath + "/event_page/event_main.do";
        
        model.addAttribute("eventList", eventList);
        model.addAttribute("totalCnt", pVO.getTotalCount());
        model.addAttribute("pageScale", pVO.getPageScale());
        model.addAttribute("currentPage", pVO.getCurrentPage());
        model.addAttribute("totalPage", (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()));
        model.addAttribute("paging", eventService.pageNation(url, param, (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()), pVO.getCurrentPage()));
        
        
        return "event_page/event_main";
    }//eventMain

    //이벤트 핸들러 - 페이지네이션
    @GetMapping("/event_page/event_handler.do")
    public String eventHandler(Model model, 
    		@RequestParam(name = "event-type", required = true) String eventType,
    		@RequestParam(name = "currentPage", defaultValue = "1") int currentPage, 
    		@RequestParam(name = "keyword", required = false) String keyword, 
    		@RequestParam(name = "field", required = false) String field,
    		HttpServletRequest request) {
    	PagingVO pVO = eventService.createPagingVO(keyword, field, currentPage, eventType);
    	
    	String param = "&event-type="+eventType;
        if( keyword != null && field != null ) {
        	param += "&keyword="+keyword+"&field="+field;
        }
    	
    	List<EventDomain> eventList = eventService.selectEvent(pVO);
    	
    	String contextPath = request.getContextPath();
        String url = contextPath + "/event_page/event_main.do";
    	
    	model.addAttribute("eventList", eventList);
    	model.addAttribute("currentPage", currentPage);
    	model.addAttribute("pageScale", pVO.getPageScale());
    	model.addAttribute("eventType", eventType);
    	model.addAttribute("totalPage", (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()));
    	model.addAttribute("paging", eventService.pageNation(url, param, (int) Math.ceil((double) pVO.getTotalCount() / pVO.getPageScale()), pVO.getCurrentPage()));
    	
    	return "event_page/event_handler";
    }//eventHandler
    
    //이벤트 상세
    @GetMapping("/event_page/event_detail.do")
    public String eventDetail(Model model, @RequestParam("event-code") String eventNumStr, HttpSession session) {
    	int eventNum = Integer.parseInt(eventNumStr);
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

    
}//class