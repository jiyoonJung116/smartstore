package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class ReviewInsertDao {
	public void review(String seller_id,long product_order_num,String review_division,int buyer_grade,
			String photo_video,String review_content,String review_display_status){
		Connection conn = Jdbc.connect();
		 String sql = "INSERT INTO review(seller_id,product_order_num,review_division,buyer_grade,"
		 			+ "photo_video,review_content,review_registration_date,final_modify,review_num,review_display_status)"
				 	+" VALUES(?,?,?,?,?,?,SYSDATE,SYSDATE,seq_rev.nextval,?)";
		 PreparedStatement pstmt = null;
		 try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,seller_id);
			pstmt.setLong(2,product_order_num);
			pstmt.setString(3,review_division);
			pstmt.setInt(4,buyer_grade);
			pstmt.setString(5,photo_video);
			pstmt.setString(6,review_content);
			pstmt.setString(7,review_display_status);
			pstmt.executeUpdate();
		 } catch(SQLException e) {
			 e.printStackTrace();
		 }finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		 }
	}
}
