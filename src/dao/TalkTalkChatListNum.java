package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.상담정렬Dto;


public class TalkTalkChatListNum {
	public ArrayList<상담정렬Dto> listdate(String choose) {
		Connection conn = Jdbc.connect();
		ArrayList<상담정렬Dto> listtalk = new ArrayList<상담정렬Dto>();
		String sql = "SELECT tl.customer_id, tl.nickname, tc.talk_content, p.pname, round((sysdate-tc.talk_time)*24*60,2) diff_min,tc.talk_time "
				+ "FROM talktalk_content tc " + "JOIN talktalk_list tl ON tc.talk_num = tl.talk_num "
				+ "JOIN product p ON p.pnumber = tl.pnumber " 
				+ "WHERE tc.talk_time IN (" 
				+ "  SELECT MAX(talk_time) "
				+ "  FROM talktalk_content " 
				+ "  GROUP BY talk_num ) ";
		switch (choose) {
		case "먼저 문의순":
			sql += "ORDER BY tl.talk_start_date";
			break;

		case "최근 문의순":
			sql += "ORDER BY tc.talk_time DESC";

			break;
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String customerId = rs.getString("customer_id");
				String nickName = rs.getString("nickname");
				String talkContent = rs.getString("talk_content");
				String pname = rs.getString("pname");
				String talkTime = rs.getString("talk_time");
				String strDate = talkTime.split(" ")[0];
				String strTime = talkTime.split(" ")[1];
				double diff = rs.getDouble("diff_min");
				
				상담정렬Dto dto = new 상담정렬Dto(customerId, nickName, talkContent, pname, talkTime, strDate, strTime, diff);
				listtalk.add(dto);
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
		return listtalk;
	}
}
