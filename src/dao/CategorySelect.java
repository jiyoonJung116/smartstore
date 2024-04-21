package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;
class 카테고리Dto {
	private String large;
	private String middle;
	private String sub;
	private String small;
	
	public 카테고리Dto(String large) {
		this.large = large;
	}
	public 카테고리Dto(String large, String middle) {
		this.large = large;
		this.middle = middle;
	}
	public 카테고리Dto(String large, String middle, String sub) {
		this.large = large;
		this.middle = middle;
		this.sub = sub;
	}
	public 카테고리Dto(String large, String middle, String sub, String small) {
		this.large = large;
		this.middle = middle;
		this.sub = sub;
		this.small = small;
	}

	public String getLarge() {
		return large;
	}

	public void setLarge(String large) {
		this.large = large;
	}

	public String getMiddle() {
		return middle;
	}

	public void setMiddle(String middle) {
		this.middle = middle;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getSmall() {
		return small;
	}

	public void setSmall(String small) {
		this.small = small;
	}
	
}
class 카테고리조회 {
	//카테고리 조회하는 메서드(대분류 조회)
	ArrayList<카테고리Dto> cate1() {
		Connection conn = Jdbc.connect();
		ArrayList<카테고리Dto> catList = new ArrayList<카테고리Dto>();
		String sql = "SELECT DISTINCT(large) FROM category";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String large = rs.getString("large");
				카테고리Dto dto = new 카테고리Dto(large);
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
	// 카테고리 조회 메서드(중분류 조회)
	// 파라미터 cate2(String) : 대분류 입력
	ArrayList<카테고리Dto> cate2(String large) {
		Connection conn = Jdbc.connect();
		ArrayList<카테고리Dto> catList = new ArrayList<카테고리Dto>();
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
				카테고리Dto dto = new 카테고리Dto(large,middle);
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

	// 카테고리 조회 메서드(소분류 조회)
	// 파라미터 cate2(String,String) : 대분류,중분류 입력
	ArrayList<카테고리Dto> cate3(String large, String middle) {
		Connection conn = Jdbc.connect();
		ArrayList<카테고리Dto> catList = new ArrayList<카테고리Dto>();
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
				카테고리Dto dto = new 카테고리Dto(large,middle,sub);
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

	// 카테고리 조회 메서드(세분류 조회)
	// 파라미터 cate2(String,String,String) : 대분류,중분류,소분류 입력
	ArrayList<카테고리Dto> cate4(String large, String middle, String sub) {
		Connection conn = Jdbc.connect();
		ArrayList<카테고리Dto> catList = new ArrayList<카테고리Dto>();
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
				카테고리Dto dto = new 카테고리Dto(large,middle,sub,small);
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
	//카테고리 시리얼넘버 리턴하는 메서드
	//categoryNum(String, String, String, String) : 대분류,중분류,소분류,세분류 입력
	int categoryNum(String large, String middle, String sub, String small) {
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

public class CategorySelect {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		카테고리조회 obj = new 카테고리조회();
		ArrayList<카테고리Dto> list = obj.cate1();
		for(카테고리Dto dto : list) {
			System.out.println(dto.getLarge());
		}
		System.out.print("대분류 선택>>");
		String large = sc.next();

		list = obj.cate2(large);
		for(카테고리Dto dto : list) {
			System.out.println(dto.getMiddle());
		}
		
		System.out.print("중분류 선택>>");
		String middle = sc.next();
		
		list = obj.cate3(large, middle);
		for(카테고리Dto dto : list) {
			System.out.println(dto.getSub());
		}
		
		System.out.print("소분류 선택>>");
		String sub = sc.next();
		
		list = obj.cate4(large, middle, sub);
		for(카테고리Dto dto : list) {
			System.out.println(dto.getSmall());
		}
		
		System.out.print("세분류 선택>>");
		String small = sc.next();
		
		int category_id = obj.categoryNum(large, middle, sub, small);
		System.out.println(category_id);

	}
}
