package global.sesoc.tempcat.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.tempcat.vo.FreeBoard;
import global.sesoc.tempcat.vo.Member;
import global.sesoc.tempcat.vo.Profile;

/**
 * 개인정보 관련 DB처리를 담당
 */
@Repository
public class MemberDao {
	@Autowired
	private SqlSession session;
	boolean res;
	int intres;
	String stres;
	Member member;
	private Object profile;

	public boolean checkId(Member member) {
		// TODO Auto-generated method stub
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		member = mapper.checkId(member);
		if (member == null) {
			return false;
		}

		return true;
	}

	public HashMap<String, String> login(Member member) {
		// TODO Auto-generated method stub
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		member = mapper.login(member);
		HashMap<String, String> map = new HashMap<>();

		if (member == null)
			stres = "login error";
		else {
			stres = "login success";
			mapper.logindate(member);
		}
		map.put("stres", stres);
		map.put("id", member.getId());
		map.put("name", member.getName());
		map.put("nickname", member.getNickname());
		return map;
	}

	public String signup(Member member) {
		// TODO Auto-generated method stub
		stres = "";

		MemberMapper mapper = session.getMapper(MemberMapper.class);
		intres = mapper.signup(member);
		if (intres > 0)
			stres = "insert success";
		else {
			stres = "insert error";
		}
		return stres;
	}

	public boolean addMynotice(Profile profile) {
		// TODO Auto-generated method stub
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		intres = mapper.addMynotice(profile);
		return intres > 0;
	}

	public boolean addMyfree(Profile profile) {
		// TODO Auto-generated method stub
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		intres = mapper.addMyfree(profile);
		return intres > 0;
	}

	public boolean addNoticereply(Profile profile) {
		// TODO Auto-generated method stub
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		intres = mapper.addNoticereply(profile);
		return intres > 0;
	}

	public boolean addFreereply(Profile profile) {
		// TODO Auto-generated method stub
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		intres = mapper.addFreereply(profile);
		return intres > 0;
	}

	public Member selectMember(String id) {
		// TODO Auto-generated method stub
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		member = mapper.selectMember(id);
		return member;
	}

	public ArrayList<Profile> selectProfile(String id) {
		// TODO Auto-generated method stub
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		ArrayList<Profile> profile = mapper.selectProfile(id);
		return profile;
	}

	public boolean changeNickname(String id, String nickname) {
		// TODO Auto-generated method stub
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("nickname", nickname);
		intres = mapper.changeNickname(map);
		return intres>0;
	}

}
