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

import global.sesoc.tempcat.dao.FreeDao;
import global.sesoc.tempcat.dao.MemberDao;
import global.sesoc.tempcat.util.PageNavigator;
import global.sesoc.tempcat.vo.FreeBoard;
import global.sesoc.tempcat.vo.FreeReply;

@Controller
@RequestMapping("free")
public class FreeController {

	private static final Logger logger = LoggerFactory.getLogger(FreeController.class);

	@Autowired
	private FreeDao Fdao;
	private MemberDao Mdao;
	FreeBoard fBoard;
	FreeReply fReply;
	private String id;
	private String stres;
	private boolean res;

	@GetMapping(value = "freelist")
	public String freeBoardList(@RequestParam(defaultValue = "") String searchText,
			@RequestParam(defaultValue = "1") int currentPage, Model model) {

		// 전체글수랑 현재페이지를 가져와야함.
		ArrayList<FreeBoard> list = Fdao.freeList();
		int totalRecordsCount = list.size();
		PageNavigator nav = new PageNavigator(10, currentPage, totalRecordsCount);
		// RowBounds에 보내줄 스타트레코드, 카운트퍼페이지
		int startRecord = nav.getStartRecord();
		int countPerPage = nav.getCountPerPage();
		list = Fdao.freeListPage(searchText, startRecord, countPerPage);
		// 카운트퍼페이지 수만큼담긴 list랑, 커런트페이지 변경시켜줘야되니까 nav보냄
		model.addAttribute("nav", nav);
		model.addAttribute("list", list);

		return "board/freelist";
	}

	@GetMapping(value = "freewrite")
	public String freeWrite() {
		return "board/freewrite";
	}

	@PostMapping(value = "freewrite")
	public String freeWrite2(String title, String contents, HttpSession session) {
		id = (String) session.getAttribute("id");
		logger.debug("id : {}, title : {}, contents : {}", id, title, contents);
		fBoard = new FreeBoard(id, title, contents);
		res = Fdao.freeWrite(fBoard);
		logger.debug("freeWrite : " + res);

		// 프로필등록
		//Mdao.addMyfree(fBoard);
		return "redirect:/free/freelist";
	}

	@GetMapping(value = "freeread")
	public String freeRead(String freenum, Model model, @RequestParam(defaultValue = "999") int currentPage) {
		logger.debug("noiceRead - freenum : " + freenum);
		Fdao.freeHits(freenum);
		fBoard = Fdao.freeRead(freenum);
		logger.debug(fBoard.toString());
		model.addAttribute("nBoard", fBoard);

		// reply read
		ArrayList<FreeReply> list = Fdao.fReplyList(freenum);
		PageNavigator nav = new PageNavigator(5, currentPage, list.size());
		logger.debug("total reply count : " + Integer.toString(list.size()));
		int startRecord = nav.getStartRecord();
		int countPerPage = nav.getCountPerPage();

		list = Fdao.fReplyListPage(startRecord, countPerPage, freenum);
		model.addAttribute("replyList", list);
		model.addAttribute("nav", nav);
		return "board/freeread";
	}

	@PostMapping(value = "freplywrite")
	public String freeReplyWrite(FreeReply fReply) {
		logger.debug(fReply.toString());
		res = Fdao.replyWrite(fReply);
		if (res)
			logger.debug("replyWrite : success");
		else {
			logger.debug("replyWrite : fail");
		}
		return "redirect:/free/freeread?freenum=" + fReply.getFreenum();
	}

	@GetMapping(value = "freplydelete")
	public String freeReplyDelete(String num, String freenum) {
		logger.debug("replynum = " + num);
		Fdao.fReplyDelete(num);

		return "redirect:/free/freeread?freenum=" + freenum;
	}

	@GetMapping(value = "freplyupdate")
	public String freeReplyUpdate(FreeReply fReply) {
		logger.debug(fReply.toString());

		Fdao.fReplyUpdate(fReply);

		return "redirect:/free/freeread?freenum=" + fReply.getFreenum();
	}
	/*
	 * 에이잭스 댓글리드 > 실패
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping(value = "freplywrite") public ArrayList<FreeReply>
	 * freeReplyWrite(FreeReply fReply) { logger.debug(fReply.toString()); res =
	 * dao.replyWrite(fReply); if (res) logger.debug("replyWrite : success");
	 * else { logger.debug("replyWrite : fail"); } ArrayList<FreeReply> list =
	 * dao.fReplyList(fReply.getFreenum());
	 * 
	 * return list; }
	 */
}
