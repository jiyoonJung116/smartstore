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
    	request.setCharacterEncoding("UTF-8");
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	String name = request.getParameter("name");
    	
    	Class.forName(driver);
    	Connection conn = DriverManager.getConnection(url,dbId,dbPw);
    	
    	String sql = "INSERT INTO member(id,pw,name) VALUES(?,?,?)";
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1,id);
    	pstmt.setString(2,pw);
    	pstmt.setString(3,name);
    	
    	//select -> pstmt.executeQuery() ->ResultSet 객체 참조값 리턴
    	// i u d -> pstmt.executeUpdate() -> 영향받은 행의 개수를 리턴. 
    	int ret = pstmt.executeUpdate();
    	pstmt.close();
    	conn.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=name %>님의 가입시도</h1>
	<%if(ret==1){ %>
	<h1>가입되었습니다!</h1>
	<%} else{ %>
	<h1>가입실패...무언가 잘못됐어요!</h1>
	<%} %>
</body>
</html>