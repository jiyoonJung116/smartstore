package dto;

public class FreeProductDto2 {
	private int displayorder; //전시순서
	private long pnumber;	//상품번호
	private String image;
	private String pname;	//상품명
	private String large;	//대븐류
	private String middle;	//중분류
	private String sub;	//소분류
	private int ordercount;
	private int like; //좋아요수
	private int hitcount;//유입수
	private int price;	//판매가
	private String displayStatus;	//전시상태
	
	public FreeProductDto2(int displayorder, long pnumber, String image, String pname, String large, String middle,
			String sub, int ordercount, int like, int hitcount, int price, String displayStatus) {
		super();
		this.displayorder = displayorder;
		this.pnumber = pnumber;
		this.image = image;
		this.pname = pname;
		this.large = large;
		this.middle = middle;
		this.sub = sub;
		this.ordercount = ordercount;
		this.like = like;
		this.hitcount = hitcount;
		this.price = price;
		this.displayStatus = displayStatus;
	}
	public int getDisplayorder() {
		return displayorder;
	}
	public void setDisplayorder(int displayorder) {
		this.displayorder = displayorder;
	}
	public long getPnumber() {
		return pnumber;
	}
	public void setPnumber(long pnumber) {
		this.pnumber = pnumber;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getLarge() {
		return large;
	}
	public void setLarge(String large) {
		this.large = large;
	}
	public String getMiddle() {
		return middle;
	}
	public void setMiddle(String middle) {
		this.middle = middle;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public int getOrdercount() {
		return ordercount;
	}
	public void setOrdercount(int ordercount) {
		this.ordercount = ordercount;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDisplayStatus() {
		return displayStatus;
	}
	public void setDisplayStatus(String displayStatus) {
		this.displayStatus = displayStatus;
	}
	
	
	
	
	
	
	
}
