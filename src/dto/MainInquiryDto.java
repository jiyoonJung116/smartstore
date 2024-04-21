package dto;

import java.sql.Date;

public class MainInquiryDto {
		private String inquiry_content;
		private Date inquiry_date;
		private String inquiry_title; 
		private String sender_id;
		private Date talk_time;
		private String talk_content;
		public MainInquiryDto(Date inquiry_date, String inquiry_content) {
			this.inquiry_date = inquiry_date;
			this.inquiry_content = inquiry_content;
		}
		public MainInquiryDto(String inquiry_title, Date inquiry_date) {
			this.inquiry_title = inquiry_title;
			this.inquiry_date = inquiry_date;
		}
		public MainInquiryDto(String sender_id, Date talk_time, String talk_content) {
			this.sender_id = sender_id;
			this.talk_time = talk_time;
			this.talk_content = talk_content;
		}
		public String getInquiry_content() {
			return inquiry_content;
		}
		public void setInquiry_content(String inquiry_content) {
			this.inquiry_content = inquiry_content;
		}
		public Date getInquiry_date() {
			return inquiry_date;
		}
		public void setInquiry_date(Date inquiry_date) {
			this.inquiry_date = inquiry_date;
		}
		public String getInquiry_title() {
			return inquiry_title;
		}
		public void setInquiry_title(String inquiry_title) {
			this.inquiry_title = inquiry_title;
		}
		public String getSender_id() {
			return sender_id;
		}
		public void setSender_id(String sender_id) {
			this.sender_id = sender_id;
		}
		public Date getTalk_time() {
			return talk_time;
		}
		public void setTalk_time(Date talk_time) {
			this.talk_time = talk_time;
		}
		public String getTalk_content() {
			return talk_content;
		}
		public void setTalk_content(String talk_content) {
			this.talk_content = talk_content;
		}
	}
