package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class CustomerInquiryInsertDao {
	
	public void inquiry(String seller_id,Long pnumber,String customer_id,String inquiry_content) {
		Connection conn = Jdbc.connect();
		 String sql = "INSERT INTO customer_inquiry(seller_id, customer_id,serial_number,inquiry_date,status,inquiry_type,"
		 			+ "product_order_num,pnumber,inquiry_title,inquiry_content,satisfaction)"
					+" VALUES(?,?,seq_inq.nextval,SYSDATE,'미답변','상품','',?,'상품문의',?,'-')";
			 PreparedStatement pstmt = null;
		 try {
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setString(1,seller_id);
			 pstmt.setString(2,customer_id);
			 pstmt.setLong(3, pnumber);
			 pstmt.setString(4,inquiry_content);
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
