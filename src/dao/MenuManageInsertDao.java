package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class MenuManageInsertDao {
	public void menu_manage(String seller_id, int best_p,int new_p,int best_review_p,int free_p,
			int free_banner,int total_p,int footer) {
		Connection conn = Jdbc.connect();
		String sql = "INSERT INTO menu_manage(seller_id, best_p, new_p, best_review_p, free_p,free_banner,"
				+ "total_p, footer)"
				+" VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,seller_id);
			pstmt.setInt(2,best_p);
			pstmt.setInt(3,new_p);
			pstmt.setInt(4,best_review_p);
			pstmt.setInt(5,free_p);
			pstmt.setInt(6,free_banner);
			pstmt.setInt(7,total_p);
			pstmt.setInt(8,footer);
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
