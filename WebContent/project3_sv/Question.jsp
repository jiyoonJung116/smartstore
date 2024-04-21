<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/Question.css"/>
<meta charset="UTF-8">
<title>상품 Q&A 작성하기</title>
<script src="../js/jquery-3.7.0.min.js"></script>
<%
	CustomerInquiryInsertDao customerInquiryInsert = new CustomerInquiryInsertDao();
	String 판매자아이디 = "";
	String 상품번호 = "";
	String 구매자아이디 = "";
	
	String url = request.getRequestURL().toString();
	String queryString = request.getQueryString();
	
	if (queryString != null) {
	  String[] params = queryString.split("&");
	  for (String param : params) {
	    String[] keyValue = param.split("=");
	    String paramName = keyValue[0];
	    String paramValue = (keyValue.length > 1) ? keyValue[1] : "";
	    
	    if ("customer_id".equals(paramName)) {
	      	구매자아이디 = paramValue;
	    } else if ("pnumber".equals(paramName)) {
	      	상품번호 = paramValue;
	    } else if ("seller_id".equals(paramName)) {
	      	판매자아이디 = paramValue;
	    }
	  }
	}
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
			<h1 class="title_st">상품 Q&amp;A 작성하기</h1>
		</div>
		<div>
			<form action = "QuestionAction.jsp">
				<input type="hidden" id="seller_id" name ="seller_id" value="<%=판매자아이디%>"/>
				<input type="hidden" id="pnumber" name ="pnumber" value="<%=상품번호%>"/>
				<input type="hidden" id="customer_id" name ="customer_id" value="<%=구매자아이디%>"/>
				<div class="q_st1 charcount">
					<textarea class="q_st" name="inquiry_content" placeholder="문의하실 내용을 입력하세요" maxlength="1000"></textarea>
					<div class="q_st4">
						<span class="q_st2">0</span>
						<span class="q_st2_2">/1000</span>
					</div>
				</div>
			<div class="q_st3">
				<button class="q_bt" role="button">취소</button>
				<button class="q_bt q_bt1" type="submit">등록</button>
			</div>
			</form>
		</div>
	</div>
</body>
</html>