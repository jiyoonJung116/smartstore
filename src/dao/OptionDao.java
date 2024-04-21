package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class OptionDao {
	public void option(String name, String fvalue,String seller_id) {
		Connection conn = Jdbc.connect();
		ArrayList<String> value = new ArrayList<>();
		String[] fvalue2 = fvalue.split(",");
		for (int i = 0; i < fvalue2.length; i++) {
			value.add(fvalue2[i]);
		}	
		String sql ="";
		PreparedStatement pstmt = null;
		try {
			for(int i=0; i<value.size(); i++) {
				sql = "INSERT INTO product_option(name, value,option_serial_num,sales_status,seller_id)" 
						+ " VALUES(?,?,seq_option.nextval,'판매중',?)" ;
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, value.get(i));
				pstmt.setString(3, seller_id);
				pstmt.executeUpdate();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
	}
	// 옵션등록하는 메서드(옵션종류2개일때)
	// 파라미터 : 옵션이름1 , 값1(콤마로 구분), 옵션이름2 , 값2(콤마로 구분)
	public void option(String name, String fvalue, String name2, String f2value) {
		Connection conn = Jdbc.connect();
		ArrayList<String> value = new ArrayList<>();
		ArrayList<String> value2 = new ArrayList<>();
		String[] fvalue2 = fvalue.split(",");
		for (int i = 0; i < fvalue2.length; i++) {
			value.add(fvalue2[i]);
		}
		String[] fvalue3 = f2value.split(",");
		for (int i = 0; i < fvalue3.length; i++) {
			value2.add(fvalue3[i]);
		}
		String sql ="";
		PreparedStatement pstmt = null;
		
		try {
			for(int i=0; i<value.size(); i++) {
				for(int j=0; j<value2.size(); j++) {
					sql = "INSERT INTO product_option(name, value, name2, value2,option_serial_num,sales_status)" 
							+ " VALUES(?,?,?,?,seq_option.nextval,'판매중')" ;
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, value.get(i));
					pstmt.setString(3, name2);
					pstmt.setString(4, value2.get(j));
					pstmt.executeUpdate();
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}
	// 옵션등록하는 메서드(옵션종류3개일때)
	// 파라미터 : 옵션이름1 , 값1(콤마로 구분), 옵션이름2 , 값2(콤마로 구분), 옵션이름3 , 값3(콤마로 구분)
	public void option(String name, String fvalue, String name2, String f2value, String name3, String f3value,String seller_id) {
		Connection conn = Jdbc.connect();
		ArrayList<String> value = new ArrayList<>();
		ArrayList<String> value2 = new ArrayList<>();
		ArrayList<String> value3 = new ArrayList<>();
		
		String[] fvalue2 = fvalue.split(",");
		for (int i = 0; i < fvalue2.length; i++) {
			value.add(fvalue2[i]);
		}
		
		String[] fvalue3 = f2value.split(",");
		for (int i = 0; i < fvalue3.length; i++) {
			value2.add(fvalue3[i]);
		}

		String[] fvalue4 = f3value.split(",");
		for (int i = 0; i < fvalue4.length; i++) {
			value3.add(fvalue4[i]);
		}
		String sql ="";
		PreparedStatement pstmt = null;
		
		try {
			for(int i=0; i<value.size(); i++) {
				for(int j=0; j<value2.size(); j++) {
					for(int k=0; k<value3.size(); k++) {
						sql = "INSERT INTO product_option(name, value, name2, value2, name3, value3,option_serial_num,sales_status,seller_id)" 
								+ " VALUES(?,?,?,?,?,?,seq_option.nextval,'판매중',?)" ;
						
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, name);
						pstmt.setString(2, value.get(i));
						pstmt.setString(3, name2);
						pstmt.setString(4, value2.get(j));
						pstmt.setString(5, name3);
						pstmt.setString(6, value3.get(k));
						pstmt.setString(7, seller_id);
						pstmt.executeUpdate();
					}
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
