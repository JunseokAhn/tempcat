package global.sesoc.tempcat.vo;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String email;
	private String inputdate;
	private String logindate;

	public Member() {
	}

	public Member(String id, String pw, String name, String nickname, String email, String inputdate,
			String logindate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.inputdate = inputdate;
		this.logindate = logindate;
	}

}
