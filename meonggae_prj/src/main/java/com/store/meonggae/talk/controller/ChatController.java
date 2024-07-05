package com.store.meonggae.talk.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.store.meonggae.talk.service.ChatService;
import com.store.meonggae.talk.vo.ChatSendVO;

@Controller
public class ChatController {
	
	@Autowired(required = false)
	private ChatService chatService;
	
	@GetMapping("/chat.do")
	public String chatFrm() {
		return "redirect:http://localhost:8080/chat_frm";
		//return "meongae_talk/talk_page";
	} // chatFrm
	
	@GetMapping("/chat_dm.do")
	public String chatDmFrm(ChatSendVO chatSendVO, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		chatSendVO.setContent(referer);
		int cnt = chatService.addChat(chatSendVO);
		
		return "redirect:http://localhost:8080/chat_frm";
		//return "meongae_talk/talk_page";
	} // chatFrm
}
