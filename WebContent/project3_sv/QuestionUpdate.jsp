<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/Question.css"/>
<meta charset="UTF-8">
<title>상품 Q&A 수정하기</title>
<script src="../js/jquery-3.7.0.min.js"></script>
<%
	CustomerInquiryUpdateDao customerInquiryInsert = new CustomerInquiryUpdateDao();
	String inquiry_content = request.getParameter("inquiry_content");
	String seller_id = request.getParameter("seller_id");
	int serial_number = Integer.parseInt(request.getParameter("serial_number"));
	String url = request.getRequestURL().toString();
	String queryString = request.getQueryString();
	
%>
		
<script>
$(function(){
	  $(".q_st").keyup(function(e) {
	    let content = $(this).val();
	    let maxLength = 1000; // 최대 문자 수 설정

	    if (content.length > maxLength) {
	      alert("최대 " + maxLength + "자까지 입력 가능합니다.");
	      $(this).val(content.substring(0, maxLength)); // 문자 수 초과 시 입력 제한
	    }

	    $(".q_st4 .q_st2").text(content.length); // 문자 수 표시
	    $(".q_st4 .q_st2_2").text("/" + maxLength);
	  });
	});
</script>
</head>
<body>
	<div>
		<div>
			<h1 class="title_st">상품 Q&amp;A 수정하기</h1>
		</div>
		<div>
			<form action = "QuestionUpdateAction.jsp">
				<div class="q_st1 charcount">
					<textarea class="q_st" name="inquiry_content" placeholder="문의하실 내용을 입력하세요" maxlength="1000"></textarea>
				<input type="hidden" id="seller_id" name ="seller_id" value="<%=seller_id%>"/>
				<input type="hidden" id="customer_id" name ="serial_number" value="<%=serial_number%>"/>
					<div class="q_st4">
						<span class="q_st2">0</span>
						<span class="q_st2_2">/1000</span>
					</div>
				</div>
			<div class="q_st3">
				<button class="q_bt" role="button">취소</button>
				<button class="q_bt q_bt1" type="submit">수정</button>
			</div>
			</form>
		</div>
	</div>
</body>
</html>