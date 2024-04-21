<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String seller_id = request.getParameter("seller_id");
	int serial_number = Integer.parseInt(request.getParameter("serial_number"));
	String inquiry_content = request.getParameter("inquiry_content");
	
	CustomerInquiryUpdateDao customerInquiryUpdateDao = new CustomerInquiryUpdateDao();
	customerInquiryUpdateDao.Update(inquiry_content,seller_id, serial_number);
	%>
<script> 
	alert("수정되었습니다.");
	location.href="CustomerDailyLeftContent.jsp";
</script>