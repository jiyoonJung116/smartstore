package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.SsBestPSelectDto;

public class SsBestPSelectDao {
	ArrayList<SsBestPSelectDto> best_p(String seller_id) {
		Connection conn = Jdbc.connect();
		ArrayList<SsBestPSelectDto> bestp = new ArrayList<SsBestPSelectDto>();
		
		String sql = 	"SELECT t2.*"
						+" FROM (SELECT rownum rnum, t1.*"
						+" FROM (SELECT p.pnumber, p.pname, c.large, c.middle, c.sub, "
						+" c.small, count(po.pnumber), p.hitcount, p.like_count, p.price, p.display_status"
						+" FROM  product p, category c, product_order po"
						+" WHERE p.category_id = c.category_id AND p.pnumber = po.pnumber(+) AND p.seller_id =?"
						+" GROUP BY p.pnumber, p.pname, c.large, c.middle, c.sub, c.small, p.hitcount, "
						+" p.like_count, p.price, p.display_status"
						+" ORDER BY p.hitcount DESC) t1) t2 "
						+" WHERE t2.rnum<=4";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,seller_id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
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
				SsBestPSelectDto dto = new SsBestPSelectDto(pnumber,pname,large,middle,sub,small,count,hitcount,like_count,price,display_status);
				bestp.add(dto);
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
		return bestp;
	}
}
