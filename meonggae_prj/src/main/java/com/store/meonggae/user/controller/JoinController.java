package com.store.meonggae.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.meonggae.user.join.service.JoinService;
import com.store.meonggae.user.join.vo.JoinVO;

@Controller
public class JoinController {

	@Autowired
	private JoinService joinService;

	// 아이디 중복확인
	@GetMapping("/join_page/id_dup.do")
	public String idDup(@RequestParam("id") String id) {
		System.err.println(id);

		return "join_page/id_dup";
	}

	@GetMapping("/join_page/nick_dup.do")
	public String nickDup(@RequestParam("nick") String nick) {
		System.err.println(nick);

		return "join_page/nick_dup";
	}

	// 회원 등록
	@RequestMapping(value = "memJoin.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String insertJoin(JoinVO joinVO) {
		System.out.println(joinVO);
		int memResult = joinService.insertMem(joinVO.getNick());
		int detailResult = joinService.insertMemDetail(joinVO);
		System.out.println("insertJoin 입장~");

		String result = "false";
		if (memResult == 1 && detailResult == 1) {
			result = "true";
		}
//		String redirectUrl = "join_page/mem_join_result.do?result=" + result;
//		return new RedirectView(redirectUrl);
		//링크 연결 다시 확인
		return "join_page/mem_join.do?result=" + result;
	}// insertJoin

	// 회원 등록 결과 페이지 이동
//	@GetMapping("/main_page/search_contents.do")
//	public String memJoinResult(@RequestParam(name = "result", required = false) String result, Model model) {
//		model.addAttribute("result", result);
//		return "/join_page/mem_join_result";
//	}

}
