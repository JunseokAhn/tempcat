package global.sesoc.tempcat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.tempcat.dao.DAO;
import global.sesoc.tempcat.vo.Member;

@Controller
@RequestMapping("member")
public class MemberControllor {

	private static final Logger logger = LoggerFactory.getLogger(MemberControllor.class);
	boolean res;
	int intres;
	String stres;
	@Autowired
	private DAO dao;

	@GetMapping(value = "login")
	public String login() {
		return "member/login";
	}

	@PostMapping(value = "login")
	public String login2(String id, String pw) {
		logger.debug("login 정보 아이디: {} 비밀번호 : {}", id, pw);

		Member member = new Member();
		member.setId(id);
		member.setPw(pw);
		res = dao.checkId(member);
		dao.login(member);
		return "temp/index";
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
			stres = "이미 아이디가 존재합니다";
			return stres;
		}
		stres = dao.signup(member);
		logger.debug(stres);
		return stres;
	}
}
