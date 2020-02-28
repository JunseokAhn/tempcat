package global.sesoc.tempcat.dao;

import global.sesoc.tempcat.vo.Member;

public interface MemberMapper {

	Member checkId(Member member);

	int signup(Member member);

	

}
