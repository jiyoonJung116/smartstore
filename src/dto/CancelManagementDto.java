package dto;

public class CancelManagementDto {
	private long pon; // 상품주문번호
	private long den; // 주문번호
	private String os; // 주문상태
	private String cs; // 취소처리상태
	private String pd; // 결제일시
	private String crd; // 취소요청일
	private String cr; // 취소사유
	private String cad; // 취소승인일
	private String ccd; // 취소완료일
	private long pnumber; // 상품번호
	private String pc; // 판매자상품코드
	private String pn; // 상품명
	private String sales; // 옵션정보
	private int pa; // 구매수량
	private String opp; // 옵션가격
	private int p; // 상품판매가격
	private int tp; // 총판매가격
	private String nm; //구매자명
	private String id; //구매자ID
	private String rn; //수취인명
	private String dct; //배송비 형태
	private int dc;     //배송비 합계
	private String phone; //구매자연락처
	private String da;	  //배송지
	private int postn;   //우편번호


	public CancelManagementDto(long pon, long den, String os, String cs, String pd, String crd, String cr, String cad, String ccd,
			long pnumber, String pc, String pn, String sales, int pa, String opp, int p, int tp, String nm, String id,
			String rn, String dct, int dc, String phone, String da, int postn) {
		super();
		this.pon = pon;
		this.den = den;
		this.os = os;
		this.cs = cs;
		this.pd = pd;
		this.crd = crd;
		this.cr = cr;
		this.cad = cad;
		this.ccd = ccd;
		this.pnumber = pnumber;
		this.pc = pc;
		this.pn = pn;
		this.sales = sales;
		this.pa = pa;
		this.opp = opp;
		this.p = p;
		this.tp = tp;
		this.nm = nm;
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

	public String getCs() {
		return cs;
	}

	public void setCs(String cs) {
		this.cs = cs;
	}

	public String getPd() {
		return pd;
	}

	public void setPd(String pd) {
		this.pd = pd;
	}

	public String getCrd() {
		return crd;
	}

	public void setCrd(String crd) {
		this.crd = crd;
	}

	public String getCr() {
		return cr;
	}

	public void setCr(String cr) {
		this.cr = cr;
	}

	public String getCad() {
		return cad;
	}

	public void setCad(String cad) {
		this.cad = cad;
	}

	public String getCcd() {
		return ccd;
	}

	public void setCcd(String ccd) {
		this.ccd = ccd;
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

	public String getNm() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm = nm;
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
