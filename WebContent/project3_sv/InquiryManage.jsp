<%@page import="java.time.format.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.*"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 		
	int pageNum = 0;
	int startNum = 0;
	int endNum=0;
	String 판매자아이디 = "";
	int 게시물번호 =0;
	LocalDate tomorrow = LocalDate.now().plusDays(1);
	String inquiry_date = tomorrow.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	String loginId = (String)session.getAttribute("id");
	
	try{ 
		pageNum = Integer.parseInt(request.getParameter("page"));
	} catch (Exception e) {
		pageNum=1;
	}
	endNum = pageNum*5;
	startNum = endNum - 4;
	int count = 0;
	CustomerInquiryUpdateDao customerInquiryUpdateDao = new CustomerInquiryUpdateDao();
	CustomerInquiryDao customerInquiryDao = new CustomerInquiryDao();
	ArrayList<CustomerInquiryDto> listCustomerInquiryDto = customerInquiryDao.select2(loginId,inquiry_date,startNum,endNum);
		count = customerInquiryDao.count2(loginId);
		listCustomerInquiryDto = customerInquiryDao.select2(loginId, inquiry_date,startNum,endNum);

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 관리</title>
<link rel="stylesheet" href="../css/TopSidebar.css"/>
<link rel="stylesheet" href="../css/InqueryManage.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="../js/jquery-3.7.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
	function sidebarbtn(a, b) {
		let sc = document.getElementById(a);
		let di = document.getElementById(b);
		if (sc.style.display == "none") {
			sc.style.display = "block";
			di.className = "afterdropbtn";
		} else if (sc.style.display == "block") {
			sc.style.display = "none";
			di.className = "dropbtn";
		}
	}
	let seller_id = $(".topid").text();
	
