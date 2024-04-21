<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "hr";
	String pw = "hr";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table,td,tr{
		border : 1px solid black;
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<%	Connection conn = null;
	//1. Connection 객체
		try{
			Class.forName(driver);
			out.println("<h1>JDBC 드라이버 로딩 성공</h1>");
			conn=DriverManager.getConnection(url, id, pw);
			out.println("<h1>Oracle 접속 성공</h1>");
		} catch(Exception e) {
			e.printStackTrace();
			out.println("<h1>오라클 접속 실패</h1>");
		}
		
		//2.PreparedStatement 객체
		String sql = "SELECT * FROM employees";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		//3. ResultSet 객체
		ResultSet rs =pstmt.executeQuery();
		while(rs.next()){
			
		%>
			<table>
				<tr>
				<th><%=rs.getString("first_name") %></th>
				<td><%=rs.getString("last_name") %></td>
				<td><%=rs.getInt("salary") %></td>
				</tr>
			</table>
		<%
		}
			rs.close();
			pstmt.close();
			conn.close();
		%>
</body>
</html>