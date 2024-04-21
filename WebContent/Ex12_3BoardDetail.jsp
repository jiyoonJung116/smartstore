<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%int bno = Integer.parseInt(request.getParameter("bno")); %>
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
		
		String title = "";
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
<title>게시판 연습</title>
<script src="js/jquery-3.7.0.min.js"></script>
<script>
	$(function(){
		$("#btn_list").click(function(){
			location.href = "Ex12_3.jsp";
		});
		$("#btn_delete").click(function(){
			location.href = "Ex12_3DeleteAction.jsp?bno="+<%=bno%>;
		});
	});
</script>
<style>
	table { border-collapse: collapse;}
	tr, td{ border : 1px solid grey; padding : 8px;}
</style>
</head>
<body>
	<table>
		<tr>
			<th>글 번호</th>
			<td><%=bno %></td>
		</tr>
		<tr>
			<td>글 제목</td>
			<td><%=title %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=content %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=writer %></td>
		</tr>
		<tr>
			<td>작성일시</td>
			<td><%=writedate %></td>
		</tr>
	</table>
	<button id = "btn_list">목록으로</button>
	<button id = "btn_delete">삭제</button>
</body>
</html>