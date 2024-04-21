<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String driver = "oracle.jdbc.driver.OracleDriver";
   	String url = "jdbc:oracle:thin:@localhost:1521:xe";
   	String dbId = "testw8";
   	String dbPw = "pass1234";
    %>
    <%
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	String name = request.getParameter("name");
    	
    	Class.forName(driver);
    	Connection conn = DriverManager.getConnection(url,dbId,dbPw);
    	
    	String sql = "SELECT * FROM member WHERE id=? AND pw=?";
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1,id);
    	pstmt.setString(2,pw);
    	
    	ResultSet rs = pstmt.executeQuery();
    	boolean loginSuccess = rs.next();
    	rs.close();
    	pstmt.close();
    	conn.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 연습</title>
</head>
<body>
	<% if (loginSuccess) { %>
            <h1>로그인되었습니다.</h1>
            <% } else { %>
            <h1>로그인 실패</h1>
            <% } %>
</body>
</html>