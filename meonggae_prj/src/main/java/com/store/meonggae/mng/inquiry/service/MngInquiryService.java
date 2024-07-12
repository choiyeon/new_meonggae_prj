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
	private MngInquiryDAO  miDAO;
	
	public List<MngInquiryDomain> searchInquiry(SearchVO sVO){
		List<MngInquiryDomain> list=null;
		try {
			
			list=miDAO.selectInquiry(sVO);//시작번호와 끝번호 사이의 글 조회
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return list;
	}//searchInquiry
	
//	  public int getTotalCounts(SearchVO sVO) {
//		  
//		    int totalCount = 0;
//		    try {
//		      totalCount = miDAO.getTotalCounts(sVO);
//		    } catch (PersistenceException pe) {
//		      pe.printStackTrace();
//		    }
//		    return totalCount;
//		  }
	
	
	public int getTotalCounts(SearchVO sVO) {
	    return miDAO.getTotalCounts(sVO);
	}
	
	public String removeTag(String content) {
		String contentNoTag = content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");		
		return contentNoTag;
	} // removeTag
	
	  
	  public MngInquiryDomain searchDetailInquiry(String inquiry_num) {
		  
	        MngInquiryDomain inquiry = null;
	        try {
	            inquiry = miDAO.selectDetailInquiry(inquiry_num);
	            //inquiry.setContents(removeTag(inquiry.getContents()));
	        } catch (PersistenceException pe) {
	            pe.printStackTrace();
	        }
	        return inquiry;
	    }
	
	  public void updateInquiry(MngInquiryDomain id) {
			try {
				miDAO.updateInquiry(id);
			} catch (PersistenceException pe) {
				pe.printStackTrace();
			}
		}
	
	
	    public void deleteInquiry(MngInquiryDomain id) {
	        try {
	            miDAO.deleteInquiry(id);
	        } catch (PersistenceException pe) {
	            pe.printStackTrace();
	        }
	    }
	
}
