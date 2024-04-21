package dto;

public class StoreDto {
	private String store_name;
	private String store_main_image;
	private String store_introduce;
	private String logo;
	
	public StoreDto(String store_name, String store_main_image, String store_introduce, String logo) {
		this.store_name = store_name;
		this.store_main_image = store_main_image;
		this.store_introduce = store_introduce;
		this.logo = logo;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_main_image() {
		return store_main_image;
	}

	public void setStore_main_image(String store_main_image) {
		this.store_main_image = store_main_image;
	}

	public String getStore_introduce() {
		return store_introduce;
	}

	public void setStore_introduce(String store_introduce) {
		this.store_introduce = store_introduce;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	
}
