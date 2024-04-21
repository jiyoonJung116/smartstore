package dto;

public class 카테고리Dto {
	private String large;
	private String middle;
	private String sub;
	private String small;
	
	public CategoryDto(String large) {
		this.large = large;
	}
	public 카테고리Dto(String large, String middle) {
		this.large = large;
		this.middle = middle;
	}
	public 카테고리Dto(String large, String middle, String sub) {
		this.large = large;
		this.middle = middle;
		this.sub = sub;
	}
	public 카테고리Dto(String large, String middle, String sub, String small) {
		this.large = large;
		this.middle = middle;
		this.sub = sub;
		this.small = small;
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
}
