package dto;

import java.sql.Date;

public class ReviewDto {
	
		private Long product_order_num;
		private String review_division;
		private int buyer_grade;
		private String photo_video;
		private String review_content;
		private Date review_registration_date2;
		private Date fi_modify;
		private Long review_num;
		private String review_display_status;
		private int reviewNum;
		
		

		public ReviewDto(Long product_order_num, String review_division, int buyer_grade, String photo_video,
				String review_content, Date review_registration_date2, Date fi_modify, Long review_num,
				String review_display_status) {
			this.product_order_num = product_order_num;
			this.review_division = review_division;
			this.buyer_grade = buyer_grade;
			this.photo_video = photo_video;
			this.review_content = review_content;
			this.review_registration_date2 = review_registration_date2;
			this.fi_modify = fi_modify;
			this.review_num = review_num;
			this.review_display_status = review_display_status;
		}


		public ReviewDto(int buyer_grade, String photo_video, String review_content, Date review_registration_date2, int reviewNum) {
			this.buyer_grade = buyer_grade;
			this.photo_video = photo_video;
			this.review_content = review_content;
			this.review_registration_date2 = review_registration_date2;
			this.reviewNum = reviewNum;
		}
		
		public ReviewDto(int buyer_grade, String photo_video, String review_content, Date review_registration_date2, int reviewNum,Long product_order_num) {
			this(buyer_grade, photo_video, review_content, review_registration_date2, reviewNum);
			this.product_order_num = product_order_num;
		}


		public Long getProduct_order_num() {
			return product_order_num;
		}
		public void setProduct_order_num(Long product_order_num) {
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
		public Date getReview_registration_date2() {
			return review_registration_date2;
		}
		public void setReview_registration_date2(Date review_registration_date2) {
			this.review_registration_date2 = review_registration_date2;
		}
		public Date getFi_modify() {
			return fi_modify;
		}
		public void setFi_modify(Date fi_modify) {
			this.fi_modify = fi_modify;
		}
		public Long getReview_num() {
			return review_num;
		}
		public void setReview_num(Long review_num) {
			this.review_num = review_num;
		}
		public String getReview_display_status() {
			return review_display_status;
		}
		public void setReview_display_status(String review_display_status) {
			this.review_display_status = review_display_status;
		}

		public int getReviewNum() {
			return reviewNum;
		}

		public void setReviewNum(int reviewNum) {
			this.reviewNum = reviewNum;
		}
		
		

		
	}

