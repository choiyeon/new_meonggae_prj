package com.store.meonggae.my.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.my.domain.GoodsDomain;
import com.store.meonggae.my.domain.InquiryCategoryDomain;
import com.store.meonggae.my.domain.InquiryDetailDomain;
import com.store.meonggae.my.domain.InquiryDomain;
import com.store.meonggae.my.domain.PersonalDomain;
import com.store.meonggae.my.vo.InquiryVO;
import com.store.meonggae.my.vo.PersonalInfoVO;
import com.store.meonggae.my.vo.PwVO;

@Component
public class InquiryDAO {
	
	@Autowired
	private MybatisDAO mbDAO;
	
	/**
	 * 카테고리 검색
	 */
	public List<InquiryCategoryDomain> selectCategory() throws PersistenceException{
		List<InquiryCategoryDomain> list = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.Inquiry.category");
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectCategory
	
	/**
	 * 문의 등록
	 */
	public int insertInquiry(InquiryVO iqVO) throws PersistenceException{
		int cnt = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.insert("com.store.meonggae.Inquiry.insertInquiry", iqVO);
		mbDAO.CloseHandler(ss);
		
		return cnt;
	}//insertInquiry
	
	/**
	 * 문의 리스트 조회
	 */
	public List<InquiryDomain> selectInquiryList(String memnum) throws PersistenceException{
		List<InquiryDomain> list = new ArrayList<InquiryDomain>();
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		list = ss.selectList("com.store.meonggae.Inquiry.selectInquiryList", memnum);
		mbDAO.CloseHandler(ss);
		
		return list;
	}//selectInquiryList
	
	/**
	 * 문의글 상세조회
	 */
	public InquiryDetailDomain selectInquiryOne(String inquiryNum) throws PersistenceException{
		InquiryDetailDomain iDetailDomain = null;
		
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		iDetailDomain = ss.selectOne("com.store.meonggae.Inquiry.selectInquiryOne", inquiryNum);
		mbDAO.CloseHandler(ss);
		
		return iDetailDomain;
	}//selectInquiryOne
	
}//class
