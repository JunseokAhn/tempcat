package global.sesoc.tempcat.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tempcat.vo.NoticeBoard;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession session;
	private int intres;
	private NoticeBoard nBoard;

	public boolean noticeWrite(NoticeBoard nBoard) {
		// TODO Auto-generated method stub
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		intres = mapper.noticeWrite(nBoard);

		return intres > 0;
	}

	public ArrayList<NoticeBoard> noticeList() {
		// TODO Auto-generated method stub
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		ArrayList<NoticeBoard> list = mapper.noticeList();
		return list;
	}

	public ArrayList<NoticeBoard> noticeListPage(String searchText, int startRecord, int countPerPage) {
		// TODO Auto-generated method stub
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		RowBounds RB = new RowBounds(startRecord, countPerPage);
		//스타트레코드부터 카운트퍼페이지에 있는수만큼 셀렉트
		ArrayList<NoticeBoard> list = mapper.noticeList2(searchText, RB);
		return list;
	}

}
