package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.주문확인Dto;


public class OrderConfirmDao {
	public ArrayList<주문확인Dto> listOrderConfirm(String menu, String date, String date2, String choose, String name, String ors,
			long n, String desasc) {
		if(menu==null)
			menu="결제일";
		if(choose==null)
			choose="수취인명";
		if(ors==null)
			ors="";
		Connection conn = Jdbc.connect();
		ArrayList<주문확인Dto> listOrderConfirm = new ArrayList<주문확인Dto>();
		String sql = "SELECT po.product_order_num, d.delivery_num, d.delivery_way, p.deliver_company, "
				+ "d.invoice_num, m.name, po.buyer_id, po.recipient_name, "
				+ "po.order_status, po.pay_date, p.pnumber, p.pname, d.delivery_deadline, d.delivery_date, p.delivery_cost "
				+ "FROM product_order po, delivery d, member m, product p "
				+ "WHERE po.buyer_id = m.id AND po.pnumber = p.pnumber AND po.delivery_num = d.delivery_num ";
		String sql2 = "AND po.pay_date BETWEEN ? AND ? ";
		String sql3 = "AND po.delivery_num = d.delivery_num " + "AND d.delivery_date BETWEEN ? AND ?";

		String order = " AND po.order_status =" + "'" + ors + "'";
		String recpient = " AND po.recipient_name LIKE '%" + name + "%'";
		String phonenum = " AND m.phone LIKE '%" + name + "%'";
		String buyer = " AND m.name LIKE '%" + name + "%'";
		String buyerId = " AND po.buyer_id LIKE '%" + name + "%'";
		String ponum = " AND po.product_order_num LIKE '%" + n + "%'";
		String ppnum = " AND p.pnumber LIKE '%" + n + "%'";
		String orderNum = " AND po.delivery_num LIKE '%" + n + "%'";

		switch (menu) {
		case "결제일":
			sql += sql2;
			break;
		case "발송처리일":
			sql += sql3;

			break;
		}

		if (choose.equals("수취인명")) {
			sql += recpient;
		} else if (choose.equals("구매자명")) {
			sql += buyer;
		} else if (choose.equals("구매자연락처")) {
			sql += phonenum;
		} else if (choose.equals("구매자ID")) {
			sql += buyerId;
		} else if (choose.equals("상품주문번호")) {
			sql += ponum;
		} else if (choose.equals("상품번호")) {
			sql += ppnum;
		} else if (choose.equals("송장번호")) {
			sql += orderNum;
		}

		if (ors.equals("배송중") || ors.equals("배송완료")) {
			sql += order;
		}

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, date2);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ResultSet rs = null;
		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getInt("invoice_num") > 0) {
					long pon = rs.getLong("product_order_num");
					long den = rs.getLong("delivery_num");
					String dw = rs.getString("delivery_way");
					String dc = rs.getString("deliver_company");
					String in = rs.getString("invoice_num");
					String na = rs.getString("name");
					String bi = rs.getString("buyer_id");
					String rn = rs.getString("recipient_name");
					String os = rs.getString("order_status");
					String payd = rs.getString("pay_date");
					long pnumber = rs.getLong("pnumber");
					String pname = rs.getString("pname");
					String dd = rs.getString("delivery_deadline");
					String dda = rs.getString("delivery_date");
					String dct = (rs.getInt("delivery_cost") == 0 ? "무료" : "유료");

					주문확인Dto dto = new 주문확인Dto(pon, den, dw, dc, in, na, bi, rn, os, payd, pnumber, pname, dd, dda, dct);
					listOrderConfirm.add(dto);
				} else if (rs.getInt("invoice_num") < 0) {
					long pon = rs.getLong("product_order_num");
					long den = rs.getLong("delivery_num");
					String dw = rs.getString("delivery_way");
					String dc = rs.getString("deliver_company");
					String in = rs.getString("invoice_num");
					String na = rs.getString("name");
					String bi = rs.getString("buyer_id");
					String rn = rs.getString("recipient_name");
					String os = rs.getString("order_status");
					String payd = rs.getString("pay_date");
					long pnumber = rs.getLong("pnumber");
					String pname = rs.getString("pname");
					long osn = rs.getLong("option_serial_num");
					String pa = rs.getString("purchase_amount");
					int opr = rs.getInt("price");
					int price = rs.getInt("price");
					int tp = rs.getInt("total_price");
					String dd = rs.getString("delivery_deadline");
					String dda = rs.getString("delivery_date");
					String dct = (rs.getInt("delivery_cost") == 0 ? "무료" : "유료");
					String da = rs.getString("delivery_address");
					String ddad = rs.getString("detail_delivery_address");
					String phone = rs.getString("phone");
					int pn = rs.getInt("postnum");
					String dm = rs.getString("delivery_message");
					String ra = rs.getString("release_address");
					String odt = rs.getString("order_date_time");
					
					
					주문확인Dto dto = new 주문확인Dto(pon, den, dw, dc, in, na, bi, rn, os, payd, pnumber, pname, osn, pa, opr, price, tp, dd, dda, dct, da, ddad, phone, pn, dm, ra, odt);
					listOrderConfirm.add(dto);
				}

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
		return listOrderConfirm;
	}
}
