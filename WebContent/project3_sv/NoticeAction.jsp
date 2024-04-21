<%@page import="dao.OptionSelectDao"%>
<%@page import="dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String seller_id = request.getParameter("seller_id");
	if(seller_id==null){
 		seller_id="jiyoonjung";
	}else {
		seller_id = request.getParameter("seller_id");
	} 
	
	String buyer_id = request.getParameter("buyer_id");
	Long pnumber = Long.parseLong(request.getParameter("pnumber"));
	int purchase_amount = Integer.parseInt(request.getParameter("purchase_amount"));
	String recipient_name = request.getParameter("recipient_name");
	String deliveryAddress = request.getParameter("deliveryAddress");
	String detailDeliveryAddress = request.getParameter("detailDeliveryAddress");
	String postNum = request.getParameter("postNum");
	String phone = request.getParameter("phone");
	String delivery_message = request.getParameter("delivery_message");
	String value=request.getParameter("value");
	String value2=request.getParameter("value2");
	String value3=request.getParameter("value3");
	OptionSelectDao optiondao = new OptionSelectDao();
	int option_choose_code = optiondao.optionNum(pnumber, value, value2, value3);
	OrderDao orderdao = new OrderDao();
	orderdao.insert(seller_id, buyer_id, pnumber, purchase_amount, recipient_name, option_choose_code, deliveryAddress, detailDeliveryAddress, postNum, phone, delivery_message);
%>
<script>
alert("주문이 완료되었습니다.");
location.href="CustomerDailyLeft.jsp";
</script>