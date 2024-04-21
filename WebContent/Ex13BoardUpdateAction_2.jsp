<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); 
	int bno = Integer.parseInt(request.getParameter("bno")); 
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	String writedate = request.getParameter("writedate");
%>
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
    	String sql = "UPDATE board1 SET title=?, content=?, writer=?, writedate=? WHERE bno=?";
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1,title);
    	pstmt.setString(2, content);
    	pstmt.setString(3, writer);
    	pstmt.setString(4, writedate);
    	pstmt.setInt(5, bno);
    	
    	pstmt.executeUpdate();
    	pstmt.close();
    	conn.close();
    %>
    <script>
    	alert("수정되었습니다!");
    	location.href = "Ex13BoardDetail_2.jsp?bno="+<%=bno%>;
    </script>