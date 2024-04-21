package dto;

public class 톡톡Dto {
	private String sellerId;	//판매자ID
	private String senderId;	//발신자ID
	private String talkContent;	//톡톡내용
	private String customer_id; //구매자 id
	private boolean readStatus; // 1 : true, 0 : false
	private String talkTime;  // date --> Stringz
	

	public 톡톡Dto(String sellerId, String senderId, String talkContent, boolean readStatus, String talkTime) {
		this.sellerId = sellerId;
		this.senderId = senderId;
		this.talkContent = talkContent;
		this.readStatus = readStatus;
		this.talkTime = talkTime;
	}
	public 톡톡Dto(String sellerId, String senderId, String talkContent, String customer_id, boolean readStatus, String talkTime) {
		this(sellerId, senderId, talkContent,readStatus, talkTime);
		this.customer_id = customer_id;
	}
	

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getTalkContent() {
		return talkContent;
	}

	public void setTalkContent(String talkContent) {
		this.talkContent = talkContent;
	}


	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public boolean isReadStatus() {
		return readStatus;
	}

	public void setReadStatus(boolean readStatus) {
		this.readStatus = readStatus;
	}

	public String getTalkTime() {
		return talkTime;
	}

	public void setTalkTime(String talkTime) {
		this.talkTime = talkTime;
	}
	
	
}
