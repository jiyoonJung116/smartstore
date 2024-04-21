package dto;

public class CustomerInquiryUpdateDto {
	private String answer_content;
	private String seller_id;
	public CustomerInquiryUpdateDto(String answer_content, String seller_id) {
		this.answer_content = answer_content;
		this.seller_id = seller_id;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	
}
