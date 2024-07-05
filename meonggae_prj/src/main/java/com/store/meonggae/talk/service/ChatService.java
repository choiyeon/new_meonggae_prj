package com.store.meonggae.talk.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.talk.dao.ChatDAO;
import com.store.meonggae.talk.domain.ChatGoodsDomain;
import com.store.meonggae.talk.vo.ChatSendVO;

@Service
public class ChatService {
	@Autowired(required = false)
	private ChatDAO cDAO;
	
	// 상품 상세 페이지에서 판매자에게 구매를 처음 시작하는 채팅 보내기
	public int addChat(ChatSendVO chatSendVO) {
		
		int cnt = 0;
		ChatGoodsDomain cgDomain = null;

		try {
			cgDomain = cDAO.selectMemNumSellByGoodsNum(chatSendVO.getGoodsNum());
			chatSendVO.setMemNumRecv(cgDomain.getMemNumSell());
			chatSendVO.setContent(cgDomain.getTitle() + chatSendVO.getContent());
			cnt = cDAO.insertChat(chatSendVO);
		} catch(PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
		
		return cnt;
	} // addChat
}
