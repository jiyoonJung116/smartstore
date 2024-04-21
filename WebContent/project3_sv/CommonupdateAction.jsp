<%@page import="dao.CommonManageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String seller_id = request.getParameter("seller_id");
	String color= request.getParameter("color");
	String location= request.getParameter("location");
	CommonManageDao comDao = new CommonManageDao();
	comDao.orderCon(seller_id, color, location);
%>
<script>
	alert("수정되었습니다.");
	location.href = "CustomerDailyLeft.jsp"
</script>