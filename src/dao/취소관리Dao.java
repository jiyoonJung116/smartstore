package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.취소관리Dto;

public class 취소관리Dao {
	public ArrayList<취소관리Dto> get취소관리List(String menu, String date, String date2, String choose, String name, String pcs,
			long n) {
		if(menu==null)
			menu = "결제일";
		if(choose==null)
			choose = "수취인명";
		if(pcs==null)
			pcs = "취소요청";	
		Connection conn = Jdbc.connect();
		ArrayList<취소관리Dto> listCancelManage = new ArrayList<취소관리Dto>();
		String sql = "SELECT po.product_order_num, d.delivery_num, po.order_status, po.cancle_status, po.pay_date,"
				+ " po.cancle_request_date, po.cancle_reason, po.cancle_approval_date,"
				+ " po.cancle_completed_date, po.pnumber, p.pcode, p.pname,"
				+ " CASE WHEN po.option_choose_code IS NULL THEN '없음' ELSE '있음' END AS 옵션정보,po.purchase_amount,"
				+ " CASE WHEN po.option_choose_code IS NULL THEN '없음' ELSE TO_CHAR(op.price) END AS 옵션가격,p.price AS 상품가격,"
				+ " d.total_price,m.name, po.buyer_id, po.recipient_name,p.delivery_cost,p.delivery_cost, d.phone, d.delivery_address, d.postnum"
				+ " FROM product_order po, delivery d, product p, product_option op,member m"
				+ " WHERE po.delivery_num = d.delivery_num(+) AND p.pnumber=po.pnumber"
				+ " AND op.option_serial_num(+)=po.option_choose_code AND po.buyer_id=m.id AND cancle_request_date IS NOT NULL AND ";
		String sql2 = "po.pay_date BETWEEN ? AND ?";
		String sql3 = "po.cancle_completed_date BETWEEN ? AND ?";
		String cancleStatus = " AND po.cancle_status =";
		String recpient = " AND po.recipient_name LIKE '%" + name + "%'";
		String buyer = " AND m.name LIKE '%" + name + "%'";
		String buyerId = " AND po.buyer_id LIKE '%" + name + "%'";
		String ponum = " AND po.product_order_num LIKE '%" + n + "%'";
		String ppnum = " AND p.pnumber LIKE '%" + n + "%'";
		String orderNum = " AND po.delivery_num LIKE '%" + n + "%'";
		String pcs2 = "'" + pcs + "'";

		switch (menu) {
		case "결제일":
			sql += sql2;
			break;

		case "취소완료일":
			sql += sql3;
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
		} else if (choose.equals("주문번호")) {
			sql += orderNum;
		}

		if (pcs.equals("취소요청") || pcs.equals("취소완료")) {
			sql += cancleStatus + pcs2;
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
				long pon = rs.getLong("product_order_num");
				long den = rs.getLong("delivery_num");
				String os = rs.getString("order_status");
				String cs = rs.getString("cancle_status");
				String pd = rs.getString("pay_date");
				String crd = rs.getString("cancle_request_date");
				String cr = rs.getString("cancle_reason");
				String cad = rs.getString("cancle_approval_date");
				String ccd = rs.getString("cancle_completed_date");
				long pnumber = rs.getLong("pnumber");
				String pc = rs.getString("pcode");
				String pn = rs.getString("pname");
				String sales = rs.getString("옵션정보");
				int pa = rs.getInt("purchase_amount");
				String opp = rs.getString("옵션가격");
				int p = rs.getInt("상품가격");
				int tp = rs.getInt("total_price");
				String nm = rs.getString("name");
				String id = rs.getString("buyer_id");
				String rn = rs.getString("recipient_name");
				String dct = (rs.getInt("delivery_cost") == 0 ? "무료" : "유료");
				int dc = rs.getInt("delivery_cost");
				String phone = rs.getString("phone");
				String da = rs.getString("delivery_address");
				int postn = rs.getInt("postnum");

				취소관리Dto dto = new 취소관리Dto(pon, den, os, cs, pd, crd, cr, cad, ccd, pnumber, pc, pn, sales, pa, opp, p,
						tp, nm, id, rn, dct, dc, phone, da, postn);
				listCancelManage.add(dto);
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
		return listCancelManage;
	}
	public ArrayList<취소관리Dto> get취소상태List(String sellerId, String pcs) {
		Connection conn = Jdbc.connect();
		ArrayList<취소관리Dto> listCancelManage = new ArrayList<취소관리Dto>();
		String sql = "SELECT po.product_order_num, d.delivery_num, po.order_status, po.cancle_status, po.pay_date,"
				+ " po.cancle_request_date, po.cancle_reason, po.cancle_approval_date,"
				+ " po.cancle_completed_date, po.pnumber, p.pcode, p.pname,"
				+ " CASE WHEN po.option_choose_code IS NULL THEN '없음' ELSE '있음' END AS 옵션정보,po.purchase_amount,"
				+ " CASE WHEN po.option_choose_code IS NULL THEN '없음' ELSE TO_CHAR(op.price) END AS 옵션가격,p.price AS 상품가격,"
				+ " d.total_price,m.name, po.buyer_id, po.recipient_name,p.delivery_cost,p.delivery_cost, d.phone, d.delivery_address, d.postnum"
				+ " FROM product_order po, delivery d, product p, product_option op,member m"
				+ " WHERE po.seller_id='" + sellerId + "' "
				+ " AND po.delivery_num = d.delivery_num(+) AND p.pnumber=po.pnumber"
				+ " AND op.option_serial_num(+)=po.option_choose_code AND po.buyer_id=m.id AND cancle_request_date IS NOT NULL AND ";
		String cancleStatus = "po.cancle_status ="+"'" + pcs + "'";
		
		if (pcs.equals("취소요청") || pcs.equals("취소완료")) {
			sql += cancleStatus;
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
				long pon = rs.getLong("product_order_num");
				long den = rs.getLong("delivery_num");
				String os = rs.getString("order_status");
				String cs = rs.getString("cancle_status");
				String pd = rs.getString("pay_date");
				String crd = rs.getString("cancle_request_date");
				String cr = rs.getString("cancle_reason");
				String cad = rs.getString("cancle_approval_date");
				String ccd = rs.getString("cancle_completed_date");
				long pnumber = rs.getLong("pnumber");
				String pc = rs.getString("pcode");
				String pn = rs.getString("pname");
				String sales = rs.getString("옵션정보");
				int pa = rs.getInt("purchase_amount");
				String opp = rs.getString("옵션가격");
				int p = rs.getInt("상품가격");
				int tp = rs.getInt("total_price");
				String nm = rs.getString("name");
				String id = rs.getString("buyer_id");
				String rn = rs.getString("recipient_name");
				String dct = (rs.getInt("delivery_cost") == 0 ? "무료" : "유료");
				int dc = rs.getInt("delivery_cost");
				String phone = rs.getString("phone");
				String da = rs.getString("delivery_address");
				int postn = rs.getInt("postnum");
				
				취소관리Dto dto = new 취소관리Dto(pon, den, os, cs, pd, crd, cr, cad, ccd, pnumber, pc, pn, sales, pa, opp, p,
						tp, nm, id, rn, dct, dc, phone, da, postn);
				listCancelManage.add(dto);
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
		return listCancelManage;
	}
}
