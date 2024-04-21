<%@page import="dao.NoticeBoardDeleteDao"%>
<%@page import="dao.ReviewDeleteDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="dao.ReviewInsertDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	int bno = Integer.parseInt(request.getParameter("bno"));	

	NoticeBoardDeleteDao dao = new NoticeBoardDeleteDao();
	dao.reviewdelete(bno);
%>
<script> 
	alert("삭제되었습니다.");
	location.href="NoticeBoard.jsp"
</script>