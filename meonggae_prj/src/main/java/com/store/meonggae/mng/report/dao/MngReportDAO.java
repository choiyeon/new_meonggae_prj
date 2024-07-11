package com.store.meonggae.mng.report.dao;

import java.util.List;


import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.mng.dao.MyBatisDAO2;
import com.store.meonggae.mng.report.domain.MngReportDomain;
import com.store.meonggae.mng.search.vo.SearchVO;


@Component
public class MngReportDAO {

	@Autowired(required = false)
	private MyBatisDAO2 mbDAO; 
	
	public List<MngReportDomain> selectReport( SearchVO sVO)throws PersistenceException {
		
		List<MngReportDomain> list=null;
		SqlSession ss=mbDAO.getMyBatisHandler(false);
		System.out.println("-----------"+ list);
		list=ss.selectList("kr.co.sist.report.selectReportList", sVO);
		mbDAO.closeHandler(ss);
		return list;
	}
	
//	 public int selectTotalCount(SearchVO sVO) throws PersistenceException {
//		 
//	        int totalCount = 0;
//	        SqlSession ss = mbDAO.getMyBatisHandler(false);
//	        totalCount = ss.selectOne("kr.co.sist.report.selectTotalCount", sVO);
//	        mbDAO.closeHandler(ss);
//	        return totalCount;
//	    }
	
	public int getTotalCounts(SearchVO sVO) throws PersistenceException {
	    SqlSession ss = mbDAO.getMyBatisHandler(false);
	    int totalRecords = ss.selectOne("kr.co.sist.report.getTotalCounts", sVO);
	    mbDAO.closeHandler(ss);
	    return totalRecords;
	}
	 
	 public MngReportDomain selectDetailReport(String rep_num) throws PersistenceException {
		 
		    MngReportDomain report = null;
		    SqlSession ss = mbDAO.getMyBatisHandler(false);
		    report = ss.selectOne("kr.co.sist.report.selectDetailReport", rep_num);
		    mbDAO.closeHandler(ss);
		    return report;
		}

	 
	 public void updateReport(MngReportDomain rd) throws PersistenceException {
	        SqlSession ss = mbDAO.getMyBatisHandler(true);
	        try {
	        	System.out.println(rd);
	            ss.update("kr.co.sist.report.updateReport", rd);
	        
	        } catch (PersistenceException pe) {
	         System.out.println(pe);
	           
	        } finally {
	            mbDAO.closeHandler(ss);
	        }
	    }
	 
	   
	
}
  