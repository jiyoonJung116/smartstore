package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.PromotionImageDto;


public class TalktalkchatDao {
	public void chat(String sellerId, String customerId, String senderId, String chat, int num) {
		Connection conn = Jdbc.connect(); //판매자입장
		String sql = "INSERT INTO talktalk_content(serial_num, seller_id, talk_num, sender_id, talk_time, read_status, talk_content) "
		                 + "VALUES (seq_talktalk_content.nextval, ?, "
		                 + "(SELECT talk_num FROM talktalk_list WHERE customer_id = ? AND seller_id = ?), "
		                 + "?, sysdate, 0, ?)";
		

		String sql2 = "UPDATE talktalk_list" + 
							" SET talk_final_date = sysdate" + 
							" WHERE talk_num=?"; 

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellerId);
			pstmt.setString(2, customerId);
			pstmt.setString(3, sellerId);
			pstmt.setString(4, senderId);
			pstmt.setString(5, chat);
			pstmt.executeUpdate();

			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.executeUpdate();

		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    try {
		        if (pstmt != null) {
		        	pstmt.close();
		        }
		        if (pstmt2 != null) {
		        	pstmt2.close();
		        }
		        if (conn != null) {
		            conn.close();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}


	}
	public void chat(String sellerId, String customerId, String senderId, String chat) { // 구매자입장
		Connection conn = Jdbc.connect(); //구매자입장
		String sql = "INSERT INTO talktalk_content(serial_num, seller_id, talk_num, sender_id, talk_time, read_status, talk_content) "
				+ "VALUES (seq_talktalk_content.nextval, ?, "
				+ "(SELECT talk_num FROM talktalk_list WHERE customer_id = ? AND seller_id = ?), "
				+ "?, sysdate, 0, ?)";
		
		
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellerId);
			pstmt.setString(2, customerId);
			pstmt.setString(3, sellerId);
			pstmt.setString(4, senderId);
			pstmt.setString(5, chat);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}
		
	public int countByStatus(String status){   // "대기" / "진행중" / "전체" ---> 전체.
		Connection conn = Jdbc.connect();
		
		String sql = "SELECT count(*) FROM talktalk_list WHERE talk_status=?";
		if("전체".equals(status)) sql += " OR 1=1";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ret = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, status);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				ret = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				rs.close();
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return ret;
	}
	public static String getSellerIdFromNum(int num) {
		String retValue = "";
		Connection conn = Jdbc.connect();
		
		String sql = "SELECT seller_id FROM talktalk_list WHERE talk_num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				retValue = rs.getString(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				rs.close();
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return retValue;
	}
	public static String getCustomerIdFromNum(int num) {
		String retValue = "";
		Connection conn = Jdbc.connect();
		
		String sql = "SELECT customer_id FROM talktalk_list WHERE talk_num=?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				retValue = rs.getString(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				rs.close();
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return retValue;
	}
	
}
