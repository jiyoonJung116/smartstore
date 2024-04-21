<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%int pageNum = 0;
    
    try{
    pageNum=Integer.parseInt(request.getParameter("page"));
    } catch(NumberFormatException e){
    	pageNum=1;
    }
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.0.min.js"></script>
<script>
	$(function(){
		$("tr").click(function(){
			let bno = $(this).find(".bno").text();
			location.href="Ex13BoardDetail_2.jsp?bno="+bno;
		});
		$("#write_bo").click(function(){
			location.href="Ex13BoardWrite_2.jsp";
		});
	});
</script>
<style>
	table { border-collapse: collapse;}
	tr,td { border : 1px solid grey; padding : 8px;}
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
			Connection conn = getConnection();
			String sql = "SELECT b2.* "
					+"FROM(SELECT rownum rnum,b1.* "
							+"FROM(SELECT * FROM board1 ORDER BY bno DESC) b1)b2 "
							+"WHERE b2.rnum>=? and b2.rnum<=?";
			int endNum = pageNum *10;
			int startNum = endNum-9;
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,startNum);
			pstmt.setInt(2,endNum);
			
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
	<div style="padding-left : 100px;">
		<%for(int i =1; i<=10; i++){ %>
			<a href = "Ex13BoardList_2.jsp?page=<%=i%>"><%=i %></a>
			<%} %>
	</div>
	<div>
	<button id="write_bo">글쓰기</button>
	</div>
</body>
</html>
<% rs.close();
	pstmt.close();
	conn.close();
	%>