package global.sesoc.tempcat.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;

import global.sesoc.tempcat.vo.FreeBoard;
import global.sesoc.tempcat.vo.NoticeBoard;
import global.sesoc.tempcat.vo.SearchBoard;

@Repository
public class HomeDao {

	@Autowired
	SqlSession session;

	public ArrayList<NoticeBoard> setNotice() {
		// TODO Auto-generated method stub
		NoticeMapper mapper = session.getMapper(NoticeMapper.class);
		ArrayList<NoticeBoard> list = mapper.setNotice();
		return list;
	}

	public ArrayList<FreeBoard> setFree() {
		// TODO Auto-generated method stub
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		ArrayList<FreeBoard> list = mapper.setFree();
		return list;
	}

	public ArrayList<SearchBoard> searchList() {
		// TODO Auto-generated method stub
		Mapper mapper = session.getMapper(Mapper.class);
		ArrayList<SearchBoard> list = mapper.searchList();
		return list;
	}

	public ArrayList<SearchBoard> searchListPage(String searchText, int startRecord, int countPerPage) {
		// TODO Auto-generated method stub
		Mapper mapper = session.getMapper(Mapper.class);
		RowBounds RB = new RowBounds(startRecord, countPerPage);
		// 스타트레코드부터 카운트퍼페이지에 있는수만큼 셀렉트
		ArrayList<SearchBoard> list = mapper.searchList2(searchText, RB);
		return list;
	}
}
