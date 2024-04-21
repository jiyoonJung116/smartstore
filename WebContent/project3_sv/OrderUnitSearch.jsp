<%@page import="dto.주문확인Dto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.OrderAllSearchDao"%>
<%@page import="dto.주문통합검색Dto"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    
    String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "project3";
	String dbPw = "3500";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,dbId,dbPw);
	
	OrderAllSearchDao orderallsearchdao = new OrderAllSearchDao();
	
	String menu = request.getParameter("menu");
    String date = request.getParameter("date");
    String date2 = request.getParameter("date2");
    String choose = request.getParameter("choose");
    String name = request.getParameter("name");
    long n = 0L;
    if(request.getParameter("n")!=null)
    	n = Long.parseLong(request.getParameter("n"));
    
    String loginId = (String)session.getAttribute("id");
	
	
	ArrayList<주문통합검색Dto> searchlist = orderallsearchdao.get주문통합검색List(menu, date, date2, choose, name, n);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문통합검색</title>
<link rel="stylesheet" href="../css/TopSidebar.css" />
<link rel="stylesheet" href="../css/OrderUnitSearch.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
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

	$(function() {
		$(".smartlogo").click(function(){
    		location.href = "MainPage.jsp";
    	});
		$("#searchbutton").click(function(){ /*데이터를 넘기는 쪽  */
			let menu = $("#sel_date").val();
			let date = $("#input_date").val();
			let date2 = $("#input_date2").val();
			date2 = date2.replaceAll(".","-");
			let choose = $("#sel_namename").val();
			let name = $(".fr.inputdetail").val();
			let n = $(".fr.inputdetail").val();
			// 입력값이 숫자인지 확인
			if (!isNaN(parseFloat(n)) && isFinite(n)) {
			  // 숫자일 경우에만 값을 전달
			  n = encodeURIComponent(n);
			} else {
			  // 문자열이거나 숫자가 아닐 경우 0으로 초기화
			  n = encodeURIComponent(0);
			}
			
			let encodedMenu = encodeURIComponent(menu);
			let encodedDate = encodeURIComponent(date);
			let encodedDate2 = encodeURIComponent(date2);
			let encodedChoose = encodeURIComponent(choose);
			let encodedName = encodeURIComponent(name);
			
			location.href = "../project3_sv/OrderUnitSearch.jsp?menu=" + encodedMenu + "&date=" + encodedDate +
             				"&date2=" + encodedDate2 + "&choose=" + encodedChoose + "&name=" + encodedName + "&n="+n;
		});
		$(".exchange_bt").click(function() {
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
		$(".selectpay").click(function() {
			$(".selectpay").removeClass("on");
			$(this).addClass("on");
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
		$(document).ready(function() {
			$("#sel_namename").change(function(){
				$("#lbl_selectleft").text(this.value);
			});
		});
		$(document).ready(function() {
		    $("#sel_date").change(function() {
		        $("#lbl_date").text(this.value);
		    });
		});
		$(".searchbuttonsection, .searchbutton3, .searchbutton4, .size_medium, #searchbutton3, .prepare").click(function() {
					alert("준비중입니다");
				});
		$("#total").click(function() {
			if ($(this).prop('checked')) {
				$('#common_order').prop('checked', true);
				$('#today_start').prop('checked', true);
				$('#reservation').prop('checked', true);
				$('#subscribe').prop('checked', true);
				$('#rental').prop('checked', true);
				$("#common_order").prop("disabled",true);
				$("#today_start").prop("disabled",true);
				$("#reservation").prop("disabled",true);
				$("#subscribe").prop("disabled",true);
				$("#rental").prop("disabled",true);
			} else {
				$('#common_order').prop('checked', false);
				$('#today_start').prop('checked', false);
				$('#reservation').prop('checked', false);
				$('#subscribe').prop('checked', false);
				$('#rental').prop('checked', false);
				$("#common_order").prop("disabled",false);
				$("#today_start").prop("disabled",false);
				$("#reservation").prop("disabled",false);
				$("#subscribe").prop("disabled",false);
				$("#rental").prop("disabled",false);
			}
		});
		$("#buttonst1").click(function() {
			let button = $(this);
			let button_text = button.find('span.buttonsize1');

			if (button_text.text() === "메뉴설명 펼치기") {
				button_text.text("메뉴설명 접기");
			} else {
				button_text.text("메뉴설명 펼치기");
			}
		});
		$(".folding").click(function() {
			$(this).toggleClass("rotate");
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
	});

	window.onload = function() {
		var Grid = tui.Grid;

		var instance = new Grid({
			el : document.getElementById('grid'), // Container element
			scrollX : true,
			bodyHeight : 341,
			rowHeaders : [ 'checkbox' ],
			columnOptions : {
				frozenCount : 4, // 2개의 컬럼을 고정하고
				frozenBorderWidth : 2
			// 고정 컬럼의 경계선 너비를 2px로 한다.
			},
			columns : [ {
				width : 147,
				header : '상품주문번호',
				name : 'productordernum'
			},  {
				width : 147,
				header : '결제일',
				name : 'paydate'
			}, {
				width : 147,
				header : '주문상태',
				name : 'orderstatus'
			}, {
				width : 147,
				header : '클레임상태',
				name : 'claimstatus'
			}, {
				width : 147,
				header : '상품번호',
				name : 'pnumber'
			}, {
				width : 147,
				header : '상품명',
				name : 'pname'
			}, {
				width : 147,
				header : '구매수량',
				name : 'purchaseunit'
			}, {
				width : 147,
				header : '구매자명',
				name : 'buyername'
			}, {
				width : 147,
				header : '구매자ID',
				name : 'buyerid'
			}, {
				width : 147,
				header : '수취인명',
				name : 'receiptname'
			}
			],
			data : [ 
				<%
				for(주문통합검색Dto dto : searchlist){
				%>
				{
				productordernum : '<%=dto.getPon()%>',
				paydate : '<%=dto.getPayd()%>',
				orderstatus : '<%=dto.getOs()%>',
				claimstatus : '<%=dto.getC()%>',
				pnumber : '<%=dto.getPnumber()%>',
				pname : '<%=dto.getPname()%>',
				purchaseunit : '<%=dto.getPa()%>',
				buyername : '<%=dto.getNa()%>',
				buyerid : '<%=dto.getBi()%>',
				receiptname : '<%=dto.getRn()%>',
			},
			<%
				}%>]
		});

		Grid.applyTheme('striped', {
			cell : {
				header : {
					background : '#f9f9f9'
				},
				evenRow : {
					background : '#fee'
				}
			}
		}); // Call API of static method
	}
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
					<span class="topid"><%=loginId %></span>님 <span class="myhome">내정보</span>
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
						<a href="ProductInsert.jsp">상품 등록</a>
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
			<div class="menu"
				onclick="sidebarbtn('side_content13', 'dropicon13')">
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
			<div class="width12 fl">
				<!-- 배송현황 관리 -->
				<div class="salehead">
					<h2 class="manage">주문통합검색</h2>

				</div>
				<div style="clear: both;"></div>
				<div class="smart1">
					<strong class="strongfont fl">스마트스토어의 모든 주문건을 조회할 수 있는 통합 주문조회 메뉴입니다.</strong>
					<button id="buttonst1" class="buttoncolor buttonsize folding rotate fl" onclick="spread('confrim_manage')">
						<span class="buttonsize1">메뉴설명 펼치기</span>
					</button>
					<div style="clear: both;"></div>
					<div id="confrim_manage" class="listlist list_font" style="display: none">
						<li>주문조회 기간은 시작일~종료일을 최대 1년 범위로 조회가 가능하며, 상세조건을 설정하지 않은 경우 최대
							1개월까지 조회 가능합니다.</li>
						<li>주문건을 선택하시면 주문목록 하단에 주문상태에 따라 처리 가능한 버튼이 활성화 됩니다.(클릭 시 관련
							메뉴로 이동하여 주문건 처리 가능)</li>
						<li>해당 메뉴에서는 모든 상태의 주문건 조회만 가능하며, 주문확인/상품발송/클레임 처리는 대상 메뉴들에서
							진행하실 수 있습니다.</li>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="ous_section">
					<div class="ous_section2">
						<strong class="ous_font">주문유형을 선택해주세요!</strong>
						<div class="ous_section2_1 ous_font1">
							<div class="ous_section2_0">
								<div class="ous_section2_2">
									<label class="seller-list label_sty"> 
										<input id="total" type="checkbox" name="productStatus"> 전체<span></span>
									</label>
								</div>
								<div class="ous_section2_2">
									<label class="seller-list label_sty"> 
										<input id="common_order" type="checkbox" name="productStatus">일반주문<span></span>
									</label>
								</div>
								<div class="ous_section2_2">
									<label class="seller-list label_sty"> 
									<input id="today_start" type="checkbox" name="productStatus">오늘출발<span></span>
									</label>
								</div>
								<div class="ous_section2_2">
									<label class="seller-list label_sty"> 
										<input id="reservation" type="checkbox" name="productStatus">예약구매<span></span>
									</label>
								</div>
								<div class="ous_section2_2">
									<label class="seller-list label_sty"> 
										<input id="subscribe" type="checkbox" name="productStatus">정기구독<span></span>
									</label>
								</div>
								<div class="ous_section2_2 ous_st">
									<label class="seller-list label_sty seller_list_"> 
										<input id="rental" type="checkbox" name="productStatus" class="seller_list__"> 렌탈<span></span>
									</label>
								</div>
								<button id="searchbutton10" class="searchbuttonsection">
									<span>선택 건 적용</span>
								</button>
								<div class="ous_section2_2 ous_section2_21">
									<label class="seller-list label_sty"> 
										<input type="checkbox" name="productStatus"> 풀필먼트 배송건 제외하고 보기 <span></span>
									</label> 
									<img src="../Images/i_image.png">
								</div>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="jy">
					<div id="fl" class="date">
						<div class="date1 fl">조회기간</div>
						<div class="fl">
							<div id="div_date">
								<label id="lbl_date">결제일</label> <select id="sel_date" class="selectoption">
									<option selected>결제일</option>
									<option>발송처리일</option>
								</select>
							</div>
							<div id="div_5113" class="date5">
								<button id="today" class="selectpay">오늘</button>
								<button id="1week" class="date6 selectpay on">1주일</button>
								<button id="1month" class="date6 selectpay">1개월</button>
								<button id="3month" class="date6 selectpay">3개월</button>
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
							<div class="detailcondition fr date1">상세조건 
								<label id="lbl_selectleft">전체</label> 
								<select id="sel_namename" class="detail1 sel_name selectoption">
									<option selected>전체</option>
									<option>수취인명</option>
									<option>구매자명</option>
									<option>구매자연락처</option>
									<option>구매자ID</option>
									<option>주문번호</option>
									<option>상품주문번호</option>
									<option>상품번호</option>
									<option>송장번호</option>
								</select>
								<div id=detail_detail>
									<input type="text" class="fr inputdetail">
								</div>
								<div style="clear: both;"></div>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div style="clear: both;"></div>
					</div>
					<div class="fl">
						<div class="fl">
							<div class="buttonsize2">
								<button id="searchbutton">
									<span>검색</span>
								</button>
								<div style="clear: both;"></div>
							</div>
						</div>
						<div class="jy2 gapstyle">
							<div>
								<div class="totallistsize">
									<h3 class="totallist listsize" style="white-space: nowrap;">
										목록 총(<span class="totallistcolor"> 0 </span>)개
									</h3>
									<div id="div_date">
										<label id="lbl_order" class="orderlistsize">100개씩 보기</label> 
										<select id="sel_order" class="selectoption proudctorder orderlistsize2">
											<option selected>100개씩 보기</option>
										</select>
										<div style="clear: both;"></div>
									</div>
									<button class="exeldown2 exeldowndown orderlistsize3 prepare">
										<span class="searchitemset exceldown">
										<img class="exeldown1" src="../Images/excel.png">엑셀다운</span>
									</button>
									<div style="clear: both;"></div>
								</div>
							</div>
							<div class="inputdeliver2">
								<div id="grid"></div>
								<div class="numbutton numbuttonstyle">
									<strong class="numbuttonstrong1">1</strong>
								</div>
							</div>
							<div class="storeboard">
								<table class="labelline">
									<colgroup>
										<col class="labellinewidth">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th class="storboardrow storeboardfont">교환관리
												<div class="tablerow2">
													<i class="tablerow3"> </i>
												</div>
											</th>
											<td colspan="1">
												<button type="button" class="buttonsizetype exchange_bt">
													<span>교환신청</span>
												</button>
												<button type="button" class="buttonsizetype">
													<span>반품 완료처리</span>
												</button>
												<button type="button" class="buttonsizetype">
													<span>반품 거부(철회)처리</span>
												</button>
												<button type="button" class="buttonsizetype">
													<span>교환으로 변경</span>
												</button>
												<div class="linestyle">
													<div class="linestyle3"></div>
												</div>
											</td>
										</tr>
										<tr>
											<th class="storboardrow storeboardfont">취소관리
												<div class="tablerow2">
													<i class="tablerow3"> </i>
												</div>
											</th>
											<td colspan="1">
												<span class="ous_fontstyle1">판매자 직접취소 처리</span> 
												<img class="imgtype3" src="../Images/화살표.png">
												<span class="ous_fontstyle1">취소 승인처리</span> 
												<img class="imgtype3" src="../Images/화살표.png"> 
												<span class="ous_fontstyle1">구매확정 후 취소처리</span> 
												<img class="imgtype3" src="../Images/화살표.png">
												<div class="linestyle">
													<div class="linestyle3"></div>
												</div>
											</td>
										</tr>
										<tr>
											<th class="storboardrow storeboardfont">반품교환 관리
												<div class="tablerow2">
													<i class="tablerow3"> </i>
												</div>
											</th>
											<td colspan="1">
												<span class="ous_fontstyle1">반품 및 교환접수</span> 
												<img class="imgtype3" src="../Images/화살표.png"> 
												<span class="ous_fontstyle1">반품접수 후 처리</span> 
												<img class="imgtype3" src="../Images/화살표.png"> <span class="ous_fontstyle1">교환접수 후 처리</span> 
												<img class="imgtype3" src="../Images/화살표.png">
												<div class="linestyle">
													<div class="linestyle3"></div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
				<div>
					<footer class="storefooter">
						<div class="innerfooter">
							<ul class="provis bottomstyle">
								<li class="li2">
									<a class="footerstyle" href="https://sell.smartstore.naver.com/#/terms/agreement" target="_blank">이용약관</a>
								</li>
								<li class="li2">
									<a class="footerstyle" href="https://new-m.pay.naver.com/member/terms-policy/finance" target="_blank" title="전자금융거래 이용약관">전자금융거래이용약관</a>
								</li>
								<li class="li2">
									<a class="footerstyle" href="https://business.naver.com/privacy/privacy.html" target="_blank">
										<strong>개인정보 처리방침</strong>
									</a>
								</li>
								<li class="li2">
									<a class="footerstyle" href="https://policy.naver.com/policy/youthpolicy.html"target="_blank">청소년 보호정책</a>
								</li>
								<li class="li2">
									<a class="footerstyle" href="javascript:void(0)" role="button" >책임의 한계와 법적고지</a>
								</li>
								<li class="li2">
									<a class="footerstyle" href="https://ips.smartstore.naver.com/main/rules/safety">안전거래가이드</a>
								</li>
								<li class="li2">
									<a class="footerstyle" href="https://help.sell.smartstore.naver.com/index.help" target="_blank">고객센터</a>
								</li>
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
								<li class="liststyles">
									<a id="businessinfo" href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208162517" class="btn-box" target="_blank" title="새창">사업자정보확인</a>
								</li>
							</ul>
							<ul class="provis totalinfo bottomstyle">
								<li id="addressinformat" class="address">주소 : 경기도 성남시 분당구 정자일로 95, NAVER 1784, 13561</li>
								<li>
									<button id="callchat" class="totalinfo2 totalinfo4" type="button" class="btn-box">전화상담 (전화 전 클릭)</button>
								</li>
								<li>
									<a class="talktalkline totalinfo3 btn-box" target="_blank" href="https://talk.naver.com/ct/wcbgqj?frm=cstpn">
										<i class="" aria-hidden="true"></i> 
										<img src="../Images/talktalk.png"> 톡톡상담
									</a>
								</li>
							</ul>
							<address class="naverlinkstyle2 bottomstyle">
								<p>
									<a class="navericon logo" href="https://www.navercorp.com/" target="_blank" title="새창"></a>
								</p>
								<p class="naverlinkstyle3">Copyright ©</p>
								<a class="naverlinkstyle4 copy-navercorp" href="https://www.navercorp.com/" target="_blank" title="새창">
									<strong class="naverlinkstyle">NAVER Corp.</strong>
								</a>
								<p class="naverlinkstyle5">All rights reserved.</p>
							</address>
						</div>
					</footer>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
</body>
</html>
