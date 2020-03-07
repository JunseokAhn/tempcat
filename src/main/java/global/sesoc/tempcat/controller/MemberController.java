package global.sesoc.tempcat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.tempcat.dao.MemberDao;
import global.sesoc.tempcat.vo.Member;
import global.sesoc.tempcat.vo.Profile;

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
	private MemberDao Mdao;
	private String name;
	private String id;

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
		res = Mdao.checkId(member);
		if (!res) {
			stres = "checkId error";
			logger.debug(stres);
			return stres;
		} else {
			map = Mdao.login(member);
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
		return "redirect:/";
	}

	@GetMapping(value = "signup")
	public String signup() {
		return "member/signup";
	}

	@ResponseBody
	@PostMapping(value = "signup")
	public String signup2(Member member) {
		System.out.println(member);
		res = Mdao.checkId(member);
		if (res) {
			stres = "exist id";
			return stres;
		}
		stres = Mdao.signup(member);
		logger.debug(stres);
		return stres;
	}

	@GetMapping(value = "profile")
	public String profile(HttpSession session, Model model) {
		id = (String) session.getAttribute("id");
		Member member = Mdao.selectMember(id);

		ArrayList<Profile> profile = Mdao.selectProfile(id);

		ArrayList<Integer> mynotice = new ArrayList<>();
		ArrayList<Integer> myfree = new ArrayList<>();
		ArrayList<Integer> noticereply = new ArrayList<>();
		ArrayList<Integer> freereply = new ArrayList<>();
		ArrayList<Integer> heartnotice = new ArrayList<>();
		ArrayList<Integer> heartfree = new ArrayList<>();

		for (Profile i : profile) {
			if (i.getMynotice() != 0) {
				mynotice.add(i.getMynotice());
			} else if (i.getMyfree() != 0) {
				myfree.add(i.getMyfree());
			} else if (i.getNoticereply() != 0) {
				noticereply.add(i.getNoticereply());
			} else if (i.getFreereply() != 0) {
				freereply.add(i.getFreereply());
			} else if (i.getHeartnotice() != 0) {
				heartnotice.add(i.getHeartnotice());
			} else if (i.getHeartfree() != 0) {
				heartfree.add(i.getHeartfree());
			}
		}

		logger.debug(
				"member : {}, mynotice : {}, myfree : {}, noticereply : {}, freereply : {}, heartnotice {}, heartfree {}",
				member, mynotice, myfree, noticereply, freereply, heartnotice, heartfree);

		model.addAttribute("member", member);
		model.addAttribute("mynotice", mynotice);
		model.addAttribute("myfree", myfree);
		model.addAttribute("noticereply", noticereply);
		model.addAttribute("freereply", freereply);
		model.addAttribute("heartnotice", heartnotice);
		model.addAttribute("heartfree", heartfree);

		return "member/profile";
	}

	@ResponseBody
	@GetMapping(value = "changeNickname")
	public void changeNickname(String id, String nickname) {
		logger.debug("id : {}, nickname : {}", id, nickname);
		res = Mdao.changeNickname(id, nickname);
	}

	@ResponseBody
	@GetMapping(value = "changeEmail")
	public void changeEmail(String id, String email) {
		logger.debug("id : {}, email : {}", id, email);
		res = Mdao.changeEmail(id, email);
	}
}
