package com.store.meonggae.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

@Component
public class MybatisDAO {
	
	private static SqlSessionFactory ssf;

	static {
		org.apache.ibatis.logging.LogFactory.useLog4J2Logging();
		if(ssf == null) {
			try {
				//1.설정파일 연결
				Reader reader;
				reader = Resources.getResourceAsReader("com/store/meonggae/dao/mybatis-config.xml");
				//2.MyBatis Framework 생성
				ssf = new SqlSessionFactoryBuilder().build(reader);
				//3.스트림 닫기
				if(reader != null) {
					reader.close();
				}//end if
			} catch (IOException e) {
				e.printStackTrace();
				throw new ExceptionInInitializerError(e);
			}
		}
	}
	
	public SqlSession getMyBatisHandler(boolean autoCommit) {
		if (ssf == null) {
	        throw new NullPointerException("SqlSessionFactory is null");
	    }
		return ssf.openSession(autoCommit);
	}//getMyBatisHandler
	
	public void CloseHandler(SqlSession ss) {
		if(ss != null) {
			ss.close();
		}
	}
}
