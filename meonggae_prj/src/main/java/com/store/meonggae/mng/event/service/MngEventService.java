package com.store.meonggae.mng.event.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.store.meonggae.mng.event.dao.MngEventDAO;
import com.store.meonggae.mng.event.domain.MngEventDomain;
import com.store.meonggae.mng.search.vo.SearchVO;

@Service
public class MngEventService {

    @Autowired
    private MngEventDAO meDAO;
    
	public List<MngEventDomain> searchEvent(SearchVO sVO){
		List<MngEventDomain> list=null;
		try {
			
			list=meDAO.selectEvent(sVO);//시작번호와 끝번호 사이의 글 조회
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return list;
	}//searchReport


	public int getTotalCounts(SearchVO sVO) {
	    return meDAO.getTotalCounts(sVO);
	}
	
	
	  public MngEventDomain searchDetailEvent(String event_num) {
		  
	        MngEventDomain event = null;
	        try {
	            event = meDAO.selectDetailEvent(event_num);
	        } catch (PersistenceException pe) {
	            pe.printStackTrace();
	        }
	        return event;
	    }
	  
	  public void updateEvent(MngEventDomain ed) {
			try {
				meDAO.updateEvent(ed);
			} catch (PersistenceException pe) {
				pe.printStackTrace();
			}
		}
	
  
}