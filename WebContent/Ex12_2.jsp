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
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,dbId,dbPw);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.0.min.js"></script>
<script>
	$(function(){
		$("table tr").click(function(){
			let bno = $(this).find(".bno").text();
			location.href = "Ex12_2BoardDetail.jsp?bno="+bno;
		});
	});
</script>
<style>
	table{ border-collapse: collapse;}
	tr, td{border : 1px solid grey; padding : 8px;}
</style>
</head>
<body>
	<table>
		<tr>
			<td>글 번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일시</td>
		</tr>
		<%
			String sql = "SELECT * FROM board1 ORDER BY bno DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
		%>
		<tr>
			<td class="bno"><%=rs.getInt("bno") %></td>
			<td><%=rs.getString("title") %></td>
			<td><%=rs.getString("writer") %></td>
			<td><%=rs.getString("writedate") %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>