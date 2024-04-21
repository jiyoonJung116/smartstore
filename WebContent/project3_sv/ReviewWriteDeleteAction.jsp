<%@page import="dao.ReviewDeleteDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="dao.ReviewInsertDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));	
	System.out.println(reviewNum);

	ReviewDeleteDao deletedao = new ReviewDeleteDao();
	deletedao.reviewdelete(reviewNum);
%>
<script> 
	alert("삭제되었습니다.");
	location.href="CustomerDailyLeftContent.jsp"
</script>