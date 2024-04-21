package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.톡톡Dto;

public class TalkTalkChatContentDao {
	public ArrayList<톡톡Dto> chatContent(int num) {
		Connection conn = Jdbc.connect();
		ArrayList<톡톡Dto> listchat = new ArrayList<톡톡Dto>();

		String sql = "SELECT seller_id,sender_id,talk_content,talk_time, read_status " + 
				" FROM talktalk_content" + 
				" WHERE talk_num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String sellerId = rs.getString("seller_id");
				String senderId = rs.getString("sender_id");
				String talkContent = rs.getString("talk_content");
				boolean readStatus = rs.getInt("read_status")==1;
				String talkTime = rs.getString("talk_time");
				톡톡Dto dto = new 톡톡Dto(sellerId, senderId, talkContent, readStatus, talkTime);
				listchat.add(dto);
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
		return listchat;
	}
	
	public String getCustomerIdFromRoomNumber(int num) {
		Connection conn = Jdbc.connect();

		String sql = "SELECT customer_id" + 
				" FROM talktalk_list" + 
				" WHERE talk_num = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String customer_id = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				customer_id = rs.getString("customer_id");
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
		return customer_id;
	}
	public void talkstatusupdate(int num) {
		Connection conn =Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE talktalk_list " + 
				" SET talk_status ='완료'" + 
				" WHERE talk_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			 e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void setTalkContentStatusToRead(String loginId, int talkNum) {
		Connection conn =Jdbc.connect();
		String sql = "UPDATE talktalk_content" + 
				" SET read_status=1" + 
				" WHERE sender_id != ? AND read_status=0 AND talk_num=?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginId);
			pstmt.setInt(2,talkNum);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			 e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}
