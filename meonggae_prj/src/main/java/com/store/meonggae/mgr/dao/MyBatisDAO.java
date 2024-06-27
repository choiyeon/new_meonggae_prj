package com.store.meonggae.mgr.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

@Component
public class MyBatisDAO {
	private static SqlSessionFactory ssf;	// singleton 사용 권장 => 비용 절감, 일관성 유지, 관리 용이
	
	static {
		org.apache.ibatis.logging.LogFactory.useLog4J2Logging();
		if(ssf == null) {
			try {
				// 1. 설정 파일과 연결 (stream)
				Reader reader = Resources.getResourceAsReader("com/store/meonggae/mgr/dao/mgr-mybatis-config.xml");
				
				// 2. MyBatis Framework 생성
				ssf = new SqlSessionFactoryBuilder().build(reader);
				
				// 3. stream 닫기
				if(reader != null) {reader.close(); }	// end if
				
			} catch (IOException e) {
				e.printStackTrace();
			} // end catch
		} // end if
	} // getSessionFactory
	
	public SqlSession getMyBatisHandler(boolean autoCommit) {
		return ssf.openSession(autoCommit);
	} // getMyBatisHandler
	
	public void closeHandler(SqlSession ss) {
		if(ss != null) { ss.close(); } // end if
	} // closeHandler
} // class
