<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%
	ProductDao productDao = new ProductDao();
	String a = "";
	String seller_id="";
	ArrayList<ProductDto> listProductDto = null;
	try{
		a = request.getParameter("sales_status");
		seller_id = request.getParameter("seller_id");
		listProductDto = productDao.select(a,seller_id);
	}catch(Exception e) {
		a="판매중";
		seller_id="jiyoonjung";
		listProductDto = productDao.select(a,seller_id);
	}
	String pnumber = "";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 등록</title>
	<link rel="stylesheet" href="../css/TopSidebar.css"/>
	<link rel="stylesheet" href="../css/Announcement.css"/>
	<script src="../js/jquery-3.7.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		$(function() {
			$(".option_text").click(function() {
				$(".top").html("<div class='toptext'>"+$(this).text()+"</div> <div id='clickserach' class='drop_serach'></div>");
				$(".top_serach").css("display","none");
			});
			$(".myhome").click(function() {
				alert("준비중입니다");
			});
			$(".bell").click(function() {
				alert("준비중입니다");
			});
			$(".topmenu span").click(function() {
				alert("준비중입니다");
			});
			$(".preparing").click(function() {
				alert("준비중입니다.")
			});
			$("#input_date").datepicker({
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
	$("#input_date2").datepicker({
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
	$(".selectize-control").click(function() {
		let showdis = $(".selectize-dropdown").css('display');
		if (showdis == 'none') {
			let showdis = $(".selectize-dropdown").css('display', 'block');
		} else if (showdis == 'block') {
			let showdis = $(".selectize-dropdown").css('display', 'none');
		}
	});
	$(".option").click(function() {
		let select_value = $(this).attr("data-value");
		if (select_value === "ORDINARY") {
			$(".item_se").text("일반");
		} else if (select_value === "PRODUCT") {
			$(".item_se").text("상품");
		} else if (select_value === "EVENT") {
			$(".item_se").text("이벤트");
		} else if (select_value === "DELIVERY") {
			$(".item_se").text("배송지연");
		}
	});
	$(".selectize-control2").click(function() {
		let showdis = $(".selectize-dropdown2").css('display');
		if (showdis == 'none') {
			let showdis = $(".selectize-dropdown2").css('display', 'block');
		} else if (showdis == 'block') {
			let showdis = $(".selectize-dropdown2").css('display', 'none');
		}
	});
	$(".option2").click(function() {
		let select_value = $(this).attr("data-value");
		$(".item_se2").text($(this).text());
		$("#pnumber").val($(this).children().val());
	});
	$("#radiochoose").click(function() {
		$(".dateborder").css('display','block');
	});
	$("#radionone").click(function() {
		$(".dateborder").css('display','none');
	});
	$(".detail_btn.reset").click(function() {
		$(".form-control").val("");
	});
	/* $("html").click(function() {
		if ($(".selectize-dropdown2").css('display') === 'block') {
			$(".selectize-dropdown2").css('display', 'none');
		}else if ($(".selectize-dropdown").css('display') === 'block') {
			$(".selectize-dropdown").css('display', 'none');
		}
	}); */
});
			
	</script>
	<script>
		function sidebarbtn(a, b){
			let sc = document.getElementById(a);
			let di = document.getElementById(b);
			if(sc.style.display=="none"){
				sc.style.display="block";
				di.className = "afterdropbtn";
			}else if(sc.style.display=="block"){
				sc.style.display="none";
				di.className = "dropbtn";
			}
		}
	</script>
	<script>
		function topserachbtn(a, b){
			let serc = document.getElementById(a);
			let cs = document.getElementById(b);
			if(serc.style.display=="none"){
				serc.style.display="block";
				cs.className = "after_serach";
			}else if(serc.style.display=="block"){
				serc.style.display="none";
				cs.className = "drop_serach";
			}
		}
	</script>
</head>
<body>
	<div id="header">
		<div class="left-header fl"> 
			<div class="fl smartlogo"></div>
			<div class="fl topmenu">
				<span>쇼핑파트너센터</span>
				<span>커머스솔루션마켓</span>
				<span>네이버광고
					<img src="../Images/headerlogo.png">
				</span>
			</div>
			<div style="clear:both;"></div>	
		</div>	
		<div class="right-header fr">
			<div class="topright fl">
				<div class="fl">
					<span class="topid">mpkung</span>님
					<a><span class="myhome">내정보</span></a>
				</div>
				<div class="fl">
					<i class="bell"></i>
					<i class="newicon"></i>
				</div>
				<div class="logout fl">로그아웃</div>
				<div class="imformation fl">도움말</div>
				<div class="header-talk fl">
					<img src="../Images/headertalk.png"/> 
					<span>톡톡상담</span>
				</div>
				<div style="clear:both;"></div>	
			</div>
		</div>
		<div style="clear:both;"></div>	
	</div>
	
	<!-- 왼쪽 사이드바 -->
	<div id="left_side" class="fl">
		<div>
			<img src="https://sell.smartstore.naver.com/images/no-img.jpg">
			<p>CustomerDaily</p>
		</div>
		<!-- 2번쨰________________ -->
		<div>
			<div class="top" id="serach_text" onclick="topserachbtn('serach_content','clickserach')"> 
				<div class="toptext">수취인명</div>
				<div id="clickserach" class="drop_serach"></div>	
			</div>
			<div id="serach_content" class="top_serach" style="display:none;">
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
					<input type="text"/>
					<img src="../Images/searchicon.png"/>
			</div>
		</div>
		<!-- 3번쨰________________________-->
		<div>
			<div class="menu" onclick="sidebarbtn('side_content', 'dropicon')">
				<div>상품관리</div>
				<div id="dropicon" class="dropbtn"></div>
			</div>
			<div id="side_content" class="dropcontent" style="display:none;">
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
				<div>판매관리
					<i></i>
					<div id="dropicon2" class="dropbtn"></div>
				</div>
			</div>
			<div id="side_content2" class="dropcontent" style="display:none;">
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
				<div>정산관리
					<i></i>
					<div id="dropicon3" class="dropbtn"></div>
				</div>
			</div>
			<div id="side_content3" class="dropcontent" style="display:none;">
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
			<div id="side_content4" class="dropcontent" style="display:none;">
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
				<div class="talk">톡톡상담관리
					<img src="../Images/talkicon.png"/>
				</div>
				<div id="dropicon5" class="dropbtn"></div>
			</div>
			<div id="side_content5" class="dropcontent" style="display:none;">
				<div class="droptext">
					<div>
						<a href="Talk_copy2.jsp">톡톡 상담하기</a>
					</div>
					<div class="preparing">
						<a>쇼핑챗봇/AI FAQ 설정</a>
					</div>
					<div class="preparing">
						<a>톡톡 응대분석</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content6', 'dropicon6')">
				<div>스토어 전시관리
					<span class="upicon">N</span>
				</div>
				<div id="dropicon6" class="dropbtn"></div>
			</div>
			<div id="side_content6" class="dropcontent" style="display:none;">
				<div class="droptext">
					<div>
						<a href="CommonManageTotalLeft.jsp">스마트스토어</a>
					</div>
					<div class="preparing">
						<a>쇼핑 스토리 관리</a>
					</div>
					<div class="preparing">
						<a>라이브 예고 페이지 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/sellers/store/detail/smartstore">스토어 관리</a>
					</div>
					<div class="preparing">
						<a>CLOVA MD 상품추천</a>
					</div>
				</div>
			
			</div>
			<div class="menu" onclick="sidebarbtn('side_content7', 'dropicon7')">
				<div>노출관리</div>
				<div id="dropicon7" class="dropbtn"></div>
			</div>
			<div id="side_content7" class="dropcontent" style="display:none;">
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
				<div>고객혜택관리
					<span class="upicon">N</span>
				</div>
				<div id="dropicon8" class="dropbtn"></div>
			</div>
			<div id="side_content8" class="dropcontent" style="display:none;">
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
			<div id="side_content9" class="dropcontent" style="display:none;">
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
			<div class="menu" onclick="sidebarbtn('side_content10', 'dropicon10')">
				<div>커머스솔루션
					<span class="upicon">N</span>
				</div>
				<div id="dropicon10" class="dropbtn"></div>
			</div>
			<div id="side_content10" class="dropcontent" style="display:none;">
				<div class="droptext">
					<div>
						<a>솔루션 목록</a>
					</div>
					<div>
						<a>결제내역</a>
					</div>
				</div>
			
			</div>
			<div class="menu" onclick="sidebarbtn('side_content11', 'dropicon11')">
				<div>통계
					<span class="upicon">N</span>
				</div>
				<div id="dropicon11" class="dropbtn"></div>
			</div>
			<div id="side_content11" class="dropcontent" style="display:none;">
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
			<div class="menu" onclick="sidebarbtn('side_content12', 'dropicon12')">
				<div>원쁠딜
					<span class="upicon">N</span>
				</div>
				<div id="dropicon12" class="dropbtn"></div>
			</div>
			<div id="side_content12" class="dropcontent" style="display:none;">
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
			<div id="side_content13" class="dropcontent" style="display:none;">
				<div class="droptext">
					<div>
						<a>판매자 지원 프로그램</a>
					</div>
				</div>
			
			</div>
			<div class="menu" onclick="sidebarbtn('side_content14', 'dropicon14')">
				<div>판매자정보</div>
				<div id="dropicon14" class="dropbtn"></div>
			</div>
			<div id="side_content14" class="dropcontent" style="display:none;">
				<div class="droptext">
					<div>
						<a href="https://sell.smartstore.naver.com/#/seller/info">판매자 정보</a>
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
			<div class="menu" onclick="sidebarbtn('side_content15', 'dropicon15')">
				<div>지식재산권침해관리</div>
				<div id="dropicon15" class="dropbtn"></div>
			</div>
			<div id="side_content15" class="dropcontent" style="display:none;">
				<div class="droptext">
					<div>
						<a>지식재산권 침해관리</a>
					</div>
				</div>
			
			</div>
			<div class="menu" onclick="sidebarbtn('side_content16', 'dropicon16')">
				<div>물류 관리
					<span class="upicon">N</span>
				</div>
				<div id="dropicon16" class="dropbtn"></div>
			</div>
			<div id="side_content16" class="dropcontent" style="display:none;">
				<div class="droptext">
					<div>
						<a>NFA 서비스 신청</a>
					</div>
					<div>
						<a>판매량 예측</a>
					</div>
				</div>
			
			</div>
			<div class="menu" onclick="sidebarbtn('side_content17', 'dropicon17')">
				<div>공지사항</div>
				<div id="dropicon17" class="dropbtn"></div>
			</div>
			<div id="side_content17" class="dropcontent" style="display:none;">
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
				<div>온라인 교육
					<img src= "../Images/shorcuticon.png"/>
				</div>
				<div class="subtitle">쇼핑 라이브 교육
					<img src= "../Images/shorcuticon.png"/>
				</div>
			</div>
			<h2 class="title mg35">네이버 비즈니스 금융센터</h2>
				<div class="shortcut">
					<div>정책지원금
						<img src= "../Images/shorcuticon.png"/>
					</div>
					<div class="subtitle">빠른정산
						<img src= "../Images/shorcuticon.png"/>
					</div>
					<div class="subtitle">사업자 대출
						<img src= "../Images/shorcuticon.png"/>
					</div>
					<div class="subtitle">사업자 보험
						<img src= "../Images/shorcuticon.png"/>
					</div>
				</div>
			<h2 class="title mg35">공식 블로그 바로가기</h2>
				<div class="shortcut">
					<div>네이버쇼핑 파트너
						<img src= "../Images/shorcuticon.png"/>
					</div>
					<div class="subtitle">쇼핑윈도
						<img src= "../Images/shorcuticon.png"/>
					</div>
				</div>
		</div>
		
		<!-- 5번째 ______________ -->
		<div class="last_leftside">
			<div class="clicktalk">
			<img class="minitalk" src="../Images/talkicon2.png"/>톡톡상담
			</div>
		</div>
	</div>
	<div id="right_side" class="fl">
		<div class="seller-sub-title">
			<div class="fl">
				<div class="navbar fl">
					<input type="button" style="border:none; height:60px; width:20px;">
				</div>
				<div><h2 class="title">상품 공지사항 등록</h2></div>
				<div style="clear:both;"></div>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div class="seller-sub-content">
		<form action="AnnouncementAction.jsp" method="post">
			<div class="panel panel-seller">
				<div class="panel-body">
					<ul class="seller-box">
						<li id="first_li">
							<label class="control-label">분류</label>
							<div class="input-content">
								<div class="form-inline">
									<div class="form-group">
										<div class="selectize-control">
											<div class="selectize-input">
												<div class="item_se">상품</div>
											</div>
											<div class="selectize-dropdown">
												<div class="dropdown_content">
													<div data-value="ORDINARY" data-selectable class="option">일반</div>
													<div data-value="EVENT" data-selectable class="option">이벤트</div>
													<div data-value="DELIVERY" data-selectable class="option">배송지연</div>
													<div data-value="PRODUCT" data-selectable class="option selected">상품</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div style="clear:both"></div>
						</li>
						<li>
							<label class="control-label">상품선택</label>
							<div class="input-content">
								<div class="form-inline">
									<div class="form-group">
										<div class="selectize-control2">
											<div class="selectize-input2">
												<div class="item_se2">상품선택</div>
												<input id="pnumber" type="hidden" name="pnumber" value="<%=pnumber %>">
											</div>
											<div class="selectize-dropdown2">
												<div class="dropdown_content2">
												<%for(ProductDto dto : listProductDto) {%>
													<div data-selectable class="option2"><%=dto.getPname() %>
														<input type="hidden" value="<%=dto.getPnumber()%>">
													</div>
												<%}%>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div style="clear:both"></div>
						</li>
						<li>
							<label class="control-label">제목</label>
							<div class="input-content">
								<div class="input-group">
									<div class="from-group">
										<div class="seller-input-wrap">
											<input type="text" name="subject" class="form-control" placeholder="제목을 입력해 주세요."maxlength="50"/>
										</div>
									</div>
								</div>
							</div>
							<div style="clear:both"></div>
						</li>
						<li>
							<label class="control-label">상품 공지사항 상세</label>
							<div class="input-content">
								<div class="seller-product-detail seller-tap-wrapper">
									<ul class="detail_ul">
										<li>
											<span>HTML 작성</span>
										</li>
									</ul>
									<div class="write-html">
										<div class="form-group">
											<textarea name="content" rows="3" class="form-control"></textarea>
										</div>
									</div>
								</div>
								<div class="mg10"></div>
								<div class="detail-content">
									<a role="button" class="detail_btn reset">
										<i class="fn">
											초기화
										</i>
									</a>
									<a role="button" class="detail_btn">
										<i class="fn">
											스마트에디터 사용하기
										</i>
									</a>
								</div>
							</div>
						<div style="clear:both"></div>
						</li>
						<li>
							<label class="control-label">전시기간 설정 </label>
							<div class="input-content">
								<div class="form-inline">
									<div class="form-group" style="vertical-align: top;">
										<div class="seller-input-toggle">
											<input type="radio" class="choosebox" name="dateradio" id="radiochoose"/>
											<label for="radiochoose">설정함</label>
											<input type="radio" class="choosebox" name="dateradio" id="radionone" checked/>
											<label for="radionone">설정안함</label>
										</div>
									</div>
								</div>
							</div>
							<div id="yes" class="dateborder" style="display: none;">
								<div id="div_date_date" style="margin-left:189px;">
									<div class="fl">
										<input id="input_date" type="text" value="" />
									</div>
									<div class="fl">~</div>
									<div class="fl">
										<input id="input_date2" type="text" name="endDate" value="" />
									</div>
									<div style="clear: both;"></div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="btnmg">
				<button class="updatebtn backco" type="submit">
					<span>상품 공지사항 등록</span>
				</button>
				<button class="updatebtn default" type="button">
					<span>취소</span>
				</button>
			</div>
		</form>
			<!--form태그 끝  -->
			<div class="footer_area">
		<div class="footer_box">
			<div class="top_footer">
				<a href="https://policy.naver.com/rules/service.html">네이버 이용약관</a>
				<a href="https://new-m.pay.naver.com/member/viewer/pdf?file=npay-usage">네이버페이 이용약관</a>
				<a href="https://policy.naver.com/rules/privacy.html"><strong>개인정보처리방침</strong></a>
				<a href="https://shopping.naver.com/help/legal-basis">법적고지 및 주의사항</a>
				<a href="https://join.shopping.naver.com/index.nhn">입점안내</a>
				<a>쇼핑윈도 노출안내</a><br/>
				<a href="https://center.shopping.naver.com/main">쇼핑파트너센터</a>
				<a href="https://sell.smartstore.naver.com/#/home/about">스마트스토어센터</a>
				<a href="https://safety.shopping.naver.com/">안전거래센터</a>
				<a href="https://new-m.pay.naver.com/member/viewer/pdf?file=finance">전자금융거래약관</a>
				<a href="https://help.pay.naver.com/index.help">쇼핑&페이 고객센터</a>
			</div>
			<p class="marketing_footer">네이버㈜는 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매자에게 있습니다.</p>
			<div class="address">
				<span>사업자등록번호 : 220-81-62517</span>
				<span>통신판매업신고번호 : 제2006-경기성남-0692호</span>
				<span>대표이사 : 최수연</span>
				<span>
				 	<a href="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208162517">사업자등록정보확인</a>
				</span>
				<span>이메일 :
					<a href="mailto:helpcustomer@naver.com">helpcustomer@naver.com</a>
				</span> <br/>
				<span>주소 : 경기도 성남시 분당구 정자일로 95, NAVER 1784, 13561</span>
				<span>대표전화 : 1588-3819</span>
				<span>
					<a href="https://help.pay.naver.com/mail/form.help">
						<strong>1:1문의 바로가기</strong>
					</a>
				</span>
				<span>호스팅 서비스 제공 : NAVER Cloud</span>
			</div>
			<div class="footer_copyright">
				<a class="footer_navericon" href="https://www.naver.com/"></a>
				Copyright ©
				<strong>
					<a class="navercorp" href="https://www.navercorp.com/">NAVER Corp.</a>
				</strong>
				All Rights Reserved.			
			</div>
		</div>
	</div>
		</div>
	<div style="clear:both;"></div>
	</div>
</body>
</html>
