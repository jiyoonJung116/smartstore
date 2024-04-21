package dto;

public class TalkNicknameDto {
	private long talk_num;
	private String nickname;
	public TalkNicknameDto(long talk_num, String nickname) {
		this.talk_num = talk_num;
		this.nickname = nickname;
	}
	public long getTalk_num() {
		return talk_num;
	}
	public void setTalk_num(long talk_num) {
		this.talk_num = talk_num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
