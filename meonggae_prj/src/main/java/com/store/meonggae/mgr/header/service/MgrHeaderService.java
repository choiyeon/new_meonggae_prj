package com.store.meonggae.mgr.header.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.store.meonggae.mgr.dao.MgrHeaderDAO;
import com.store.meonggae.mgr.header.domain.MgrNoticeDomain;
import com.store.meonggae.mgr.header.vo.MgrNoticeVO;

@Service
public class MgrHeaderService {
	@Autowired(required = false)
	private MgrHeaderDAO mhDAO;
	
	// 관리자가 안 읽은 알림이 존재하는지 조회
	@SuppressWarnings("unchecked")
	public String searchOneIsNotice(String managerId) {
		boolean flagNotice = false;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("dataSize", 0);
		jsonObj.put("date", sdf.format(new Date()));
		jsonObj.put("data", "");
		
		try {
			flagNotice = mhDAO.selectOneIsNotice(managerId); 
			JSONObject jsonTemp = new JSONObject();
			jsonTemp.put("flagNotice", flagNotice);
			
			jsonObj.put("dataSize", 1);
			jsonObj.put("data", jsonTemp);
			jsonObj.put("result", true);
			
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return jsonObj.toJSONString();
		
	} // searchOneIsNotice
	
	// 관리자의 알림 리스트
	@SuppressWarnings("unchecked")
	public String searchListNotice(String managerId) {
		List<MgrNoticeDomain> list = null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("dataSize", 0);
		jsonObj.put("date", sdf.format(new Date()));
		jsonObj.put("data", "");
		
		try {
			list = mhDAO.selectListNotice(managerId); 
			ObjectMapper objMapper = new ObjectMapper();
			jsonObj.put("dataSize", list.size());
			jsonObj.put("data", objMapper.writeValueAsString(list));
			jsonObj.put("result", true);
			
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} catch (JsonProcessingException jpe) {
			jpe.printStackTrace();
		} // end catch
		
		return jsonObj.toJSONString();
	} // searchListNotice
	
	// 관리자의 알림 모두 읽음
	@SuppressWarnings("unchecked")
	public String updateAllNoticeRead(String managerId) {
		int cnt = 0; 
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("dataSize", 0);
		jsonObj.put("date", sdf.format(new Date()));
		jsonObj.put("data", "");
		
		try {
			cnt = mhDAO.updateAllInquiryNoticeRead(managerId);
			cnt += mhDAO.updateAllReportNoticeRead(managerId);
			JSONObject jsonTemp = new JSONObject();
			jsonTemp.put("cnt", cnt);
			jsonObj.put("dataSize", 1);
			jsonObj.put("data", jsonTemp);
			jsonObj.put("result", true);
			
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return jsonObj.toJSONString();
	} // searchListNotice
	
	// 관리자의 알림 하나 읽음
	@SuppressWarnings("unchecked")
	public String updateOneNoticeRead(MgrNoticeVO noticeVO) {
		int cnt = 0; 
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("dataSize", 0);
		jsonObj.put("date", sdf.format(new Date()));
		jsonObj.put("data", "");
		
		try {
			cnt = mhDAO.updateOneNoticeRead(noticeVO);
			JSONObject jsonTemp = new JSONObject();
			jsonTemp.put("cnt", cnt);
			jsonObj.put("dataSize", 1);
			jsonObj.put("data", jsonTemp);
			jsonObj.put("result", true);
			
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return jsonObj.toJSONString();
	} // searchListNotice
} // class
