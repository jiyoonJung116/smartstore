package dto;

public class 상담정렬Dto {
	private String customerId;
	private String nickName;
	private String talkContent;
	private String pname;
	private String talkTime;
	private String strDate;
	private String strTime;
	private double diff;
	
	public 상담정렬Dto(String customerId, String nickName, String talkContent, String pname, String talkTime,
			String strDate, String strTime, double diff) {
		this.customerId = customerId;
		this.nickName = nickName;
		this.talkContent = talkContent;
		this.pname = pname;
		this.talkTime = talkTime;
		this.strDate = strDate;
		this.strTime = strTime;
		this.diff = diff;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTalkContent() {
		return talkContent;
	}

	public void setTalkContent(String talkContent) {
		this.talkContent = talkContent;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getTalkTime() {
		return talkTime;
	}

	public void setTalkTime(String talkTime) {
		this.talkTime = talkTime;
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
