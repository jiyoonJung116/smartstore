package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.톡톡Dto;
import dto.톡톡채팅상태Dto;

public class TalkTalkChatStatus {
	public ArrayList<톡톡채팅상태Dto> chatContent(String talkStatus) {
		Connection conn = Jdbc.connect();
		ArrayList<톡톡채팅상태Dto> listchatstatus = new ArrayList<톡톡채팅상태Dto>();

		String sql = "Select talk_num, customer_id" + 
				" FROM talktalk_list"; 
				
		if(talkStatus.equals("진행중")) {
			sql+= " WHERE talk_status='진행중'";
		} else if(talkStatus.equals("대기")) {
			sql+= " WHERE talk_status='대기'";
		} else if(talkStatus.equals("대기")) {
			sql+= " WHERE talk_status='완료'";
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int talk_num = rs.getInt("talk_num");
				String customer_id = rs.getString("customer_id");
				톡톡채팅상태Dto dto = new 톡톡채팅상태Dto(talk_num, customer_id);
				listchatstatus.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listchatstatus;
	}
	
}
