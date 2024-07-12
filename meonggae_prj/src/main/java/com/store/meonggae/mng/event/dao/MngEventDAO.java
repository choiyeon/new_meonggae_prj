package com.store.meonggae.mng.event.dao;

import java.util.List;


import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.mng.dao.MyBatisDAO2;
import com.store.meonggae.mng.event.domain.MngEventDomain;
import com.store.meonggae.mng.search.vo.SearchVO;


@Component
public class MngEventDAO {

	@Autowired
	private MyBatisDAO2 mbDAO;

	//이벤트 리스트 조회
	public List<MngEventDomain> selectEvent(SearchVO sVO) throws PersistenceException {
		
		List<MngEventDomain> list=null;
		SqlSession ss=mbDAO.getMyBatisHandler(false);
		System.out.println("-----------"+ list);
		list=ss.selectList("kr.co.sist.event.selectEventList", sVO);
		mbDAO.closeHandler(ss);
		return list;
	}
	
	//이벤트 총 개수
	public int getTotalCounts(SearchVO sVO) throws PersistenceException {
	    SqlSession ss = mbDAO.getMyBatisHandler(false);
	    int totalRecords = ss.selectOne("kr.co.sist.event.getTotalCounts", sVO);
	    mbDAO.closeHandler(ss);
	    return totalRecords;
	}

	//이벤트 상세보기
	 public MngEventDomain selectDetailEvent(String event_num) throws PersistenceException {
		 
		    MngEventDomain event = null;
		    SqlSession ss = mbDAO.getMyBatisHandler(false);
		    event = ss.selectOne("kr.co.sist.event.selectDetailEvent", event_num);
		    mbDAO.closeHandler(ss);
		    return event;
		}

	 //이벤트 업데이트
	 public void updateEvent(MngEventDomain ed) throws PersistenceException {
	        SqlSession ss = mbDAO.getMyBatisHandler(true);
	        try {
	        	System.out.println(ed);
	            ss.update("kr.co.sist.event.updateEvent", ed);
	        
	        } catch (PersistenceException pe) {
	         System.out.println(pe);
	           
	        } finally {
	            mbDAO.closeHandler(ss);
	        }
	    }
	 
}