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
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.tempcat.dao.FreeDao;
import global.sesoc.tempcat.dao.MemberDao;
import global.sesoc.tempcat.util.FileService;
import global.sesoc.tempcat.util.PageNavigator;
import global.sesoc.tempcat.vo.FreeBoard;
import global.sesoc.tempcat.vo.FreeReply;
import global.sesoc.tempcat.vo.NoticeBoard;
import global.sesoc.tempcat.vo.Profile;

@Controller
@RequestMapping("free")
public class FreeController {

	private static final Logger logger = LoggerFactory.getLogger(FreeController.class);
	private static final String uploadPath = "/tempcat";

	@Autowired
	private FreeDao Fdao;
	@Autowired
	private MemberDao Mdao;
	FreeBoard fBoard;
	FreeReply fReply;
	private String id;
	private String stres;
	private boolean res;

	private String nickname;
	private Profile profile;
	private int myFreeNum;

	private String id2;

	@GetMapping(value = "freelist")
	public String freeBoardList(@RequestParam(defaultValue = "") String searchText,
			@RequestParam(defaultValue = "1") int currentPage, Model model) {

		// 전체글수랑 현재페이지를 가져와야함.
		ArrayList<FreeBoard> list = Fdao.freeList(searchText);
		int totalRecordsCount = list.size();
		PageNavigator nav = new PageNavigator(10, currentPage, totalRecordsCount);
		// RowBounds에 보내줄 스타트레코드, 카운트퍼페이지
		int startRecord = nav.getStartRecord();
		int countPerPage = nav.getCountPerPage();
		list = Fdao.freeListPage(searchText, startRecord, countPerPage);
		// 카운트퍼페이지 수만큼담긴 list랑, 커런트페이지 변경시켜줘야되니까 nav보냄
		model.addAttribute("nav", nav);
		model.addAttribute("list", list);
		model.addAttribute("searchText", searchText);

		return "board/freelist";
	}

	@GetMapping(value = "freewrite")
	public String freeWrite() {
		return "board/freewrite";
	}

	@PostMapping(value = "freewrite")
	public String freeWrite2(String title, String contents, HttpSession session, MultipartFile upload) {
		id = (String) session.getAttribute("id");
		nickname = (String) session.getAttribute("nickname");
		logger.debug("id : {}, title : {}, contents : {} nickname : {}", id, title, contents, nickname);
		logger.debug(upload.toString());
		int myFreeNum = 0;
		if (upload.getSize() != 0) {
			FileService file = new FileService();
			String originalfile = upload.getOriginalFilename();
			String savedfile = file.saveFile(upload, uploadPath);
			logger.debug("originalfile : {}, savedfile : {}", originalfile, savedfile);
			fBoard = new FreeBoard(id, title, contents, originalfile, savedfile, nickname);
			logger.debug(fBoard.toString());
			myFreeNum = Fdao.freeWrite2(fBoard);
		} else {
			fBoard = new FreeBoard(id, title, contents, nickname);
			myFreeNum = Fdao.freeWrite(fBoard);
			logger.debug("myFreeNum : " + myFreeNum);
		}
		profile = new Profile();
		profile.setId(id);
		profile.setMyfree(myFreeNum);
		res = Mdao.addMyfree(profile);
		logger.debug("addMyfree : {}, Profile : {}", res, profile);

		return "redirect:/free/freelist";
	}

	@GetMapping(value = "freeread")
	public String freeRead(String freenum, Model model, @RequestParam(defaultValue = "999") int currentPage) {
		logger.debug("noiceRead - freenum : " + freenum);
		Fdao.freeHits(freenum);
		fBoard = Fdao.freeRead(freenum);
		logger.debug(fBoard.toString());
		model.addAttribute("fBoard", fBoard);

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
	public String freeReplyWrite(FreeReply fReply, HttpSession session) {
		logger.debug(fReply.toString());
		int freereply = Fdao.replyWrite(fReply);
		logger.debug("freereply : " + freereply);
		id = (String) session.getAttribute("id");
		profile = new Profile();
		profile.setId(id);
		profile.setFreereply(freereply);
		res = Mdao.addFreereply(profile);
		logger.debug("addFreereply : {}, Profile : {}", res, profile);

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

	@GetMapping(value = "fboarddelete")
	public String freeBoardDelete(String freenum, HttpSession session) {
		id = (String) session.getAttribute("id");
		res = Fdao.freeBoardDelete(freenum, id);
		logger.debug("id : {}, freenum : {}, FreeBoardDelete : {}", id, freenum, res);

		return "redirect:/free/freelist";
	}

	@GetMapping(value = "fboardupdate")
	public String freeBoardUpdate(String freenum, String id, HttpSession session, Model model) {
		id2 = (String) session.getAttribute("id");
		if (id.equals(id2)) {
			fBoard = Fdao.freeRead(freenum);
			model.addAttribute("fBoard", fBoard);
			return "board/freewrite";
		} else {
			logger.debug("freeBoardUpdate : 해킹시도");
			return "redirect:/";
		}
	}

	@PostMapping(value = "freeupdate")
	public String noticeUpdate(String title, String contents, int freenum, HttpSession session) {

		id = (String) session.getAttribute("id");
		nickname = (String) session.getAttribute("nickname");
		logger.debug("noticenum : {}, id : {}, title : {}, contents : {} nickname : {}", freenum, id, title, contents,
				nickname);
		fBoard = new FreeBoard(freenum, id, title, contents, nickname);
		Fdao.freeUpdate(fBoard);

		return "redirect:/free/freeread?freenum=" + freenum;
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
