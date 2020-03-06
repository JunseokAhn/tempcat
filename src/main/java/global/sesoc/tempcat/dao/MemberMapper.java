package global.sesoc.tempcat.dao;

import global.sesoc.tempcat.vo.Member;
import global.sesoc.tempcat.vo.NoticeBoard;
import global.sesoc.tempcat.vo.Profile;

public interface MemberMapper {

	Member checkId(Member member);

	int signup(Member member);

	Member login(Member member);

	void logindate(Member member);

	int addMynotice(Profile profile);

	int addMyfree(Profile profile);


}
