package dto;

public class ProductInsertDto {
	private String seller_id;
	private int category_id;
	private String pcode;
	private String pname;
	private String description;
	private int amount;
	private int price;
	private String vat;
	private String delivery_company;
	private int delivery_cost;
	private String return_delivery_company;
	private int return_delivery_cost;
	private int exchange_cost;
	private String manufacturer_name;
	private String brand_name;
	private String model_name;
	private String as_number;
	private String as_announcement;
	private String seller_note;
	private String notice;
	private String image;
	
	public ProductInsertDto(String seller_id, int category_id, String pcode, String pname, String description, int amount,
			int price, String vat, String delivery_company, int delivery_cost, String return_delivery_company,
			int return_delivery_cost, int exchange_cost, String manufacturer_name, String brand_name, String model_name,
			String as_number, String as_announcement, String seller_note, String notice, String image) {
		this.seller_id = seller_id;
		this.category_id = category_id;
		this.pcode = pcode;
		this.pname = pname;
		this.description = description;
		this.amount = amount;
		this.price = price;
		this.vat = vat;
		this.delivery_company = delivery_company;
		this.delivery_cost = delivery_cost;
		this.return_delivery_company = return_delivery_company;
		this.return_delivery_cost = return_delivery_cost;
		this.exchange_cost = exchange_cost;
		this.manufacturer_name = manufacturer_name;
		this.brand_name = brand_name;
		this.model_name = model_name;
		this.as_number = as_number;
		this.as_announcement = as_announcement;
		this.seller_note = seller_note;
		this.notice = notice;
		this.image = image;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
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

	public String getVat() {
		return vat;
	}

	public void setVat(String vat) {
		this.vat = vat;
	}

	public String getDelivery_company() {
		return delivery_company;
	}

	public void setDelivery_company(String delivery_company) {
		this.delivery_company = delivery_company;
	}

	public int getDelivery_cost() {
		return delivery_cost;
	}

	public void setDelivery_cost(int delivery_cost) {
		this.delivery_cost = delivery_cost;
	}

	public String getReturn_delivery_company() {
		return return_delivery_company;
	}

	public void setReturn_delivery_company(String return_delivery_company) {
		this.return_delivery_company = return_delivery_company;
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

	public String getAs_number() {
		return as_number;
	}

	public void setAs_number(String as_number) {
		this.as_number = as_number;
	}

	public String getAs_announcement() {
		return as_announcement;
	}

	public void setAs_announcement(String as_announcement) {
		this.as_announcement = as_announcement;
	}

	public String getSeller_note() {
		return seller_note;
	}

	public void setSeller_note(String seller_note) {
		this.seller_note = seller_note;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
}
