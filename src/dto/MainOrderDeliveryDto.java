package dto;

public class MainOrderDeliveryDto {
	private String ready;
	private String omw;
	private String complete;
	private String neworder;
	public MainOrderDeliveryDto(String ready, String omw, String complete) {
		this.ready = ready;
		this.omw = omw;
		this.complete = complete;
	}
	public MainOrderDeliveryDto(String neworder) {
		this.neworder = neworder;
	}
	public String getReady() {
		return ready;
	}
	public void setReady(String ready) {
		this.ready = ready;
	}
	public String getOmw() {
		return omw;
	}
	public void setOmw(String omw) {
		this.omw = omw;
	}
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}
	public String getNeworder() {
		return neworder;
	}
	public void setNeworder(String neworder) {
		this.neworder = neworder;
	}
}
