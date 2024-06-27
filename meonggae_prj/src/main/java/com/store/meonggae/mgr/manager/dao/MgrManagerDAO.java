package com.store.meonggae.mgr.manager.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.store.meonggae.mgr.manager.domain.MgrManagerDomain;
import com.store.meonggae.mgr.vo.MgrManagerVO;
import com.store.meonggae.mgr.vo.SearchVO;

@Component
public class MgrManagerDAO {
	
	public int selectManagerCount( SearchVO sVO){
		return 0;
	} // selectManagerCount
	
	public List<MgrManagerDomain> selectListManager( SearchVO sVO ){
		return null;
	} // selectListManager
	
	public MgrManagerDomain selectOneManager(String managerId) {
		
		return null;
	} // selectOneManager
	public void insertManager(MgrManagerVO mmVO) {
		
	} // insertManager
} // class
