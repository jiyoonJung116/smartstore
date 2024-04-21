<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.SellerDao"%>
<% 
	request.setCharacterEncoding("utf-8");
	
	String seller_id = request.getParameter("seller_id");
	String store_introduce = request.getParameter("store_introduce");
	String new_name = request.getParameter("new_name");
	SellerDao sellerdao = new SellerDao();
	sellerdao.nameupdate(seller_id,store_introduce,new_name);
	
%>
<script>
alert("수정되었습니다.");
location.href="CommonManageTotalTop.jsp";
</script>