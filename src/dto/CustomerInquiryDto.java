package dto;

import java.sql.Date;

public class CustomerInquiryDto {
	private int serial_number;
	private Date inquiry_date2;
	private String status;
	private String inquiry_type;
	private Long product_order_num;
	private Long pnumber;
	private String inquiry_title;
	private String inquiry_content;
	private String answer_content;
	private String customer_id;
	private String pname;
	private Date processing_date;
	private String satisfaction;
	
	
	public CustomerInquiryDto(int serial_number, Date inquiry_date2, String status, String inquiry_type, Long product_order_num,
			Long pnumber, String inquiry_title, String inquiry_content, String answer_content, String customer_id,String pname,Date processing_date,
			String satisfaction) {
		this.serial_number = serial_number;
		this.inquiry_date2 = inquiry_date2;
		this.status = status;
		this.inquiry_type = inquiry_type;
		this.product_order_num = product_order_num;
		this.pnumber = pnumber;
		this.inquiry_title = inquiry_title;
		this.inquiry_content = inquiry_content;
		this.answer_content = answer_content;
		this.customer_id = customer_id;
		this.pname = pname;
		this.processing_date = processing_date;
		this.satisfaction = satisfaction;
	}
	public int getSerial_number() {
		return serial_number;
	}
	public void setSerial_number(int serial_number) {
		this.serial_number = serial_number;
	}
	public Date getInquiry_date2() {
		return inquiry_date2;
	}
	public void setInquiry_date2(Date inquiry_date2) {
		this.inquiry_date2 = inquiry_date2;
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
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
	public String getcustomer_id() {
		return customer_id;
	}
	public void setcustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getpname() {
		return pname;
	}
	public void setpname(String pname) {
		this.pname = pname;
	}
	public Date getProcessing_date() {
		return processing_date;
	}
	public void setProcessing_date(Date processing_date) {
		this.processing_date = processing_date;
	}
	public String getSatisfaction() {
		return satisfaction;
	}
	public void setSatisfaction(String satisfaction) {
		this.satisfaction = satisfaction;
	}
}

