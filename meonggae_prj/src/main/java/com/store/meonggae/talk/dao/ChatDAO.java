package com.store.meonggae.talk.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.talk.domain.ChatGoodsDomain;
import com.store.meonggae.talk.vo.ChatSendVO;

@Repository
public class ChatDAO {
	
	@Autowired(required = false)
	private MybatisDAO mbDAO;
	
	// 상품 번호에 해당하는 판매자 번호 조회
	public ChatGoodsDomain selectMemNumSellByGoodsNum(String goodsNum) {
		ChatGoodsDomain cgDomain = null;
		SqlSession ss = mbDAO.getMyBatisHandler(false);
		cgDomain = ss.selectOne("com.store.meonggae.chat.selectMemNumSellByGoodsNum", goodsNum);
		
		mbDAO.CloseHandler(ss);
		
		return cgDomain;
	} // selectMemNumSellByGoodsNum
	
	// 상품 상세 페이지에서 판매자에게 구매를 처음 시작하는 채팅 보내기
	public int insertChat(ChatSendVO chatSendVO) {
		int cnt = 0;
		SqlSession ss = mbDAO.getMyBatisHandler(true);
		cnt = ss.insert("com.store.meonggae.chat.insertChat", chatSendVO);
		
		mbDAO.CloseHandler(ss);
		
		return cnt;
	} // insertChat
}
