package global.sesoc.tempcat.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.tempcat.dao.BoardDao;
import global.sesoc.tempcat.dao.MemberDao;
import global.sesoc.tempcat.vo.NoticeBoard;

@Controller
@RequestMapping("board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardDao dao;

	NoticeBoard nBoard;
	private String id;
	private String stres;
	private boolean res;

	@GetMapping(value = "index")
	public String index() {
		return "temp/index";
	}

	@GetMapping(value = "noticelist")
	public String noticeBoardList() {
		return "board/noticelist";
	}

	@GetMapping(value = "noticewrite")
	public String noticeWrite() {
		return "board/noticewrite";
	}

	@PostMapping(value = "noticewrite")
	public String noticeWrite2(String title, String contents, HttpSession session) {
		id = (String) session.getAttribute("id");
		logger.debug("id : {}, title : {}, contents : {}", id, title, contents);
		nBoard = new NoticeBoard(id, title, contents);
		res = dao.noticeWrite(nBoard);
		logger.debug("noticeWrite : " + res);
		return "board/noticelist";
	}
}
