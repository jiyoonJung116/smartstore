package dto;

public class OptionDto {
	private String name;
	private String value;
	private String name2;
	private String value2;
	private String name3;
	private String value3;
	private int price;
	private int amount;
	private String sales_status;
	
	public OptionDto(String name) {
		this.name = name;
	}
	public OptionDto(String name, String value) {
		this.name = name;
		this.value = value;
	}
	public OptionDto(String name, String value, String name2) {
		this.name = name;
		this.value = value;
		this.name2 = name2;
	}
	public OptionDto(String name, String value, String name2, String value2) {
		this.name = name;
		this.value = value;
		this.name2 = name2;
		this.value2 = value2;
	}
	public OptionDto(String name, String value, String name2, String value2, String name3) {
		this.name = name;
		this.value = value;
		this.name2 = name2;
		this.value2 = value2;
		this.name3 = name3;
	}
	public OptionDto(String name, String value, String name2, String value2, String name3, String value3) {
		this.name = name;
		this.value = value;
		this.name2 = name2;
		this.value2 = value2;
		this.name3 = name3;
		this.value3 = value3;
	}
	public OptionDto(String name, String value, String name2, String value2, String name3, String value3,int price, int amount, String sales_status) {
		this.name = name;
		this.value = value;
		this.name2 = name2;
		this.value2 = value2;
		this.name3 = name3;
		this.value3 = value3;
		this.price = price;
		this.amount = amount;
		this.sales_status = sales_status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getValue2() {
		return value2;
	}
	public void setValue2(String value2) {
		this.value2 = value2;
	}
	public String getName3() {
		return name3;
	}
	public void setName3(String name3) {
		this.name3 = name3;
	}
	public String getValue3() {
		return value3;
	}
	public void setValue3(String value3) {
		this.value3 = value3;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getSales_status() {
		return sales_status;
	}
	public void setSales_status(String sales_status) {
		this.sales_status = sales_status;
	}
	
}
