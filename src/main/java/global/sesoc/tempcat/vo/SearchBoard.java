package global.sesoc.tempcat.vo;

import lombok.Data;

@Data
public class SearchBoard {
	private int noticenum;
	private int freenum;
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

	public SearchBoard() {
	}

}
