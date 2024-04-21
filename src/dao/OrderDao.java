package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class OrderDao {
	public void insert(String seller_id,String buyer_id,Long pnumber
			,int purchase_amount, String recipient_name,int option_choose_code
			,String deliveryAddress, String detailDeliveryAddress, String postNum, String phone,String delivery_message) {
		Connection conn = Jdbc.connect();
		//배송테이블에 먼저 insert : 왜냐면 배송테이블의 pk(delivery_num)가 order테이블에서 fk로 참조하기 때문
		String sql2 = "INSERT INTO delivery(seller_id, delivery_num, delivery_way, delivery_status, total_price, delivery_deadline, phone, delivery_address, detail_delivery_address, postnum, order_date_time,delivery_message)"
				+ " VALUES(?,seq_dnum.nextval,'택배','배송준비중',(SELECT price*? + product.delivery_cost FROM product WHERE pnumber=?),"
				+ "SYSDATE+7,?,?,?,?,SYSDATE,?)";
		//주문테이블에 insert : 배송테이블의 pk(배송번호)가져와서 넣어줌
		String sql = "INSERT INTO product_order(seller_id,product_order_num,delivery_num,pay_date,order_status,buyer_id,pnumber,claim_status,purchase_amount,recipient_name,option_choose_code)"
				 + " VALUES(?,seq_pon.nextval,seq_dnum.currval,SYSDATE,'결제완료',?,?,'정상',?,?,?)";

		 try {
			 PreparedStatement pstmt = null;
			 pstmt = conn.prepareStatement(sql2);
			 pstmt.setString(1, seller_id);
			 pstmt.setInt(2, purchase_amount);
			 pstmt.setLong(3, pnumber);
			 pstmt.setString(4, phone);
			 pstmt.setString(5, deliveryAddress);
			 pstmt.setString(6, detailDeliveryAddress);
			 pstmt.setString(7, postNum);
			 pstmt.setString(8, delivery_message);
			 pstmt.executeUpdate();
			 pstmt.close();

			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1,seller_id);
			 pstmt.setString(2,buyer_id);
			 pstmt.setLong(3,pnumber);
			 pstmt.setInt(4,purchase_amount);
			 pstmt.setString(5,recipient_name);
			 pstmt.setInt(6,option_choose_code);
			 pstmt.executeUpdate();
			 pstmt.close();
		 } catch(SQLException e) {
				 e.printStackTrace();
		 } finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
	}
}
