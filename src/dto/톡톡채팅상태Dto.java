package dto;

public class 톡톡채팅상태Dto {
	private int talk_num;
	private String customer_id;
	
	public 톡톡채팅상태Dto(int talk_num, String customer_id) {
		super();
		this.talk_num = talk_num;
		this.customer_id = customer_id;
	}

	public int getTalk_num() {
		return talk_num;
	}

	public void setTalk_num(int talk_num) {
		this.talk_num = talk_num;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	

	
}
