package dto;

public class CustomerInquiryInsertDto {
		private String seller_id;
		private String customer_id;
		private String status;
		private String inquiry_type;
		private Long product_order_num;
		private Long pnumber;
		private String inquiry_title;
		private String inquiry_content;
		private String satisfaction;
		
		public CustomerInquiryInsertDto(String seller_id, String customer_id, String status, String inquiry_type, Long product_order_num,
				Long pnumber, String inquiry_title, String inquiry_content, String satisfaction) {
			this.seller_id = seller_id;
			this.customer_id = customer_id;
			this.status = status;
			this.inquiry_type = inquiry_type;
			this.product_order_num = product_order_num;
			this.pnumber = pnumber;
			this.inquiry_title = inquiry_title;
			this.inquiry_content = inquiry_content;
			this.satisfaction = satisfaction;
		}
		public String getSeller_id() {
			return seller_id;
		}
		public void setSeller_id(String seller_id) {
			this.seller_id = seller_id;
		}
		public String getCustomer_id() {
			return customer_id;
		}
		public void setCustomer_id(String customer_id) {
			this.customer_id = customer_id;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getInquiry_type() {
			return inquiry_type;
		}
		public void setInquiry_type(String inquiry_type) {
			this.inquiry_type = inquiry_type;
		}
		public Long getProduct_order_num() {
			return product_order_num;
		}
		public void setProduct_order_num(Long product_order_num) {
			this.product_order_num = product_order_num;
		}
		public Long getPnumber() {
			return pnumber;
		}
		public void setPnumber(Long pnumber) {
			this.pnumber = pnumber;
		}
		public String getInquiry_title() {
			return inquiry_title;
		}
		public void setInquiry_title(String inquiry_title) {
			this.inquiry_title = inquiry_title;
		}
		public String getInquiry_content() {
			return inquiry_content;
		}
		public void setInquiry_content(String inquiry_content) {
			this.inquiry_content = inquiry_content;
		}
		public String getSatisfaction() {
			return satisfaction;
		}
		public void setSatisfaction(String satisfaction) {
			this.satisfaction = satisfaction;
		}
	}

