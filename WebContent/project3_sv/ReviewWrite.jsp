<%@page import="dto.ProductReviewDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductReviewDao"%>
<%@page import="dao.ReviewInsertDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     	ReviewInsertDao reviewinsertdao = new ReviewInsertDao();
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 쓰기</title>
<link rel="stylesheet" href="../css/Review.css" />
<script src="../js/jquery-3.7.0.min.js"></script>
<%
	    ProductReviewDao productReviewdao = new ProductReviewDao();
		String buyer_id = request.getParameter("buyer_id");
	    long pnumber = Long.parseLong(request.getParameter("pnumber"));
		ArrayList<ProductReviewDto> reviewlist = productReviewdao.review_select(pnumber, buyer_id);
    %>
<script>
function handleImageUpload(event) {
    let file = event.target.files[0];
    let imageContainer = document.getElementById("imageContainer");
    let previewButton = document.getElementById("previewButton");
    let uploadMessage = document.getElementById("uploadMessage");

    uploadMessage.style.display = "none";

    let reader = new FileReader();

    reader.onload = function (e) {
    	let imageUrl = e.target.result;
        imageContainer.innerHTML = "<img src='" + imageUrl + "' alt='Uploaded Image' />";
        previewButton.style.backgroundImage = "url('" + imageUrl + "')";
    };

    reader.readAsDataURL(file);
}


 $(function(){
	 $(".review_st36").click(function() {
		 let reviewGroup = document.getElementById("reviewGroup");
		 let selectedButton = reviewGroup.querySelector("button[aria-checked=true]");
		 
		  let buyer_grade = selectedButton.getAttribute("data-value");
		  let product_order_num = $(".pon").text();
		  let review_content = $(".review_st29").val();
		  let photo_video = $("#previewButton").css("background-image");
		  

		  photo_video = photo_video.replace('url("', '');
		  photo_video = photo_video.replace('")', '');
		  
		  let encodedBuyerGrade = encodeURIComponent(buyer_grade);
		  let encodedproduct_order_num = encodeURIComponent(product_order_num);
		  let encodedreview_content = encodeURIComponent(review_content);
		  let encodedphoto_video = encodeURIComponent(photo_video);
		  
		  location.href = "../project3_sv/ReviewWriteInsertAction.jsp?buyer_grade=" + encodedBuyerGrade + "&product_order_num=" + encodedproduct_order_num +
          "&review_content=" + encodedreview_content + "&photo_video=" + encodedphoto_video;
		
		});
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
document.addEventListener('DOMContentLoaded', function() {
	  // <textarea> 요소 가져오기
	  let textarea = document.getElementById("reviewInput");

	  let charCount = document.querySelector("._2-fFR8_GEA");

	  // <textarea> 키 입력 이벤트 핸들러 등록
	  textarea.addEventListener("keyup", function() {
	    // 입력된 글자 수 계산
	    let inputLength = textarea.value.length;
	    
	    if (inputLength > 5000) {
	      alert("5,000 이상 작성할 수 없습니다.");
	      textarea.value = textarea.value.slice(0, 5000);
	      inputLength = 5000;
	    }

	    // <em> 업데이트
	    charCount.textContent = inputLength;
	  });
	});

	document.addEventListener('DOMContentLoaded', function() {
		// 별점 버튼 요소들 가져오기
		let buttons = document.querySelectorAll(".review_st24");

		buttons.forEach(function(button) {
			button.addEventListener("click", function() {
				// 선택한 별을 활성화하고, 이전에 선택한 별들을 비활성화
				let value = button.getAttribute("data-value");
				let selectedButtons = document
						.querySelectorAll(".review_st24[data-value='" + value
								+ "']");

				selectedButtons.forEach(function(selectedButton) {
					selectedButton.classList.add("N=a:wrtmnt.rate" + value);
					selectedButton.classList.remove("_3t99v0mtDD");
					selectedButton.setAttribute("aria-checked", "true");
				});

				let deselectedButtons = document
						.querySelectorAll(".review_st24:not([data-value='"
								+ value + "'])");

				deselectedButtons.forEach(function(deselectedButton) {
					deselectedButton.classList
							.remove("N=a:wrtmnt.rate" + value);
					deselectedButton.classList.add("_3t99v0mtDD");
					deselectedButton.setAttribute("aria-checked", "false");
				});
			});
		});
	});
</script>



</head>
<body>
<div class="background" style="display: none;">
		<div class="window">
			<div class="popup popup1">
				<div class="popup2">
					<strong class="popupfont1">사진 등록</strong>
					<button type="button" class="popupbt">
						<span class="blind">닫기</span>
					</button>
				</div>
				<div class="popup3">
					<div class="popup4">
						<div class="popup5">
							<div class="popup6">
								<p id="uploadMessage" class="popup7">이미지를 등록하세요.</p>
								<div id="imageContainer"></div> <!-- 이미지가 들어갈 컨테이너 -->
							</div>
						</div>
						<div class="popup8">
							<div>
								<div class="popup9">
    <form>
        <label for="fileUpload" class="popup10">이미지 찾기</label>
        <input id="fileUpload" class="blind" type="file" accept="image/*" onchange="handleImageUpload(event)">
    </form>
</div>
							</div>
							<div class="footerdi">
								<button class="footbut footbut1" type="button">첨부 완료</button>
								<button class="footbut1" type="button">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="main">
		<div>
			<header class="review_st">
				<h1 class="review_st1">
					<span class="review_st2">리뷰쓰기</span>
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
					<div class="review_st10">
						<div class="review_st14">
							<%for(ProductReviewDto dto : reviewlist) {%>
							<h2 class="review_st16">상품명 : <%=dto.getPname() %></h2>
							<p class="pon" style="display: none;"><%=dto.getProduct_order_num() %></p>
							<%} %>
						</div>
					</div>
				</div>
				<!--  -->
				<!-- <form action="ReviewWriteInsertAction.jsp"> -->
				<div class="review_st18">
					<h3 class="blind">상품 리뷰 작성</h3>
					<div class="review_st19">
						<strong class="review_st20">상품을 사용해보셨나요?</strong>
						<div class="review_st21">
							<div class="review_st22">
								<div id="reviewGroup" class="review_st23" role="radiogroup">
									<button class="review_st24 _3t99v0mtDD N=a:wrtmnt.rate5"
										role="radio" aria-checked="false" data-value="5">
										<span class="blind">5</span>
									</button>
									<button class="review_st24 _3t99v0mtDD N=a:wrtmnt.rate4"
										role="radio" aria-checked="false" data-value="4">
										<span class="blind">4</span>
									</button>
									<button class="review_st24 _3t99v0mtDD N=a:wrtmnt.rate3"
										role="radio" aria-checked="false" data-value="3">
										<span class="blind">3</span>
									</button>
									<button class="review_st24 _3t99v0mtDD N=a:wrtmnt.rate2"
										role="radio" aria-checked="false" data-value="2">
										<span class="blind">2</span>
									</button>
									<button class="review_st24 _3t99v0mtDD N=a:wrtmnt.rate1"
										role="radio" aria-checked="false" data-value="1">
										<span class="blind">1</span>
									</button>
								</div>
								<div class="review_st26">선택하세요.</div>
							</div>
						</div>
					</div>
					<div class="review_st19"></div>
					<div class="review_st19"></div>
					<div class="review_st19"></div>
					<div class="review_st19">
						<div class="review_st25">
							<div class="review_st27">
								<textarea class="review_st29" name="review_content" id="reviewInput" cols="30"
									placeholder="한달동안 사용하시면서 달라진 만족도에 대한 후기를 남겨주세요.(최소 10자 이상)"
									style="height: 92px"></textarea>
								<div class="review_st30">
									<em class="_2-fFR8_GEA"><span class="blind">입력글자수</span>0</em>
									<span class="review_st31"></span><span class="blind">최대글자수</span>5,000
								</div>
							</div>
						</div>
					</div>
					<div class="review_st_bt">
				  <button id="previewButton" type="button" class="piimgst4" style="height: 120px; width: 200px; background-image: url(''); margin-left: 857px;"></button>
				  <button class="piimgst7" type="button" style="margin-top: 106px;">사진 등록</button>
				</div>
				<input type="file" style="display: none;">

				</div>
				<!-- </form> -->
				<!--  -->
				<div class="review_st28">
					<div class="review_stt"></div>
					<div class="review_st32">
						<div class="review_st33">
							<button class="review_st34">취소</button>
						</div>
						<div class="review_st35">
							<button class="review_st36" type = "submit" disabled>등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>