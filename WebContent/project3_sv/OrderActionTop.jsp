<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="dao.*"%>

<%
request.setCharacterEncoding("UTF-8");

int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트   
String location = application.getRealPath("/Images");
MultipartRequest multi = new MultipartRequest(request,
										location,
										  maxSize,
										  "utf-8",
										  new DefaultFileRenamePolicy());


Enumeration<?> files = multi.getFileNames(); 
	
String element = "";
String filesystemName = "";
String originalFileName = "";
String contentType = "";
long length = 0;		
		
if (files.hasMoreElements()) { 
	element = (String)files.nextElement(); 
	filesystemName 			= multi.getFilesystemName(element); 
	originalFileName 		= multi.getOriginalFileName(element); 
	contentType 			= multi.getContentType(element);	
	length 					= multi.getFile(element).length(); 
	
}

String image = filesystemName;

	String seller_id = multi.getParameter("seller_id");
	int category_id= Integer.parseInt(multi.getParameter("category_id"));
	String pcode = multi.getParameter("pcode");
	String pname = multi.getParameter("pname");
	String description = multi.getParameter("description");
	int amount=0;
	if (multi.getParameter("amount")!=null) {
	    try {
	        amount = Integer.parseInt(multi.getParameter("amount"));
	    } catch (NumberFormatException e) {
	    	amount=0;
	    }
	}
	int price=0;
	if (multi.getParameter("price")!=null) {
	    try {
	        price = Integer.parseInt(multi.getParameter("price"));
	    } catch (NumberFormatException e) {
	    	price=0;
	    }
	}
	String vat= multi.getParameter("vat");
	String delivery_company= multi.getParameter("delivery_company");
	int delivery_cost=0;
	if (multi.getParameter("delivery_cost")!=null) {
	    try {
	    	delivery_cost = Integer.parseInt(multi.getParameter("delivery_cost"));
	    } catch (NumberFormatException e) {
	    	delivery_cost=0;
	    }
	}
	String return_delivery_company= multi.getParameter("return_delivery_company");
	int return_delivery_cost=0;
	if (multi.getParameter("return_delivery_cost")!=null) {
	    try {
	    	return_delivery_cost = Integer.parseInt(multi.getParameter("return_delivery_cost"));
	    } catch (NumberFormatException e) {
	    	return_delivery_cost=0;
	    }
	}
	int exchange_cost=0;
	if (multi.getParameter("exchange_cost")!=null) {
	    try {
	    	exchange_cost = Integer.parseInt(multi.getParameter("exchange_cost"));
	    } catch (NumberFormatException e) {
	    	exchange_cost=0;
	    }
	}
	String manufacturer_name= multi.getParameter("manufacturer_name");
	String brand_name= multi.getParameter("brand_name");
	String model_name= multi.getParameter("model_name");
	String as_number= multi.getParameter("as_number");
	String as_announcement= multi.getParameter("as_announcement");
	String seller_note= multi.getParameter("seller_note");
	String notice= multi.getParameter("notice");
	ProductInsertDao productInsertDao = new ProductInsertDao();
	productInsertDao.pinsert(seller_id, category_id, pcode, pname, description, amount, price, vat, delivery_company,
			delivery_cost, return_delivery_company, return_delivery_cost, exchange_cost, manufacturer_name,
			brand_name, model_name, as_number, as_announcement, seller_note, notice, image);
%>
<script> 
	alert("등록되었습니다.");
	location.href="CustomerDailyLeft.jsp"
</script>
