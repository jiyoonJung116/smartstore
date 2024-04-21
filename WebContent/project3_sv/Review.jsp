<%@page import="dto.ReviewDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginId = (String)session.getAttribute("id");
	String date = request.getParameter("date");
	String date2 = request.getParameter("date2");
	
	ReviewDao reviewDao = new ReviewDao();
	ArrayList<ReviewDto> listReviewDto = reviewDao.review_select(loginId, date, date2);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰관리</title>
	<link rel="stylesheet" href="../css/TopSidebar.css"/>
	<link rel="stylesheet" href="../css/review2.css"/>
	<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="../js/jquery-3.7.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
	
	function getToday(){
		let today = new Date();
		let year = today.getFullYear();
		let month = String(today.getMonth()+1).padStart(2,'0');
		let day = String(today.getDate()).padStart(2,'0');
		let formattedDate = year +'.'+month+'.'+day;
		return formattedDate;
	}
	
	function getThisWeek() {
		let today = new Date();
		let startOfWeek = new Date(today.getFullYear(), today.getMonth(), today.getDate() - today.getDay());
		let endOfWeek = new Date(today.getFullYear(), today.getMonth(), today.getDate() + (6 - today.getDay()));
		let startDate = startOfWeek.getFullYear() + '.' + String(startOfWeek.getMonth() + 1).padStart(2, '0') + '.' + String(startOfWeek.getDate()).padStart(2, '0');
		let endDate = endOfWeek.getFullYear() + '.' + String(endOfWeek.getMonth() + 1).padStart(2, '0') + '.' + String(endOfWeek.getDate()).padStart(2, '0');
	    return [startDate, endDate];
	}

	
	function getThisMonth() {
		let today = new Date();
		let startOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		let endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		let startDate = startOfMonth.getFullYear() + '.' + String(startOfMonth.getMonth() + 1).padStart(2, '0') + '.' + String(startOfMonth.getDate()).padStart(2, '0');
		let endDate = endOfMonth.getFullYear() + '.' + String(endOfMonth.getMonth() + 1).padStart(2, '0') + '.' + String(endOfMonth.getDate()).padStart(2, '0');
	    return [startDate, endDate];
	}
	
	function getThisThreeMonths() {
		let today = new Date();
		let startOfThreeMonths = new Date(today.getFullYear(), today.getMonth() - 2, 1);
		let endOfThreeMonths = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		let startDate = startOfThreeMonths.getFullYear() + '.' + String(startOfThreeMonths.getMonth() + 1).padStart(2, '0') + '.' + String(startOfThreeMonths.getDate()).padStart(2, '0');
		let endDate = endOfThreeMonths.getFullYear() + '.' + String(endOfThreeMonths.getMonth() + 1).padStart(2, '0') + '.' + String(endOfThreeMonths.getDate()).padStart(2, '0');
	    return [startDate, endDate];
	}
	
	function getThisSixMonths() {
		  let today = new Date();
		  let startOfSixMonths = new Date(today.getFullYear(), today.getMonth() - 5, 1);
		  let endOfSixMonths = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		  let startDate = startOfSixMonths.getFullYear() + '.' + String(startOfSixMonths.getMonth() + 1).padStart(2, '0') + '.' + String(startOfSixMonths.getDate()).padStart(2, '0');
		  let endDate = endOfSixMonths.getFullYear() + '.' + String(endOfSixMonths.getMonth() + 1).padStart(2, '0') + '.' + String(endOfSixMonths.getDate()).padStart(2, '0');
		  return [startDate, endDate];
		}

		function getThisYear() {
		  let today = new Date();
		  let startOfYear = new Date(today.getFullYear(), 0, 1);
		  let endOfYear = new Date(today.getFullYear(), 11, 31);
		  let startDate = startOfYear.getFullYear() + '.' + String(startOfYear.getMonth() + 1).padStart(2, '0') + '.' + String(startOfYear.getDate()).padStart(2, '0');
		  let endDate = endOfYear.getFullYear() + '.' + String(endOfYear.getMonth() + 1).padStart(2, '0') + '.' + String(endOfYear.getDate()).padStart(2, '0');
		  return [startDate, endDate];
		}
	
		$(function() {
			$(".smartlogo").click(function(){
	    		location.href = "MainPage.jsp";
	    	});
			$(".pdsel_date, .pd_excel, .pd_cnt").click(function(){
				alert("준비중입니다");
			});
			$("#searchbutton").click(function(){ /*데이터를 넘기는 쪽  */
				let date = $("#input_date").val();
				date = date.replaceAll(".","-");
				let date2 = $("#input_date2").val();
				date2 = date2.replaceAll(".","-");
				let encodedDate = encodeURIComponent(date);
				let encodedDate2 = encodeURIComponent(date2);
				
				location.href = "../project3_sv/Review.jsp?date=" + encodedDate + "&date2=" + encodedDate2;
			});
			$(document).ready(function() {
			    let weekDates = getThisWeek();
			    $("#input_date").val(weekDates[0]);
			    $("#input_date2").val(weekDates[1]);
			});
			$("#today").click(function() {
				let today = new Date();
				let formattedDate = today.getFullYear() + '.' + String(today.getMonth() + 1).padStart(2, '0') + '.' + String(today.getDate()).padStart(2, '0');
			    $("#input_date").val(formattedDate);
			    $("#input_date2").val(formattedDate);
			});

			$("#1week").click(function() {
				let weekDates = getThisWeek();
			    $("#input_date").val(weekDates[0]);
			    $("#input_date2").val(weekDates[1]);
			});
			
			$("#1month").click(function() {
				let monthDates = getThisMonth();
			    $("#input_date").val(monthDates[0]);
			    $("#input_date2").val(monthDates[1]);
			});

			$("#3month").click(function() {
				let threeMonthsDates = getThisThreeMonths();
			    $("#input_date").val(threeMonthsDates[0]);
			    $("#input_date2").val(threeMonthsDates[1]);
			});
			$("#6month").click(function() {
				let threeMonthsDates = getThisSixMonths();
			    $("#input_date").val(threeMonthsDates[0]);
			    $("#input_date2").val(threeMonthsDates[1]);
			});
			$("#1year").click(function() {
				let threeMonthsDates = getThisYear();
			    $("#input_date").val(threeMonthsDates[0]);
			    $("#input_date2").val(threeMonthsDates[1]);
			});
				$(".option_text").click(function() {
					$(".top").html("<div class='toptext'>"+$(this).text()+"</div> <div id='clickserach' class='drop_serach'></div>");
					$(".top_serach").css("display","none");
				});
			$(".dropbox1").click(function() {
				if($(".drop1").css("display")==="block") {
					$(".drop1").css("display","none");
				} else if($(".drop1").css("display")==="none") {
					$(".drop1").css("display","block");
				}
			});
			$(".dropbox2").click(function() {
				if($(".drop2").css("display")==="block") {
					$(".drop2").css("display","none");
				} else if($(".drop2").css("display")==="none") {
					$(".drop2").css("display","block");
				}
			});
			$("#type_allcheck").click(function() {
				if($("#type_allcheck").prop("checked")) {
					$(".type_check1").prop("checked",true);
					$(".type_check1").prop("disabled",true);
				} else {
					$(".type_check1").prop("checked",false);
					$(".type_check1").prop("disabled",false);
					
				}
			});
			$("#all_score").click(function() {
				if($("#all_score").prop("checked")) {
					$(".score_check").prop("checked",true);
					$(".score_check").prop("disabled",true);
				} else {
					$(".score_check").prop("checked",false);
					$(".score_check").prop("disabled",false);
				}
			});
			$(".drop1 .option").click(function() {
				$("#style1").html("<div class='item dropbox1'>"+$(this).text()+"</div>")
				$(".drop1").css("display","none");
			});
			$(".drop2 .option").click(function() {
				$("#style2").html("<div class='item dropbox2'>"+$(this).text()+"</div>")
				$(".drop2").css("display","none");
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
			
			$(".pdsel_date").change(function() {
				$("#pd_datebox").text(this.value);
			});
		});
	</script>
	<script>
		function sidebarbtn(a, b){
			let sc = document.getElementById(a);
			let di = document.getElementById(b);
			if(sc.style.display=="none"){
				sc.style.display="block";
				di.className = "afterdropbtn";
			} else if(sc.style.display=="block"){
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
	<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>	
	<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>
	window.onload = function() {
		var Grid = tui.Grid;
		var instance = new Grid({
			el: document.getElementById('grid'), // Container element
			scrollX: true,
			bodyHeight: 300,
			rowHeaders: ['checkbox'],
			minBodyHeight : 35,
			columns: [
				{
					width: 100,
					header: '채널상품번호',
					name: 'pnumber',
					align: 'center',
				},
				{
					width: 150,
					header: '상품명',
					name: 'pname',
					align: 'center',
				},
				{
					width: 100,
					header: '리뷰구분',
					name: 'reviewtype',
					align: 'center',
				},
				{
					width: 100,
					header: '구매자평점',
					name: 'customercount',
					align: 'center',
				},
				{
					width: 100,
					header: '포토/영상',
					name: 'photo',
					align: 'center',
				},
				{
					width: 150,
					header: '리뷰내용',
					name: 'reviewcontent',
					align: 'center',
				},
				{
					width: 100,
					header: '등록자',
					name: 'registrant',
					align: 'center',
				},
				{
					width: 150,
					header: '리뷰등록일',
					name: 'registrationdate',
					align: 'center',
				},
				{
					width: 150,
					header: '최종수정일',
					name: 'fiupdateday',
					align: 'center',
				},
				{
					width: 100,
					header: '리뷰글번호',
					name: 'reveiwnum',
					align: 'center',
				},
				{
					width: 100,
					header: '전시상태',
					name: 'displaystatus',
					align: 'center',
				},
				{
					width: 100,
					header: '상품주문번호',
					name: 'pordernum',
					align: 'center',
				},
			],
			data: [
				<%
					for(ReviewDto dto : listReviewDto) {
				%>
				{
					pnumber: '<a href="https://smartstore.naver.com/customerfordaily/products/4897977260#REVIEW"><%=dto.getProduct_order_num()%></a>',
					pname: '<a href="https://smartstore.naver.com/main/products/4897977260#REVIEW" class="text-info">가구수평패드</a>',
					reviewtype: '<%=dto.getReview_division()%>',
					customercount: '<span><span class="seller-rating"><span class="seller-rating-total"></span><span class="seller-rating-value" style="width: <%= dto.getBuyer_grade() * 20 %>%;"></span></span> <%=dto.getBuyer_grade()%></span>',
					photo: '<img src="../Images/<%=dto.getPhoto_video()%>" width="80" height="80">',
					reviewcontent: '<%=dto.getReview_content()%>',
					registrant: 'thfg******',
					registrationdate: '<%= dto.getReview_registration_date2()%>',
					fiupdateday: '<%= dto.getFi_modify() %>',
					reviewnum: '<%= dto.getReview_num() %>',
					displaystatus: '<%=dto.getReview_display_status()%>',
					pordernum: '<span class="text-info">' + <%=dto.getProduct_order_num() %> + '</span>'
				},
				<%
				}
				%>
			]
		});
		Grid.applyTheme('clean', {
			cell: {
				header: {
					background: '#f8f9fd',
					border: '#d3d8e1',
					showVerticalBorder: true,
					showHorizontalBorder: true,
				},
				normal: {
					background: '#ffffff',
					border: '#e9ebf0',
					showVerticalBorder: true,
					showHorizontalBorder: true,
				},
				rowHeader: {
					showHorizontalBorder: true,
				},
			},
			outline: {
				border: '#d3d8e1',
				showVerticalBorder: true,
			},
		});
	};
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
					<span class="topid"><%=loginId %></span>님
					<span class="myhome">내정보</span>
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
			<div class="top" onclick="topserachbtn('serach_content','clickserach')"> 
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
					<div>
						<a>쇼핑챗봇/AI FAQ 설정</a>
					</div>
					<div>
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
					<div>
						<a>쇼핑 스토리 관리</a>
					</div>
					<div>
						<a>라이브 예고 페이지 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/sellers/store/detail/smartstore">스토어 관리</a>
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
						<img src= "../Images//shorcuticon.png"/>
					</div>
					<div class="subtitle">쇼핑윈도
						<img src= "../Images//shorcuticon.png"/>
					</div>
				</div>
		</div>
		<div class="last_leftside">
			<div class="clicktalk">
			<img class="minitalk" src="../Images//talkicon2.png"/>톡톡상담
			</div>
		</div>
	</div>
	<div id="right_side" class="fl">
		<div class="seller-sub-title">
			<div class="fl">
				<div class="navbar fl">
					<input type="button" style="border:none; height:60px; width:20px;"/>
				</div>
				<div>
					<h2 class="title">리뷰관리</h2>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div class="seller-sub-content">
			<div class="panel panel-seller" style="width: 1668px;">
				<div class="panel-body">
					<div class="seller-search-section">
						<ul class="seller-list-border">
							<li style="border: none;">
								<label class="fl control-label">리뷰작성일</label>
								<div class="input-content">
									<div class="form-inline">
										<div class="form-group">
											<div class="btn-toolbar">
												<div id="div_5113" class="fl">
													<button id="today" class="selectday">오늘</button>
													<button id="1week" class="selectday ml4" checked>1주일</button>
													<button id="1month" class="selectday ml4">1개월</button>
													<button id="3month" class="selectday ml4">3개월</button>
													<button id="6month" class="selectday ml4">6개월</button>
													<button id="1year" class="selectday ml4">1년</button>
												</div>
												<div id="div_date_date" class="fl div_date_st">
													<div class="fl">
														<input type="text" id="input_date" value="2023.05.25">
													</div>
													<div class="fl" style="margin-top: 13px;">~</div>
													<div class="fl">
														<input type="text" id="input_date2" value="2023.05.25">
													</div>
													<div style="clear: both;"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div style="clear:both;"></div>
							</li>
						</ul>
					</div>
				</div>
				<div style="margin-bottom: 25px;">
					<div class="botton_style fl">
						<button type="button" id="searchbutton">
							<span>검색</span>
						</button>
					</div>
					<div class="botton_style fl">
						<button type="button" id="resetbutton">
							<span>초기화</span>
						</button>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div class="panel panel-seller"  style="height:740px">
						<div class="panel_f">
							<div class="fl panel-title">리뷰목록</div>
							<div class="fr">
								<div class="fl h34">
									<div id="pd_datebox" class="pd_date">상품등록일순</div> 
										<select class="pdsel_date">
											<option selected>리뷰등록일순</option>
											<option>상품명순</option>
											<option>도움순</option>
											<option>평점높은순</option>
											<option>리뷰랭킹순</option>
										</select>
								</div>
								<div class="fl h34">
									<div class="pd_cnt" style="width:95px;">100개씩</div> 
								</div>
								<div class="fl h34">
									<div class="pd_excel" style="width:95px;">
										<i class="excel-icon"></i>
										엑셀다운
									</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div style="clear:both;"></div>
						</div>
						<div class="panel-body">
							<p class="toast_txt mg-bottom mg-top-reset">
								욕설, 허위, 비방, 음란물 등 상품과 관련 없는 내용의 부적절한 리뷰는 '리뷰 신고' 기능을 이용해주세요 서비스 규정에 맞춰 관리자 검수하여 삭제 조치될 수 있습니다.
							</p>
							<div class="seller-btn-group">
								<div class="seller-btn-left">
									<div class="form-inline">
										<div class="form-group">
											<button class="btn btn-primary btn-sm" type="button">베스트리뷰선정 · 혜택지급</button>
											<button class="btn btn-default btn-sm" type="button">답글작성</button>
										</div>
									</div>
								</div>
							</div>
							<div id="grid"></div>
							<div class="hidden-xs">     
								 <ul class="pagination _pc_pagination">
									 <li class="_page active" data-page="0">
									 	<a href="">1</a>
							 		</li>
							 	</ul>   
							 </div>
						</div>
					</div>
				</div>		
				<div style="clear:both;"></div>
			</div>
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
				<a class="footer_navericon" href="https://www.naver.com/"></a>Copyright ©
				<strong>
					<a class="navercorp" href="https://www.navercorp.com/">NAVER Corp.</a>
				</strong>
				All Rights Reserved.			
			</div>
		</div>
	</div>
	</div>	
</body>
</html>
