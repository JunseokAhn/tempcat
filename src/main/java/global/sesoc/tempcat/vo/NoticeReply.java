package global.sesoc.tempcat.vo;

import lombok.Data;

@Data
public class NoticeReply {
	private int num;
	private String id;
	private String nickname;
	private String contents;
	private String inputdate;

	public NoticeReply() {
	}

	public NoticeReply(int num, String id, String nickname, String contents, String inputdate) {
		super();
		this.num = num;
		this.id = id;
		this.nickname = nickname;
		this.contents = contents;
		this.inputdate = inputdate;
	}

	public NoticeReply(String id, String nickname, String contents) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.contents = contents;
	}

}
