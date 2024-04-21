package dto;

public class ReviewInsertDto {
	private String seller_id;
	private long product_order_num;
	private String review_division;
	private int buyer_grade;
	private String photo_video;
	private String review_content;
	private String review_display_status;
	public ReviewInsertDto(String seller_id, long product_order_num, String review_division, int buyer_grade,
			String photo_video, String review_content, String review_display_status) {
		super();
		this.seller_id = seller_id;
		this.product_order_num = product_order_num;
		this.review_division = review_division;
		this.buyer_grade = buyer_grade;
		this.photo_video = photo_video;
		this.review_content = review_content;
		this.review_display_status = review_display_status;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public long getProduct_order_num() {
		return product_order_num;
	}
	public void setProduct_order_num(long product_order_num) {
		this.product_order_num = product_order_num;
	}
	public String getReview_division() {
		return review_division;
	}
	public void setReview_division(String review_division) {
		this.review_division = review_division;
	}
	public int getBuyer_grade() {
		return buyer_grade;
	}
	public void setBuyer_grade(int buyer_grade) {
		this.buyer_grade = buyer_grade;
	}
	public String getPhoto_video() {
		return photo_video;
	}
	public void setPhoto_video(String photo_video) {
		this.photo_video = photo_video;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_display_status() {
		return review_display_status;
	}
	public void setReview_display_status(String review_display_status) {
		this.review_display_status = review_display_status;
	}
	
}
