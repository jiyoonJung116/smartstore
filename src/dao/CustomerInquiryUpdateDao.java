package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class CustomerInquiryUpdateDao {
	public void customerupdate(String answer_content,String seller_id,int serial_number) {
		Connection conn = Jdbc.connect();
		String sql = "UPDATE customer_inquiry SET answer_content=?"
				+ ", processing_date= SYSDATE, status='답변완료' WHERE seller_id=? AND serial_number=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,answer_content);
			pstmt.setString(2,seller_id);
			pstmt.setInt(3, serial_number);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
		try {
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}
	}
	public void Update(String inquiry_content,String seller_id,int serial_number) {
		Connection conn = Jdbc.connect();
		String sql = "UPDATE customer_inquiry SET inquiry_content=?"
				+ " WHERE seller_id=? AND serial_number=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,inquiry_content);
			pstmt.setString(2,seller_id);
			pstmt.setInt(3, serial_number);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
		try {
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}
	}
}
