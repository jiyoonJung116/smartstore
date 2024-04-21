<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Scanner"%>
<%
	Scanner sc = new Scanner(System.in);
	System.out.print("이름: ");
	String name = sc.nextLine();
	out.println(name+"님, 안녕하세요!");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>