package com.store.meonggae.mgr.dashboard.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.store.meonggae.mgr.dao.MgrDashboardDAO;
import com.store.meonggae.mgr.dashboard.domain.CategoryTopDomain;
import com.store.meonggae.mgr.dashboard.domain.GoodsTradeRatioDomain;
import com.store.meonggae.mgr.dashboard.domain.ReportRecentDomain;
import com.store.meonggae.mgr.dashboard.domain.TopEventDomain;
import com.store.meonggae.mgr.dashboard.domain.UserSummaryDomain;
import com.store.meonggae.mgr.dashboard.domain.VisitorDomain;
import com.store.meonggae.mgr.dashboard.domain.VisitorGraphDomain;
import com.store.meonggae.mgr.dashboard.vo.SelOptionVO;
import com.store.meonggae.mgr.dashboard.vo.VisitorDatepickVO;

@Service
@SuppressWarnings("unchecked")
public class MgrDashboardService {
	
	@Autowired(required=false)
	private MgrDashboardDAO mDashDAO;
	
	// 상위 거래 카테고리
	public String searchCategoryTop(int period) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
		
		JSONObject jsonObj = new JSONObject();
		JSONObject jsonData = new JSONObject();
		JSONObject jsonTemp = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		jsonData.put("totalTradeCnt", 0);
		jsonData.put("graph", jsonArr);
		
		jsonObj.put("result", false);
		jsonObj.put("dataSize", 0);
		jsonObj.put("data", jsonData);
		jsonObj.put("date", sdf.format(new Date()));
		
		CategoryTopDomain cateTopDomain = new CategoryTopDomain();
		List<GoodsTradeRatioDomain> list = null;
		int totalTradeCnt = 0;
		
		try {
			list = mDashDAO.selectListCategoryRatio(period);
			totalTradeCnt = mDashDAO.selectOneCategoryTop(period);
			cateTopDomain.setGraph(list);
			cateTopDomain.setTotalTradeCnt(totalTradeCnt);
			
			jsonData.put("totalTradeCnt", cateTopDomain.getTotalTradeCnt());
			
			for(GoodsTradeRatioDomain gtrd : cateTopDomain.getGraph()) {
				jsonTemp = new JSONObject();
				jsonTemp.put("grade", gtrd.getGrade());
				jsonTemp.put("categoryName", gtrd.getCategoryName());
				jsonTemp.put("tradeCnt", gtrd.getTradeCnt());
				jsonTemp.put("tradePercent", gtrd.getTradePercent());
				jsonArr.add(jsonTemp);
			} // end for
			
			jsonData.put("graph", jsonArr);
			
			jsonObj.put("data", jsonData);
			jsonObj.put("result", true);
			jsonObj.put("dataSize", cateTopDomain.getGraph().size());
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		return jsonObj.toJSONString();
		
	} // searchCategoryTop
	
	// 사용자수 요약
	public String searchUserSummary(int period) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("dataSize", 0);
		jsonObj.put("date", sdf.format(new Date()));
		jsonObj.put("data", "");
		
		List<UserSummaryDomain> list = null;
		SelOptionVO selOptVO = new SelOptionVO();
		selOptVO.setPeriod(period);
		try {
			list = mDashDAO.selectListUserSummary(period);
			for(int i = 0; i < list.size(); i++ ) {
				switch(i) {
				case 0:
					list.get(i).setGraph(mDashDAO.selectListUserTendencyVisitor(period));
					break;
				case 1:
					list.get(i).setGraph(mDashDAO.selectListUserTendencyMember(period));
					break;
				case 2:
					selOptVO.setItem(0);
					list.get(i).setGraph(mDashDAO.selectListUserTendencyJoinWithdraw(selOptVO));
					break;
				case 3:
					selOptVO.setItem(1);
					list.get(i).setGraph(mDashDAO.selectListUserTendencyJoinWithdraw(selOptVO));
					break;
				} // end switch
			} // end for
			
			ObjectMapper objMapper = new ObjectMapper();
			
			jsonObj.put("result", true);
			jsonObj.put("dataSize", list.size());
			jsonObj.put("data", objMapper.writeValueAsString(list));
			
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} catch (JsonProcessingException jpe) {
			jpe.printStackTrace();
		} // end catch
		
		return jsonObj.toJSONString();
	} // searchUserSummary
	
	// 이벤트 조회수 현황
	public String searchTopEvent(int type) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("dataSize", 0);
		jsonObj.put("date", sdf.format(new Date()));
		jsonObj.put("data", "");
		
		List<TopEventDomain> list = null;
		
		try {
			list = mDashDAO.selectListTopEvent(type);
			
			ObjectMapper objMapper = new ObjectMapper();

			jsonObj.put("data", objMapper.writeValueAsString(list));
			jsonObj.put("dataSize", list.size());
			jsonObj.put("result", true);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} catch (JsonProcessingException jpe) {
			jpe.printStackTrace();
		} // catch
		
		return jsonObj.toJSONString();
	} // searchTopEvent
	
	// 신고 현황
	public String searchReportRecent() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("dataSize", 0);
		jsonObj.put("date", sdf.format(new Date()));
		jsonObj.put("data", "");
		
		List<ReportRecentDomain> list = null;
		
		try {
			list = mDashDAO.selectListReportRecent();
			
			ObjectMapper objMapper = new ObjectMapper();

			jsonObj.put("data", objMapper.writeValueAsString(list));
			jsonObj.put("dataSize", list.size());
			jsonObj.put("result", true);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} catch (JsonProcessingException jpe) {
			jpe.printStackTrace();
		} // end catch
		
		return jsonObj.toJSONString();
	} // searchReportRecent
	
	// 사이트 방문자수
	public String searchVisitorStatistics(VisitorDatepickVO visitorDateVO) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("result", false);
		jsonObj.put("dataSize", 0);
		jsonObj.put("date", sdf.format(new Date()));
		jsonObj.put("data", "");
		
		VisitorDomain visitorDomain = null;
		
		try {
			visitorDomain = mDashDAO.selectOneVisitorSummary(visitorDateVO);
			visitorDomain.setGraph(mDashDAO.selectListVisitorGraph(visitorDateVO));
			
			ObjectMapper objMapper = new ObjectMapper();
			
			jsonObj.put("dataSize", 1);
			jsonObj.put("data", objMapper.writeValueAsString(visitorDomain));
			jsonObj.put("result", true);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} catch (JsonProcessingException jpe) {
			jpe.printStackTrace();
		} // end catch
		return jsonObj.toJSONString();
	} // searchVisitorStatistics
	
} // class
