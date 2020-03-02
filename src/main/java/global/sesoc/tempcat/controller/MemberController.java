package global.sesoc.tempcat.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.tempcat.dao.MemberDao;
import global.sesoc.tempcat.vo.Member;

@Controller
@RequestMapping("member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	boolean res;
	int intres;
	String stres;
	HashMap<String, String> map;
	String nickname;

	@Autowired
	private MemberDao dao;
	private String name;

	@GetMapping(value = "login")
	public String login() {
		return "member/login";
	}

	@ResponseBody
	@PostMapping(value = "login")
	public String login2(String id, String pw, HttpSession session) {
		logger.debug("login 정보 아이디: {} 비밀번호 : {}", id, pw);

		Member member = new Member();
		member.setId(id);
		member.setPw(pw);
		res = dao.checkId(member);
		if (!res) {
			stres = "checkId error";
			logger.debug(stres);
			return stres;
		} else {
			map = dao.login(member);
			stres = map.get("stres");
			nickname = map.get("nickname");
			id = map.get("id");
			name = map.get("name");
			if (stres.equals("login success")) {
				session.setAttribute("id", id);
				session.setAttribute("nickname", nickname);
				session.setAttribute("name", name);
				logger.debug("id : {}, name : {}, nickname : {}", id, name, nickname);
			}
			logger.debug(stres);
			return stres;
		}
	}

	@GetMapping(value = "logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/member/index";
	}

	@GetMapping(value = "index")
	public String index() {
		return "temp/index";
	}

	@GetMapping(value = "signup")
	public String signup() {
		return "member/signup";
	}

	@ResponseBody
	@PostMapping(value = "signup")
	public String signup2(Member member) {
		System.out.println(member);
		res = dao.checkId(member);
		if (res) {
			stres = "exist id";
			return stres;
		}
		stres = dao.signup(member);
		logger.debug(stres);
		return stres;
	}

	@GetMapping(value = "profile")
	public String profile() {
		return "member/profile";
	}
}
