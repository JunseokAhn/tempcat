package global.sesoc.tempcat;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import global.sesoc.tempcat.dao.HomeDao;
import global.sesoc.tempcat.util.PageNavigator;
import global.sesoc.tempcat.vo.FreeBoard;
import global.sesoc.tempcat.vo.NoticeBoard;
import global.sesoc.tempcat.vo.SearchBoard;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	HomeDao Hdao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		logger.info("메인 화면으로 이동");
		ArrayList<NoticeBoard> noticeList = Hdao.setNotice();
		ArrayList<FreeBoard> freeList = Hdao.setFree();
		logger.debug(noticeList.toString());
		logger.debug(freeList.toString());
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("freeList", freeList);
		return "home";
	}

	@GetMapping(value = "searchlist")
	public String searchList(@RequestParam(defaultValue = "") String searchText,
			@RequestParam(defaultValue = "0") int currentPage, Model model) {
		
		logger.debug(searchText);

		// 전체글수랑 현재페이지를 가져와야함.
		ArrayList<SearchBoard> list = Hdao.searchList(searchText);
		int totalRecordsCount = list.size();
		PageNavigator nav = new PageNavigator(10, currentPage, totalRecordsCount);
		// RowBounds에 보내줄 스타트레코드, 카운트퍼페이지
		int startRecord = nav.getStartRecord();
		int countPerPage = nav.getCountPerPage();
		list = Hdao.searchListPage(searchText, startRecord, countPerPage);
		// 카운트퍼페이지 수만큼담긴 list랑, 커런트페이지 변경시켜줘야되니까 nav보냄
		model.addAttribute("nav", nav);
		model.addAttribute("list", list);
		model.addAttribute("searchText", searchText);
		System.out.println(list);
		return "board/searchlist";
	}

}
