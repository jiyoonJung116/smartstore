package dto;

public class SsBestPSelectDto {
	private long pnumber;
	private String pname;
	private String large;
	private String middle;
	private String sub;
	private String small;
	private int count;
	private int hitcount;
	private int like_count;
	private int price;
	private String display_status;

	public SsBestPSelectDto(long pnumber, String pname, String large, String middle, String sub, String small, int count,
			int hitcount, int like_count, int price, String display_status) {
		this.pnumber = pnumber;
		this.pname = pname;
		this.large = large;
		this.middle = middle;
		this.sub = sub;
		this.small = small;
		this.count = count;
		this.hitcount = hitcount;
		this.like_count = like_count;
		this.price = price;
		this.display_status = display_status;
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
	public String getSmall() {
		return small;
	}
	public void setSmall(String small) {
		this.small = small;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDisplay_status() {
		return display_status;
	}
	public void setDisplay_status(String display_status) {
		this.display_status = display_status;
	}
}
