package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.AllProductDto;

public class AllProductSelectDao {
	//전체상품을 조회하는 메서드
		//파라미터 : String 판매자아이디, String 조회할기준(인기도순,최신등록순,낮은가격순,높은가격순,누적판매순,리뷰많은순,평점높은순)
		public ArrayList<AllProductDto> allSelect(String seller, String sq) {
			Connection conn = Jdbc.connect();
			ArrayList<AllProductDto> allP = new ArrayList<AllProductDto>();
			String sql = "SELECT p.pnumber, p.pname, c.large, c.middle, c.sub, c.small, count(po.pnumber), p.hitcount, p.like_count, p.price, p.display_status, p.image"
					+ " FROM product p, category c, product_order po"
					+ " WHERE p.category_id = c.category_id AND p.pnumber = po.pnumber(+) AND p.seller_id = ?"
					+ " GROUP BY p.pnumber, p.pname, c.large, c.middle, c.sub, c.small, p.hitcount, p.like_count, p.price, p.display_status, p.product_registration, p.image"
					+ " ORDER BY ";
			if(sq.equals("인기도순")) {
				sql += "p.like_count";
			}
			if(sq.equals("최신등록순")) {
				sql += "p.product_registration DESC";
			}
			if(sq.equals("낮은가격순")) {
				sql += "p.price";
			}
			if(sq.equals("높은가격순")) {
				sql += "p.price DESC";
			}
			if(sq.equals("누적판매순")) {
				sql += "(SELECT count(*) FROM review WHERE product_order_num IN (SELECT product_order_num FROM product_order WHERE pnumber = p.pnumber)) DESC"
						+ ",(SELECT count(product_order_num) FROM product_order WHERE claim_status = '정상') DESC";
			}
			if(sq.equals("리뷰많은순")) {
				sql += "(SELECT count(*) FROM review WHERE product_order_num IN (SELECT product_order_num FROM product_order WHERE pnumber = p.pnumber)) DESC";
			}
			if(sq.equals("평점높은순")) {
				sql += "ro.buyer_grade DESC";
			}
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
					AllProductDto dto = new AllProductDto(pnumber, pname, large, middle, sub, small, count, hitcount, like_count, price, display_status,image);
					allP.add(dto);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs!=null)
					rs.close();
					if(pstmt!=null)
					pstmt.close();
					if(conn!=null)
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return allP;
		}
}
