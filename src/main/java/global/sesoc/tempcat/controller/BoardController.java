package global.sesoc.tempcat.controller;

import java.util.ArrayList;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.tempcat.dao.BoardDao;
import global.sesoc.tempcat.dao.MemberDao;
import global.sesoc.tempcat.util.PageNavigator;
import global.sesoc.tempcat.vo.NoticeBoard;
import global.sesoc.tempcat.vo.NoticeReply;

@Controller
@RequestMapping("board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardDao dao;

	NoticeBoard nBoard;
	NoticeReply nReply;
	private String id;
	private String stres;
	private boolean res;

	@GetMapping(value = "index")
	public String index() {
		return "temp/index";
	}

	@GetMapping(value = "noticelist")
	public String noticeBoardList(@RequestParam(defaultValue = "") String searchText,
			@RequestParam(defaultValue = "1") int currentPage, Model model) {

		// 전체글수랑 현재페이지를 가져와야함.
		ArrayList<NoticeBoard> list = dao.noticeList();
		int totalRecordsCount = list.size();
		PageNavigator nav = new PageNavigator(currentPage, totalRecordsCount);
		// RowBounds에 보내줄 스타트레코드, 카운트퍼페이지
		int startRecord = nav.getStartRecord();
		int countPerPage = nav.getCountPerPage();
		list = dao.noticeListPage(searchText, startRecord, countPerPage);
		// 카운트퍼페이지 수만큼담긴 list랑, 커런트페이지 변경시켜줘야되니까 nav보냄
		model.addAttribute("nav", nav);
		model.addAttribute("list", list);

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
		return "redirect:/board/noticelist";
	}

	@GetMapping(value = "noticeread")
	public String noticeRead(String noticenum, Model model) {
		logger.debug("noiceRead - noticenum : " + noticenum);
		dao.noticeHits(noticenum);
		nBoard = dao.noticeRead(noticenum);
		logger.debug(nBoard.toString());
		model.addAttribute("nBoard", nBoard);

		// reply read
		ArrayList<NoticeReply> list = dao.nReplyList(noticenum);
		logger.debug("reply size : " + Integer.toString(list.size()));
		model.addAttribute("replyList", list);
		return "board/noticeread";
	}

	@PostMapping(value = "nreplywrite")
	public String noticeReplyWrite(NoticeReply nReply) {
		logger.debug(nReply.toString());
		res = dao.replyWrite(nReply);
		if (res)
			logger.debug("replyWrite : success");
		else {
			logger.debug("replyWrite : fail");
		}
		return "redirect:/board/noticeread?noticenum=" + nReply.getNoticenum();
	}

	@GetMapping(value = "nreplydelete")
	public String noticeReplyDelete(String num, String noticenum) {
		logger.debug("replynum = " + num);
		dao.nReplyDelete(num);

		return "redirect:/board/noticeread?noticenum=" + noticenum;
	}

	@GetMapping(value = "nreplyupdate")
	public String noticeReplyUpdate(NoticeReply nReply) {
		logger.debug(nReply.toString());
		
		dao.nReplyUpdate(nReply);

		return "redirect:/board/noticeread?noticenum=" + nReply.getNoticenum();
	}
	/*
	 * 에이잭스 댓글리드 > 실패
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping(value = "nreplywrite") public ArrayList<NoticeReply>
	 * noticeReplyWrite(NoticeReply nReply) { logger.debug(nReply.toString());
	 * res = dao.replyWrite(nReply); if (res)
	 * logger.debug("replyWrite : success"); else {
	 * logger.debug("replyWrite : fail"); } ArrayList<NoticeReply> list =
	 * dao.nReplyList(nReply.getNoticenum());
	 * 
	 * return list; }
	 */
}
