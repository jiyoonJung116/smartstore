package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.반품Dto;


public class 반품Dao {
	public ArrayList<반품Dto> get반품관리list(String menu, String date, String date2, String choose, String name, String res, long n) {
		if(menu==null)
			menu="반품요청일";
		if(choose==null)
			choose="수취인명";
		if(res==null)
			res="반품완료";
		
		Connection conn = Jdbc.connect();
		
		ArrayList<반품Dto> listReturnManage = new ArrayList<반품Dto>();
		
		String sql = "SELECT po.product_order_num, po.delivery_num, po.order_status, pr.return_status,"
				+ " po.pay_date, pr.return_request_date, pr.return_reason,pr.return_approval_date, pr.return_completed_date,po.pnumber,p.pcode,p.pname,pr.collection_status,"
				+ " CASE WHEN po.option_choose_code IS NULL THEN '없음' ELSE '있음' END AS 옵션정보, po.purchase_amount,"
				+ " CASE WHEN po.option_choose_code IS NULL THEN '없음' ELSE TO_CHAR(op.price) END AS 옵션가격,p.price AS 상품가격,"
				+ " d.total_price,m.name, po.buyer_id,po.recipient_name,p.delivery_cost AS \"배송비 유형\", p.delivery_cost AS \"배송비 합계\", d.phone, d.delivery_address, d.postnum"
				+ " FROM product_order po,product_return pr,product p,delivery d, product_option op, member m"
				+ " WHERE pr.product_order_num = po.product_order_num AND p.pnumber=po.pnumber AND po.delivery_num = d.delivery_num(+)"
				+ " AND op.option_serial_num(+)=po.option_choose_code AND po.buyer_id=m.id ";
		String sql2 = "AND po.pay_date BETWEEN ? AND ?";
		String sql3 = "AND pr.return_request_date BETWEEN ? AND ?";
		String sql4 = "AND pr.collection_finish_date BETWEEN ? AND ?";
		String ret = " AND pr.return_status =" + "'" + res + "'";
		String recpient = " AND po.recipient_name LIKE '%" + name + "%'";
		String buyer = " AND m.name LIKE '%" + name + "%'";
		String buyerId = " AND po.buyer_id LIKE '%" + name + "%'";
		String ponum = " AND po.product_order_num LIKE '%" + n + "%'";
		String ppnum = " AND p.pnumber LIKE '%" + n + "%'";
		String orderNum = " AND po.delivery_num LIKE '%" + n + "%'";
		switch (menu) {
		case "결제일":
			sql += sql2;
			break;
		case "수거완료일":
			sql += sql4;
			break;
		case "반품요청일":
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
		
		if (res.equals("반품요청") || res.equals("반품완료")) {
			sql += ret;
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
				String rss = rs.getString("return_status");
				String pd = rs.getString("pay_date");
				String rrd = rs.getString("return_request_date");
				String rr = rs.getString("return_reason");
				String rad = rs.getString("return_approval_date");
				String rcd = rs.getString("return_completed_date");
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
				
				
				반품Dto dto = new 반품Dto(pon, den, os, rss, pd, rrd, rr, rad, rcd, pnumber, pc, pn, cs, sales, pa, opp, p, tp, na, id, rn, dct, dc, phone, da, postn);
				listReturnManage.add(dto);
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
		return listReturnManage;

	}
	public ArrayList<반품Dto> get반품상태list(String sellerId,String res) {
		Connection conn = Jdbc.connect();
		
		ArrayList<반품Dto> listReturnManage = new ArrayList<반품Dto>();
		
		String sql = "SELECT po.product_order_num, po.delivery_num, po.order_status, pr.return_status,"
				+ " po.pay_date, pr.return_request_date, pr.return_reason,pr.return_approval_date, pr.return_completed_date,po.pnumber,p.pcode,p.pname,pr.collection_status,"
				+ " CASE WHEN po.option_choose_code IS NULL THEN '없음' ELSE '있음' END AS 옵션정보, po.purchase_amount,"
				+ " CASE WHEN po.option_choose_code IS NULL THEN '없음' ELSE TO_CHAR(op.price) END AS 옵션가격,p.price AS 상품가격,"
				+ " d.total_price,m.name, po.buyer_id,po.recipient_name,p.delivery_cost AS \"배송비 유형\", p.delivery_cost AS \"배송비 합계\", d.phone, d.delivery_address, d.postnum"
				+ " FROM product_order po,product_return pr,product p,delivery d, product_option op, member m"
				+ " WHERE po.seller_id='" + sellerId + "' "
				+ " AND pr.product_order_num = po.product_order_num AND p.pnumber=po.pnumber AND po.delivery_num = d.delivery_num(+)"
				+ " AND op.option_serial_num(+)=po.option_choose_code AND po.buyer_id=m.id ";
		String ret = " AND pr.return_status =" + "'" + res + "'";
		String ret2 = " AND pr.collection_status="+"'"+res+"'";
		
		if (res.equals("반품요청") || res.equals("반품완료")) {
			sql += ret;
		} else if(res.equals("수거중") || res.equals("수거완료")) {
			sql += ret2;
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
				String rss = rs.getString("return_status");
				String pd = rs.getString("pay_date");
				String rrd = rs.getString("return_request_date");
				String rr = rs.getString("return_reason");
				String rad = rs.getString("return_approval_date");
				String rcd = rs.getString("return_completed_date");
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
				
				
				반품Dto dto = new 반품Dto(pon, den, os, rss, pd, rrd, rr, rad, rcd, pnumber, pc, pn, cs, sales, pa, opp, p, tp, na, id, rn, dct, dc, phone, da, postn);
				listReturnManage.add(dto);
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
		return listReturnManage;
		
	}
}
