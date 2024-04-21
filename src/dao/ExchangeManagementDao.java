package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.ExchangeDto;

public class ExchangeManagementDao {
	public ArrayList<ExchangeDto> getExchangeManagementList(String menu, String date, String date2, String choose, String name, String ps, long n) {
		if(menu==null)
			menu="교환요청일";
		if(choose==null)
			choose="수취인명";
		if(ps==null)
			ps="교환완료";
		Connection conn = Jdbc.connect();
		ArrayList<ExchangeDto> listExchangeMng = new ArrayList<ExchangeDto>();
		String sql = "SELECT po.product_order_num, po.delivery_num, po.order_status, e.exchange_processing_status," + 
				"po.pay_date, e.exchange_request_date, e.exchange_reason, e.exchange_approval_date," + 
				"e.exchange_completed_date, po.pnumber, p.pcode, p.pname,e.collection_status," + 
				" CASE WHEN po.option_choose_code IS NULL THEN '없음' ELSE '있음' END AS 옵션정보," + 
				" po.purchase_amount, CASE WHEN po.option_choose_code IS NULL THEN '없음' ELSE TO_CHAR(op.price) END AS 옵션가격," + 
				" p.price AS 상품가격, d.total_price, m.name, po.buyer_id, po.recipient_name," + 
				" p.delivery_cost AS \"배송비 유형\", p.delivery_cost AS \"배송비 합계\"," + 
				" d.phone, d.delivery_address, d.postnum" + 
				" FROM product_order po, exchange e, product p, product_option op, delivery d, member m" + 
				" WHERE e.product_order_num = po.product_order_num" + 
				"  AND p.pnumber = po.pnumber" + 
				"  AND op.option_serial_num(+) = po.option_choose_code" + 
				"  AND po.delivery_num = d.delivery_num(+)" + 
				"  AND po.buyer_id = m.id ";
		String sql2 = " AND po.pay_date BETWEEN ? AND ?";
		String sql3 = " AND e.exchange_request_date BETWEEN ? AND ?";
		String sql4 = "AND e.collection_completion_date BETWEEN ? AND ?";
		String exchange = " AND e.exchange_processing_status =" + "'" + ps + "'";
		String exchange2 = " AND e.collection_status="+"'"+ps+"'";
		String recpient = " AND po.recipient_name LIKE '%" + name + "%'";
		String buyer = " AND m.name LIKE '%" + name + "%'";
		String buyerId = " AND po.buyer_id LIKE '%" + name + "%'";
		String ponum = " AND po.product_order_num LIKE '%" + n + "%'";
		String ppnum = " AND p.pnumber LIKE '%" + n + "%'";
		
		switch (menu) {
		case "결제일":
			sql += sql2;
			break;
		case "교환요청일":
			sql += sql3;
			break;
		case "수거완료일":
			sql += sql4;
			break;
		}
		
		if (choose.equals("수취인명")) {
			sql += recpient;
		} else if (choose.equals("구매자명")) {
			sql += buyer;
		} else if (choose.equals("구매자ID")) {
			sql += buyerId;
		} else if (choose.equals("상품주문번호")) {
			sql += ponum;
		} else if (choose.equals("상품번호")) {
			sql += ppnum;
		}
		
		if(ps.equals("교환요청") || ps.equals("교환재배송중") || ps.equals("교환완료")) {
			sql += exchange;
		} else if(ps.equals("수거중") || ps.equals("수거완료")) {
			sql += exchange2;
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
				String os = rs.getString("order_status");
				String eps = rs.getString("exchange_processing_status");
				String pd = rs.getString("pay_date");
				String erd = rs.getString("exchange_request_date");
				String er = rs.getString("exchange_reason");
				String ead = rs.getString("exchange_approval_date");
				String ecd = rs.getString("exchange_completed_date");
				long pnumber = rs.getLong("pnumber");
				String pc = rs.getString("pcode");
				String pn = rs.getString("pname");
				String cs = rs.getString("collection_status");
				String sales = rs.getString("옵션정보");
				int pa = rs.getInt("purchase_amount");
				String opp = rs.getString("옵션가격");
				int p = rs.getInt("상품가격");
				int tp = rs.getInt("total_price");
				String na = rs.getString("name");
				String id = rs.getString("buyer_id");
				String rn = rs.getString("recipient_name");
				String dct = (rs.getInt("배송비 유형") == 0 ? "무료" : "유료");
				int dc = rs.getInt("배송비 합계");
				String phone = rs.getString("phone");
				String da = rs.getString("delivery_address");
				int postn = rs.getInt("postnum");
				
				ExchangeDto dto = new ExchangeDto(pon, den, os, eps, pd, erd, er, ead, ecd, pnumber, pc, pn, cs, sales, pa, opp, p, tp, na, id, rn, dct, dc, phone, da, postn);
				listExchangeMng.add(dto);
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
		return listExchangeMng;
	}
	public ArrayList<ExchangeDto> getExchangeStatusList(String sellerId,String ps) {
		Connection conn = Jdbc.connect();
		ArrayList<ExchangeDto> listExchangeMng = new ArrayList<ExchangeDto>();
		String sql = "SELECT po.product_order_num, po.delivery_num, po.order_status, e.exchange_processing_status," + 
				"po.pay_date, e.exchange_request_date, e.exchange_reason, e.exchange_approval_date," + 
				"e.exchange_completed_date, po.pnumber, p.pcode, p.pname,e.collection_status," + 
				" CASE WHEN po.option_choose_code IS NULL THEN '없음' ELSE '있음' END AS 옵션정보," + 
				" po.purchase_amount, CASE WHEN po.option_choose_code IS NULL THEN '없음' ELSE TO_CHAR(op.price) END AS 옵션가격," + 
				" p.price AS 상품가격, d.total_price, m.name, po.buyer_id, po.recipient_name," + 
				" p.delivery_cost AS \"배송비 유형\", p.delivery_cost AS \"배송비 합계\"," + 
				" d.phone, d.delivery_address, d.postnum" + 
				" FROM product_order po, exchange e, product p, product_option op, delivery d, member m" + 
				" WHERE e.seller_id='" + sellerId + "' "+
				" AND e.product_order_num = po.product_order_num" + 
				"  AND p.pnumber = po.pnumber" + 
				"  AND op.option_serial_num(+) = po.option_choose_code" + 
				"  AND po.delivery_num = d.delivery_num(+)" + 
				"  AND po.buyer_id = m.id ";
		String exchange = " AND e.exchange_processing_status =" + "'" + ps + "'";
		String exchange2 = " AND e.collection_status="+"'"+ps+"'";
		
		
		if(ps.equals("교환요청") || ps.equals("교환재배송중") || ps.equals("교환완료")) {
			sql += exchange;
		} else if(ps.equals("수거중") || ps.equals("수거완료")) {
			sql += exchange2;
		}
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				long pon = rs.getLong("product_order_num");
				long den = rs.getLong("delivery_num");
				String os = rs.getString("order_status");
				String eps = rs.getString("exchange_processing_status");
				String pd = rs.getString("pay_date");
				String erd = rs.getString("exchange_request_date");
				String er = rs.getString("exchange_reason");
				String ead = rs.getString("exchange_approval_date");
				String ecd = rs.getString("exchange_completed_date");
				long pnumber = rs.getLong("pnumber");
				String pc = rs.getString("pcode");
				String pn = rs.getString("pname");
				String cs = rs.getString("collection_status");
				String sales = rs.getString("옵션정보");
				int pa = rs.getInt("purchase_amount");
				String opp = rs.getString("옵션가격");
				int p = rs.getInt("상품가격");
				int tp = rs.getInt("total_price");
				String na = rs.getString("name");
				String id = rs.getString("buyer_id");
				String rn = rs.getString("recipient_name");
				String dct = (rs.getInt("배송비 유형") == 0 ? "무료" : "유료");
				int dc = rs.getInt("배송비 합계");
				String phone = rs.getString("phone");
				String da = rs.getString("delivery_address");
				int postn = rs.getInt("postnum");
				
				ExchangeDto dto = new ExchangeDto(pon, den, os, eps, pd, erd, er, ead, ecd, pnumber, pc, pn, cs, sales, pa, opp, p, tp, na, id, rn, dct, dc, phone, da, postn);
				listExchangeMng.add(dto);
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
		return listExchangeMng;
	}
}
