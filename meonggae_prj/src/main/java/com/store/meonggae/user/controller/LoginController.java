 package com.store.meonggae.user.controller;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.store.meonggae.user.login.domain.LoginDomain;
import com.store.meonggae.user.login.service.LoginService;
import com.store.meonggae.user.login.vo.LoginLogVO;
import com.store.meonggae.user.login.vo.LoginVO;

@Controller
@RequestMapping("/index.do")
public class LoginController {

	@Autowired
	private LoginService loginService;

	@PostMapping("/authenticate.do")
	public String authenticate(@RequestParam("uid") String id, @RequestParam("upw") String pass, HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model) {
		LoginVO loginVO = new LoginVO(id, pass);
		LoginDomain user = null;

		try {
			user = loginService.selectOneUser(loginVO);
			if (user == null) {
				session.setAttribute("message", "로그인 실패. 아이디 또는 비밀번호를 확인하세요.");
				return "redirect:/index.do";
			}

			PasswordEncoder pe = new BCryptPasswordEncoder();
			if (!pe.matches(loginVO.getPass(), user.getPass())) {
				session.setAttribute("message", "로그인 실패. 아이디 또는 비밀번호를 확인하세요.");
				session.setAttribute("status", "FALIED : UN MATCH PASSWORD");
				return "redirect:/index.do";
			}

			String key = "test1234";
			String salt = "123456";
			TextEncryptor te = Encryptors.text(key, salt);

			user.setPass("");
			LoginLogVO logVO = new LoginLogVO(user.getMemNum(), request.getRemoteAddr(), request.getHeader("sec-ch-ua-platform") != null ? request.getHeader("sec-ch-ua-platform").replaceAll("\"", "-") : "", loginService.getMemberBrowser(request.getHeader("User-Agent")), user.getMemStatus());
			loginService.addMemberLoginLog(logVO);
			
			switch (user.getMemStatus()) {
		    case "S":
		        session.setAttribute("message", "정지된 회원입니다.");
		        //loginService.addMemberLoginLog(logVO);
		        return "redirect:/index.do";
		    case "W":
		        session.setAttribute("message", "탈퇴한 회원입니다.");
		        return "redirect:/index.do";
		    case "N":
		        session.setAttribute("user", user);
		        Cookie cookie = new Cookie("memNum", String.valueOf(user.getMemNum()));
		        cookie.setMaxAge(60 * 30);
		        cookie.setPath("/");
		        cookie.setSecure(false);
		        response.addCookie(cookie);
		        
		        return "redirect:/index.do";
		    default:
		        session.setAttribute("message", "알 수 없는 상태입니다.");
		        return "redirect:/index.do";
			}
		} catch (Exception e) {
			session.setAttribute("message", "로그인 중 오류가 발생했습니다.");
			session.setAttribute("status", "FAILED : ERROR");
			e.printStackTrace();
		}
		return "redirect:/index.do";
	}


	@PostMapping("/index.do")
	public String mainPageLogin() {
		return "main_page/main_contents";
	}

	@GetMapping("/logout.do")
	public String logout(HttpSession session, SessionStatus ss) {
		session.invalidate();
		ss.setComplete();
		return "redirect:/index.do";
	}
}
