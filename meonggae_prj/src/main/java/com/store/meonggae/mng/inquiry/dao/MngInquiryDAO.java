package com.store.meonggae.mng.inquiry.dao;

import java.util.List;


import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.mng.dao.MyBatisDAO2;
import com.store.meonggae.mng.inquiry.domain.MngInquiryDomain;
import com.store.meonggae.mng.search.vo.SearchVO;


@Component
public class MngInquiryDAO { 

	@Autowired(required = false)
	private MyBatisDAO2 mbDAO;
	
	public List<MngInquiryDomain> selectInquiry( SearchVO sVO)throws PersistenceException {
	
		List<MngInquiryDomain> list=null;
		SqlSession ss=mbDAO.getMyBatisHandler(false);
		System.out.println("-----------"+ list);
		list=ss.selectList("kr.co.sist.inquiry.selectInquiryList", sVO);
		mbDAO.closeHandler(ss);
		return list;
	}
	
//	 public int selectTotalCount(SearchVO sVO) throws PersistenceException {
//		 
//	        int totalCount = 0;
//	        SqlSession ss = mbDAO.getMyBatisHandler(false);
//	        totalCount = ss.selectOne("kr.co.sist.inquiry.selectTotalCount", sVO);
//	        mbDAO.closeHandler(ss);
//	        return totalCount;
//	    }
	
	public int getTotalCounts(SearchVO sVO) throws PersistenceException {
	    SqlSession ss = mbDAO.getMyBatisHandler(false);
	    int totalRecords = ss.selectOne("kr.co.sist.inquiry.getTotalCounts", sVO);
	    mbDAO.closeHandler(ss);
	    return totalRecords;
	}
	 
	 public MngInquiryDomain selectDetailInquiry(String inquiry_num) throws PersistenceException {
		 
		    MngInquiryDomain inquiry = null;
		    SqlSession ss = mbDAO.getMyBatisHandler(false);
		    inquiry = ss.selectOne("kr.co.sist.inquiry.selectDetailInquiry", inquiry_num);
		    mbDAO.closeHandler(ss);
		    return inquiry;
		}

	 
	 public void updateInquiry(MngInquiryDomain id) throws PersistenceException {
	        SqlSession ss = mbDAO.getMyBatisHandler(true);
	        try {
	        	
	            ss.update("kr.co.sist.inquiry.updateInquiry", id);
	           
	        } catch (PersistenceException pe) {
	        
	        	 
	        } finally {
	            mbDAO.closeHandler(ss);
	        }
	    }
	 
	    public void deleteInquiry(MngInquiryDomain id) throws PersistenceException {
	        SqlSession ss = mbDAO.getMyBatisHandler(true);
	        try {
	        
	        	ss.update("kr.co.sist.inquiry.updateDeleteFlag", id);
	          
	        } catch (PersistenceException pe) {
	        
	            
	        } finally {
	            mbDAO.closeHandler(ss);
	        }
	    }
	
}
