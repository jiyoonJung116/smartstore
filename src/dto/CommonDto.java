package dto;

public class CommonDto {
	private String seller_id;
	private String color_theme;
	private String pc_gnb_location;
	public CommonDto(String seller_id, String color_theme, String pc_gnb_location) {
		this.seller_id = seller_id;
		this.color_theme = color_theme;
		this.pc_gnb_location = pc_gnb_location;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getColor_theme() {
		return color_theme;
	}
	public void setColor_theme(String color_theme) {
		this.color_theme = color_theme;
	}
	public String getPc_gnb_location() {
		return pc_gnb_location;
	}
	public void setPc_gnb_location(String pc_gnb_location) {
		this.pc_gnb_location = pc_gnb_location;
	}
	
	
}
