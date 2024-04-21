package dto;

public class SellerInformationDto {
	private String name;
	private String workplace;
	private String bank;
	private String bankNum;
	private String large;
	private String releaseAddress;
	private String returnAddress;
	
	public SellerInformationDto(String name, String workplace, String bank, String bankNum, String large, String releaseAddress,
			String returnAddress) {
		this.name = name;
		this.workplace = workplace;
		this.bank = bank;
		this.bankNum = bankNum;
		this.large = large;
		this.releaseAddress = releaseAddress;
		this.returnAddress = returnAddress;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWorkplace() {
		return workplace;
	}

	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBankNum() {
		return bankNum;
	}

	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}

	public String getLarge() {
		return large;
	}

	public void setLarge(String large) {
		this.large = large;
	}

	public String getReleaseAddress() {
		return releaseAddress;
	}

	public void setReleaseAddress(String releaseAddress) {
		this.releaseAddress = releaseAddress;
	}

	public String getReturnAddress() {
		return returnAddress;
	}

	public void setReturnAddress(String returnAddress) {
		this.returnAddress = returnAddress;
	}
}
