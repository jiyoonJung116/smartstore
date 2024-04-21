package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.DeliveryStatusManagementDto;

public class DeliveryStatusManagementDao {
	public ArrayList<DeliveryStatusManagementDto> getDeliveryStatusManagementList(String menu, String date, String date2, String choose, String name, String ds, long n) {
		if(menu==null)
			menu="결제일";
		if(choose==null)
			choose="수취인명";
		if(ds==null)
			ds="";
		
		Connection conn = Jdbc.connect();
		ArrayList<DeliveryStatusManagementDto> listdeliveryMng = new ArrayList<DeliveryStatusManagementDto>();
		String sql = "SELECT po.product_order_num, d.delivery_num, d.delivery_way, p.deliver_company, "
				+ "d.invoice_num, m.name, po.buyer_id, po.recipient_name, "
				+ "po.order_status, po.pay_date, p.pnumber, p.pname, d.delivery_deadline, d.delivery_date, p.delivery_cost "
				+ "FROM product_order po, delivery d, member m, product p "
				+ "WHERE po.buyer_id = m.id AND po.pnumber = p.pnumber AND po.delivery_num = d.delivery_num ";
		String sql2 = "AND po.pay_date BETWEEN ? AND ? ";
		String sql3 = "AND delivery_date BETWEEN ? AND ?";
		String sql4 = "AND delivery_end BETWEEN ? AND ?";
		String orderStatus = " AND po.order_status =" + "'" + ds + "'";
		String recpient = " AND po.recipient_name LIKE '%" + name + "%'";
		String buyer = " AND m.name LIKE '%" + name + "%'";
		String phonenum = " AND m.phone LIKE '%" + name + "%'";
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
		case "배송완료일":
			sql += sql4;
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
		
		if(ds.equals("배송중") || ds.equals("배송완료")) {
			sql += orderStatus;
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
				long den = rs.getLong("delivery_num");
				String dd = rs.getString("delivery_date");
				String os = rs.getString("order_status");
				String dw = rs.getString("delivery_way");
				String dc = rs.getString("deliver_company");
				String in = rs.getString("invoice_num");
				DeliveryStatusManagementDto dto = new DeliveryStatusManagementDto(pon, den, dd, os, dw, dc, in);
				listdeliveryMng.add(dto);
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
		return listdeliveryMng;
	}
	public ArrayList<DeliveryStatusManagementDto> getDeliveryStatusList(String sellerId, String ds) {
		Connection conn = Jdbc.connect();
		ArrayList<DeliveryStatusManagementDto> listdeliveryMng = new ArrayList<DeliveryStatusManagementDto>();
		String sql = "SELECT po.product_order_num, d.delivery_num, d.delivery_way, p.deliver_company, "
				+ "d.invoice_num, m.name, po.buyer_id, po.recipient_name, "
				+ "po.order_status, po.pay_date, p.pnumber, p.pname, d.delivery_deadline, d.delivery_date, p.delivery_cost "
				+ "FROM product_order po, delivery d, member m, product p "
				+ "WHERE d.seller_id='" + sellerId + "' "
				+ "AND po.buyer_id = m.id AND po.pnumber = p.pnumber AND po.delivery_num = d.delivery_num ";
		String orderStatus = " AND po.order_status =" + "'" + ds + "'";
		
		if(ds.equals("배송중") || ds.equals("배송완료")) {
			sql += orderStatus;
		}
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				long pon = rs.getLong("product_order_num");
				long den = rs.getLong("delivery_num");
				String dd = rs.getString("delivery_date");
				String os = rs.getString("order_status");
				String dw = rs.getString("delivery_way");
				String dc = rs.getString("deliver_company");
				String in = rs.getString("invoice_num");
				DeliveryStatusManagementDto dto = new DeliveryStatusManagementDto(pon, den, dd, os, dw, dc, in);
				listdeliveryMng.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listdeliveryMng;
	}
}
