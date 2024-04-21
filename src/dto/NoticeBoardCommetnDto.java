package dto;

public class NoticeBoardCommetnDto {
	private int rno;
	private String writerId;
	private String content;
	private String writedate;
	private String nickname;
	
	public NoticeBoardCommetnDto(int rno, String writerId, String content, String writedate, String nickname) {
		super();
		this.rno = rno;
		this.writerId = writerId;
		this.content = content;
		this.writedate = writedate;
		this.nickname = nickname;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
}
