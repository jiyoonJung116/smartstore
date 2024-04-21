<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%
	int pageNum = 0;
	int startNum = 0;
	int endNum=0;
	int cnt = 0;
	String loginId = (String)session.getAttribute("id");
	int 게시물번호=0;
	long pnumber=0;
	String inquiry_date = request.getParameter("inquiry_date");
	String satisfaction = request.getParameter("satisfaction");
	String status = request.getParameter("status");
	String inquiry_type = request.getParameter("inquiry_type");
	try{ 
		pageNum = Integer.parseInt(request.getParameter("page"));
	} catch (Exception e) {
		pageNum=1;
	}
	endNum = pageNum*5;
	startNum = endNum - 4;
	
	
	CustomerInquiryDao customerinquiryDao = new CustomerInquiryDao();
	ArrayList<CustomerInquiryDto> listCustomerInquiryDto = customerinquiryDao.select2(loginId, inquiry_date, startNum, endNum);
	
	CustomerInquiryUpdateDao customerInquiryUpdateDao = new CustomerInquiryUpdateDao();
%>		
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>고객문의</title>
	<link rel="stylesheet" href="../css/TopSidebar.css"/>
	<link rel="stylesheet" href="../css/customerinquiry.css"/>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
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
	
	
		
		$(function() {
			$(".smartlogo").click(function(){
	    		location.href = "MainPage.jsp";
	    	});
			$(".option_text").click(function() {
				$(".top").html("<div class='toptext'>"+$(this).text()+"</div> <div id='clickserach' class='drop_serach'></div>");
				$(".top_serach").css("display","none");
			});
			$(".serach_a").click(function() {
				  let seller_id= $(".topid").text();
				  let quick_btn= $("#quick_btn").val();
				  let date = $("#input_date").val();
				  let satisfaction = $("#satisfied_select").val();
				  let status = $("#return_msg").val();
				  let inquiry_type = $("#inquiry_select").val();
				  let selchoice3 = $("#sel_choice3").val();
				  let encodedsellerid = encodeURIComponent(seller_id);
				  let encodedquick_btn = encodeURIComponent(quick_btn);
				  let encodedDate = encodeURIComponent(date);
				  let encodedSatisfied = encodeURIComponent(satisfaction);
				  let encodedmsg = encodeURIComponent(status);
				  let encodedinquiry = encodeURIComponent(inquiry_type);
				  let encodedselchoice = encodeURIComponent(selchoice3);
				  location.href = "http://localhost:9090/WebProject1/project3_sv/CustomerInquiry.jsp?seller_id="+encodedsellerid+"&quick_btn=" + encodedquick_btn + "&inquiry_date=" + encodedDate +
 "&satisfaction=" +encodedSatisfied+ "&status=" +encodedmsg+ "&inquiry_type=" +encodedinquiry+ "&sel_choice3=" +encodedselchoice;
				});
			$(".per1").click(function() {
				let today = new Date();
				let formattedDate = today.getFullYear() + '.' + String(today.getMonth() + 1).padStart(2, '0') + '.' + String(today.getDate()).padStart(2, '0');
			    $("#input_date").val(formattedDate);
			    $("#input_date2").val(formattedDate);
			});
			$(".per3").click(function() {
				let weekDates = getThisWeek();
			    $("#input_date").val(weekDates[0]);
			    $("#input_date2").val(weekDates[1]);
			});
			
			$(".per4").click(function() {
				let monthDates = getThisMonth();
			    $("#input_date").val(monthDates[0]);
			    $("#input_date2").val(monthDates[1]);
			});

			$(".per5").click(function() {
				let threeMonthsDates = getThisThreeMonths();
			    $("#input_date").val(threeMonthsDates[0]);
			    $("#input_date2").val(threeMonthsDates[1]);
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
			let seller_id = $(".topid").text();
			$(".input_seller_id").val(seller_id);
			let serial_number = $("#orderconNo").text();
			$("#serial_number").val(serial_number);
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
	
	<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>	
	<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
	<script>
	window.onload = function() {
		var Grid = tui.Grid;
		var instance = new Grid({
			el : document.getElementById('grid'), // Container element
			scrollX : true,
			bodyHeight : 341,
			
			columns : [ {
				width : 67,
				header : '글번호',
				name : 'serialNumber'
			}, {
				width : 147,
				header : '접수일',
				name : 'joindate'
			}, {
				width : 67,
				header : '처리상태',
				name : 'status'
			}, {
				width : 67,
				header : '문의유형',
				name : 'inquirytype'
			}, {
				width : 147,
				header : '주문번호',
				name : 'ordernumber'
			}, {
				width : 355,
				header : '문의내용',
				name : 'inquirytitle'
			}, {
				width : 147,
				header : '상품번호',
				name : 'pnumber'
			}, {
				width : 355,
				header : '상품명',
				name : 'pname'
			}, {
				width : 147,
				header : '질문자',
				name : 'questioner'
			}, {
				width : 147,
				header: '답변내용',
				name : 'answercontent'
			} ,	{
				width : 147,
				header : '처리일시',
				name : 'processingdate'
			}, {
				width : 87,
				header : '만족도',
				name : 'satisfaction'
			}
			],
	
			data : [ 
				<% 
				for(CustomerInquiryDto dto : listCustomerInquiryDto) {
					
				%>	
				{
				serialNumber : '<%=dto.getSerial_number()%>',
				joindate : '<%= dto.getInquiry_date2()%>',
				status : '<%= dto.getStatus()%>',
				inquirytype : '<%= dto.getInquiry_type() %>',
				ordernumber : '<%= dto.getProduct_order_num()%>',
				inquirytitle : '<%= dto.getInquiry_content()%>',
				pnumber : '<%= dto.getPnumber()%>',
				pname : '<%= dto.getpname()%>',
				questioner : '<%= dto.getcustomer_id() %>',
				answercontent : '<%=dto.getAnswer_content() %>',
				processingdate : '<%= dto.getProcessing_date()%>',
				satisfaction : '<%= dto.getSatisfaction()%>'
				},
				<%
					}
				%>
			]

		});
		  var index = 0; // 인덱스 변수 초기화

		    // 특정 줄을 클릭했을 때 데이터 추출 및 인덱스 증가
		    instance.on('click', function(ev) {
			    var clickedRowIndex = ev.rowKey; // 클릭한 줄의 인덱스
			    var clickedRowData = instance.getRow(clickedRowIndex); // 클릭한 줄의 데이터
			    console.log(clickedRowData); // 클릭한 줄의 데이터 콘솔에 출력
			
			    // 클릭한 줄의 데이터를 특정 위치에 표시 (예시)
			    document.getElementById('regDate').textContent = clickedRowData.joindate;
			    document.getElementById('treatDate').textContent = clickedRowData.processingdate;
			    document.getElementById('purchaser').textContent = clickedRowData.questioner;
			    document.getElementById('purchaserID').textContent = clickedRowData.questionerID;
			    document.getElementById('orderNo').textContent = clickedRowData.ordernumber;
			    document.getElementById('pName').textContent = clickedRowData.pname;
			    document.getElementById('pordernum').textContent = clickedRowData.pordernum;
			    document.getElementById('orderconNo').textContent = clickedRowData.serialNumber;
			    document.getElementById('_title').textContent = "[" + clickedRowData.inquirytype + "]  " + clickedRowData.inquirytitle;
			    // 현재 인덱스 번호 표시
			    console.log('현재 인덱스 번호:', clickedRowIndex);
			    if (clickedRowData.answercontent != 'null') {
			        $('#editComment').css('display', 'inline-block');
			    } else {
			        $('#editComment').css('display', 'none');
			    }
			    index++;
			    console.log('인덱스 증가:', index);
			    
			    document.getElementById('serial_number').value = clickedRowData.serialNumber || "";
			});
		Grid.applyTheme('clean', {
	         cell : {
	            header : {
	               background : '#f8f9fd',
	               border : '#d3d8e1',
	               showVerticalBorder : true,
	               showHorizontalBorder : true
	            },
	            normal : {
	               background : '#ffffff',
	               border : '#e9ebf0',
	               showVerticalBorder : true,
	               showHorizontalBorder : true
	            },
	            rowHeader : {
	               showHorizontalBorder : true
	            }
	         },
	         outline : {
	            border : '#d3d8e1',
	            showVerticalBorder : true
	         }
	      });
	}
</script>
<%-- <% String logout = request.getParameter("logout");
if (logout != null && logout.equals("true")) {
    HttpSession sessionObj = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("Login.jsp");
    return;
}
    HttpSession sessionObj = request.getSession(false);
    String id = null;
    if (session != null) {
        id = (String) session.getAttribute("id");
    }
%> --%>
<!-- <script>
	let searchDate =   document.getElementById('input_date').value;
	$(".serach_a").click(function() {
		$.ajax({
			  url: "Search", 
			  type: "POST", 
			  data: {
				  searchDate: searchDate
			  }, 
			  success: function(response) {
			    console.log(response); // 응답 데이터를 콘솔에 출력
			  },
			  error: function(xhr, status, error) {
			    console.error(error); // 에러 메시지를 콘솔에 출력
			  }
			});	
	});
	

</script>
 -->
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
				<a href="?logout=true" class="logout fl">로그아웃</a>
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
						<a href="CustomerInquriy.jsp">고객문의 관리</a>
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
		<div style="clear:both;"></div>
	</div>
	<div id="right_side" class="fl" style="width: 89%;">
		<div class="wrap">
			<div class="right_container">
				<div class="right_content">
					<div class="right_hd">
						<h2 class="fl">
						<span class="blind">고객문의 관리</span>
						</h2>
						<div style="clear:both;"></div>
					</div>
					<div class="serach_table">
							<table class="serach_box" border="1">
								<colgroup>
									<col width="13%">
									<col>
									<col width="13%">
									<col width="13%">
									<col width="13%">
									<col width="35%">
								</colgroup>
								
									<tbody>
										<tr>
											<th scope="row" class="th_txt">문의 접수일</th>
											<td colspan=3>
												<div class="td_div">
													<ul class="quick_btn">
														<li class="today">
															<a class="per">
																<span class="blind">오늘</span>
															</a>
														</li>
														
														<li>
															<a class="per3">
																<span class="blind">1주일</span>
															</a>
														</li>
														<li>
														<a class="per4">
																<span class="blind">1개월</span>
														</a>
														</li>
														<li>
															<a class="per5">
																<span class="blind">3개월</span>
															</a>
														</li>
													</ul>
													</div>
													<span class="h_bar">|</span>
													<div id="div_date_date" class="adddate">
														<div class="fl calendar_st">
															<input type="text" id="input_date" value="2023.05.25" />
														</div>
														<div class="fl">~</div>
														<div class="fl calendar_st">
															<input type="text" id="input_date2" value="2023.05.25" />
														</div>
												</div>
											</td>
											<th scope="row" class="th_txt">만족도</th>
											<td>
												<select id="satisfied_select" name="satisfied_select">
													<option value="-">전체</option>
													<option value="만족">만족</option>
													<option value="불만족">불만족</option>
												</select>
											</td>
										</tr>
										<tr>
											<th scope="row" class="th_txt">처리상태</th>
											<td>
												<select style="width: 85px" id="return_msg">
													<option value="">전체</option>
													<option value="답변완료">답변완료</option>
													<option value="미답변" selected>미답변</option>
												</select>
											</td>
											<th scope="row" class="th_txt">문의유형</th>
											<td>
												<select style="width:85px" id="inquiry_select">
													<option value="">전체</option>
													<option value="상품">상품</option>
													<option value="배송">배송</option>
													<option value="반품">반품</option>
													<option value="교환">교환</option>
													<option value="환불">환불</option>
													<option value="기타">기타</option>
												</select>
											</td>
											<th scope="row" class="th_txt">상세검색</th>
											<td>
												<select id="sel_choice3" name="searchType" style="width:85px">
													<option value="">선택</option>
													<option value="상품번호">상품번호</option>
													<option value="pordernum">상품주문번호</option>
												</select>
												<input type="text" name="quick_ipt" class="quick_ipt"/>
											</td>
										</tr>
									</tbody>
									
								</table>
							</div>
							<div class="btn_quickserach">
								<a class="serach_a">
									<span>검색</span>
								</a>
							</div>
						
						<p class="information">문의제목을 클릭하시면 상세한 문의내역을 확인할 수 있습니다. </p>
					<div id="grid" class="toast"></div>
					<div class="box_column">
						<div class="fl columnbox">
							<div class="hdcbox">
								<h3>고객문의 내용 보기</h3>
							</div>
						<div class="table_type">
							<table class="inquiry_contable">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">접수일</th>
										<td id="regDate">&nbsp;</td>
										<th scope="row">처리일</th>
										<td id="treatDate">&nbsp;</td>
									</tr>
									<tr>
										<th scope="row">질문자</th>
										<td id="purchaser">&nbsp;</td>
										<th scope="row">질문자ID</th>
										<td id="purchaserID">&nbsp;</td>
										
									</tr>
									<tr>
										<th scope="row">주문번호</th>
										<td id="orderNo">&nbsp;</td>
										<th scope="row">상품명</th>
										<td id="pName">&nbsp;</td>
										
									</tr>
									<tr>
										<th scope="row">상품주문번호</th>
										<td id="pordernum">&nbsp;</td>
										<th scope="row">글번호</th>
										<td id="orderconNo">&nbsp;</td>
									</tr>
									<tr>
										<th>문의유형/문의내용</th>
										<td id="_title" colspan="3">&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</div>
						</div>
						<div class="fr columnbox">
							<div class="hdcbox">
								<h3 class="fl">판매자 답변 처리</h3>
								<div class="fr tamplete_btn">
									<a class="tam_btn">
										<span>템플릿 관리</span>
									</a>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="table_type">
								<table class="inquiry_contable">
								<colgroup>
									<col width="25%">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">
											<label for="inquiry_type">문의유형</label>
										</th>
										<td>
											<select id="inquiry_type" name="inquiry_type">
												<option value="NONE">선택해주세요.</option>
												<option value="PRODUCT">상품</option>
												<option value="DELIVERY">배송</option>
												<option value="RETURN">반품</option>
												<option value="EXCHANGE">교환</option>
												<option value="REFUND">환불</option>
												<option value="ETC">기타</option>
												<option value="NONE_SELECTED">선택안함</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row">답변내용</th>
										<td>
											<form action="InquiryUpdateAction.jsp" id="inquiry_return_form" method="post">
											 	<input type="hidden" class="input_seller_id" name="seller_id" value="<%=loginId%>"/>
					        					<input type="hidden" id="serial_number" name="serial_number" value="<%=게시물번호%>"/>	
											<textarea style="width:100%; height:250px;" cols="30" rows="5" class="ta" name="answer_content"></textarea>
													<div class="space_h">
														<span class="fr maxchar">
															<em>
																<span class="blind">입력된 글자수 : </span>
																<span>0</span>
															</em>/
															<strong>
																<span class="blind">최대 입력 글자 : </span>
																1,000
															</strong>
														 
															</span>
															<button type="submit" style="" id="regComment" class="btn_d">
																<span>답변하기</span>
															</button>
															<button type="submit" style="display:none;" id="editComment" class="btn_d">
																	<span>답변수정</span>
															</button>
													</div>
											</form>
										</td>
									</tr>
								</tbody>
								</table>
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
				</div>
			</div>
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
</body>
</html>

