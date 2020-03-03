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
	
	public NoticeBoard() {
	}

	public NoticeBoard(String id, String title, String contents) {
		super();
		this.id = id;
		this.title = title;
		this.contents = contents;
	}



}
