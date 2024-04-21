package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.CategoryDto;

public class CategoryDao {
	public ArrayList<CategoryDto> cate1() {
		Connection conn = Jdbc.connect();
		ArrayList<CategoryDto> catList = new ArrayList<CategoryDto>();
		String sql = "SELECT DISTINCT(large) FROM category";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String large = rs.getString("large");
				CategoryDto dto = new CategoryDto(large);
				catList.add(dto);
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
		return catList;
	}
	// Category 조회 메서드(중분류 조회)
	// 파라미터 cate2(String) : 대분류 입력
	public ArrayList<CategoryDto> cate2(String large) {
		Connection conn = Jdbc.connect();
		ArrayList<CategoryDto> catList = new ArrayList<CategoryDto>();
		String sql = "SELECT DISTINCT(middle) FROM category WHERE large = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, large);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ResultSet rs = null;
		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String middle = rs.getString("middle");
				CategoryDto dto = new CategoryDto(large,middle);
				catList.add(dto);
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
		return catList;
	}

	// Category 조회 메서드(소분류 조회)
	// 파라미터 cate2(String,String) : 대분류,중분류 입력
	public ArrayList<CategoryDto> cate3(String large, String middle) {
		Connection conn = Jdbc.connect();
		ArrayList<CategoryDto> catList = new ArrayList<CategoryDto>();
		String sql = "SELECT DISTINCT sub FROM category WHERE large = ? AND middle = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, large);
			pstmt.setString(2, middle);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ResultSet rs = null;
		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String sub = rs.getString("sub");
				CategoryDto dto = new CategoryDto(large,middle,sub);
				catList.add(dto);
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
		return catList;
	}

	// Category 조회 메서드(세분류 조회)
	// 파라미터 cate2(String,String,String) : 대분류,중분류,소분류 입력
	public ArrayList<CategoryDto> cate4(String large, String middle, String sub) {
		Connection conn = Jdbc.connect();
		ArrayList<CategoryDto> catList = new ArrayList<CategoryDto>();
		String sql = "SELECT small FROM category WHERE large = ? AND middle = ? AND sub =?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, large);
			pstmt.setString(2, middle);
			pstmt.setString(3, sub);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ResultSet rs = null;

		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String small = rs.getString("small");
				CategoryDto dto = new CategoryDto(large,middle,sub,small);
				catList.add(dto);
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
		return catList;
	}
	//Category 시리얼넘버 리턴하는 메서드
	//categoryNum(String, String, String, String) : 대분류,중분류,소분류,세분류 입력
	public int categoryNum(String large, String middle, String sub, String small) {
		Connection conn = Jdbc.connect();
		String sql = "SELECT category_id FROM category WHERE large=? AND middle=?"
				+ " AND sub=? AND small=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int category_id=0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, large);
			pstmt.setString(2, middle);
			pstmt.setString(3, sub);
			pstmt.setString(4, small);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				category_id = rs.getInt("category_id");
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
		return category_id;
	}
}
