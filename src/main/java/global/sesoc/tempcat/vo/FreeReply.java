package global.sesoc.tempcat.vo;

import lombok.Data;

@Data
public class FreeReply {
	private int num;
	private String id;
	private String nickname;
	private String freenum;
	private String contents;
	private String inputdate;

	public FreeReply() {
	}

	public FreeReply(String id, String nickname, String freenum, String contents) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.freenum = freenum;
		this.contents = contents;
	}

	public FreeReply(int num, String id, String nickname, String freenum, String contents, String inputdate) {
		super();
		this.num = num;
		this.id = id;
		this.nickname = nickname;
		this.freenum = freenum;
		this.contents = contents;
		this.inputdate = inputdate;
	}

}
