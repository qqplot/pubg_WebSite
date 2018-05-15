package pubg.util;

public class NoticeBean {
   
	private final String ADOMIN_ID = "admin";
	
	
	private int regno;
	private String user_id = ADOMIN_ID;
	private String no_title;
	private String no_text;
	private String no_date;
	
	
	public int getRegno() {
		return regno;
	}
	public void setRegno(int regno) {
		this.regno = regno;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getNo_title() {
		return no_title;
	}
	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}
	public String getNo_text() {
		return no_text;
	}
	public void setNo_text(String no_text) {
		this.no_text = no_text;
	}
	public String getNo_date() {
		return no_date;
	}
	public void setNo_date(String no_date) {
		this.no_date = no_date;
	}
	
	
}
