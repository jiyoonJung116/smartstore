package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.ProductDto;



public class ProductDao {
	
	public ArrayList<ProductDto> select(String a,String seller_id){
		Connection conn = Jdbc.connect();
		ArrayList<ProductDto> listP = new ArrayList<ProductDto>();
		String sql = "SELECT * FROM product p, category c WHERE p.category_id = c.category_id AND p.seller_id=? AND ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		if(a.equals("판매중")||a.equals("판매종료")) {
			sql += "P.sales_status=?" ;
			
		}
		if(a.equals("전시중")||a.equals("전시종료")) {
			sql += "P.display_status=?" ;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seller_id);
			pstmt.setString(2, a);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(sql);
			while(rs.next()) { //���� row�� ������ �հ��� �̵�, true ����.
				long pnumber = rs.getLong("pnumber");
				String pcode = rs.getString("pcode");
				String whetherPayment = rs.getString("whether_payment");
				String pname = rs.getString("pname");
				String description = rs.getString("description");
				String salesStatus = rs.getString("sales_status");
				String displayStatus = rs.getString("display_status");
				int amount = rs.getInt("amount");
				int price = rs.getInt("price");
				String deliverCompany = rs.getString("deliver_company");
				String deliveryCostType = (rs.getInt("delivery_cost")==0 ? "����" : "����");
				int deliveryCost = rs.getInt("delivery_cost");
				int return_delivery_cost = rs.getInt("return_delivery_cost");
				int exchange_cost = rs.getInt("exchange_cost");
				String large = rs.getString("large");
				String middle = rs.getString("middle");
				String sub = rs.getString("sub");
				String small = rs.getString("small");
				String manufacturer_name = rs.getString("manufacturer_name");
				String brand_name = rs.getString("brand_name");
				String model_name = rs.getString("model_name");
				Date sales_start_period = rs.getDate("sales_start_period");
				Date sales_end_period = rs.getDate("sales_end_period");
				Date product_registration = rs.getDate("product_registration");
				Date fi_modify = rs.getDate("fi_modify");
				String image = rs.getString("image");
				
				ProductDto dto = new ProductDto(pnumber,pcode,whetherPayment,pname,description,salesStatus,displayStatus,
						amount,price,deliverCompany,deliveryCostType,deliveryCost,return_delivery_cost,exchange_cost,
						large,middle,sub,small,manufacturer_name,brand_name,model_name,sales_start_period,sales_end_period,
						product_registration,fi_modify,image);
				listP.add(dto);
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
		return listP;
	}
	public ProductDto select1(long pnumber){
		Connection conn = Jdbc.connect();
		String sql = "SELECT * FROM product p, category c WHERE p.category_id = c.category_id AND p.pnumber=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDto dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pnumber);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(sql);
			while(rs.next()) { //���� row�� ������ �հ��� �̵�, true ����.
				String pcode = rs.getString("pcode");
				String whetherPayment = rs.getString("whether_payment");
				String pname = rs.getString("pname");
				String description = rs.getString("description");
				String salesStatus = rs.getString("sales_status");
				String displayStatus = rs.getString("display_status");
				int amount = rs.getInt("amount");
				int price = rs.getInt("price");
				String deliverCompany = rs.getString("deliver_company");
				String deliveryCostType = (rs.getInt("delivery_cost")==0 ? "����" : "����");
				int deliveryCost = rs.getInt("delivery_cost");
				int return_delivery_cost = rs.getInt("return_delivery_cost");
				int exchange_cost = rs.getInt("exchange_cost");
				String large = rs.getString("large");
				String middle = rs.getString("middle");
				String sub = rs.getString("sub");
				String small = rs.getString("small");
				String manufacturer_name = rs.getString("manufacturer_name");
				String brand_name = rs.getString("brand_name");
				String model_name = rs.getString("model_name");
				Date sales_start_period = rs.getDate("sales_start_period");
				Date sales_end_period = rs.getDate("sales_end_period");
				Date product_registration = rs.getDate("product_registration");
				Date fi_modify = rs.getDate("fi_modify");
				String image = rs.getString("image");
				
				dto = new ProductDto(pnumber,pcode,whetherPayment,pname,description,salesStatus,displayStatus,
						amount,price,deliverCompany,deliveryCostType,deliveryCost,return_delivery_cost,exchange_cost,
						large,middle,sub,small,manufacturer_name,brand_name,model_name,sales_start_period,sales_end_period,
						product_registration,fi_modify,image);
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
		return dto;
	}
}
