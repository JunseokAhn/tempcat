package global.sesoc.tempcat.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tempcat.vo.NoticeBoard;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession session;
	private int intres;

	public boolean noticeWrite(NoticeBoard nBoard) {
		// TODO Auto-generated method stub
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		intres = mapper.noticeWrite(nBoard);

		return intres > 0;
	}

}
