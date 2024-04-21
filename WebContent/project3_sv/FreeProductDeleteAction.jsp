<%@page import="dao.SsFreeProductAddRemoveDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("UTF-8");
    
		/* int displayOrder = Integer.parseInt(request.getParameter("displayOrder"));
		
		  
		SsFreeProductAddRemoveDao remove = new SsFreeProductAddRemoveDao();
		remove.freeDisplayD(displayOrder); */
		String displayOrderParam = request.getParameter("displayOrder");
		String[] displayOrderArray = displayOrderParam.split(",");

		for (String displayOrderStr : displayOrderArray) {
		    try {
		        int displayOrder = Integer.parseInt(displayOrderStr);
		        SsFreeProductAddRemoveDao delete = new SsFreeProductAddRemoveDao();
		        delete.freeDisplayD(displayOrder);
		    } catch (NumberFormatException e) {
		        e.printStackTrace();
		    }
		}
    	
    %>

    
    <script>alert("삭제되었습니다"); location.href="SsFreeProduct.jsp";
    </script>