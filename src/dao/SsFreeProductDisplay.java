package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.자유상품상세검색Dto;

public class SsFreeProductDisplay {
	ArrayList<자유상품상세검색Dto> get자유상품List() {
		Connection conn = Jdbc.connect();

		ArrayList<자유상품상세검색Dto> listFreeProduct = new ArrayList<자유상품상세검색Dto>();
		String sql = "SELECT p.pnumber, p.image, p.pname, p.sales_status,"
				+ "p.display_status, p.price, c.large, c.middle, c.sub, c.small, p.delivery_cost,"
				+ "(SELECT COUNT(*) FROM review WHERE product_order_num IN (SELECT product_order_num FROM product_order WHERE pnumber = p.pnumber)), "
				+ "(SELECT AVG(buyer_grade) FROM review WHERE product_order_num IN (SELECT product_order_num FROM product_order WHERE pnumber = p.pnumber)) "
				+ "FROM product p, category c " + "WHERE p.category_id = c.category_id";

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
				String small = rs.getString("small");
				String dct = (rs.getInt("delivery_cost") == 0 ? "무료" : "유료");
				int reviewCount = rs.getInt(12);
				double grade = rs.getDouble(13);
				
				자유상품상세검색Dto free = new 자유상품상세검색Dto(pnumber, image, pname, salesStatus, displayStatus, price, large, middle, sub, small, dct, reviewCount, grade);
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

	ArrayList<자유상품상세검색Dto> get자유상품List2(String choose, String order) {
		Connection conn = Jdbc.connect();
		
		ArrayList<자유상품상세검색Dto> list자유상품manage2 = new ArrayList<자유상품상세검색Dto>();
		String sql = "SELECT p.pnumber, p.image, p.pname, p.sales_status,"
				+ "p.display_status, p.price, c.large, c.middle, c.sub, c.small, p.delivery_cost, "
				+ "(SELECT count(*) from review where product_order_num IN (SELECT product_order_num from product_order where pnumber = p.pnumber)) "
				+ ",(SELECT avg(buyer_grade) FROM review where product_order_num IN (SELECT product_order_num from product_order where pnumber = p.pnumber))"
				+ " FROM product p, category c, product_order po";
		String where = " WHERE p.category_id=c.category_id AND p.pnumber = po.pnumber";
		String free = " AND p.delivery_cost = 0";
		String groupBy = " GROUP BY p.pnumber, p.image, p.pname, p.sales_status, p.display_status, p.price, c.large, c.middle, c.sub, c.small, p.delivery_cost";
		String popular = ", likey l" + where + " AND p.pnumber=l.pnumber";
		String popular1 = groupBy + ", po.pnumber ORDER BY COUNT(l.pnumber) DESC";
		String register = groupBy + ", po.pnumber "
				+ "ORDER BY (SELECT COUNT(product_order_num) FROM product_order WHERE claim_status = '정상') DESC";
		String grpo = groupBy + ", po.pnumber ";
		String regidate = ", review ro" + where + " AND ro.product_order_num = po.product_order_num";
		String regd = "ORDER BY p.product_registration DESC";
		String review = "ORDER BY (SELECT count(*) from review where product_order_num IN (SELECT product_order_num from product_order where pnumber = p.pnumber)) DESC";

		if (choose.equals("무료배송")) {
			switch (order) {
			case "인기도순":
				sql += popular + free + popular1;
				break;

			case "누적판매순":
				sql += where + free + register;
				break;
			case "최신등록순":
				sql += regidate + free + regd;
				break;
			case "리뷰순":
				sql += regidate + free + review;
				break;
			}
		} else if (choose.equals("리뷰")) {
			switch (order) {
			case "인기도순":
				sql += popular + grpo + review + ",COUNT(l.pnumber) DESC";
				break;

			case "누적판매순":
				sql += regidate + groupBy + review + " ,(SELECT COUNT(product_order_num) FROM product_order WHERE claim_status = '정상') DESC";
				break;
			case "최신등록순":
				sql += regidate + groupBy+ ", p.product_registration "+ review+ " , p.product_registration DESC";
				break;
			case "리뷰순":
				sql += regidate +review;
				break;
			}
		} else if (choose.equals("전체")) {
			switch (order) {
			case "인기도순":
				sql += popular +popular1;
				break;
			case "누적판매순":
				sql += where+ register;
				break;
			case "최신등록순":
				sql += regidate+ regd;
				break;
			case "리뷰순":
				sql += regidate+ review;
				break;
			}
		}

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
				String small = rs.getString("small");
				String dct = (rs.getInt("delivery_cost") == 0 ? "무료" : "유료");
				int reviewCount = rs.getInt(12);
				double grade = rs.getDouble(13);
				
				자유상품상세검색Dto dto = new 자유상품상세검색Dto(pnumber, image, pname, salesStatus, displayStatus, price, large, middle, sub, small, dct, reviewCount, grade);
				list자유상품manage2.add(dto);
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
		return list자유상품manage2;
	}
}
