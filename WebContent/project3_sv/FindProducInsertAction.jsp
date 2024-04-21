<%@page import="dao.SsFreeProductAddRemoveDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("UTF-8");
    

		String loginId = "jiyoonjung";
		String[] prNumberArray = request.getParameter("pr_number_long_array").split(","); 
		
		for (String prNumberStr : prNumberArray) {
		  long prNumber = Long.parseLong(prNumberStr);
		  
		  SsFreeProductAddRemoveDao ssfreepa = new SsFreeProductAddRemoveDao();
		  ssfreepa.freeDisplayU(loginId, prNumber);
		}
    	
    %>

    
    <script>alert("등록되었습니다"); location.href="FindProduct.jsp";
    </script>