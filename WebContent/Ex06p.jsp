<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int sum = 0;
	for (int i = num; i <= num1; i++) {
	sum += i;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=sum%></h1>
</body>
</html>