package com.store.meonggae.my.service;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.aspectj.lang.annotation.AfterReturning;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.my.dao.InquiryDAO;
import com.store.meonggae.my.domain.InquiryCategoryDomain;
import com.store.meonggae.my.domain.InquiryDetailDomain;
import com.store.meonggae.my.domain.InquiryDomain;
import com.store.meonggae.my.vo.InquiryVO;

@Service
public class InquiryService {
	
	@Autowired
	private InquiryDAO iDAO;
	
	/**
	 * 카테고리 검색
	 */
	public List<InquiryCategoryDomain> searchCategory(){
		List<InquiryCategoryDomain> list = null;
		
		try {
			list = iDAO.selectCategory();
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchCategory
	
	/**
	 * 문의등록
	 */
	public int inputInquiry(InquiryVO iVO) {
		int cnt = 0 ;
		
		try {
			cnt = iDAO.insertInquiry(iVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//inputInquiry
	
	/**
	 * 문의 리스트 조회
	 */
	public List<InquiryDomain> searchInquiryList(String memnum){
		List<InquiryDomain> list = null;
		
		try {
			list = iDAO.selectInquiryList(memnum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchInquiryList
	
	/**
	 * 문의글 상세조회
	 */
	public InquiryDetailDomain searchInquiryOne(String inquiryNum) {
		InquiryDetailDomain iDetailDomain = null;
		
		try {
			iDetailDomain = iDAO.selectInquiryOne(inquiryNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return iDetailDomain;
	}//searchInquiryOne
	
}//class