package com.store.meonggae.event.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.event.domain.EventDomain;
import com.store.meonggae.event.vo.PagingVO;


@Component
public class UserEventDAO {

	@Autowired
	private MybatisDAO mbDAO;

	public int selectTotalCount(PagingVO pVO) throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectOne("com.store.meonggae.event.selectTotalCount", pVO);
		}
	}

	public List<EventDomain> selectEvent(PagingVO pVO) throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectList("com.store.meonggae.event.selectEventList", pVO);
		}
	}

	public EventDomain selectDetailEvent(int eventNum) throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectOne("com.store.meonggae.event.selectDetailEvent", eventNum);
		}
	}
	
	public int updateCnt(int eventNum) throws PersistenceException {
	    try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
	        return ss.update("com.store.meonggae.event.updateCnt", eventNum);
	    }
	}

}

/*
 * @Component public class UserEventDAO {
 * 
 * @Autowired(required = false) private MybatisDAO mbDAO;
 * 
 * private static UserEventDAO ueDAO;
 * 
 * private String[] columNames;
 * 
 * private UserEventDAO() { columNames = new String[] {"title", "content",
 * "input_date"}; }
 * 
 * public static UserEventDAO getInstance() { if(ueDAO == null) { ueDAO = new
 * UserEventDAO(); }//end if return ueDAO; }//getInstance
 * 
 * public int selectTotalCount(PagingVO pVO) throws PersistenceException{ int
 * totalCnt = 0; MybatisDAO mbDAO = MybatisDAO.getInstance(); SqlSession ss =
 * mbDAO.getMyBatisHandler(false);
 * 
 * totalCnt = ss.selectOne("com.store.meonggae.event.selectTotalCount", pVO);
 * 
 * mbDAO.CloseHandler(ss);
 * 
 * return totalCnt; }//selectTotalCount
 * 
 * public List<EventDomain> selectEvent(PagingVO pVO) throws
 * PersistenceException{ List<EventDomain> eventList = null; MybatisDAO mbDAO =
 * MybatisDAO.getInstance(); SqlSession ss = mbDAO.getMyBatisHandler(false);
 * 
 * eventList = ss.selectList("com.store.meonggae.event.selectEventList", pVO);
 * 
 * mbDAO.CloseHandler(ss);
 * 
 * 
 * return eventList; }
 * 
 * public EventDomain selectDetailEvent(int seq) throws PersistenceException{
 * EventDomain ed = null; MybatisDAO mbDAO = MybatisDAO.getInstance();
 * SqlSession ss = mbDAO.getMyBatisHandler(false); ed =
 * ss.selectOne("com.store.meonggae.event.selectDetailEvent", seq);
 * 
 * mbDAO.CloseHandler(ss);
 * 
 * 
 * return ed; }
 * 
 * }
 */