package dto;

public class MenuManageInsertDto {
	private String seller_id;
	private int best_p; 
	private int new_p;
	private int best_review_p;
	private int free_p;
	private int free_banner;
	private int total_p;
	private int footer;
	public MenuManageInsertDto(String seller_id, int best_p, int new_p, int best_review_p, int free_p, int free_banner,
			int total_p, int footer) {
		super();
		this.seller_id = seller_id;
		this.best_p = best_p;
		this.new_p = new_p;
		this.best_review_p = best_review_p;
		this.free_p = free_p;
		this.free_banner = free_banner;
		this.total_p = total_p;
		this.footer = footer;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public int getBest_p() {
		return best_p;
	}
	public void setBest_p(int best_p) {
		this.best_p = best_p;
	}
	public int getNew_p() {
		return new_p;
	}
	public void setNew_p(int new_p) {
		this.new_p = new_p;
	}
	public int getBest_review_p() {
		return best_review_p;
	}
	public void setBest_review_p(int best_review_p) {
		this.best_review_p = best_review_p;
	}
	public int getFree_p() {
		return free_p;
	}
	public void setFree_p(int free_p) {
		this.free_p = free_p;
	}
	public int getFree_banner() {
		return free_banner;
	}
	public void setFree_banner(int free_banner) {
		this.free_banner = free_banner;
	}
	public int getTotal_p() {
		return total_p;
	}
	public void setTotal_p(int total_p) {
		this.total_p = total_p;
	}
	public int getFooter() {
		return footer;
	}
	public void setFooter(int footer) {
		this.footer = footer;
	}
	
}
