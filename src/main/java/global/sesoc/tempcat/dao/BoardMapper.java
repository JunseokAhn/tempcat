package global.sesoc.tempcat.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.tempcat.vo.NoticeBoard;
import global.sesoc.tempcat.vo.NoticeReply;

public interface BoardMapper {

	int noticeWrite(NoticeBoard nBoard);

	ArrayList<NoticeBoard> noticeList();

	ArrayList<NoticeBoard> noticeList2(String searchText, RowBounds rB);

	NoticeBoard noticeRead(String noticenum);

	void noticeHits(String noticenum);

	int replyWrite(NoticeReply nReply);

}
