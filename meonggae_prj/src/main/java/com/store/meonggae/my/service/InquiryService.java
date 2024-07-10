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
import com.store.meonggae.my.domain.InquiryModifyDomain;
import com.store.meonggae.my.pagination.PaginationUtil;
import com.store.meonggae.my.pagination.SearchVO;
import com.store.meonggae.my.vo.InquiryModifyVO;
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
	public List<InquiryDomain> searchInquiryList(String memnum, int currentPage){
		List<InquiryDomain> list = null;
		
		try {
			SearchVO sVO = PaginationUtil.getInstance().startNum(memnum, currentPage, 10);
			list = iDAO.selectInquiryList(sVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;
	}//searchInquiryList
	
	/**
	 * 문의 count
	 */
	public int searchCount(String memnum){
		int cnt = 0;
		
		try {
			cnt = iDAO.selectCount(memnum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//searchCount
	
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
	
	/**
	 * 문의 수정 글불러오기 select
	 */
	public InquiryModifyDomain searchInquiryForUpdate(String inquiryNum) {
		InquiryModifyDomain imDomain = null;
		
		try {
			imDomain = iDAO.selectInquiryForUpdate(inquiryNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return imDomain;
	}//searchInquiryForUpdate
	
	/**
	 * 문의 수정 update process
	 */
	public int updateInquiry(InquiryModifyVO inVO) {
		int cnt = 0;
		
		try {
			cnt = iDAO.updateInquiry(inVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//updateInquiry
	
	/**
	 * 문의 삭제
	 */
	public int deleteInquiry(String inquiryNum) {
		int cnt = 0;
		
		try {
			cnt = iDAO.deleteInquiry(inquiryNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//deleteInquiry
	
	/**
	 * 삭제 flag 조회
	 */
	public String searchDeleteFlag(String inquiryNum) {
		String result = "";
		
		try {
			result = iDAO.selectFlag(inquiryNum);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return result;
	}//searchDeleteFlag
	
}//class