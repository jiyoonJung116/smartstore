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
	// �ɼ��̸�1�� ������� ��ȸ�ϴ� �޼���(ex)�÷���� �ɼ��̸�1�� �����:����,�Ķ�...)
	// �Ķ���� : long ��ǰ��ȣ, String �ɼ��̸�1
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
	// �ɼ��̸�2�� ��ȸ�ϴ� �޼���
	// �Ķ���� : long ��ǰ��ȣ, String �ɼ��̸�1, String �ɼǰ�1 
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
	// �ɼ��̸�2�� ������� ��ȸ�ϴ� �޼���(ex)�������� �ɼ��̸�2�� �����:90,95,100...)
	// �Ķ���� : long ��ǰ��ȣ, String �ɼ��̸�1, String �ɼǰ�1, String �ɼ��̸�2
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
	// �ɼ��̸�3�� ��ȸ�ϴ� �޼���
	// �Ķ���� : long ��ǰ��ȣ, String �ɼ��̸�1, String �ɼǰ�1, String �ɼ��̸�2, String �ɼǰ�2 
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
	// �ɼ��̸�3�� ������� ��ȸ�ϴ� �޼���(ex)���̶�� �ɼ��̸�3�� �����:�ٹ���,�ɹ���,���̾���...)
	// �Ķ���� : long ��ǰ��ȣ, String �ɼ��̸�1, String �ɼǰ�1, String �ɼ��̸�2, String �ɼ��̸�3
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
	//�ɼǰ����� �Է¹޾� �ɼǽø���ѹ��� �����ϴ� �޼���
	//�Ķ���� : long ��ǰ��ȣ, String �ɼǰ�1, String �ɼǰ�2, String �ɼǰ�3
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
