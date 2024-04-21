<%@ page import="dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String seller_id = request.getParameter("seller_id");
	Long pnumber = Long.parseLong(request.getParameter("pnumber"));
	String customer_id = request.getParameter("customer_id");
	String inquiry_content = request.getParameter("inquiry_content");
	
	CustomerInquiryInsertDao customerInquiryInsertDao = new CustomerInquiryInsertDao();
	customerInquiryInsertDao.inquiry(seller_id, pnumber,customer_id, inquiry_content);
%>
<script> 
	alert("등록되었습니다.");
	location.href="CustomerDailyLeftContent.jsp";
</script>