package global.sesoc.tempcat.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.tempcat.vo.Member;
import global.sesoc.tempcat.vo.NoticeBoard;
import global.sesoc.tempcat.vo.Profile;
import global.sesoc.tempcat.vo.SearchBoard;

public interface MemberMapper {

	Member checkId(Member member);

	int signup(Member member);

	Member login(Member member);

	void logindate(Member member);

	int addMynotice(Profile profile);

	int addMyfree(Profile profile);

	int addNoticereply(Profile profile);

	int addFreereply(Profile profile);

	Member selectMember(String id);

	ArrayList<Profile> selectProfile(String id);

	int changeNickname(HashMap<String, String> map);

	int changeEmail(HashMap<String, String> map);

	int changePw(HashMap<String, String> map);

	ArrayList<SearchBoard> noticeList2(String searchText, RowBounds rB);

	ArrayList<SearchBoard> myfreeList2(String searchText, RowBounds rB);

	ArrayList<SearchBoard> noticereplyList2(String searchText, RowBounds rB);

	ArrayList<SearchBoard> freereplyList2(String searchText, RowBounds rB);


}
