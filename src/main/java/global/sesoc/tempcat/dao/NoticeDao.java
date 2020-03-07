package global.sesoc.tempcat.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.prefs.BackingStoreException;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tempcat.vo.NoticeBoard;
import global.sesoc.tempcat.vo.NoticeReply;

@Repository
public class NoticeDao {

	@Autowired
	private SqlSession session;
	private int intres;
	private NoticeBoard nBoard;

	public int noticeWrite(NoticeBoard nBoard) {
		// TODO Auto-generated method stub
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		intres = mapper.noticeWrite(nBoard);
		int myNoticeNum = mapper.selectMynoticeNum(nBoard.getId());
		return myNoticeNum;
	}

	public ArrayList<NoticeBoard> noticeList() {
		// TODO Auto-generated method stub
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		ArrayList<NoticeBoard> list = mapper.noticeList();
		return list;
	}

	public ArrayList<NoticeBoard> noticeListPage(String searchText, int startRecord, int countPerPage) {
		// TODO Auto-generated method stub
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		RowBounds RB = new RowBounds(startRecord, countPerPage);
		// 스타트레코드부터 카운트퍼페이지에 있는수만큼 셀렉트
		ArrayList<NoticeBoard> list = mapper.noticeList2(searchText, RB);
		return list;
	}

	public NoticeBoard noticeRead(String noticenum) {
		// TODO Auto-generated method stub
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		nBoard = mapper.noticeRead(noticenum);
		return nBoard;
	}

	public void noticeHits(String noticenum) {
		// TODO Auto-generated method stub
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		mapper.noticeHits(noticenum);
	}

	public int replyWrite(NoticeReply nReply) {
		// TODO Auto-generated method stub
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		mapper.replyWrite(nReply);
		int noticereply = mapper.selectNoticereplyNum(nReply.getId());
		return noticereply;
	}

	public ArrayList<NoticeReply> nReplyList(String noticenum) {
		// TODO Auto-generated method stub
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		ArrayList<NoticeReply> list = mapper.nReplyList(noticenum);
		return list;
	}

	public void nReplyDelete(String num) {
		// TODO Auto-generated method stub
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		mapper.nReplyDelete(num);
	}

	public void nReplyUpdate(NoticeReply nReply) {
		// TODO Auto-generated method stub
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		mapper.nReplyUpdate(nReply);

	}

	public ArrayList<NoticeReply> nReplyListPage(int startRecord, int countPerPage, String noticenum) {
		// TODO Auto-generated method stub
		RowBounds RB = new RowBounds(startRecord, countPerPage);
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		ArrayList<NoticeReply> list = mapper.nReplyList(RB, noticenum);

		return list;
	}

	public boolean noticeBoardDelete(String noticenum, String id) {
		// TODO Auto-generated method stub
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		HashMap<String, String> map = new HashMap<>();
		map.put("noticenum", noticenum);
		map.put("id", id);
		intres = mapper.noticeBoardDelete(map);
		return intres>0;
	}

}
