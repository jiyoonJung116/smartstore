package dto;


public class ProductReviewDto {
		private String pname;
		private long product_order_num;
		private int review_num;

		public ProductReviewDto(String pname, long product_order_num, int review_num) {
			this.pname = pname;
			this.product_order_num = product_order_num;
			this.review_num = review_num;
		}
		public ProductReviewDto(String pname, long product_order_num) {
			this.pname = pname;
			this.product_order_num = product_order_num;
		}

		public String getPname() {
			return pname;
		}

		public void setPname(String pname) {
			this.pname = pname;
		}

		public long getProduct_order_num() {
			return product_order_num;
		}

		public void setProduct_order_num(long product_order_num) {
			this.product_order_num = product_order_num;
		}

		public int getReview_num() {
			return review_num;
		}

		public void setReview_num(int review_num) {
			this.review_num = review_num;
		}
		
		
		
	}

