package global.sesoc.tempcat.vo;

import lombok.Data;

@Data
public class NoticeBoard {
	private int noticenum;
	private String id;
	private String title;
	private String contents;
	private String inputdate;
	private int hits;
	private int heart;
	private String originalfile;
	private String savedfile;
	private String nickname;
	private int comments;

	public NoticeBoard() {
	}

	public NoticeBoard(String id, String title, String contents, String nickname) {
		super();
		this.id = id;
		this.title = title;
		this.contents = contents;
		this.nickname = nickname;
	}

	public NoticeBoard(int noticenum, String id, String title) {
		super();
		this.noticenum = noticenum;
		this.id = id;
		this.title = title;
	}

	public NoticeBoard(int noticenum, String id, String title, String contents, String nickname) {
		super();
		this.noticenum = noticenum;
		this.id = id;
		this.title = title;
		this.contents = contents;
		this.nickname = nickname;
	}

	public NoticeBoard(String id, String title, String contents, String originalfile, String savedfile,
			String nickname) {
		super();
		this.id = id;
		this.title = title;
		this.contents = contents;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
		this.nickname = nickname;
	}

}
