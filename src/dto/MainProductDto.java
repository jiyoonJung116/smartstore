package dto;

public class MainProductDto {
	private int salescnt;
	private int amount;
	public MainProductDto(int salescnt, int amount) {
		this.salescnt = salescnt;
		this.amount = amount;
	}
	public int getSalescnt() {
		return salescnt;
	}
	public void setSales_status(int salescnt) {
		this.salescnt = salescnt;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}
