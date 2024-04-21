package dto;

public class FreeProductDetailSearchDto {
	private long pnumber;	//상품번호
	private String image;	//이미지
	private String pname;	//상품명
	private String salesStatus;	//판매상태
	private String displayStatus;	//전시상태
	private int price;	//판매가
	private String large;	//대븐류
	private String middle;	//중분류
	private String sub;	//소분류
	private String small;	//세분류
	private String dct;	//배송비유형
	private int reviewCount;	//리뷰수
	private double grade;	//평점
	
	public FreeProductDetailSearchDto(long pnumber, String image, String pname, String salesStatus, String displayStatus, int price,
			String large, String middle, String sub, String small, String dct, int reviewCount, double grade) {
		this.pnumber = pnumber;
		this.image = image;
		this.pname = pname;
		this.salesStatus = salesStatus;
		this.displayStatus = displayStatus;
		this.price = price;
		this.large = large;
		this.middle = middle;
		this.sub = sub;
		this.small = small;
		this.dct = dct;
		this.reviewCount = reviewCount;
		this.grade = grade;
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

	public String getSalesStatus() {
		return salesStatus;
	}

	public void setSalesStatus(String salesStatus) {
		this.salesStatus = salesStatus;
	}

	public String getDisplayStatus() {
		return displayStatus;
	}

	public void setDisplayStatus(String displayStatus) {
		this.displayStatus = displayStatus;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public String getDct() {
		return dct;
	}

	public void setDct(String dct) {
		this.dct = dct;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "FreeProductDetailSearchDto [pnumber=" + pnumber + ", image=" + image + ", pname=" + pname + ", salesStatus="
				+ salesStatus + ", displayStatus=" + displayStatus + ", price=" + price + ", large=" + large
				+ ", middle=" + middle + ", sub=" + sub + ", small=" + small + ", dct=" + dct + ", reviewCount="
				+ reviewCount + ", grade=" + grade + "]";
	}
}
