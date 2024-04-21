package dto;

public class MenuManageUpdateDto {
	private String seller_id;
	private String s_con; 
	private int num;
	public MenuManageUpdateDto(String seller_id, String s_con, int num) {
		this.seller_id = seller_id;
		this.s_con = s_con;
		this.num = num;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}
