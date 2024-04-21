package dto;

import java.sql.Date;

public class ProductDto {
	private long pnumber;
	private String pcode;
	private String whetherPayment;
	private String pname;
	private String description;
	private String salesStatus;
	private String displayStatus;
	private int amount;
	private int price;
	private String deliverCompany;
	private String deliveryCostType;
	private int deliveryCost;
	private int return_delivery_cost;
	private int exchange_cost;
	private String large;
	private String middle;
	private String sub;
	private String small;
	private String manufacturer_name;
	private String brand_name;
	private String model_name;
	private Date sales_start_period;
	private Date sales_end_period;
	private Date product_registration;
	private Date fi_modify;
	private String image;
	public ProductDto(long pnumber, String pcode, String whetherPayment, String pname, String description,
			String salesStatus, String displayStatus, int amount, int price, String deliverCompany,
			String deliveryCostType, int deliveryCost, int return_delivery_cost, int exchange_cost, String large,
			String middle, String sub, String small, String manufacturer_name, String brand_name, String model_name,
			Date sales_start_period, Date sales_end_period, Date product_registration, Date fi_modify, String image) {
		this.pnumber = pnumber;
		this.pcode = pcode;
		this.whetherPayment = whetherPayment;
		this.pname = pname;
		this.description = description;
		this.salesStatus = salesStatus;
		this.displayStatus = displayStatus;
		this.amount = amount;
		this.price = price;
		this.deliverCompany = deliverCompany;
		this.deliveryCostType = deliveryCostType;
		this.deliveryCost = deliveryCost;
		this.return_delivery_cost = return_delivery_cost;
		this.exchange_cost = exchange_cost;
		this.large = large;
		this.middle = middle;
		this.sub = sub;
		this.small = small;
		this.manufacturer_name = manufacturer_name;
		this.brand_name = brand_name;
		this.model_name = model_name;
		this.sales_start_period = sales_start_period;
		this.sales_end_period = sales_end_period;
		this.product_registration = product_registration;
		this.fi_modify = fi_modify;
		this.image = image;
	}
	public long getPnumber() {
		return pnumber;
	}
	public void setPnumber(long pnumber) {
		this.pnumber = pnumber;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getWhetherPayment() {
		return whetherPayment;
	}
	public void setWhetherPayment(String whetherPayment) {
		this.whetherPayment = whetherPayment;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDeliverCompany() {
		return deliverCompany;
	}
	public void setDeliverCompany(String deliverCompany) {
		this.deliverCompany = deliverCompany;
	}
	public String getDeliveryCostType() {
		return deliveryCostType;
	}
	public void setDeliveryCostType(String deliveryCostType) {
		this.deliveryCostType = deliveryCostType;
	}
	public int getDeliveryCost() {
		return deliveryCost;
	}
	public void setDeliveryCost(int deliveryCost) {
		this.deliveryCost = deliveryCost;
	}
	public int getReturn_delivery_cost() {
		return return_delivery_cost;
	}
	public void setReturn_delivery_cost(int return_delivery_cost) {
		this.return_delivery_cost = return_delivery_cost;
	}
	public int getExchange_cost() {
		return exchange_cost;
	}
	public void setExchange_cost(int exchange_cost) {
		this.exchange_cost = exchange_cost;
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
	public String getManufacturer_name() {
		return manufacturer_name;
	}
	public void setManufacturer_name(String manufacturer_name) {
		this.manufacturer_name = manufacturer_name;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getModel_name() {
		return model_name;
	}
	public void setModel_name(String model_name) {
		this.model_name = model_name;
	}
	public Date getSales_start_period() {
		return sales_start_period;
	}
	public void setSales_start_period(Date sales_start_period) {
		this.sales_start_period = sales_start_period;
	}
	public Date getSales_end_period() {
		return sales_end_period;
	}
	public void setSales_end_period(Date sales_end_period) {
		this.sales_end_period = sales_end_period;
	}
	public Date getProduct_registration() {
		return product_registration;
	}
	public void setProduct_registration(Date product_registration) {
		this.product_registration = product_registration;
	}
	public Date getFi_modify() {
		return fi_modify;
	}
	public void setFi_modify(Date fi_modify) {
		this.fi_modify = fi_modify;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
