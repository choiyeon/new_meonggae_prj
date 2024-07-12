package com.store.meonggae.mng.dao;

import java.io.IOException;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

@Component
public class MyBatisDAO2 {

	
    private static SqlSessionFactory ssf;//singleton 사용권장 => 비용절감, 일관성유지, 관리용이

  
	/**  
	SqlSessionFactory는 비용절감, 일관성 유지, 관리의 용이성을 위해서 Singleton Pattern으로 사용.
	@return SqlSessionFactory
	 */
	static { //static 영역 : 호출하지 않고 클래스가 생성되면 자동호출 되는 영역.
	    org.apache.ibatis.logging.LogFactory.useLog4J2Logging();
	
	    if(ssf ==null) {
	        try {
	            //1. 설정파일과 연결
	            Reader reader=Resources.getResourceAsReader("com/store/meonggae/mng/dao/mng-mybatis-config.xml");
	            //2. MyBatis Framework 생성
	            ssf=new SqlSessionFactoryBuilder().build( reader );
	            //3. 스트림 닫기
	            if( reader != null ) { reader.close(); }//end if
	
	        } catch (IOException e) {
	            e.printStackTrace();
	        }//end catch
	    }//end if
	}//static 영역

	public SqlSession getMyBatisHandler(boolean autoCommit) {
	    return ssf.openSession( autoCommit );     
	
	}//getMyBatisHandler
	
	public void closeHandler(SqlSession ss) {
	    if(ss != null) { ss.close(); } // end if} // closeHandler
	}
	
}//class