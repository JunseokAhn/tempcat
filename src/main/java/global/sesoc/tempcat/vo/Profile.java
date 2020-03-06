package global.sesoc.tempcat.vo;

import lombok.Data;

@Data
public class Profile {
	private String id;
	private int mynotice;
	private int myfree;
	private int noticereply;
	private int freereply;
	private int heartnotice;
	private int heartfree;
	
	public Profile() {}
	
}