</script>
<script>
	function topserachbtn(a, b) {
		let serc = document.getElementById(a);
		let cs = document.getElementById(b);
		if (serc.style.display == "none") {
			serc.style.display = "block";
			cs.className = "after_serach";
		} else if (serc.style.display == "block") {
			serc.style.display = "none";
			cs.className = "drop_serach";
		}
	}
	function spread(id) {
		var getId = document.getElementById(id);
		getId.style.display = (getId.style.display == 'block') ? 'none'
				: 'block';
	}
	
	$(function() {
		$(".smartlogo").click(function(){
    		location.href = "MainPage.jsp";
    	});
		$(".inqueryst1").keyup(function(e) {
		    let content = $(this).val();
		    $(".text_primary").text(content.length);
		    if (content.length > 1000) {
		        alert("최대 1000자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 1000));
		        $(".text_primary").text("1000");
		    }
		});
		$('.exeldown3').click(function() {
			  var index = $(this).attr('class').match(/an(\d+)/)[1];
			  // 해당 인덱스를 기반으로 해당하는 ".inqueryst" div의 display 속성을 변경합니다.
			  if ($('.bn' + index).css('display') === 'none') {
			    $('.bn' + index).css('display', 'block');
			  } else {
			    $('.bn' + index).css('display', 'none');
			  }
			});
		$(".option").click(function(){
			let option_value = $(this).attr("data-value");
			if(option_value==="total"){
				$(".item").text("전체");
			} else if(option_value==="false"){
				$(".item").text("미답변");
			} else if(option_value==="true"){
				$(".item").text("답변완료");
			}
		});
		$(".form-group").click(
				function() {
					let sd = $(this).parents('.ygstyle1').find('#q_manage')
							.css('display');
					if (sd === 'none') {
						$(this).parents('.ygstyle1').find('#q_manage').css(
								'display', 'block');
					} else if (sd === 'block') {
						$(this).parents('.ygstyle1').find('#q_manage').css(
								'display', 'none');
					}
				});
		$(".form-group").click(function() {
			$(".selectize-input").toggleClass("rotate");
		});
		$(".selectpay").click(function() {
			$(".selectpay").removeClass("on");
			$(this).addClass("on");
		});
		$("#input_date").datepicker(
						{
							showOn : 'both',
							buttonImage : 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAeCAYAAABe3VzdAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODgwN0NCRURFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODgwN0NCRUVFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo4ODA3Q0JFQkU4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ODA3Q0JFQ0U4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjTBh6MAAAEoSURBVHjaYvz//z/DYAZMDIMcjDpw1IGjDiQAWEjVUNXUiS4EKqcYsSjFEG+rK6e9A6EWEyOGTZyRXlHMiITfo/EZkRyCzh+QNCiExxMDnkk6gFgAiB2AOAIqVgDEGlDxjoF2oCDUDA4g5oaK8QExK1RckO65GA2sBuJvQHwDiJ9AxXYB8XOo+OqBDsGZ0DToAcTJULE6INaFis8c6BBUhtIzkMS8sMgPWAiCyjk5IK4A4qVQsUtA7A0V/z/QIQiKxo9APAGImaFiNkD8HYj/4imC6BaCu4FYDFrEVELFZgGxOVR890CHIKhi/gTEJ4D4OlRsHhDfhYp3DpQDYeXbHiBmB+KXUAwSPw2VY4fKCw6EA9/Rq7nFONqrG3XgqANHHTjCHQgQYAAjWTNTyGzxagAAAABJRU5ErkJggg==',
							dateFormat : "yy-mm-dd",
							prevText : '이전 달',

							nextText : '다음 달',
							monthNames : [ '01', '02', '03', '04', '05', '06',
									'07', '08', '09', '10', '11', '12' ],
							monthNameshort : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
							dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
							showMonthAfterYear : true,
							yearSuffix : '.',
							onSelect : function(dateText, inst) {
								let dateObj = $(this).datepicker('getDate');
								let formattedDate = $.datepicker.formatDate(
										"yy-F-DDDD", dateObj);
								$("#formatted_date").text(formattedDate);
							}
						});
		$("#input_date2").datepicker(
						{
							showOn : 'both',
							buttonImage : 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAeCAYAAABe3VzdAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODgwN0NCRURFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODgwN0NCRUVFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo4ODA3Q0JFQkU4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ODA3Q0JFQ0U4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjTBh6MAAAEoSURBVHjaYvz//z/DYAZMDIMcjDpw1IGjDiQAWEjVUNXUiS4EKqcYsSjFEG+rK6e9A6EWEyOGTZyRXlHMiITfo/EZkRyCzh+QNCiExxMDnkk6gFgAiB2AOAIqVgDEGlDxjoF2oCDUDA4g5oaK8QExK1RckO65GA2sBuJvQHwDiJ9AxXYB8XOo+OqBDsGZ0DToAcTJULE6INaFis8c6BBUhtIzkMS8sMgPWAiCyjk5IK4A4qVQsUtA7A0V/z/QIQiKxo9APAGImaFiNkD8HYj/4imC6BaCu4FYDFrEVELFZgGxOVR890CHIKhi/gTEJ4D4OlRsHhDfhYp3DpQDYeXbHiBmB+KXUAwSPw2VY4fKCw6EA9/Rq7nFONqrG3XgqANHHTjCHQgQYAAjWTNTyGzxagAAAABJRU5ErkJggg==',
							dateFormat : "yy-mm-dd",
							prevText : '이전 달',

							nextText : '다음 달',
							monthNames : [ '01', '02', '03', '04', '05', '06',
									'07', '08', '09', '10', '11', '12' ],
							monthNameshort : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
							dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
							showMonthAfterYear : true,
							yearSuffix : '.',
							onSelect : function(dateText, inst) {
								let dateObj = $(this).datepicker('getDate');
								let formattedDate = $.datepicker.formatDate(
										"yy-F-DDDD", dateObj);
								$("#formatted_date").text(formattedDate);
							}
						});
		let seller_id = $(".topid").text();
		let customer_id = $("#ygfontstyle_").text();
		$(".input_seller_id").val(seller_id);
		$("#input_customer_id").val(customer_id);
		
		<% int cnt2 = 0;
		   for(CustomerInquiryDto dto : listCustomerInquiryDto) {
		       cnt2++;
		%>
		let serial_number<%=cnt2%> = $(".ygfontstyle5<%=cnt2%>").text();
		$("#serial_number<%=cnt2%>").val(serial_number<%=cnt2%>);	
		let answer_content<%=cnt2%> = $("#answer_content<%=cnt2%>").text(); 
		$("#answer_content<%=cnt2%>").val(answer_content<%=cnt2%>);
		<% } %>
	});
</script>
</head>
<body>
	<div id="header">
		<div class="left-header fl">
			<div class="fl smartlogo"></div>
			<div class="fl topmenu">
				<span>쇼핑파트너센터</span> <span>커머스솔루션마켓</span> <span>네이버광고 <img
					src="../Images/headerlogo.png">
				</span>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div class="right-header fr">
			<div class="topright fl">
				<div class="fl">
					<span class="topid">jiyoonjung</span>님 <span class="myhome">내정보</span>
				</div>
				<div class="fl">
					<i class="bell"></i> <i class="newicon"></i>
				</div>
				<div class="logout fl">로그아웃</div>
				<div class="imformation fl">도움말</div>
				<div class="header-talk fl">
					<img src="../Images/headertalk.png" /> <span>톡톡상담</span>
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>

	<!-- 왼쪽 사이드바 -->
	<div id="left_side" class="fl">
		<div>
			<img src="https://sell.smartstore.naver.com/images/no-img.jpg">
			<p>CustomerDaily</p>
		</div>
		<!-- 2번쨰________________ -->
		<div>
			<div class="top"
				onclick="topserachbtn('serach_content','clickserach')">
				<div class="toptext">수취인명</div>
				<div id="clickserach" class="drop_serach"></div>
			</div>
			<div id="serach_content" class="top_serach" style="display: none;">
				<div class="drop_serachtext">
					<div class="find_text">
						<div class="option_text">수취인명</div>
						<div class="option_text">구매자명</div>
						<div class="option_text">구매자연락처</div>
						<div class="option_text">구매자ID</div>
						<div class="option_text">주문번호</div>
						<div class="option_text">상품주문번호</div>
						<div class="option_text">상품번호</div>
					</div>
				</div>
				<!-- <select>
					<option value="addressee_name">수취인명</option>
					<option value="buyer_name">구매자명</option>
					<option value="buyer_phone">구매자연락처</option>
					<option value="buyer_id">구매자ID</option>
					<option value="ordernumber">주문번호</option>
					<option value="order_pnumber">상품주문번호</option>
					<option value="pnumber">상품번호</option>
				</select>  -->
			</div>
			<div class="input_title">
				<input type="text" /> <img src="../Images/searchicon.png" />
			</div>
		</div>
		<!-- 3번쨰________________________-->
		<div>
			<div class="menu" onclick="sidebarbtn('side_content', 'dropicon')">
				<div>상품관리</div>
				<div id="dropicon" class="dropbtn"></div>
			</div>
			<div id="side_content" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/origin-list">상품 조회/수정</a>
					</div>
					<div> 
						<a href="ProductInsert2.jsp">상품 등록</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/bulkadd">상품 일괄등록</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/navershopping-match-product">카탈로그 가격관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/relation-list">연관상품 관리</a>
					</div>
					<div>
						<a>사진 보관함</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/delivery/bundle">배송정보 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/template/delivery">템플릿 관리</a>
					</div>
					<div>
						<a href="Notice.jsp">공지사항 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/interest/subscription/search">구독 관리</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content2', 'dropicon2')">
				<div>
					판매관리 <i></i>
					<div id="dropicon2" class="dropbtn"></div>
				</div>
			</div>
			<div id="side_content2" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a href="OrderUnitSearch.jsp">주문통합검색</a>
					</div>
					<div>
						<a>선물 수락대기</a>
					</div>
					<div>
						<a>미결재 확인</a>
					</div>
					<div>
						<a href="OrderConfirm.jsp">발주(주문)확인/발송관리</a>
					</div>
					<div>
						<a href="DeliveryStatusManage.jsp">배송현황 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/sale/purchaseDecision">구매확정 내역</a>
					</div>
					<div>
						<a href="CancelManage.jsp">취소 관리</a>
					</div>
					<div>
						<a href="ReturnManage.jsp">반품 관리</a>
					</div>
					<div>
						<a href="ExchangeManagement.jsp">교환 관리</a>
					</div>
					<div>
						<a>판매방해 고객관리</a>
					</div>
					<div>
						<a>반품안심케어</a>
					</div>
				</div>

			</div>

			<div class="menu" onclick="sidebarbtn('side_content3', 'dropicon3')">
				<div>
					정산관리 <i></i>
					<div id="dropicon3" class="dropbtn"></div>
				</div>
			</div>
			<div id="side_content3" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>정산 내역 (일별/건별)</a>
					</div>
					<div>
						<a>항목별 정산 내역</a>
					</div>
					<div>
						<a>빠른정산</a>
					</div>
					<div>
						<a>부가세신고 내역</a>
					</div>
					<div>
						<a>세금계산서 조회</a>
					</div>
					<div>
						<a>비즈월렛 관리 (충전금)</a>
					</div>
					<div>
						<a>초보판매자 정산가이드</a>
					</div>
					<div>
						<a>우대수수료 환급내역</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content4', 'dropicon4')">
				<div>문의/리뷰관리</div>
				<div id="dropicon4" class="dropbtn"></div>
			</div>
			<div id="side_content4" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a href="InquiryManage.jsp">문의 관리</a>
					</div>
					<div>
						<a href="CustomerInquiry.jsp">고객문의 관리</a>
					</div>
					<div>
						<a href="Review.jsp">리뷰 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/event/REVIEW_EVENT/search">리뷰이벤트 관리</a>
					</div>
				</div>

			</div>
			<div class="menu" onclick="sidebarbtn('side_content5', 'dropicon5')">
				<div class="talk">
					톡톡상담관리 <img src="../Images/talkicon.png" />
				</div>
				<div id="dropicon5" class="dropbtn"></div>
			</div>
			<div id="side_content5" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a href="Talk_copy2.jsp">톡톡 상담하기</a>
					</div>
					<div>
						<a>쇼핑챗봇/AI FAQ 설정</a>
					</div>
					<div>
						<a>톡톡 응대분석</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content6', 'dropicon6')">
				<div>
					스토어 전시관리 <span class="upicon">N</span>
				</div>
				<div id="dropicon6" class="dropbtn"></div>
			</div>
			<div id="side_content6" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a href="CommonManageTotalLeft.jsp">스마트스토어</a>
					</div>
					<div>
						<a>쇼핑 스토리 관리</a>
					</div>
					<div>
						<a>라이브 예고 페이지 관리</a>
					</div>
					<div>
						<a>스토어 관리</a>
					</div>
					<div>
						<a>CLOVA MD 상품추천</a>
					</div>
				</div>

			</div>
			<div class="menu" onclick="sidebarbtn('side_content7', 'dropicon7')">
				<div>노출관리</div>
				<div id="dropicon7" class="dropbtn"></div>
			</div>
			<div id="side_content7" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>기획전 관리</a>
					</div>
					<div>
						<a>노출 서비스 관리</a>
					</div>
				</div>

			</div>
			<div class="menu" onclick="sidebarbtn('side_content8', 'dropicon8')">
				<div>
					고객혜택관리 <span class="upicon">N</span>
				</div>
				<div id="dropicon8" class="dropbtn"></div>
			</div>
			<div id="side_content8" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>혜택 등록</a>
					</div>
					<div>
						<a>혜택 조회/수정</a>
					</div>
					<div>
						<a>혜택 리포트</a>
					</div>
					<div>
						<a>고객등급 관리</a>
					</div>
					<div>
						<a>포인트 지급관리</a>
					</div>
					<div>
						<a>포인트 지급내역 조회</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content9', 'dropicon9')">
				<div>마케팅메세지</div>
				<div id="dropicon9" class="dropbtn"></div>
			</div>
			<div id="side_content9" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>마케팅 보내기</a>
					</div>
					<div>
						<a>마케팅 이력</a>
					</div>
					<div>
						<a>마케팅 통계</a>
					</div>
					<div>
						<a>쇼핑 소식 광고 소개</a>
					</div>
					<div>
						<a>AI 마케팅 효과분석</a>
					</div>
				</div>

			</div>
			<div class="menu"
				onclick="sidebarbtn('side_content10', 'dropicon10')">
				<div>
					커머스솔루션 <span class="upicon">N</span>
				</div>
				<div id="dropicon10" class="dropbtn"></div>
			</div>
			<div id="side_content10" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>솔루션 목록</a>
					</div>
					<div>
						<a>결제내역</a>
					</div>
				</div>

			</div>
			<div class="menu"
				onclick="sidebarbtn('side_content11', 'dropicon11')">
				<div>
					통계 <span class="upicon">N</span>
				</div>
				<div id="dropicon11" class="dropbtn"></div>
			</div>
			<div id="side_content11" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>요약</a>
					</div>
					<div>
						<a>판매분석</a>
					</div>
					<div>
						<a>마케팅분석</a>
					</div>
					<div>
						<a>쇼핑행동분석</a>
					</div>
					<div>
						<a>시장벤치마크</a>
					</div>
					<div>
						<a>판매성과예측</a>
					</div>
					<div>
						<a>고객현황</a>
					</div>
					<div>
						<a>재구매 통계</a>
					</div>
				</div>
			</div>
			<div class="menu"
				onclick="sidebarbtn('side_content12', 'dropicon12')">
				<div>
					원쁠딜 <span class="upicon">N</span>
				</div>
				<div id="dropicon12" class="dropbtn"></div>
			</div>
			<div id="side_content12" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>원쁠딜 소개</a>
					</div>
					<div>
						<a>원쁠딜 제안관리</a>
					</div>
					<div>
						<a>원쁠템 제안관리</a>
					</div>
					<div>
						<a>공지/FAQ</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content13', 'dropicon13')">
				<div>판매자지원프로그램</div>
				<div id="dropicon13" class="dropbtn"></div>
			</div>
			<div id="side_content13" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>판매자 지원 프로그램</a>
					</div>
				</div>

			</div>
			<div class="menu"
				onclick="sidebarbtn('side_content14', 'dropicon14')">
				<div>판매자정보</div>
				<div id="dropicon14" class="dropbtn"></div>
			</div>
			<div id="side_content14" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a href="PSellerInformation.jsp">판매자 정보</a>
					</div>
					<div>
						<a>상품판매권한 신청</a>
					</div>
					<div>
						<a>심사내역 조회</a>
					</div>
					<div>
						<a>판매자 등급</a>
					</div>
					<div>
						<a>매니저 관리</a>
					</div>
					<div>
						<a>사업자 전환</a>
					</div>
				</div>

			</div>
			<div class="menu"
				onclick="sidebarbtn('side_content15', 'dropicon15')">
				<div>지식재산권침해관리</div>
				<div id="dropicon15" class="dropbtn"></div>
			</div>
			<div id="side_content15" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>지식재산권 침해관리</a>
					</div>
				</div>

			</div>
			<div class="menu"
				onclick="sidebarbtn('side_content16', 'dropicon16')">
				<div>
					물류 관리 <span class="upicon">N</span>
				</div>
				<div id="dropicon16" class="dropbtn"></div>
			</div>
			<div id="side_content16" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>NFA 서비스 신청</a>
					</div>
					<div>
						<a>판매량 예측</a>
					</div>
				</div>

			</div>
			<div class="menu"
				onclick="sidebarbtn('side_content17', 'dropicon17')">
				<div>공지사항</div>
				<div id="dropicon17" class="dropbtn"></div>
			</div>
			<div id="side_content17" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>공지사항</a>
					</div>
				</div>

			</div>
		</div>
		<!-- 4번쨰 _______________________-->
		<div id="menuline"></div>
		<div>
			<h2 class="title">교육 프로그램 바로가기</h2>
			<div class="shortcut">
				<div>
					온라인 교육 <img src="../Images/shorcuticon.png" />
				</div>
				<div class="subtitle">
					쇼핑 라이브 교육 <img src="../Images/shorcuticon.png" />
				</div>
			</div>
			<h2 class="title mg35">네이버 비즈니스 금융센터</h2>
			<div class="shortcut">
				<div>
					정책지원금 <img src="../Images/shorcuticon.png" />
				</div>
				<div class="subtitle">
					빠른정산 <img src="../Images/shorcuticon.png" />
				</div>
				<div class="subtitle">
					사업자 대출 <img src="../Images/shorcuticon.png" />
				</div>
				<div class="subtitle">
					사업자 보험 <img src="../Images/shorcuticon.png" />
				</div>
			</div>
			<h2 class="title mg35">공식 블로그 바로가기</h2>
			<div class="shortcut">
				<div>
					네이버쇼핑 파트너 <img src="../Images/shorcuticon.png" />
				</div>
				<div class="subtitle">
					쇼핑윈도 <img src="../Images/shorcuticon.png" />
				</div>
			</div>
		</div>

		<!-- 5번째 ______________ -->
		<div class="last_leftside">
			<div class="clicktalk">
				<img class="minitalk" src="../Images/talkicon2.png" />톡톡상담
			</div>
		</div>
	</div>
	<div id="right_side" class="fl">
		<div class="backgroundtheme">
			<div class="width12">
				<!-- 배송현황 관리 -->

				<div class="salehead">
					<h2 class="manage ygfontstyle4">문의 관리</h2>

				</div>
				<div style="clear: both;"></div>

				<div class="ygpad">
					<h3 class="ygfontstyle2 ygfontstyle4">
						문의내역 <strong><%=cnt2 %></strong>건
					</h3>
					<button class="ygstyle2" onclick="spread('filter')">
						<img src="../Images/filter.png">
					</button>
				</div>

				<div id="filter" class="ygstyle1" style="display: none;">
					<ul class="seller_list_border">
						<li><label class="ygstyle3">문의일</label>
							<div id="div_5113" class="date5">
								<button class="selectpay">오늘</button>
								<button class="date6 selectpay">3일</button>
								<button class="date6 selectpay">1주일</button>
								<button class="date6 selectpay">1개월</button>
								<button class="date6 selectpay on">3개월</button>
							</div>
							<div id="div_date_date" class="adddate">
								<div class="fl calendar_st">
									<input type="text" id="input_date" value="2023.05.25" />
								</div>
								<div class="fl">~</div>
								<div class="fl calendar_st">
									<input type="text" id="input_date2" value="2023.05.25" />
								</div>
								<div style="clear: both;"></div>
							</div>
						<li class="qmanage"><label class="control-label"
							for="sellerAnswer">답변</label>
							<div class="input-content">
								<div class="form-inline">
									<div class="form-group">
										<div
											class="selectize-control ng-pristine ng-untouched ng-valid single">
											<div
												class="selectize-input items full has-options has-items ng-valid ng-pristine">
												<div data-value="" class="item">전체</div>
												<input type="text" autocomplete="off" tabindex="0"
													readonly=""
													style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
											</div>
											<div id="q_manage"
												class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
												style="display: none; width: 206px; top: 34px; left: 0px; visibility: visible;">
												<div class="selectize-dropdown-content">
													<div data-value="total" data-selectable=""
														class="option selected">전체</div>
													<div data-value="false" data-selectable="" class="option">미답변</div>
													<div data-value="true" data-selectable="" class="option">답변완료</div>
												</div>
											</div>
										</div>
										<select id="sellerAnswer" class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty"
											tabindex="-1"
											style="width: 4px; opacity: 0; position: absolute; left: -10000px;"><option
												value="" selected="selected">전체</option></select>
									</div>
								</div>
							</div></li>
						<li>
							<button id="searchbutton">
								<span>검색</span>
							</button>
							<button id="searchbutton11">
								<span>초기화</span>
							</button>
						</li>
					</ul>
				</div>
					<div class="jy">
					
					<% int cnt = 0;
					   for(CustomerInquiryDto dto : listCustomerInquiryDto) {
					       cnt++;
					%>
					<div id="<%=cnt%>" class="anparent">
					    <div id="fl" class="date">
					        <img class="imgtype" src="https://shop-phinf.pstatic.net/20200418_210/15871866582182zgqf_JPEG/24548991791616982_1239311195.jpg?type=f220_220">
					        <div class="ygstyle">
					            <div>
					                <span class="ygfontstyle3"><%=dto.getStatus() %></span>
					                <strong class="ygfontstyle"><%=dto.getpname() %></strong>
					                <span class="ygfontstyle5<%=cnt%>"><%=dto.getSerial_number() %></span>
					            </div>
					            <div style="line-height: 32px;">
					                <span>
					                    <span class="ygfontstyle6">스마트스토어</span>
					                    <span class="ygfontstyle7">CustomerDaily</span>
					                </span>
					                <span class="ygfontstyle7"><%=dto.getPnumber() %></span>
					                <span id="ygfontstyle_" class="ygfontstyle7"><%=dto.getcustomer_id() %></span>
					                <span class="ygfontstyle7"><%=dto.getInquiry_date2() %><ng-if ng-if="comment.regDate !== comment.modDate">&nbsp;<%=dto.getProcessing_date() %></ng-if></span>
					            </div>
					            <p style="line-height: 3px;" class="ygfontstyle"><%=dto.getInquiry_content()%></p>
					            <div>
					                <button class="exeldown3 an<%=cnt%>">
					                    <span class="searchitemset">답글</span>
					                </button>
					            </div>
					        </div>
					    </div>
					    <form action="InquiryUpdateAction.jsp" id="inquiry_return_form" method="post">
					        <input type="hidden" class="input_seller_id" name="seller_id" value="<%=판매자아이디%>"/>
					        <input type="hidden" id="serial_number<%=cnt%>" name="serial_number" value="<%=게시물번호%>"/>
					        <div class="inqueryst bn<%=cnt%>" style="display: none;">
					            <!-- 답글입력 -->
					            <div class="input_box">
					                <div class="form-group">
					                    <textarea class="inqueryst1" id="answer_content<%=cnt%>" name="answer_content" rows="3" placeholder="답글을 입력해 주세요." maxlength="1000"></textarea>
					                </div>
					                <span class="input_box_btn btn-write">
					                    <button type="submit" class="btn">
					                        <span class="">등록</span>
					                        <span class="progress"><span class="progress-inner notransition"></span></span>
					                    </button>
					                </span>
					            </div>
					            <div style="float: right;">
					                <span class="text_count">
					                    <em class="text-primary" aria-label="현재 입력한 글자수">
					                        <span class="text_primary charcount">0</span>
					                    </em>/
					                    <span class="charcount" aria-label="전체 입력 가능한 글자수">1000</span>
					                </span>
					            </div>
					        </div>
					    </form>
					</div>
					<% } %>
					</div>
					<div style="clear:both"></div>
					<!-- 답글입력 -->
<!-- 					<a href="" role="button" ng-click="vm.setPage(page)"> -->
					<div class="numbutton numbuttonstyle">
						<%
						for(int i=1; i<=count/5+1; i++) {
						%>
							<a href="InquiryManage.jsp?seller_id=<%=loginId%>&page=<%=i%>"><strong class="numbuttonstrong1"><%=i %></strong></a>
						<%	
						}
						%>
					</div>
<!-- 					</a> -->
				</div>
				<div>
					<footer class="storefooter" role="contentinfo">
						<div class="innerfooter">
							<ul class="provis bottomstyle">
								<li class="li2"><a class="footerstyle"
									href="https://sell.smartstore.naver.com/#/terms/agreement"
									target="_blank">이용약관</a></li>
								<li class="li2"><a class="footerstyle"
									href="https://new-m.pay.naver.com/member/terms-policy/finance"
									role="button" target="_blank" title="전자금융거래 이용약관">전자금융거래
										이용약관</a></li>
								<li class="li2"><a class="footerstyle"
									href="https://business.naver.com/privacy/privacy.html"
									target="_blank" title="새창"><strong>개인정보 처리방침</strong></a></li>
								<li class="li2"><a class="footerstyle"
									href="https://policy.naver.com/policy/youthpolicy.html"
									target="_blank" title="새창">청소년 보호정책</a></li>
								<li class="li2"><a class="footerstyle"
									href="javascript:void(0)" role="button"
									 title="팝업">책임의 한계와 법적고지</a></li>
								<li class="li2"><a class="footerstyle"
									href="https://ips.smartstore.naver.com/main/rules/safety"
									target="_blank" title="새창">안전거래가이드</a></li>
								<li class="li2"><a class="footerstyle"
									href="https://help.sell.smartstore.naver.com/index.help"
									target="_blank">고객센터</a></li>
							</ul>
							<p class="notice noticestyle bottomstyle">
								네이버㈜는 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매자에게
								있습니다. <br> 또한 판매자와 구매자간의 직거래에 대하여 당사는 관여하지 않기 때문에 거래에 대해서는
								책임을 지지 않습니다.
							</p>
							<ul class="provis bottomstyle">
								<li class="liststyles">사업자등록번호 : 220-81-62517</li>
								<li class="liststyles">통신판매업신고번호 : 제2006-경기성남-0692호</li>
								<li class="liststyles">대표이사 : JSMG</li>
								<li class="liststyles"><a id="businessinfo"
									href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208162517"
									class="btn-box" target="_blank" title="새창">사업자정보확인</a></li>
							</ul>
							<ul class="provis totalinfo bottomstyle">
								<li id="addressinformat" class="address">주소 : 경기도 성남시 분당구
									정자일로 95, NAVER 1784, 13561</li>
								<li><button id="callchat" class="totalinfo2 totalinfo4"
										type="button" 
										class="btn-box">전화상담 (전화 전 클릭)</button></li>
								<li><a class="talktalkline totalinfo3"
									ng-href="https://talk.naver.com/ct/wcbgqj?frm=cstpn"
									class="btn-box" target="_blank"
									data-action-location-id="talktalkCounseling"
									href="https://talk.naver.com/ct/wcbgqj?frm=cstpn"><i
										class="" aria-hidden="true"></i> <img
										src="../Images/talktalk.png"> 톡톡상담</a>
									</li>
							</ul>
							<address class="naverlinkstyle2 bottomstyle">
							<p>
								<a class="navericon" href="https://www.navercorp.com/"
									class="logo" target="_blank" title="새창"></a>
							</p>
							<p class="naverlinkstyle3">Copyright ©</p>
							<a class="naverlinkstyle4" href="https://www.navercorp.com/"
								class="copy-navercorp" target="_blank" title="새창"><strong
								class="naverlinkstyle">NAVER Corp.</strong></a>
							<p class="naverlinkstyle5">All rights reserved.</p>
							</address>
						</div>
					</footer>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
</body>
</html>
