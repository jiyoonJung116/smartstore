package dto;

public class TalkContentReadDto {
	private long serial_num;
	private int read_status;
	public TalkContentReadDto(long serial_num, int read_status) {
		this.serial_num = serial_num;
		this.read_status = read_status;
	}
	public long getSerial_num() {
		return serial_num;
	}
	public void setSerial_num(long serial_num) {
		this.serial_num = serial_num;
	}
	public int getRead_status() {
		return read_status;
	}
	public void setRead_status(int read_status) {
		this.read_status = read_status;
	}
	
}
