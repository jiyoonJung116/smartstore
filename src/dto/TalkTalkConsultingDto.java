package dto;

public class TalkTalkConsultingDto {
	private int talk_num;	//대화방 번호
	private String name;	//실명
	private String final_date; //톡대화 최근날짜
	private String sender_id; //판매자id
	private String talk_content; //톡내용
	private String talk_time;	//톡톡내용
	private String strDate;
	private String strTime;
	private double diff;
	
	
	public TalkTalkConsultingDto(int talk_num, String name, String final_date, String sender_id, String talk_content,
			String talk_time, String strDate, String strTime, double diff) {
		this.talk_num = talk_num;
		this.name = name;
		this.final_date = final_date;
		this.sender_id = sender_id;
		this.talk_content = talk_content;
		this.talk_time = talk_time;
		this.strDate = strDate;
		this.strTime = strTime;
		this.diff = diff;
	}
	public int getTalk_num() {
		return talk_num;
	}
	public void setTalk_num(int talk_num) {
		this.talk_num = talk_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFinal_date() {
		return final_date;
	}
	public void setFinal_date(String final_date) {
		this.final_date = final_date;
	}
	public String getSender_id() {
		return sender_id;
	}
	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}
	public String getTalk_content() {
		return talk_content;
	}
	public void setTalk_content(String talk_content) {
		this.talk_content = talk_content;
	}
	public String getTalk_time() {
		return talk_time;
	}
	public void setTalk_time(String talk_time) {
		this.talk_time = talk_time;
	}
	public String getStrDate() {
		return strDate;
	}
	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}
	public String getStrTime() {
		return strTime;
	}
	public void setStrTime(String strTime) {
		this.strTime = strTime;
	}
	public double getDiff() {
		return diff;
	}
	public void setDiff(double diff) {
		this.diff = diff;
	}
	

	
	
	
	}
