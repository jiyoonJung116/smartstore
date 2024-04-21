<%@page import="dao.OptionDao"%>
<%@page import="dao.ProductInsertDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String seller_id = request.getParameter("seller_id");
	int category_id= Integer.parseInt(request.getParameter("category_id"));
	String pcode = request.getParameter("pcode");
	String pname = request.getParameter("pname");
	String description = request.getParameter("description");
	int amount=0;
	if (request.getParameter("amount")!=null) {
	    try {
	        amount = Integer.parseInt(request.getParameter("amount"));
	    } catch (NumberFormatException e) {
	    	amount=0;
	    }
	}
	int price=0;
	if (request.getParameter("price")!=null) {
	    try {
	        price = Integer.parseInt(request.getParameter("price"));
	    } catch (NumberFormatException e) {
	    	price=0;
	    }
	}
	String vat= request.getParameter("vat");
	
	String delivery_company= null;
	if (request.getParameter("delivery_company")!=null) {
	    try {
	    	delivery_company = request.getParameter("delivery_company");
	    } catch (NumberFormatException e) {
	    	delivery_company="CJ대한통운";
	    }
	}
	
	int delivery_cost=0;
	if (request.getParameter("delivery_cost")!=null) {
	    try {
	    	delivery_cost = Integer.parseInt(request.getParameter("delivery_cost"));
	    } catch (NumberFormatException e) {
	    	delivery_cost=0;
	    }
	}
	String return_delivery_company= request.getParameter("return_delivery_company");
	int return_delivery_cost=0;
	if (request.getParameter("return_delivery_cost")!=null) {
	    try {
	    	return_delivery_cost = Integer.parseInt(request.getParameter("return_delivery_cost"));
	    } catch (NumberFormatException e) {
	    	return_delivery_cost=0;
	    }
	}
	int exchange_cost=0;
	if (request.getParameter("exchange_cost")!=null) {
	    try {
	    	exchange_cost = Integer.parseInt(request.getParameter("exchange_cost"));
	    } catch (NumberFormatException e) {
	    	exchange_cost=0;
	    }
	}
	String manufacturer_name= request.getParameter("manufacturer_name");
	String brand_name= request.getParameter("brand_name");
	String model_name= request.getParameter("model_name");
	String as_number= request.getParameter("as_number");
	String as_announcement= request.getParameter("as_announcement");
	String seller_note= request.getParameter("seller_note");
	String notice= request.getParameter("notice");
	String image= request.getParameter("image");
	ProductInsertDao productInsertDao = new ProductInsertDao();
	productInsertDao.pinsert(seller_id, category_id, pcode, pname, description, amount, price, vat, delivery_company,
			delivery_cost, return_delivery_company, return_delivery_cost, exchange_cost, manufacturer_name,
			brand_name, model_name, as_number, as_announcement, seller_note, notice, image);
%>
<script>
	alert("등록되었습니다.");
	location.href = "ProductInsert2.jsp"
</script>