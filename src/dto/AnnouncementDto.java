package dto;

import java.sql.Date;

public class AnnouncementDto {
	private long pnumber;
	private long serialNum;
	private String displayStatus;
	private String subject;
	private String content;
	private Date startDate;
	private Date endDate;
	private Date regDate;
	
	public AnnouncementDto(long pnumber, long serialNum, String displayStatus, String subject, String content, Date startDate, Date endDate,
			Date regDate) {
		this.pnumber = pnumber;
		this.serialNum = serialNum;
		this.displayStatus = displayStatus;
		this.subject = subject;
		this.content = content;
		this.startDate = startDate;
		this.endDate = endDate;
		this.regDate = regDate;
	}

	public long getPnumber() {
		return pnumber;
	}
	
	public void setPnumber(long pnumber) {
		this.pnumber = pnumber;
	}
	
	public long getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(long serialNum) {
		this.serialNum = serialNum;
	}

	public String getDisplayStatus() {
		return displayStatus;
	}

	public void setDisplayStatus(String displayStatus) {
		this.displayStatus = displayStatus;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
