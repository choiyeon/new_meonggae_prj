package com.store.meonggae.user.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.meonggae.product.vo.ReportVO;
import com.store.meonggae.user.join.service.joinService;
import com.store.meonggae.user.join.vo.JoinVO;

@Controller
public class JoinController {

	@Autowired
	private joinService joinService;
	
	// 아이디 중복확인
	@GetMapping("/join_page/id_dup.do")
	public String idDup(@RequestParam("id") String id) {
		System.err.println(id);

		return "join_page/id_dup";
	}

	@GetMapping("/join_page/nick_dup.do")
	public String nickDup() {
		return "join_page/nick_dup";
	}

	// 회원 등록
	@RequestMapping(value = "insertJoin.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String insert(JoinVO joinVO) {
//		int result = joinService.insertJoin(joinVO);
		return "/join_page/mem_join";
	}// insertReport

//	//비밀번호 암호화
//	PasswordEncoder pe = new BCryptPasswordEncoder();
//	String encodePass = pe.encode(id);
}
