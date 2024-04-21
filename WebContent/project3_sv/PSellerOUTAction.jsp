<%@page import="dao.SellerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String seller_id = request.getParameter("seller_id");
	SellerDao sellerdao = new SellerDao();
	String name = request.getParameter("name");
  	String workPlace = request.getParameter("workPlace");
  	String releaseAddress = request.getParameter("releaseAddress");
  	String returnAddress = request.getParameter("returnAddress");
  	int categoryNum = Integer.parseInt(request.getParameter("categoryNum"));
  	String phone = request.getParameter("phone");
  	String bank = request.getParameter("bank");
  	String bank_num = request.getParameter("bank_num");
  	sellerdao.selUpdate(seller_id, name, workPlace, releaseAddress, returnAddress, categoryNum);
  	sellerdao.memUpdate(seller_id, bank, bank_num);
%>
<script>
	alert("수정되었습니다.");
	location.href = "PSellerInformation.jsp"
</script>