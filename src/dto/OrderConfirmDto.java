package dto;

public class OrderConfirmDto {
	private long pon;	//상품주문번호
	private long den;	//주문번호
	private String dw;	//배송방법
	private String dc;	//택배사
	private String in;	//송장번호
	private String na;	//구매자명
	private String bi;	//구매자ID
	private String rn;	//수취인명
	private String os;	//주문상태
	private String payd;	//결제일
	private long pnumber;	//상품번호
	private String pname;	//상품명
	private long osn;	//옵션정보
	private String pa;	//구매수량
	private int opr;	//옵션가격
	private int price;	//상품가격
	private int tp;		//상품 총 가격
	private String dd;	//발송기한
	private String dda;	//발송일자
	private String dct;	//배송비유형
	private String da;	//발송지
	private String ddad;	//상세지주소
	private String phone;	//구매자연락처
	private int pn;		//우편번호
	private String dm;	//배송메세지
	private String ra;	//출시일
	private String odt;	//주문일자

	public OrderConfirmDto(long pon, long den, String dw, String dc, String in, String na, String bi, String rn, String os,
			String payd, long pnumber, String pname, String dd, String dda, String dct) {
		this.pon = pon;
		this.den = den;
		this.dw = dw;
		this.dc = dc;
		this.in = in;
		this.na = na;
		this.bi = bi;
		this.rn = rn;
		this.os = os;
		this.payd = payd;
		this.pnumber = pnumber;
		this.pname = pname;
		this.dd = dd;
		this.dda = dda;
		this.dct = dct;
	}

	public 주문확인Dto(long pon, long den, String dw, String dc, String in, String na, String bi, String rn, String os,
			String payd, long pnumber, String pname, long osn, String pa, int opr, int price, int tp, String dd,
			String dda, String dct, String da, String ddad, String phone, int pn, String dm, String ra, String odt) {
		this(pon, den, dw, dc, in, na, bi, rn, os, payd, pnumber, pname, dd, dda, dct);
		this.osn = osn;
		this.pa = pa;
		this.opr = opr;
		this.price = price;
		this.tp = tp;
		this.da = da;
		this.ddad = ddad;
		this.phone = phone;
		this.pn = pn;
		this.dm = dm;
		this.ra = ra;
		this.odt = odt;
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

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getPayd() {
		return payd;
	}

	public void setPayd(String payd) {
		this.payd = payd;
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

	public long getOsn() {
		return osn;
	}

	public void setOsn(long osn) {
		this.osn = osn;
	}

	public String getPa() {
		return pa;
	}

	public void setPa(String pa) {
		this.pa = pa;
	}

	public int getOpr() {
		return opr;
	}

	public void setOpr(int opr) {
		this.opr = opr;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTp() {
		return tp;
	}

	public void setTp(int tp) {
		this.tp = tp;
	}

	public String getDd() {
		return dd;
	}

	public void setDd(String dd) {
		this.dd = dd;
	}

	public String getDda() {
		return dda;
	}

	public void setDda(String dda) {
		this.dda = dda;
	}

	public String getDct() {
		return dct;
	}

	public void setDct(String dct) {
		this.dct = dct;
	}

	public String getDa() {
		return da;
	}

	public void setDa(String da) {
		this.da = da;
	}

	public String getDdad() {
		return ddad;
	}

	public void setDdad(String ddad) {
		this.ddad = ddad;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPn() {
		return pn;
	}

	public void setPn(int pn) {
		this.pn = pn;
	}

	public String getDm() {
		return dm;
	}

	public void setDm(String dm) {
		this.dm = dm;
	}

	public String getRa() {
		return ra;
	}

	public void setRa(String ra) {
		this.ra = ra;
	}

	public String getOdt() {
		return odt;
	}

	public void setOdt(String odt) {
		this.odt = odt;
	}
}
