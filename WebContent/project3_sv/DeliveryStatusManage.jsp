<%@page import="java.util.ArrayList"%>
<%@page import="dao.배송현황관리Dao"%>
<%@page import="dto.배송현황관리Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    배송현황관리Dao dao = new 배송현황관리Dao();
    
    String menu = request.getParameter("menu");
    String date = request.getParameter("date");
    String date2 = request.getParameter("date2");
    String choose = request.getParameter("choose");
    String name = request.getParameter("name");
    String ds = request.getParameter("ds");
    long n = 0L;
    if(request.getParameter("n")!=null)
    	n = Long.parseLong(request.getParameter("n"));
    System.out.println("menu: " + menu);
    System.out.println("date: " + date);
    System.out.println("date2: " + date2);
    System.out.println("choose: " + choose);
    String delivery = request.getParameter("delivery");
    
    ArrayList<배송현황관리Dto> listDel=null;
    String loginId = (String)session.getAttribute("id");
    if("배송완료".equals(delivery)) {
    	listDel = dao.get배송상태list(loginId, "배송완료");
    } else if("배송중".equals(delivery)) {
    	listDel = dao.get배송상태list(loginId, "배송중");
    } else{
    	listDel = dao.get배송현황관리list(menu, date, date2, choose, name, ds, n);
    }
    
    /* if(request.getParameter("delivery").equals("배송완료")) */
    
    
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송현황 관리</title>
<link rel="stylesheet" href="../css/TopSidebar.css" />
<link rel="stylesheet" href="../css/DeliveryStatusManage.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="../js/jquery-3.7.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

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
		$("#delivery_complete").click(function(){
			let dc = $("#delivery_complete_1").text();
			location.href = "../project3_sv/DeliveryStatusManage.jsp?delivery=배송완료"; 
		});
		$("#delivery_proceeding").click(function(){
			let dc = $("#delivery_proceeding_1").text();
			location.href = "../project3_sv/DeliveryStatusManage.jsp?delivery=배송중";
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
		$(".status-icon").click(function() {
			$(".status-icon").removeClass("on");
			$(this).addClass("on");
			$(".iconstyle").removeClass("on");
			$(this).parent().addClass("on");
		});
	});

	$(function() {
		$(".smartlogo").click(function(){
    		location.href = "MainPage.jsp";
    	});
		$("#searchbutton").click(function(){ /*데이터를 넘기는 쪽  */
			let menu = $("#sel_date").val();
			let date = $("#input_date").val();
			let date2 = $("#input_date2").val();
			let choose = $("#sel_namename").val();
			let name = $(".fr.inputdetail").val();
			let ds = $("#sel_date2").val();
			
			if (choose === '전체' && ds === '전체') {
			    alert("처리상태 또는 상세 검색조건을 입력하신 후 검색 가능합니다.");
			    return; 
			  }
			
			let encodedMenu = encodeURIComponent(menu);
			let encodedDate = encodeURIComponent(date);
			let encodedDate2 = encodeURIComponent(date2);
			let encodedChoose = encodeURIComponent(choose);
			let encodedName = encodeURIComponent(name);
			let encodedDs = encodeURIComponent(ds);
			
			location.href = "../project3_sv/DeliveryStatusManage.jsp?menu=" + encodedMenu + "&date=" + encodedDate +
             "&date2=" + encodedDate2 + "&choose=" + encodedChoose + "&name=" + encodedName +
             "&ds=" + encodedDs;
			
			
		});
		$(".searchbuttonsection, .searchbutton3, .searchbutton4, .size_medium, #searchbutton3, .problem, .prepare").click(function() {
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
			let button_txt = button.find('span.buttonsize1');

			if (button_txt.text() === "메뉴설명 펼치기") {
				button_txt.text("메뉴설명 접기");
			} else {
				button_txt.text("메뉴설명 펼치기");
			}
		});
		$("#sel_namename").change(function(){
			$("#lbl_selectleft").text(this.value);
		});
		$("#sel_date").change(function(){
			$("#lbl_date").text(this.value);
		});
		$("#sel_date2").change(function(){
			$("#lbl_date2").text(this.value);
		});
		$("#buttonst2").click(function() {
			let button = $(this);
			let button_txt = button.find('span.buttonsize1');

			if (button_txt.text() === "상세검색 펼치기") {
				button_txt.text("상세검색 접기");
			} else {
				button_txt.text("상세검색 펼치기");
			}
		});
		$(".selectpay").click(function() {
			$(".selectpay").removeClass("on");
			$(this).addClass("on");
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
				width : 210,
				header : '상품주문번호',
				name : 'productordernum'
			}, {
				width : 210,
				header : '주문번호',
				name : 'deliverynum'
			}, {
				width : 210,
				header : '발송처리일',
				name : 'deliverydate'
			}, {
				width : 210,
				header : '주문상태',
				name : 'orderstatus'
			}, {
				width : 240,
				header : '배송방법',
				name : 'deliveryway'
			}, {
				width : 240,
				header : '택배사',
				name : 'deliverycompany'
			}, {
				width : 240,
				header : '송장번호',
				name : 'invoicnum'
			}

			],
			data : [ 
				<%
				int cnt = 0;
				int cnt2 = 0;
				for(배송현황관리Dto dto:listDel){
					if(dto.getOs().equals("배송중")){
						cnt++;
					} else if(dto.getOs().equals("배송완료")){
						cnt2++;
					}
				%>
				{
				productordernum : '<%=dto.getPon() %>',
				deliverynum : '<%=dto.getDen() %>',
				deliverydate : '<%=dto.getDd()%>',
				orderstatus : '<%=dto.getOs()%>',
				deliveryway : '<%=dto.getDw()%>',
				deliverycompany : '<%=dto.getDc()%>',
				invoicnum : '<%=dto.getIn()%>'
				},
				<%
			}%> ]
		});

		Grid.applyTheme('clear', {
			cell : {
				header : {
					background : '#f9f9f9'
				},
				Row : {
					background : '#fff'
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
						<a
							href="https://sell.smartstore.naver.com/#/sellers/store/detail/smartstore">스토어
							관리</a>
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
					<h2 class="manage">배송현황 관리</h2>
					<button class="searchbutton3">
						<span class="searchbutton3font">1:1로 배우는 꿀팁 동영상</span>
					</button>
					<button class="searchbutton4">
						<span class="searchbutton3font">메뉴얼 다운로드</span>
					</button>
					<label id="lbl_namenum">수취인명</label> <select id="sel_namenum"
						class="selectoption">
						<option selected>수취인명</option>
						<option>구매자명</option>
						<option>구매자연락처</option>
						<option>구매자ID</option>
						<option>주문번호</option>
						<option>상품주문번호</option>
						<option>상품번호</option>
						<option>송장번호</option>
					</select> <input type="text" id="orderSearchInput" placeholder="상세조회 내용">
					<button type="button" class="size_medium">
						<span>주문조회</span>
					</button>

				</div>
				<div style="clear: both;"></div>

				<div class="smart1">
					<strong class="strongfont fl">발송처리 이후 배송중, 배송완료된 주문 건을
						조회하거나 직접 반품, 및 교환 처리를 접수할 수 있는 메뉴입니다.</strong>
					<button id="buttonst1"
						class="buttoncolor buttonsize folding rotate fl"
						onclick="spread('menusearch')">
						<span class="buttonsize1">메뉴설명 펼치기</span>
					</button>
					<div style="clear: both;"></div>
					<div id="menusearch" class="listlist list_font"
						style="display: none;">
						<li>배송추적 가능 주문건은 택배사와 정보 연동을 통해 자동으로 배송완료 처리 됩니다. 배송상태가 업데이트
							되지 않을 경우 업데이트 될때까지 기다려주세요.</li>
						<li>배송추적이 불가능한 주문건(직접전달,퀵서비스 등)은 배송완료 처리되지 않으며 구매확정이 될때까지 기다려
							주셔야 합니다.</li>
						<li>택배사에 반영되는 시간차 등으로 인해 정상적으로 업데이트되지 않는 배송중 문제건(문제송장)은 '배송중'
							상태로 남아있다고 하더라도, 결제일로부터 28일째(출고지가 해외주소인 상품 및 예약구매 상품의 경우 45일째)
							자동으로 구매확정 처리됩니다.※ 배송중 상태에서도 구매자가 직접 구매확정 할 수 있습니다.</li>
						<li>해외배송 상품 주문건은 국내로 들어오는 시점에 국내택배 송장으로 수정하시면 구매자에게 국내 배송현황을
							제공할 수 있습니다.</li>
					</div>
					<div style="clear: both;"></div>
				</div>

				<div class="delievery_section">
					<div class="delievery_section2">
						<strong class="delivery_font">주문유형을 선택해주세요!</strong>
						<div class="delievery_section2_1 delivery_font1">
							<div class="delievery_section2_0">
								<div class="delievery_section2_2">
									<label class="seller-list label_sty"> <input id="total"
										type="checkbox" name="productStatus"> 전체<span></span>
									</label>
								</div>
								<div class="delievery_section2_2">
									<label class="seller-list label_sty"> <input
										id="common_order" type="checkbox" name="productStatus">
										일반주문<span></span>
									</label>
								</div>
								<div class="delievery_section2_2">
									<label class="seller-list label_sty"> <input
										id="today_start" type="checkbox" name="productStatus">
										오늘출발<span></span>
									</label>
								</div>
								<div class="delievery_section2_2">
									<label class="seller-list label_sty"> <input
										id="reservation" type="checkbox" name="productStatus">
										예약구매<span></span>
									</label>
								</div>
								<div class="delievery_section2_2">
									<label class="seller-list label_sty"> <input
										id="subscribe" type="checkbox" name="productStatus">
										정기구독<span></span>
									</label>
								</div>
								<div class="delievery_section2_2">
									<label class="seller-list label_sty seller_list_"> <input
										id="rental" type="checkbox" name="productStatus"
										class="seller_list__"> 렌탈<span></span>
									</label>
								</div>
								<button id="searchbutton10" class="searchbuttonsection">
									<span>선택 건 적용</span>
								</button>
								<div class="delievery_section2_2 delievery_section2_21">
									<label class="seller-list label_sty"> <input
										type="checkbox" name="productStatus"> 풀필먼트 배송건 제외하고 보기<span></span>
									</label> <img src="../Images/i_image.png">
								</div>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>


				<div class="delievery_sectionstyle">
					<div class="seller-status form-section">
						<div class="delivery_st delivery_iconstyle3">
							<strong class="redstyle redstyle2">빠르게 확인해주세요!</strong>
							<ul class="seller-status-list mstyle">
								<li>
									<div class="iconstyle problem">
										<span class="status-icon"> <i
											class="icon-all delivery_iconstyle1"><img
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAqCAYAAADFw8lbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAadJREFUeNrsmIttwkAMhhPEAOkETSfosQFswAZhA2ACwgRRJwhM0BHCBsAEtBPABunv1pGiU9S7XC7pA1uyLKL47ovjsx1GwR+RkYAKqIAKqIDeB+jY10JlWcYwcYclbmEYnnoHhSygCfTNwTciUOhsCFCSPaKSOryNKczGW45iwQh6LBvEtNHQhylj+xBqgmtbw0MuOI/7BcUmOYyiPALXzWGvpMthG1tCUt7NoU+OkP2/enplMMsOkewflCEzhjz95oJPebX1BLl2rLHWh8lXJDsdpiF7veIO9LO93iRIn5mMeQ1VYAW9cNekVjpv4UudqWB9haq+OlPK/XzNLfMFmtvAsi+VuT232jO0qMEqU0WwydGEp5tlvZ7C7nCdGkDG9rE2CelCDziplbnD1xzz6Uvgz9D3b3PcouBXJWXDkdTvoR0PhlmTHmyi+VEUjzVfGhF3Pib4Up9+KHrQq8FPNd1DKUN57v3UYdGMD1BUfXrw79TCt+DpK2jr6wJKQ3POka1OftZy4L4wtLVvV+Cpo6/idImD/yryB4SACqiACuidgH4IMAB49Sr2AyNOpQAAAABJRU5ErkJggg==">
										</i>
										</span>
										<div class="text">
											<p>배송중 문제건</p>
											<strong>0</strong> <em>건</em>
										</div>
									</div>
								</li>
								<li>
									<div class="iconstyle problem">
										<span class="status-icon"> <i
											class="icon-wait delivery_iconstyle1 delivery_iconstyle2"><img
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAqCAYAAADFw8lbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAY5JREFUeNrsl+FNwzAQhXHEf8IGGQEmoJ2AdgLaDegEiAkCEwATQCdomAAzQbMBYYLwTrxIUeQG0sTEVHeSZddpmy/ne89xdPRPIlJQBVVQBVXQXnHc9w/KsjxDF++6bozJggBFpAQtHNcmwvrnoDuyJ5+f0KwLFL+ZOOYtMl10ubfpCLppyd5vQx523rUk9ln6VZ+648OqPR02KJb5AS0NBhQwiQsS3YyOMD4ogMQF3tAvHJBTCM8GYfjihwCbYrhBL1MXQ0MOtTMJrK1gOTUo5GCgNdhzjvPgXkoasHlLHce8vkLLQ7Ona7Qthh8UnPSzrvu8V1D65w3a0nzHKcZSGpf7bKORJ0jx1QVFlTVKQ0QX1+1szIwKxKNL+Vz2e7Sr0cTUiE9k7Znjd/rrmuUwH1X1jTihwqt4odqlFJJQQAVGsnnrULil0F5Hr1EKKOO2mtT9lO8B4qt3vjOa4mbFD6Ci7CXrcYvvZ7VjiKUbeD0ztR6NXUdkZrTKau5je9WjiIIqqIIq6AGBfgkwAPjOqLItPd/cAAAAAElFTkSuQmCC"></i>
										</span>
										<div class="text">
											<p>구매확정연장</p>
											<strong>0</strong> <em>건</em>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<div class="delivery_st delivery_iconstyle4 ">
							<strong class="greenstyle redstyle2">배송중, 배송완료 주문건을<br>확인해주세요.
							</strong>
							<ul class="seller-status-list">
								<li>
									<div class="iconstyle <%=("배송중".equals(request.getParameter("delivery"))) ? "on" : ""%>">
										<span id="delivery_proceeding" class="status-icon <%=("배송중".equals(request.getParameter("delivery"))) ? "on" : ""%>"> 
											<i class="icon-suspension delivery_iconstyle1 delivery_iconstyle2">
											<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAqCAYAAADFw8lbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAY5JREFUeNrsl+FNwzAQhXHEf8IGGQEmoJ2AdgLaDegEiAkCEwATQCdomAAzQbMBYYLwTrxIUeQG0sTEVHeSZddpmy/ne89xdPRPIlJQBVVQBVXQXnHc9w/KsjxDF++6bozJggBFpAQtHNcmwvrnoDuyJ5+f0KwLFL+ZOOYtMl10ubfpCLppyd5vQx523rUk9ln6VZ+648OqPR02KJb5AS0NBhQwiQsS3YyOMD4ogMQF3tAvHJBTCM8GYfjihwCbYrhBL1MXQ0MOtTMJrK1gOTUo5GCgNdhzjvPgXkoasHlLHce8vkLLQ7Ona7Qthh8UnPSzrvu8V1D65w3a0nzHKcZSGpf7bKORJ0jx1QVFlTVKQ0QX1+1szIwKxKNL+Vz2e7Sr0cTUiE9k7Znjd/rrmuUwH1X1jTihwqt4odqlFJJQQAVGsnnrULil0F5Hr1EKKOO2mtT9lO8B4qt3vjOa4mbFD6Ci7CXrcYvvZ7VjiKUbeD0ztR6NXUdkZrTKau5je9WjiIIqqIIq6AGBfgkwAPjOqLItPd/cAAAAAElFTkSuQmCC"></i>
										</span>
										<div class="text">
											<p>배송중</p>
											<a href="#" class="_3a4NLUdd2p"> <strong><%=cnt%></strong> <em>건</em></a>
										</div>
									</div>
								</li>
								<li>
									<div class="iconstyle <%=("배송완료".equals(request.getParameter("delivery"))) ? "on" : ""%>">
										<span id="delivery_complete" class="status-icon <%=("배송완료".equals(request.getParameter("delivery"))) ? "on" : ""%>"> <i
											class="icon-close delivery_iconstyle1 delivery_iconstyle2"><img
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAqCAYAAADFw8lbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAbRJREFUeNrsl41tgzAQhQFlAHeC0g3SDZIN6ATpBi0TlE5AN6CdIN0ANggjsAHZgN61D8m1KvyDQY1iSycSK+/82dydL0l0ISMJoAE0gAbQAHodoBtfjoZhSOmRznBxjuO4XRyUxiPZgaxz0AoGJduvAcrjg06lcHgbO3q8eI1Rcnoa/hi6hVZNJuKp8PEmVgbNvVr6KsiEd1BAbjmOiOs8M/E4np+8Zz0cZ2T3NpDQRaR5l+Z4s5Wtr8RwsRIn6ZLR1QiMV30ky6dKkfWJSrvf2zoeT/Inz75hI5SvhubffBf8ErtvXONRhiXjzeZL3Uzt3NICWPbTuSbiJlppuIRO6J7+082UkdWSZY7aI+53/zEq1dMcHVI6lh2Kv0+N9hm9wKjlssewD6YVxQR0i/LCC/1yTPOcwSWet1InpA5V28Ana3OATyej5iRKyckOzYf6G16x0fSagqR3Gm1Lv8lnBzO6uVTt6rHYlE5AK9QelKz3nnXcPaEXFRLACaeu09bQq9piCVCBbO2xcI/vwlBbS9rBZIPGMar5E9fZdlNocoSL9mJGuEIDaAANoAH0SkC/BBgAHghUGTrxnmwAAAAASUVORK5CYII="></i>
										</span>
										<div class="text">
											<p>배송완료</p>
											<a href="#" class="_3a4NLUdd2p"> <strong><%=cnt2%></strong> <em>건</em>
											</a>
										</div>
									</div>
								</li>
								<li>
									<div class="iconstyle problem">
										<span class="status-icon"> <i
											class="icon-prohibition delivery_iconstyle1 delivery_iconstyle2"><img
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAqCAYAAADFw8lbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAQxJREFUeNrsmIENgjAQRalhAEZgBEbQCWQEHMEN3AA3wA2ME3QEHcENGAH/JUeCRgXMoSX+n1xKAymvV/qvIYooiqIoKiS5IQ81TVOiySZiuDjntlagHs1JBjWGlMmvAboyGU1AEUvrVMqYmoReLebyjRK0s7wZ4hw0KAATNJVuxN+CasZeWZdAXrGrdyFkVCD9Iyz6ApciNl/7kPvsCfcKRN3Cqu3UbzI92p7MfLQDm2tbWPpobFaLnTvgpXJ5ROylb7mqseVgCiu127rU2tvTFJCsTH8NOsaePtWdVakldeVDmWTrq+UkJm8Mm8oJSiMPFrQ9SSGqoJZ7QKn1c9mcCX8AUBRFUU91E2AA5N0U0JKNngcAAAAASUVORK5CYII="></i>
										</span>
										<div class="text">
											<p>구매확정요청</p>
											<strong>0</strong> <em>건</em>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>


				<div class="jy">
					<div id="fl" class="date">
						<div class="date1 fl">조회기간</div>
						<div class="fl">
							<div class="div_date">
								<label id="lbl_date">결제일</label> <select id="sel_date"
									class="selectoption">
									<option selected>결제일</option>
									<option>배송 완료일</option>
									<option>발송 처리일</option>
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
							<div class="year1">
								<p class="year">· 최근 1년 이내에서 조회하실 수 있습니다.(3개월 단위 조회 가능)
							</div>
							<div class="detailcondition fr date1">
								상세조건 <label id="lbl_selectleft">전체</label> <select
									id="sel_namename" class="detail1 sel_name selectoption">
									<option selected>전체</option>
									<option>수취인명</option>
									<option>구매자명</option>
									<option>구매자연락처</option>
									<option>구매자ID</option>
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

					<div class="date1 fl orderfont">주문상태</div>
					<div class="fl">
						<div id="ps" class="orderselectbox div_date"
							style="display: none;">
							<label id="lbl_date2" class="delivery_iconstyle6 lbl_date_">전체</label> <select
								id="sel_date2" class="selectoption lbl_date_">
								<option selected>전체</option>
								<option id="delivery_proceeding_1">배송중</option>
								<option id="delivery_complete_1">배송완료</option>
							</select>
						</div>
						<div class="fl">
							<div class="buttonsize2">
								<button id="searchbutton">
									<span>검색</span>
								</button>
								<button id="buttonst2"
									class="buttoncolor buttonsize folding rotate fl"
									onclick="spread('ps')">
									<span class="buttonsize1 fr">상세검색 펼치기</span>
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
										<label id="lbl_order" class="orderlistsize">100개씩 보기</label> <select
											id="sel_order"
											class="selectoption proudctorder orderlistsize2">
											<option selected>100개씩 보기</option>
										</select>
										<div style="clear: both;"></div>
									</div>
									<button class="searchitemset1 prepare">
										<span class="searchitemset">조회항목 설정</span>
									</button>
									<button class="exeldown2 exeldowndown prepare">
										<span class="searchitemset exceldown"><img
											class="exeldown1" src="../Images/excel.png">엑셀다운</span>
									</button>
									<div style="clear: both;"></div>
								</div>

								<div class="manybut">
									<button class="exeldown2">
										<span class="searchitemset">송장수정</span>
									</button>
									<button class="exeldown2 problem">
										<span class="searchitemset">판매자 직접 반품</span>
									</button>
									<button class="exeldown2 problem">
										<span class="searchitemset">판매자 직접 교환</span>
									</button>

									<button id="searchbutton3" class="fr buttonsize3">
										<span>구매확정 후 취소처리 바로가기</span>
									</button>
									<img id="imgtype2" src="../Images/icpn.png">
									<li class="oversea">해외배송 상품 주문건은 국내로 들어오는 시점에 국내택배 송장으로
										수정해주시기 바랍니다.</li>
									<div class="eattoast"></div>
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
											<th class="storboardrow storeboardfont" scope="tablerow">주문확인
												<div class="tablerow2">
													<i class="tablerow3"> </i>
												</div>
											</th>
											<td colspan="1">
												<button type="button" class="buttonsizetype problem">
													<span>구매확정 요청</span>
												</button>
												<button type="button" class="buttonsizetype problem">
													<span>구매확정 연장</span>
												</button>
												<div class="linestyle">
													<div class="linestyle3"></div>
												</div>
											</td>
										</tr>
										<tr>
											<th class="storboardrow storeboardfont" scope="tablerow">구매확정관리
												<div class="tablerow2">
													<i class="tablerow3"> </i>
												</div>
											</th>
											<td colspan="1">
												<button type="button" class="buttonsizetype problem">
													<span>판매자 직접 반품</span>
												</button>
												<button type="button" class="buttonsizetype problem">
													<span>판매자 직접 교환</span>
												</button>
												<div class="linestyle">
													<div class="linestyle3"></div>
												</div>
											</td>
										</tr>
										<tr>
											<th class="storboardrow storeboardfont" scope="tablerow">정보
												수정
												<div class="tablerow2">
													<i class="tablerow3"> </i>
												</div>
											</th>
											<td colspan="1">
												<button type="button" class="buttonsizetype">
													<span>송장수정</span>
												</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
					</div>
					<div></div>
				</div>
				<div>
					<footer class="storefooter" role="contentinfo"
						ng-if="::!vm.isMobile">
						<div class="innerfooter" ncp-click-log action-id="footer.link">
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
									ng-click="vm.responsibilityPopup()" title="팝업">책임의 한계와 법적고지</a></li>
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
										type="button" ng-click="vm.openTelephoneSupportModal()"
										class="btn-box">전화상담 (전화 전 클릭)</button></li>
								<li><a class="talktalkline totalinfo3"
									ng-href="https://talk.naver.com/ct/wcbgqj?frm=cstpn"
									class="btn-box" target="_blank"
									data-action-location-id="talktalkCounseling"
									href="https://talk.naver.com/ct/wcbgqj?frm=cstpn"><i
										class="" aria-hidden="true"></i> <img
										src="../Images/talktalk.png"> 톡톡상담</a>
									</button></li>
							</ul>
							<adderss class="naverlinkstyle2 bottomstyle">
							<p>
								<a class="navericon" href="https://www.navercorp.com/"
									class="logo" target="_blank" title="새창"></a>
							</p>
							<p class="naverlinkstyle3">Copyright ©</p>
							<a class="naverlinkstyle4" href="https://www.navercorp.com/"
								class="copy-navercorp" target="_blank" title="새창"><strong
								class="naverlinkstyle">NAVER Corp.</strong></a>
							<p class="naverlinkstyle5">All rights reserved.</p>
							</adderss>
						</div>
					</footer>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
</body>
</html>
