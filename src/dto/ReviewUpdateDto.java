package dto;

public class ReviewUpdateDto {
	private String review_content;
	private Long product_order_num;
	public ReviewUpdateDto(String review_content, Long product_order_num) {
		this.review_content = review_content;
		this.product_order_num = product_order_num;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Long getProduct_order_num() {
		return product_order_num;
	}
	public void setProduct_order_num(Long product_order_num) {
		this.product_order_num = product_order_num;
	}
	
}
