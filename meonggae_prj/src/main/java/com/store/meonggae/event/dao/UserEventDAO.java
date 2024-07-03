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

	//	이벤트 총 개수
	public int selectTotalCount(PagingVO pVO) throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectOne("com.store.meonggae.event.selectTotalCount", pVO);
		}
	}

	//이벤트 리스트
	public List<EventDomain> selectEvent(PagingVO pVO) throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectList("com.store.meonggae.event.selectEventList", pVO);
		}
	}

	//이벤트 상세
	public EventDomain selectDetailEvent(int eventNum) throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectOne("com.store.meonggae.event.selectDetailEvent", eventNum);
		}
	}
	
	//조회수 올리기
	public int updateCnt(int eventNum) throws PersistenceException {
	    try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
	        return ss.update("com.store.meonggae.event.updateCnt", eventNum);
	    }
	}
	
	//이벤트 캐러셀
	public List<EventDomain> eventCarousel() throws PersistenceException {
		try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
			return ss.selectList("com.store.meonggae.event.eventCarousel");
		}
	}

}