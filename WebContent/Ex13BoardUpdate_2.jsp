<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    	String sql = "SELECT * FROM board1 WHERE bno=?";
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setInt(1,bno);
    	
    	ResultSet rs = pstmt.executeQuery();
    	String title ="";
    	String content = "";
    	String writer="";
    	String writedate = "";
    	if(rs.next()){
    		title = rs.getString("title");
    		content = rs.getString("content");
    		writer = rs.getString("writer");
    		writedate = rs.getString("writedate");
    	}
    	rs.close();
    	pstmt.close();
    	conn.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table { border-collapse: collapse;}
	tr,td { border : 1px solid grey; padding : 8px;}
</style>
</head>
<body>
	<form action="Ex13BoardUpdateAction_2.jsp" method="post">
	<table>
		<tr>
			<th>번호</th>
			<td><input type="text" name = "bno" value=<%=bno %>></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name= "title" value=<%=title %>></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content"><%=content %></textarea></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name = "writer" value=<%=writer %>></td>
		</tr>
	</table>
	<input type="submit" value="작성완료">
	</form>
</body>
</html>