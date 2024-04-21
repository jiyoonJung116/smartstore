<%@page import="dao.ReviewDao"%>
<%@page import="dto.ReviewDto"%>
<%@page import="dto.ProductReviewDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductReviewDao"%>
<%@page import="dao.ReviewInsertDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<link rel="stylesheet" href="../css/Review.css" />
<script src="../js/jquery-3.7.0.min.js"></script>
	<%
	    ProductReviewDao productReviewdao = new ProductReviewDao();
		String buyer_id = request.getParameter("buyer_id");
		long pnumber = Long.parseLong(request.getParameter("pnumber"));
		int reviewNumber = Integer.parseInt(request.getParameter("reviewNum"));
		ArrayList<ProductReviewDto> reviewlist = productReviewdao.review_select(pnumber, buyer_id, reviewNumber);
	    
		
	    ReviewDao review = new ReviewDao();
	    ArrayList<ReviewDto> listreview = review.review_select3(pnumber, reviewNumber);
    %>
<script>
 $(function(){
	 
	 /* $(".review_st36").click(function() {
		  let product_order_num = $(".pon").text();
		  let reviewNum = $("input[name='review_num']").val();
		  let encodedproduct_order_num = encodeURIComponent(product_order_num);
		  let encoded_reviewNum = encodeURIComponent(reviewNum);
		  location.href = "../project3_sv/ReviewWriteUpdateAction.jsp?product_order_num=" + encodedproduct_order_num
				  			+"&reviewNum="+encoded_reviewNum; 
		
		}); */
	 $(document).on("click", ".popupbt", function() {
			$(".background").css('display', 'none');
		});
	 $(document).on("click", ".piimgst7", function() {
			$(".background").css('display', 'block');
		});
	 $(document).on("click", ".footbut ", function() {
			alert("적용되었습니다");
			$(".background").css('display', 'none');
		});
 });
document.addEventListener('DOMContentLoaded', function() {
	let textarea = document.getElementById("reviewInput");
    let button = document.querySelector(".review_st36");

    textarea.addEventListener("keyup", function() {
      button.disabled = textarea.value.length < 10;
    });
  });

</script>



</head>
<body>
	<div id="main">
		<div>
			<header class="review_st">
				<h1 class="review_st1">
					<span class="review_st2">리뷰수정</span>
				</h1>
				<a href="#" role="button" class="review_st3"><span class="blind">닫기</span></a>
			</header>
			<div class="review_st4" style="padding-bottom: 0px">
				<div class="review_st5">
					<div class="review_st6">
						<div class="review_st7">
							<ul class="list_set">
								<li class="review_st8">텍스트 리뷰 <span class="review_st9">50<!-- -->원
								</span></li>
								<li class="review_st8">포토/동영상 리뷰 <span class="review_st9">150<!-- -->원
								</span></li>
							</ul>
						</div>
					</div>
					<!--  -->
					<input type = "hidden" name = "pnumber" value="<%=request.getParameter("pnumber")%>">
					<input type="hidden" name="buyer_grade" id="input_hidden_stars"/> 
					<div class="review_st10">	
						<div class="review_st14">
							<%for(ProductReviewDto dto : reviewlist) {%> 
								<h2 class="review_st16">상품명 : <%=dto.getPname() %></h2>
								<p class="pon" style="display: none;"><%=dto.getProduct_order_num() %></p> 
								<input type="hidden" name="product_order_num" value="<%=dto.getProduct_order_num() %>"/>
								<input type="hidden" name="review_num" value="<%=dto.getReview_num() %>"/>
							<%} %>
						</div>
					</div>
				</div>
				<form action="ReviewWriteUpdateAction.jsp" method="post">
					<div class="review_st18">
						<h3 class="blind">상품 리뷰 작성</h3>
						<div class="review_st19"></div>
						<div class="review_st19"></div>
						<div class="review_st19"></div>
						<div class="review_st19">
							<div class="review_st25">
								
								  <div class="review_st27">
								    <% for(ReviewDto dto : listreview) { %>
								      <textarea class="review_st29" name="review_content" id="reviewInput" cols="30" style="height: 92px"><%= dto.getReview_content() %></textarea>
								      <input type="hidden" name="product_order_num" value="<%=dto.getProduct_order_num() %>"/>
								   	  <input type="hidden" name="review_num" value="<%=dto.getReviewNum() %>"/>
								    <% } %>
								    <div class="review_st30">
								      <em class="_2-fFR8_GEA"><span class="blind">입력글자수</span>0</em>
								      <span class="review_st31"></span><span class="blind">최대글자수</span>5,000
								    </div>
								  </div>
								  <br>
								
							</div>
						</div>
					</div>
				<div class="review_st28">
					<div class="review_stt"></div>
					<div class="review_st32">
						<div class="review_st33">
							<button class="review_st34">취소</button>
						</div>
						<div class="review_st35">
							<button class="review_st36" type = "submit" disabled>수정</button>
						</div>
					</div>
				</div>
				</form>
			</div>
			</div>
		</div>
</body>
</html>