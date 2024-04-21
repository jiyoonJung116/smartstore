package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.OptionDto;


public class OptionSelectDao {
	public OptionDto option1(long pnumber) {
		Connection conn = Jdbc.connect();
		OptionDto dto = null;
		String sql = "SELECT DISTINCT(name) FROM product_option WHERE pnumber=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pnumber);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				dto = new OptionDto(name);
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
		return dto;
	}
	// 옵션이름1의 내용들을 조회하는 메서드(ex)컬러라는 옵션이름1의 내용들:빨강,파랑...)
	// 파라미터 : long 상품번호, String 옵션이름1
	public ArrayList<OptionDto> option1(long pnumber,String name) {
		Connection conn = Jdbc.connect();
		ArrayList<OptionDto> optionList = new ArrayList<OptionDto>();
		String sql = "SELECT DISTINCT(value) FROM product_option WHERE pnumber=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pnumber);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String value = rs.getString("value");
				OptionDto dto = new OptionDto(name,value);
				optionList.add(dto);
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
		return optionList;
	}
	// 옵션이름2를 조회하는 메서드
	// 파라미터 : long 상품번호, String 옵션이름1, String 옵션값1 
	public OptionDto option2(long pnumber,String name,String value) {
		Connection conn = Jdbc.connect();
		OptionDto dto = null;
		String sql = "SELECT DISTINCT(name2) FROM product_option WHERE pnumber=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pnumber);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String name2 = rs.getString("name2");
				dto = new OptionDto(name, value, name2);
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
		return dto;
	}
	// 옵션이름2의 내용들을 조회하는 메서드(ex)사이즈라는 옵션이름2의 내용들:90,95,100...)
	// 파라미터 : long 상품번호, String 옵션이름1, String 옵션값1, String 옵션이름2
	public ArrayList<OptionDto> option2(long pnumber,String name,String value,String name2) {
		Connection conn = Jdbc.connect();
		ArrayList<OptionDto> optionList = new ArrayList<OptionDto>();
		String sql = "SELECT DISTINCT(value2) FROM product_option WHERE pnumber=? AND value=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pnumber);
			pstmt.setString(2, value);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String value2 = rs.getString("value2");
				OptionDto dto = new OptionDto(name,value,name2,value2);
				optionList.add(dto);
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
		return optionList;
	}
	// 옵션이름3를 조회하는 메서드
	// 파라미터 : long 상품번호, String 옵션이름1, String 옵션값1, String 옵션이름2, String 옵션값2 
	public OptionDto option3(long pnumber,String name,String value,String name2,String value2) {
		Connection conn = Jdbc.connect();
		OptionDto dto = null;
		String sql = "SELECT DISTINCT(name3) FROM product_option WHERE pnumber=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pnumber);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String name3 = rs.getString("name3");
				dto = new OptionDto(name, value, name2, value2,name3);
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
		return dto;
	}
	// 옵션이름3의 내용들을 조회하는 메서드(ex)무늬라는 옵션이름3의 내용들:줄무늬,꽃무늬,무늬없음...)
	// 파라미터 : long 상품번호, String 옵션이름1, String 옵션값1, String 옵션이름2, String 옵션이름3
	public ArrayList<OptionDto> option3(long pnumber,String name,String value,String name2,String value2, String name3) {
		Connection conn = Jdbc.connect();
		ArrayList<OptionDto> optionList = new ArrayList<OptionDto>();
		String sql = "SELECT DISTINCT(value3) FROM product_option WHERE pnumber=? AND value=? AND value2=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pnumber);
			pstmt.setString(2, value);
			pstmt.setString(3, value2);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String value3 = rs.getString("value3");
				OptionDto dto = new OptionDto(name,value,name2,value2,name3,value3);
				optionList.add(dto);
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
		return optionList;
	}	
	//옵션값들을 입력받아 옵션시리얼넘버를 리턴하는 메서드
	//파라미터 : long 상품번호, String 옵션값1, String 옵션값2, String 옵션값3
	public int optionNum(long pnumber, String value, String value2, String value3) {
		Connection conn = Jdbc.connect();
		String sql = "SELECT option_serial_num FROM product_option WHERE pnumber=? AND value=?"
				+ " AND value2=? AND value3=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int option_serial_num=0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pnumber);
			pstmt.setString(2, value);
			pstmt.setString(3, value2);
			pstmt.setString(4, value3);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				option_serial_num = rs.getInt("option_serial_num");
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
		return option_serial_num;
	}
}
