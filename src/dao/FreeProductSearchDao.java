package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.FreeProductDto;

public class FreeProductSearchDao extends 카테고리조회 {
	public ArrayList<FreeProductDto> getFreeProductList(String sellerId){
		Connection conn = Jdbc.connect();
		
		ArrayList<FreeProductDto> listFreeProduct = new ArrayList<FreeProductDto>();
		String sql = "SELECT p.pnumber, p.image,p.pname, p.sales_status, p.display_status, p.price," + 
				" (SELECT COUNT(*) FROM review WHERE product_order_num IN (SELECT product_order_num FROM product_order WHERE pnumber = p.pnumber)) AS 리뷰수," + 
				" (SELECT NVL(AVG(buyer_grade),0) FROM review WHERE product_order_num IN (SELECT product_order_num FROM product_order WHERE pnumber = p.pnumber)) AS 평점," + 
				" c.large, c.middle, c.sub, c.small,p.delivery_cost" + 
				" FROM product p, category c" + 
				" WHERE p.category_id = c.category_id";
		
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = null;
		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				long pnumber = rs.getLong("pnumber");
				String image = rs.getString("image");
				String pname = rs.getString("pname");
				String salesStatus = rs.getString("sales_status");
				String displayStatus = rs.getString("display_status");
				int price = rs.getInt("price");
				String large = rs.getString("large");
				String middle = rs.getString("middle");
				String sub = rs.getString("sub");
				String small=rs.getString("small");
				String dct = (rs.getInt("delivery_cost") == 0 ? "무료" : "유료");
				int reviewCount = rs.getInt(7);
				double grade = rs.getDouble(8);
				
				FreeProductDto free = new FreeProductDto(pnumber, image, pname, salesStatus, displayStatus, price, large, middle, sub, small, dct, reviewCount, grade);
				listFreeProduct.add(free);
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
		return listFreeProduct;
		
	}
}
