package com.store.meonggae.mng.inquiry.service;

import java.sql.Date;


import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.mng.inquiry.dao.MngInquiryDAO;
import com.store.meonggae.mng.inquiry.domain.MngInquiryDomain;
import com.store.meonggae.mng.search.vo.SearchVO;



@Service
public class MngInquiryService {
	 
	@Autowired(required = false)
	private MngInquiryDAO  tiDAO;
	
	public List<MngInquiryDomain> searchInquiry(SearchVO sVO){
		List<MngInquiryDomain> list=null;
		try {
			
			list=tiDAO.selectInquiry(sVO);//시작번호와 끝번호 사이의 글 조회
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return list;
	}//searchInquiry
	
	  public int getTotalCount(SearchVO sVO) {
		  
		    int totalCount = 0;
		    try {
		      totalCount = tiDAO.selectTotalCount(sVO);
		    } catch (PersistenceException pe) {
		      pe.printStackTrace();
		    }
		    return totalCount;
		  }
	  
	  public MngInquiryDomain searchDetailInquiry(String inquiry_num) {
		  
	        MngInquiryDomain inquiry = null;
	        try {
	            inquiry = tiDAO.selectDetailInquiry(inquiry_num);
	        } catch (PersistenceException pe) {
	            pe.printStackTrace();
	        }
	        return inquiry;
	    }
	
	  public void updateInquiry(MngInquiryDomain id) {
			try {
				tiDAO.updateInquiry(id);
			} catch (PersistenceException pe) {
				pe.printStackTrace();
			}
		}
	
	
	    public void deleteInquiry(MngInquiryDomain id) {
	        try {
	            tiDAO.deleteInquiry(id);
	        } catch (PersistenceException pe) {
	            pe.printStackTrace();
	        }
	    }
	
}
