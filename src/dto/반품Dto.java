package dto;

public class 반품Dto {
	private long pon;	//상품주문번호
	private long den;	//주문번호
	private String os;	//주문상태
	private String rss;	//반품처리상태
	private String pd;	//결제일
	private String rrd;	//반품요청일
	private String rr;	//반품사유
	private String rad;	//반품승인일
	private String rcd;	//반품완료일
	private long pnumber;	//상품번호
	private String pc;	//판매자 상품코드
	private String pn;	//상품명
	private String cs;
	private String sales;	//옵션정보
	private int pa;		//구매수량
	private String opp;	//옵션가격
	private int p;	//상품별 총 주문금액
	private int tp;	//상품가격
	private String na; //구매자명
	private String id;	//구매자ID
	private String rn;	//수취인명
	private String dct;	//배송비 유형
	private int dc;	//배송비 합계
	private String phone;	//구매자 연락처
	private String da;	//배송지
	private int postn;	//우편번호
	public 반품Dto(long pon, long den, String os, String rss, String pd, String rrd, String rr, String rad, String rcd,
			long pnumber, String pc, String pn, String cs, String sales, int pa, String opp, int p, int tp, String na,
			String id, String rn, String dct, int dc, String phone, String da, int postn) {
		super();
		this.pon = pon;
		this.den = den;
		this.os = os;
		this.rss = rss;
		this.pd = pd;
		this.rrd = rrd;
		this.rr = rr;
		this.rad = rad;
		this.rcd = rcd;
		this.pnumber = pnumber;
		this.pc = pc;
		this.pn = pn;
		this.cs = cs;
		this.sales = sales;
		this.pa = pa;
		this.opp = opp;
		this.p = p;
		this.tp = tp;
		this.na = na;
		this.id = id;
		this.rn = rn;
		this.dct = dct;
		this.dc = dc;
		this.phone = phone;
		this.da = da;
		this.postn = postn;
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
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getRss() {
		return rss;
	}
	public void setRss(String rss) {
		this.rss = rss;
	}
	public String getPd() {
		return pd;
	}
	public void setPd(String pd) {
		this.pd = pd;
	}
	public String getRrd() {
		return rrd;
	}
	public void setRrd(String rrd) {
		this.rrd = rrd;
	}
	public String getRr() {
		return rr;
	}
	public void setRr(String rr) {
		this.rr = rr;
	}
	public String getRad() {
		return rad;
	}
	public void setRad(String rad) {
		this.rad = rad;
	}
	public String getRcd() {
		return rcd;
	}
	public void setRcd(String rcd) {
		this.rcd = rcd;
	}
	public long getPnumber() {
		return pnumber;
	}
	public void setPnumber(long pnumber) {
		this.pnumber = pnumber;
	}
	public String getPc() {
		return pc;
	}
	public void setPc(String pc) {
		this.pc = pc;
	}
	public String getPn() {
		return pn;
	}
	public void setPn(String pn) {
		this.pn = pn;
	}
	public String getCs() {
		return cs;
	}
	public void setCs(String cs) {
		this.cs = cs;
	}
	public String getSales() {
		return sales;
	}
	public void setSales(String sales) {
		this.sales = sales;
	}
	public int getPa() {
		return pa;
	}
	public void setPa(int pa) {
		this.pa = pa;
	}
	public String getOpp() {
		return opp;
	}
	public void setOpp(String opp) {
		this.opp = opp;
	}
	public int getP() {
		return p;
	}
	public void setP(int p) {
		this.p = p;
	}
	public int getTp() {
		return tp;
	}
	public void setTp(int tp) {
		this.tp = tp;
	}
	public String getNa() {
		return na;
	}
	public void setNa(String na) {
		this.na = na;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}
	public String getDct() {
		return dct;
	}
	public void setDct(String dct) {
		this.dct = dct;
	}
	public int getDc() {
		return dc;
	}
	public void setDc(int dc) {
		this.dc = dc;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDa() {
		return da;
	}
	public void setDa(String da) {
		this.da = da;
	}
	public int getPostn() {
		return postn;
	}
	public void setPostn(int postn) {
		this.postn = postn;
	}
	
}
