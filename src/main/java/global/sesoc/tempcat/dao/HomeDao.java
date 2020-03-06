package global.sesoc.tempcat.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;

import global.sesoc.tempcat.vo.NoticeBoard;

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
}
