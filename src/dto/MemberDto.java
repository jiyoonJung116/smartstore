package dto;

public class MemberDto {
	private String id;
	private String pw; 
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String phone;
	private String release_address;
	private String return_address;
	public MemberDto(String id, String pw, String name, String birth, String gender, String email, String phone, String release_address, String return_address) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.release_address = release_address;
		this.return_address = return_address;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRelease_address() {
		return release_address;
	}
	public void setRelease_address(String release_address) {
		this.release_address = release_address;
	}
	public String getReturn_address() {
		return return_address;
	}
	public void setReturn_address(String return_address) {
		this.return_address = return_address;
	}
}
