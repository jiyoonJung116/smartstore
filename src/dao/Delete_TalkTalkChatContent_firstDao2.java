//package dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.Scanner;
//
//import dto.톡톡상담Dto;
//
//public class delete_TalkTalkChatContent_firstDao2 {
//	public ArrayList<톡톡상담Dto> chatContent1(String date1, String date2, String read, String order) { 
//		Connection conn = Jdbc.connect();
//		ArrayList<톡톡상담Dto> listchat = new ArrayList<톡톡상담Dto>();
//
//		String sql = "SELECT ts.talk_num, p.pname, m.name, ts.talk_final_date, t.sender_id, t.talk_content, t.talk_time,ROUND((SYSDATE - t.talk_time) * 24 * 60, 2) AS diff_min" + 
//				" FROM talktalk_list ts" + 
//				" JOIN product p ON p.pnumber = ts.pnumber" + 
//				" JOIN member m ON m.id = ts.customer_id" + 
//				" JOIN (" + 
//				"  SELECT sender_id, talk_content, talk_time," + 
//				"    ROW_NUMBER() OVER (PARTITION BY sender_id ORDER BY talk_time DESC) AS row_num" + 
//				"  FROM talktalk_content" + 
//				") t ON t.sender_id = ts.customer_id" + 
//				" WHERE t.row_num = 1";
//		
//				
//		if(date1 != null) {
//			sql += " AND t.talk_time >= '" + date1 +"'";
//		}
//		if(date2 != null) {
//			sql += " AND t.talk_time <= '" + date2 +"'";
//		}
//		if(read != null) {
//			if(read.equals("안읽음")) {
//				sql+=" AND (SELECT COUNT(read_status) AS count" + 
//						" FROM talktalk_content" + 
//						" WHERE read_status = 0 AND talk_num = ts.talk_num)>0";
//			}
//		}
//		
//		if(order != null) {
//			if(order.equals("최근문의순")) {
//				sql +=	" ORDER BY t.talk_time DESC";
//			} else if(order.equals("먼저문의순")) {
//				sql += " ORDER BY t.talk_time";
//			}
//		} else {
//			sql +=	" ORDER BY t.talk_time DESC";
//		}
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				int talk_num = rs.getInt("talk_num");
//				String pname = rs.getString("pname");
//				String name = rs.getString("name");
//				String final_date = rs.getString("talk_final_date");
//				String sender_id = rs.getString("sender_id");
//				String talk_content = rs.getString("talk_content");
//				String talk_time = rs.getString("talk_time");
//				String strDate = talk_time.split(" ")[0];
//				String strTime = talk_time.split(" ")[1];
//				double diff = rs.getDouble("diff_min");
//				톡톡상담Dto dto = new 톡톡상담Dto(talk_num, pname, name, final_date, sender_id, talk_content, talk_time, strDate, strTime, diff);
//				listchat.add(dto);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				rs.close();
//				pstmt.close();
//				conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return listchat;
//	}
//}
