package com.store.meonggae.mng.report.service;

import java.sql.Date;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.mng.report.dao.MngReportDAO;
import com.store.meonggae.mng.report.domain.MngReportDomain;
import com.store.meonggae.mng.search.vo.SearchVO;


@Service
public class MngReportService {
	 
	@Autowired(required = false)
	private MngReportDAO  mrDAO;
	
	public List<MngReportDomain> searchReport(SearchVO sVO){
		List<MngReportDomain> list=null;
		try {
			
			list=mrDAO.selectReport(sVO);//시작번호와 끝번호 사이의 글 조회
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return list;
	}//searchReport
	
//	  public int getTotalCounts(SearchVO sVO) {
//		  
//		    int totalCount = 0;
//		    try {
//		      totalCount = mrDAO.selectTotalCount(sVO);
//		    } catch (PersistenceException pe) {
//		      pe.printStackTrace();
//		    }
//		    return totalCount;
//		  }
	
	
	public int getTotalCounts(SearchVO sVO) {
	    return mrDAO.getTotalCounts(sVO);
	}
	
	  
	  public MngReportDomain searchDetailReport(String rep_num) {
		  
	        MngReportDomain report = null;
	        try {
	            report = mrDAO.selectDetailReport(rep_num);
	        } catch (PersistenceException pe) {
	            pe.printStackTrace();
	        }
	        return report;
	    }
	
	  public void updateReport(MngReportDomain rd) {
			try {
				mrDAO.updateReport(rd);
			} catch (PersistenceException pe) {
				pe.printStackTrace();
			}
		}
	
	  
	
}
