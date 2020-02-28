package global.sesoc.tempcat.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tempcat.vo.Member;


/**
 * 개인정보 관련 DB처리를 담당
 */
@Repository
public class DAO {
	@Autowired
	private SqlSession session;
	boolean res;
	Member member;
	
	public boolean checkId(Member member) {
		// TODO Auto-generated method stub
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		member = mapper.checkId(member);
		if(member==null) {
			return false;
		}
		
		return true;
	}
	
	public void login(Member member) {
		// TODO Auto-generated method stub
		
	}



	
	
	

}
