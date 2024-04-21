<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("seller_id");
    String answer_content = request.getParameter("answer_content");
    int serial_number = Integer.parseInt(request.getParameter("serial_number"));
   
    CustomerInquiryUpdateDao customerInquiryUpdateDao = new CustomerInquiryUpdateDao();
   
    customerInquiryUpdateDao.customerupdate(answer_content, id, serial_number);
%>
<script>
    alert("등록되었습니다");
    location.href = "CustomerInquiry.jsp";
</script>