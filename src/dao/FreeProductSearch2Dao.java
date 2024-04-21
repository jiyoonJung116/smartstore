package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.FreeProductDto2;

public class FreeProductSearch2Dao {
	public ArrayList<FreeProductDto2> getFreeProductList(String sellerId){
		Connection conn = Jdbc.connect();
		
		ArrayList<FreeProductDto2> listFreeProduct = new ArrayList<FreeProductDto2>();
		String sql = "SELECT fad.display_order, p.image,p.pnumber, p.pname, c.large, c.middle, c.sub," + 
				"    SUM(CASE WHEN po.claim_status = '정상' THEN 1 ELSE 0 END) AS 주문수," + 
				"    COUNT(DISTINCT l.customer_id) AS 좋아요수," + 
				"    p2.hitcount," + 
				"    p.price, p.display_status" + 
				" FROM product p" + 
				" JOIN category c ON p.category_id = c.category_id" + 
				" JOIN freeproduct_add_delete fad ON fad.dp = p.pnumber" + 
				" LEFT JOIN product_order po ON po.pnumber = p.pnumber" + 
				" LEFT JOIN likey l ON l.pnumber = p.pnumber" + 
				" JOIN (" + 
				"  SELECT pnumber, hitcount" + 
				"  FROM product) p2 ON p.pnumber = p2.pnumber" + 
				" GROUP BY fad.display_order, p.image,p.pnumber, p.pname, c.large, c.middle, c.sub, p.price, p.display_status, p2.hitcount";
		
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
				int displayorder = rs.getInt("display_order");
				String image = rs.getString("image");
				long pnumber = rs.getLong("pnumber");
				String pname = rs.getString("pname");
				String large = rs.getString("large");
				String middle = rs.getString("middle");
				String sub = rs.getString("sub");
				int ordercount = rs.getInt(8);
				int like = rs.getInt(9);
				int hitcount = rs.getInt("hitcount");
				int price = rs.getInt("price");
				String displayStatus = rs.getString("display_status");
				
				FreeProductDto2 free = new FreeProductDto2(displayorder, pnumber, image, pname, large, middle, sub, ordercount, like, hitcount, price, displayStatus);
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
