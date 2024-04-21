package dto;

public class MainViewDto {
	private int buyer_count;
	private String recent_count;
	public MainViewDto(int buyer_count, String recent_count) {
		this.buyer_count = buyer_count;
		this.recent_count = recent_count;
	}
	public int getBuyer_count() {
		return buyer_count;
	}
	public void setBuyer_count(int buyer_count) {
		this.buyer_count = buyer_count;
	}
	public String getRecent_count() {
		return recent_count;
	}
	public void setRecent_count(String recent_count) {
		this.recent_count = recent_count;
	}
}
