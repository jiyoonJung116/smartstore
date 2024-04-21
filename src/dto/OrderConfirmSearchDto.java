package dto;

public class OrderConfirmSearchDto {
	private long pon;	//상품주문번호
	private String payd; //결제일자
	private String os;	//주문상태
	private String c;	//클레임상태
	private long pnumber; //상품번호
	private String pname; //상품명
	private int pa;		//구매수량
	private String na;	//구매자명
	private String bi;	//구매자ID
	private String rn;	//수취인명
	
	public OrderConfirmSearchDto(long pon, String payd, String os, String c, long pnumber, String pname, int pa, String na,
			String bi, String rn) {
		this.pon = pon;
		this.payd = payd;
		this.os = os;
		this.c = c;
		this.pnumber = pnumber;
		this.pname = pname;
		this.pa = pa;
		this.na = na;
		this.bi = bi;
		this.rn = rn;
	}

	public long getPon() {
		return pon;
	}

	public void setPon(long pon) {
		this.pon = pon;
	}

	public String getPayd() {
		return payd;
	}

	public void setPayd(String payd) {
		this.payd = payd;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}

	public long getPnumber() {
		return pnumber;
	}

	public void setPnumber(long pnumber) {
		this.pnumber = pnumber;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPa() {
		return pa;
	}

	public void setPa(int pa) {
		this.pa = pa;
	}

	public String getNa() {
		return na;
	}

	public void setNa(String na) {
		this.na = na;
	}

	public String getBi() {
		return bi;
	}

	public void setBi(String bi) {
		this.bi = bi;
	}

	public String getRn() {
		return rn;
	}

	public void setRn(String rn) {
		this.rn = rn;
	}
}
