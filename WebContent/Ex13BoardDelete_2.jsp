<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%int bno = Integer.parseInt(request.getParameter("bno")); %>
     <%!
    	public Connection getConnection(){
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "testw8";
		String dbPw = "pass1234";
		
		Connection conn = null;
		try{
		Class.forName(driver);
		 conn = DriverManager.getConnection(url, dbId, dbPw);
		} catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		return conn;
    }
    %>
    <%
    	Connection conn = getConnection();
    	String sql = "DELETE FROM board1 WHERE bno=?";
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setInt(1,bno);
    	
    	pstmt.executeUpdate();
    	
    	pstmt.close();
    	conn.close();
    %>
    <script>
    	alert("삭제되었습니다!");
    	location.href="Ex13BoardList_2.jsp";
    </script>