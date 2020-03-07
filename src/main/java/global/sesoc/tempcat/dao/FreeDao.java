package global.sesoc.tempcat.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.prefs.BackingStoreException;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tempcat.vo.FreeBoard;
import global.sesoc.tempcat.vo.FreeReply;

@Repository
public class FreeDao {

	@Autowired
	private SqlSession session;
	private int intres;
	private FreeBoard fBoard;

	public int freeWrite(FreeBoard fBoard) {
		// TODO Auto-generated method stub
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		intres = mapper.freeWrite(fBoard);
		int myFreenum = mapper.selectMyfreeNum(fBoard.getId());
		return myFreenum;
	}

	public ArrayList<FreeBoard> freeList() {
		// TODO Auto-generated method stub
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		ArrayList<FreeBoard> list = mapper.freeList();
		return list;
	}

	public ArrayList<FreeBoard> freeListPage(String searchText, int startRecord, int countPerPage) {
		// TODO Auto-generated method stub
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		RowBounds RB = new RowBounds(startRecord, countPerPage);
		// 스타트레코드부터 카운트퍼페이지에 있는수만큼 셀렉트
		ArrayList<FreeBoard> list = mapper.freeList2(searchText, RB);
		return list;
	}

	public FreeBoard freeRead(String freenum) {
		// TODO Auto-generated method stub
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		fBoard = mapper.freeRead(freenum);
		return fBoard;
	}

	public void freeHits(String freenum) {
		// TODO Auto-generated method stub
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		mapper.freeHits(freenum);
	}

	public int replyWrite(FreeReply fReply) {
		// TODO Auto-generated method stub
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		mapper.replyWrite(fReply);
		int freereply = mapper.selectFreereplyNum(fReply.getId());
		return freereply;
	}

	public ArrayList<FreeReply> fReplyList(String freenum) {
		// TODO Auto-generated method stub
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		ArrayList<FreeReply> list = mapper.fReplyList(freenum);
		return list;
	}

	public void fReplyDelete(String num) {
		// TODO Auto-generated method stub
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		mapper.fReplyDelete(num);
	}

	public void fReplyUpdate(FreeReply fReply) {
		// TODO Auto-generated method stub
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		mapper.fReplyUpdate(fReply);

	}

	public ArrayList<FreeReply> fReplyListPage(int startRecord, int countPerPage, String freenum) {
		// TODO Auto-generated method stub
		RowBounds RB = new RowBounds(startRecord, countPerPage);
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		ArrayList<FreeReply> list = mapper.fReplyList(RB, freenum);

		return list;
	}

	public boolean freeBoardDelete(String freenum, String id) {
		// TODO Auto-generated method stub
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		HashMap<String, String> map = new HashMap<>();
		map.put("freenum", freenum);
		map.put("id", id);
		intres = mapper.freeBoardDelete(map);
		return intres > 0;
	}

	public void freeUpdate(FreeBoard fBoard) {
		// TODO Auto-generated method stub
		FreeMapper mapper = session.getMapper(FreeMapper.class);
		mapper.freeUpdate(fBoard);
	}

}
