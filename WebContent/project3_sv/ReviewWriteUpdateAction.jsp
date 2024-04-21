<%@page import="dto.ReviewUpdateDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ReviewUpdateDao"%>
<%@page import="dao.ReviewDeleteDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="dao.ReviewInsertDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String review_content = request.getParameter("review_content");
	int reviewNum = Integer.parseInt(request.getParameter("review_num"));
	Long product_order_num = Long.parseLong(request.getParameter("product_order_num"));
	System.out.println(reviewNum);
	ReviewUpdateDao dao = new ReviewUpdateDao();
	dao.reviewupdate(review_content, reviewNum, product_order_num);
%>
<script> 
	alert("수정되었습니다.");
	location.href="CustomerDailyLeftContent.jsp"
</script>