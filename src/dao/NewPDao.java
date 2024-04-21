package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.NewPDto;


public class NewPDao {
	public ArrayList<NewPDto> select(String seller) {
		Connection conn = Jdbc.connect();
		ArrayList<NewPDto> newP = new ArrayList<NewPDto>();
		String sql = "SELECT p.pnumber, p.pname, c.large, c.middle, c.sub, c.small, count(po.pnumber), p.hitcount, p.like_count, p.price, p.display_status, p.image"
				+ " FROM product p, category c, product_order po"
				+ " WHERE p.category_id = c.category_id AND p.pnumber = po.pnumber(+) AND p.seller_id = ? AND p.sales_start_period >= SYSDATE-7"
				+ " GROUP BY p.pnumber, p.pname, c.large, c.middle, c.sub, c.small, p.hitcount, p.like_count, p.price, p.display_status, p.image";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seller);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				long pnumber = rs.getLong("pnumber");
				String pname = rs.getString("pname");
				String large = rs.getString("large");
				String middle = rs.getString("middle");
				String sub = rs.getString("sub");
				String small = rs.getString("small");
				int count = rs.getInt("count(po.pnumber)");
				int hitcount = rs.getInt("hitcount");
				int like_count = rs.getInt("like_count");
				int price = rs.getInt("price");
				String display_status = rs.getString("display_status");
				String image = rs.getString("image");
				NewPDto dto = new NewPDto(pnumber, pname, large, middle, sub, small, count, hitcount, like_count, price, display_status, image);
				newP.add(dto);
			}
		} catch(SQLException e) {
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
		return newP;
	}
}
