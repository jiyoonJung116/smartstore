package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductInsertDao {
	public void pinsert(String seller_id, int category_id, String pcode, String pname, String description, int amount,
			int price, String vat, String delivery_company, int delivery_cost, String return_delivery_company,
			int return_delivery_cost, int exchange_cost, String manufacturer_name, String brand_name, String model_name,
			String as_number, String as_announcement, String seller_note, String notice, String image) {
		Connection conn = Jdbc.connect();
		String sql = "INSERT INTO product(seller_id, pnumber, category_id, pcode, whether_payment, "
				+ "pname, description, sales_status, display_status, amount, price, vat, "
				+ "deliver_company,delivery_cost,return_deliver_company,return_delivery_cost,"
				+ "exchange_cost,manufacturer_name,brand_name,model_name,sales_end_period,product_registration, "
				+ "fi_modify,as_number,as_announcement,seller_note,notice,hitcount,like_count,temporary_storage,"
				+ "sales_start_period, image)" 
				+ " VALUES(?,seq_pnumber.nextval,?,?,'Y',?,?,'판매중','전시중',?,?,?"
				+ ",?,?,?,?,?,?,?,?,TO_DATE('','YYYY-MM-DD HH24:MI:SS'),"
				+ "SYSDATE, SYSDATE, ?, ?,?,?,'','','',SYSDATE,?)";

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seller_id);
			pstmt.setInt(2, category_id);
			pstmt.setString(3, pcode);
			pstmt.setString(4, pname);
			pstmt.setString(5, description);
			pstmt.setInt(6, amount);
			pstmt.setInt(7, price);
			pstmt.setString(8, vat);
			pstmt.setString(9, delivery_company);
			pstmt.setInt(10, delivery_cost);
			pstmt.setString(11, return_delivery_company);
			pstmt.setInt(12, return_delivery_cost);
			pstmt.setInt(13, exchange_cost);
			pstmt.setString(14, manufacturer_name);
			pstmt.setString(15, brand_name);
			pstmt.setString(16, model_name);
			pstmt.setString(17, as_number);
			pstmt.setString(18, as_announcement);
			pstmt.setString(19, seller_note);
			pstmt.setString(20, notice);
			pstmt.setString(21, image);
			pstmt.executeUpdate();
			pstmt.close();
			String sql2 = "UPDATE product_option SET pnumber = seq_pnumber.currval WHERE pnumber IS NULL";
			pstmt = conn.prepareStatement(sql2);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
