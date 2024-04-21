<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<% int bno = Integer.parseInt(request.getParameter("bno"));

%>
    <%
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "testw8";
		String dbPw = "pass1234";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
	%>
	<%
		String sql = "SELECT * FROM board1 ORDER BY bno DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		String title ="";
		String content ="";
		String writer="";
		String writedate="";
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
<script src= "js/jquery-3.7.0.min.js"></script>
<script>
	$(function(){
		$("#list_bo").click(function(){
			location.href="Ex12_4.jsp";
		});
		$("#list_delete").click(function(){
			location.href="Ex12_4DeleteAction.jsp?bno="+<%=bno%>;
		});
	});
</script>
<style>
	table { border-collapse: collapse;}
	tr, td { border : 1px solid grey; padding : 8px;}
</style>
</head>
<body>
	<table>
		<tr>
			<th>글번호</th>
			<td><%=bno %></td>
		</tr>
		<tr>
			<th>글제목</th>
			<td><%=title %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=content %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=writer %></td>
		</tr>
		<tr>
			<th>작성일시</th>
			<td><%=writedate %></td>
		</tr>
	</table>
	<button id="list_bo">목록으로</button>
	<button id="list_delete">삭제</button>
</body>
</html>