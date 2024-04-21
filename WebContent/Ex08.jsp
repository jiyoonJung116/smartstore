<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
	int a = (int)(Math.random()*10)+1;
	int b = (int)(Math.random()*10)+1;
%>
</head>
<body>
	<form action="Ex08p.jsp">
	숫자 1: <input type="text" name ="a" value=<%=a%>>
	숫자 2: <input type="text" name ="b" value=<%=b%>>
	답 : <input type="text" name="answer">
	<input type="submit" value="정답 확인">
	</form>
</body>
</html>