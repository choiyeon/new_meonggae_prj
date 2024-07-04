package com.store.meonggae.talk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	@GetMapping("/chat.do")
	public String chatFrm() {
		return "meongae_talk/talk_page";
	}
}
