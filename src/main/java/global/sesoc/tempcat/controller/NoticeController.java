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
import org.springframework.web.bind.annotation.RequestParam;

import global.sesoc.tempcat.dao.NoticeDao;
import global.sesoc.tempcat.dao.MemberDao;
import global.sesoc.tempcat.util.PageNavigator;
import global.sesoc.tempcat.vo.NoticeBoard;
import global.sesoc.tempcat.vo.NoticeReply;
import global.sesoc.tempcat.vo.Profile;

@Controller
@RequestMapping("notice")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private MemberDao Mdao;
	@Autowired
	private NoticeDao Ndao;

	NoticeBoard nBoard;
	NoticeReply nReply;
	private String id;
	private String stres;
	private boolean res;

	private Profile profile;

	private String nickname;

	private String id2;

	@GetMapping(value = "noticelist")
	public String noticeBoardList(@RequestParam(defaultValue = "") String searchText,
			@RequestParam(defaultValue = "1") int currentPage, Model model) {

		// 전체글수랑 현재페이지를 가져와야함.
		ArrayList<NoticeBoard> list = Ndao.noticeList();
		int totalRecordsCount = list.size();
		PageNavigator nav = new PageNavigator(10, currentPage, totalRecordsCount);
		// RowBounds에 보내줄 스타트레코드, 카운트퍼페이지
		int startRecord = nav.getStartRecord();
		int countPerPage = nav.getCountPerPage();
		list = Ndao.noticeListPage(searchText, startRecord, countPerPage);
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
		nickname = (String) session.getAttribute("nickname");
		logger.debug("id : {}, title : {}, contents : {} nickname : {}", id, title, contents, nickname);
		nBoard = new NoticeBoard(id, title, contents, nickname);
		int myNoticeNum = Ndao.noticeWrite(nBoard);
		logger.debug("myNoticeNum : " + myNoticeNum);
		profile = new Profile();
		profile.setId(id);
		profile.setMynotice(myNoticeNum);
		res = Mdao.addMynotice(profile);
		logger.debug("addMynotice : {}, Profile : {}", res, profile);

		return "redirect:/notice/noticelist";
	}

	@GetMapping(value = "noticeread")
	public String noticeRead(String noticenum, Model model, @RequestParam(defaultValue = "999") int currentPage) {
		logger.debug("noiceRead - noticenum : " + noticenum);
		Ndao.noticeHits(noticenum);
		nBoard = Ndao.noticeRead(noticenum);
		logger.debug(nBoard.toString());
		model.addAttribute("nBoard", nBoard);

		// reply read
		ArrayList<NoticeReply> list = Ndao.nReplyList(noticenum);
		PageNavigator nav = new PageNavigator(5, currentPage, list.size());
		logger.debug("total reply count : " + Integer.toString(list.size()));
		int startRecord = nav.getStartRecord();
		int countPerPage = nav.getCountPerPage();

		list = Ndao.nReplyListPage(startRecord, countPerPage, noticenum);
		model.addAttribute("replyList", list);
		model.addAttribute("nav", nav);
		return "board/noticeread";
	}

	@PostMapping(value = "nreplywrite")
	public String noticeReplyWrite(NoticeReply nReply, HttpSession session) {
		logger.debug(nReply.toString());
		int noticereply = Ndao.replyWrite(nReply);
		logger.debug("noticereply : " + noticereply);
		id = (String) session.getAttribute("id");
		profile = new Profile();
		profile.setId(id);
		profile.setNoticereply(noticereply);
		res = Mdao.addNoticereply(profile);
		logger.debug("addNoticereply : {}, Profile : {}", res, profile);

		return "redirect:/notice/noticeread?noticenum=" + nReply.getNoticenum();
	}

	@GetMapping(value = "nreplydelete")
	public String noticeReplyDelete(String num, String noticenum) {
		logger.debug("replynum = " + num);
		Ndao.nReplyDelete(num);

		return "redirect:/notice/noticeread?noticenum=" + noticenum;
	}

	@GetMapping(value = "nreplyupdate")
	public String noticeReplyUpdate(NoticeReply nReply) {
		logger.debug(nReply.toString());

		Ndao.nReplyUpdate(nReply);

		return "redirect:/notice/noticeread?noticenum=" + nReply.getNoticenum();
	}

	@GetMapping(value = "nboarddelete")
	public String noticeBoardDelete(String noticenum, HttpSession session) {
		id = (String) session.getAttribute("id");
		res = Ndao.noticeBoardDelete(noticenum, id);
		logger.debug("id : {}, noticenum : {}, NoticeBoardDelete : {}", id, noticenum, res);

		return "redirect:/notice/noticelist";
	}

	@GetMapping(value = "nboardupdate")
	public String noticeBoardUpdate(String noticenum, String id, HttpSession session, Model model) {
		id2 = (String) session.getAttribute("id");
		if (id.equals(id2)) {
			nBoard = Ndao.noticeRead(noticenum);
			model.addAttribute("nBoard", nBoard);
			return "board/noticewrite";
		} else {
			logger.debug("noticeBoardUpdate : 해킹시도");
			return "redirect:/";
		}
	}

	@PostMapping(value = "noticeupdate")
	public String noticeUpdate(String title, String contents, HttpSession session) {
		/*
		 * id = (String) session.getAttribute("id"); nickname = (String)
		 * session.getAttribute("nickname");
		 * logger.debug("id : {}, title : {}, contents : {} nickname : {}", id,
		 * title, contents, nickname); nBoard = new NoticeBoard(id, title,
		 * contents, nickname); int myNoticeNum = Ndao.noticeWrite(nBoard);
		 * logger.debug("myNoticeNum : " + myNoticeNum); profile = new
		 * Profile(); profile.setId(id); profile.setMynotice(myNoticeNum); res =
		 * Mdao.addMynotice(profile);
		 * logger.debug("addMynotice : {}, Profile : {}", res, profile);
		 * 
		 * return "redirect:/notice/noticelist";
		 */
		return null;
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
