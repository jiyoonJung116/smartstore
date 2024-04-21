package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.주문통합검색Dto;


public class OrderAllSearchDao {
	public ArrayList<주문통합검색Dto> get주문통합검색List(String menu, String date, String date2, String choose, String name, long n) {
		if(menu==null)
			menu = "결제일";
		if(choose==null)
			choose = "수취인명";
		
		Connection conn = Jdbc.connect();
		ArrayList<주문통합검색Dto> listOrderAllSearch = new ArrayList<주문통합검색Dto>();
		String sql = "SELECT po.product_order_num, po.pay_date, "
				+ "po.order_status, po.claim_status,p.pnumber,p.pname, "
				+ "po.purchase_amount, m.name, po.buyer_id, po.recipient_name ";
		String sql2 = "FROM product_order po, member m, product p " + "WHERE po.buyer_id = m.id "
				+ "AND po.pnumber = p.pnumber AND pay_date BETWEEN ? AND ?";
		String sql3 = "FROM product_order po, member m, product p, delivery d " + "WHERE po.buyer_id = m.id "
				+ "AND po.pnumber = p.pnumber AND po.delivery_num = d.delivery_num "
				+ "AND delivery_date BETWEEN ? AND ?";
		String rec = " AND po.recipient_name LIKE '%" + name + "%'";
		String buyer = " AND name LIKE '%" + name + "%'";
		String phone = " AND m.phone LIKE '%" + name + "%'";
		String buyerId = " AND po.buyer_id LIKE '%" + name + "%'";
		String ppon =" AND po.product_order_num LIKE '%" + n + "%'";
		String pnum =" AND p.pnumber LIKE '%" + n + "%'";
		String deliver =" AND p.pnumber LIKE '%" + n + "%'";
		

		switch (menu) {
		case "결제일":
			sql += sql2;
			break;
		case "발송처리일":
			sql += sql3;
			break;
		}
		
		if (choose.equals("수취인명")) {
			sql += rec;
		} else if (choose.equals("구매자명")) {
			sql += buyer;
		} else if (choose.equals("구매자연락처")) {
			sql += phone;
		} else if (choose.equals("구매자ID")) {
			sql += buyerId;
		} else if (choose.equals("상품주문번호")) {
			sql += ppon;
		} else if (choose.equals("상품번호")) {
			sql += pnum;
		} else if (choose.equals("송장번호")) {
			sql += deliver;
		} 

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, date2);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				long pon = rs.getLong("product_order_num");
				String payd = rs.getString("pay_date");
				String os = rs.getString("order_status");
				String c = rs.getString("claim_status");
				long pnumber = rs.getLong("pnumber");
				String pname = rs.getString("pname");
				int pa = rs.getInt("purchase_amount");
				String na = rs.getString("name");
				String bi = rs.getString("buyer_id");
				String rn = rs.getString("recipient_name");
				
				주문통합검색Dto dto = new 주문통합검색Dto(pon, payd, os, c, pnumber, pname, pa, na, bi, rn);
				listOrderAllSearch.add(dto);
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
		return listOrderAllSearch;
	}
}
