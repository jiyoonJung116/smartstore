package dto;

public class DeliveryStatusManagementDto {
	private long pon;	//상품주문번호
	private long den;	//주문번호
	private String dd;	//발송처리일
	private String os;	//주문상태
	private String dw;	//배송방법
	private String dc;	//택배사
	private String in;	//송장번호
	
	public DeliveryStatusManagementDto(long pon, long den, String dd, String os, String dw, String dc, String in) {
		this.pon = pon;
		this.den = den;
		this.dd = dd;
		this.os = os;
		this.dw = dw;
		this.dc = dc;
		this.in = in;
	}
	
	public long getPon() {
		return pon;
	}
	public void setPon(long pon) {
		this.pon = pon;
	}
	public long getDen() {
		return den;
	}
	public void setDen(long den) {
		this.den = den;
	}
	public String getDd() {
		return dd;
	}
	public void setDd(String dd) {
		this.dd = dd;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getDw() {
		return dw;
	}
	public void setDw(String dw) {
		this.dw = dw;
	}
	public String getDc() {
		return dc;
	}
	public void setDc(String dc) {
		this.dc = dc;
	}
	public String getIn() {
		return in;
	}
	public void setIn(String in) {
		this.in = in;
	}
}
