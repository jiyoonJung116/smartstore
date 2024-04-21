package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MenuManageUpdateDao {
	public void menu_manage(String seller_id,String s_con, int num) {
		Connection conn = Jdbc.connect();
		String a ="";
		
		if(s_con.equals("베스트상품")) {
			a = "best_p=?";
		}
		if(s_con.equals("신상품")) {
			a = "new_p=?";
		}
		if(s_con.equals("베스트리뷰상품")) {
			a = "best_review_p=?";
		}
		if(s_con.equals("자유상품")) {
			a = "free_p=?";
		}
		if(s_con.equals("자유배너")) {
			a= "free_banner=?";
		}
		if(s_con.equals("전체상품")) {
			a = "total_p=?";
		}
		if(s_con.equals("푸터")) {
			a = "footer=?";
		}
		String sql = "UPDATE menu_manage SET "+a+" WHERE SELLER_ID = ?";;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.setString(2,seller_id);
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
