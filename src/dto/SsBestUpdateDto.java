package dto;

public class SsBestUpdateDto {
	private String seller_id;
	private String s_con;
	private String s_content;
	public SsBestUpdateDto(String seller_id, String s_con, String s_content) {
		super();
		this.seller_id = seller_id;
		this.s_con = s_con;
		this.s_content = s_content;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getS_con() {
		return s_con;
	}
	public void setS_con(String s_con) {
		this.s_con = s_con;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	
}
