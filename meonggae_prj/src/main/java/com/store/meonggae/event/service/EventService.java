package com.store.meonggae.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.event.dao.UserEventDAO;
import com.store.meonggae.event.domain.EventDomain;
import com.store.meonggae.event.vo.PagingVO;

@Service
public class EventService {

    @Autowired
    private UserEventDAO eventDAO;

    //이벤트 총 개수
    public int totalCount(PagingVO pVO) {
        return eventDAO.selectTotalCount(pVO);
    }

    //이벤트 목록
    public List<EventDomain> selectEvent(PagingVO pVO) {
        return eventDAO.selectEvent(pVO);
    }

    //이벤트 상세
    public EventDomain selectDetailEvent(int eventNum) {
        return eventDAO.selectDetailEvent(eventNum);
    }
    
    //조회수 올리기
    public int updateCnt(int eventNum) {
    	return eventDAO.updateCnt(eventNum);
    }
    
    //이벤트 캐러셀
    public List<EventDomain> eventCarousel() {
    	return eventDAO.eventCarousel();
    }

    //페이지 스케일(페이지당 이벤트 개수)
    public int pageScale() {
        return 4; // 페이지당 항목 수
    }

    //페이지 네이션
    public String pageNation(String url, String param, int totalPage, int currentPage) {
        StringBuilder pageNation = new StringBuilder();

        int pageNumber = 3;
        int startPage = ((currentPage - 1) / pageNumber) * pageNumber + 1;
        int endPage = startPage + pageNumber - 1;

        if (totalPage <= endPage) {
            endPage = totalPage;
        }

        if (totalPage > 0) {
            pageNation.append("<a href='").append(url).append("?currentPage=1").append(param)
                .append("'><input type='button' class='btn btn-sm btn-light marginL' style='margin:0px auto;' value='처음 페이지'/></a>&nbsp;&nbsp;&nbsp;");
        }

        if (currentPage > pageNumber) {
            int movePage = startPage - 1;
            pageNation.append("<a href='").append(url).append("?currentPage=").append(movePage).append(param)
                .append("'><input type='button' class='btn btn-sm btn-light marginL' value='&lt;&lt;'/></a>&nbsp;&nbsp;&nbsp;");
        }

        for (int i = startPage; i <= endPage; i++) {
            if (i == currentPage) {
                pageNation.append("<input type='button' class='btn btn-sm btn-secondary marginL' value='").append(i).append("'/>&nbsp");
            } else {
                pageNation.append("<a href='").append(url).append("?currentPage=").append(i).append(param)
                    .append("'><input type='button' class='btn btn-sm btn-light marginL' value='").append(i).append("'/></a>&nbsp");
            }
        }

        if (totalPage > endPage) {
            int movePage = endPage + 1;
            pageNation.append("&nbsp;&nbsp;&nbsp;<a href='").append(url).append("?currentPage=").append(movePage).append(param)
                .append("'><input type='button' class='btn btn-sm btn-light marginL' value='&gt;&gt;'/></a>");
        }

        if (totalPage > 0) {
            pageNation.append("&nbsp;&nbsp;&nbsp;<a href='").append(url).append("?currentPage=").append(totalPage).append(param)
                .append("'><input type='button' class='btn btn-sm btn-light marginL' style='margin:0px auto;' value='마지막 페이지'/></a>");
        }

        return pageNation.toString();
    }

    public PagingVO createPagingVO(String keyword, String field, int currentPage, String eventType) {
        PagingVO pVO = new PagingVO();
        pVO.setKeyword(keyword);
        pVO.setField(field);
        pVO.setCurrentPage(currentPage);
        
        if("진행중".equals(eventType)) {
    		pVO.setEventStatus("진행");
    	}else if("종료".equals(eventType)) {
    		pVO.setEventStatus("종료");
    	}
        
        pVO.setPageScale(pageScale());

        int totalCnt = totalCount(pVO);
        pVO.setTotalCount(totalCnt);

        pVO.calculatePageNumbers();
        return pVO;
    }
}