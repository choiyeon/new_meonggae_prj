package com.store.meonggae.user.contoller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.store.meonggae.user.login.domain.LoginDomain;
import com.store.meonggae.user.login.service.LoginService;
import com.store.meonggae.user.login.vo.LoginVO;

@Controller
@RequestMapping("/index.do")
public class LoginController {

	@Autowired
	private LoginService loginService;

	@PostMapping("/authenticate.do")
	public String authenticate(@RequestParam("uid") String id, @RequestParam("upw") String pass, HttpSession session) {
		LoginVO loginVO = new LoginVO(id, pass);
		LoginDomain user = null;

		try {
			user = loginService.selectOneUser(loginVO);
			if (user == null) {
				session.setAttribute("message", "로그인 실패. 아이디 또는 비밀번호를 확인하세요.");
				System.out.println("사용자를 찾을 수 없습니다.");
				return "redirect:/index.do";
			}

			System.out.println("로그인 시도 - 입력된 ID: " + loginVO.getId() + ", DB에서 조회한 암호화된 비밀번호: " + user.getPass());

			PasswordEncoder pe = new BCryptPasswordEncoder();
			if (!pe.matches(loginVO.getPass(), user.getPass())) {
				System.out.println("암호가 일치하지 않습니다: " + loginVO.getPass() + " vs " + user.getPass());
				session.setAttribute("message", "로그인 실패. 아이디 또는 비밀번호를 확인하세요.");
				session.setAttribute("status", "FALIED : UN MATCH PASSWORD");
				return "redirect:/index.do";
			}

			String key = "test1234";
			String salt = "123456";
			TextEncryptor te = Encryptors.text(key, salt);

			user.setPass("");
			if (user.getId() != null) {
				/*
				 * String decryptedId = te.decrypt(user.getId()); System.out.println("암호화된 ID: "
				 * + user.getId() + ", 복호화된 ID: " + decryptedId); user.setId(decryptedId);
				 */
			} else {
				System.out.println("user.getId()가 null입니다.");
			}

			switch (user.getMemStatus()) {
		    case "S":
		        session.setAttribute("message", "정지된 회원입니다.");
		        return "redirect:/index.do";
		    case "W":
		        session.setAttribute("message", "탈퇴한 회원입니다.");
		        return "redirect:/index.do";
		    case "N":
		        session.setAttribute("user", user);
		        return "redirect:/index.do";
		    default:
		        session.setAttribute("message", "알 수 없는 상태입니다.");
		        return "redirect:/index.do";
		}
		} catch (Exception e) {
			session.setAttribute("message", "로그인 중 오류가 발생했습니다.");
			session.setAttribute("status", "FAILED : ERROR");
			e.printStackTrace();
			if (user != null) {
				System.out.println("user.getPass(): " + user.getPass() + ", loginVO.getPass(): " + loginVO.getPass());
			} else {
				System.out.println("user가 null입니다.");
			}
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
