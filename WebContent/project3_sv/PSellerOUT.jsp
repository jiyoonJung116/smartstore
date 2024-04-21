<%@page import="dao.SellerOUTDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
	request.setCharacterEncoding("utf-8");

	String seller_id = request.getParameter("seller_id");
	SellerOUTDao selleroutdao = new SellerOUTDao();
	String id = request.getParameter("id");
  	String pw = request.getParameter("pw");
  	if(!selleroutdao.check(id, pw)) { %>
<script>
	alert("아이디 비밀번호가 맞지 않습니다. 다시 입력해주세요");
	location.href = "PSellerOUT.jsp";
</script>
  		
<% }else {
  	selleroutdao.selUpdate(id, pw);
%>
<script>
	alert("탈퇴되었습니다.");
	location.href = "https://www.naver.com/";
</script>
<%
}
%>