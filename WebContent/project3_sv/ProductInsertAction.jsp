<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="dto.*"%>

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
	AllProductSelectDao allpDao = new AllProductSelectDao();
  	String sq = "인기도순";
  	ArrayList<AllProductDto> dto2 = allpDao.allSelect(seller_id, sq);
  	
  	int count = 0;
	for(AllProductDto dto : dto2 ) {
		count++;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품조회/수정</title>
	<link rel="stylesheet" href="css/ProductSelect.css" />
	<link rel="stylesheet" href="css/TopSidebar.css"/>

	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
		$(function() {
			
			
			
			//카테고리 열기
			$("#largecat").click(function() {
				$("#largecatbox").css("display","block");
			});
			$("#middlecat").click(function() {
				$("#middlecatbox").css("display","block");
			});
			$("#subcat").click(function() {
				$("#subcatbox").css("display","block");
			});
			$("#smallcat").click(function() {
				$("#smallcatbox").css("display","block");
			});
			//카테고리 값 바꾸기
			$("#largecatbox .option").click(function() {
				$("#largecat").html('<div class="item">'+$(this).text()+'</div>');
				$("#largecatbox").css("display","none");
				$("#middlecat").attr("class","select_style");
				$("#subcat").attr("class","select_style disabled");
				$("#smallcat").attr("class","select_style disabled");
			});
			$("#middlecatbox .option").click(function() {
				$("#middlecat").html('<div class="item">'+$(this).text()+'</div>');
				$("#middlecatbox").css("display","none");
				$("#subcat").attr("class","select_style");
				$("#smallcat").attr("class","select_style disabled");
			});
			$("#subcatbox .option").click(function() {
				$("#subcat").html('<div class="item">'+$(this).text()+'</div>');
				$("#subcatbox").css("display","none");
				$("#smallcat").attr("class","select_style");
			});
			$("#smallcatbox .option").click(function() {
				$("#smallcat").html('<div class="item">'+$(this).text()+'</div>');
				$("#smallcatbox").css("display","none");
			});
			$("#all_status").click(function() {
				if($("#all_status").prop("checked")) {
					$(".type_status").prop("checked",true);
					$(".type_status").prop("disabled",true);
				} else {
					$(".type_status").prop("checked",false);
					$(".type_status").prop("disabled",false);
				}
			});
			$(".pdsel_date").change(function() {
				$("#pd_datebox").text(this.value);
			});
			//판매대기
			$("#li1").click(function() {
				$(this).attr("aria-selected",true);
				$("#li2").attr("aria-selected",false);
				$("#li3").attr("aria-selected",false);
				$("#li4").attr("aria-selected",false);
				$("#li5").attr("aria-selected",false);
				$("#li6").attr("aria-selected",false);
				$("#li7").attr("aria-selected",false);
				$("#li8").attr("aria-selected",false);
				$("#all_status").prop("checked",true);
				$(".type_status").prop("checked",true);
				$(".type_status").prop("disabled",true);
			});
			$("#li2").click(function() {
				$(this).attr("aria-selected",true);
				$("#li1").attr("aria-selected",false);
				$("#li3").attr("aria-selected",false);
				$("#li4").attr("aria-selected",false);
				$("#li5").attr("aria-selected",false);
				$("#li6").attr("aria-selected",false);
				$("#li7").attr("aria-selected",false);
				$("#li8").attr("aria-selected",false);
				$("#all_status").prop("checked",false);
				$(".type_status").prop("disabled",false);
				$(".type_status").prop("checked",false);
				$("#ts1").prop("checked",true);
			});
			//판매중클릭
			$("#li3").click(function() {
				$(this).attr("aria-selected",true);
				$("#li1").attr("aria-selected",false);
				$("#li2").attr("aria-selected",false);
				$("#li4").attr("aria-selected",false);
				$("#li5").attr("aria-selected",false);
				$("#li6").attr("aria-selected",false);
				$("#li7").attr("aria-selected",false);
				$("#li8").attr("aria-selected",false);
				$("#all_status").prop("checked",false);
				$(".type_status").prop("disabled",false);
				$(".type_status").prop("checked",false);
				$("#ts2").prop("checked",true);
				$("#searchbutton").click(function() {
					// 현재 URL 가져오기
					let currentUrl = window.location.href;
				
					
					let searchQuery = $("#li3 > .text > p").text();
					let seller_id = $(".topid").text();
					// 기존 쿼리 문자열 파싱
					var url = new URL(currentUrl);
					var searchParams = new URLSearchParams(url.search);
				
					// 파라미터 추가 또는 변경
					searchParams.set("sales_status", searchQuery);
					searchParams.set("seller_id", seller_id);
				
					// 변경된 쿼리 문자열을 새로운 URL에 적용
					url.search = searchParams.toString();
				
					// 새로운 URL로 페이지 새로고침
					window.location.href = url.toString();
					
				});
			});
			$("#li4").click(function() {
				$(this).attr("aria-selected",true);
				$("#li1").attr("aria-selected",false);
				$("#li2").attr("aria-selected",false);
				$("#li3").attr("aria-selected",false);
				$("#li5").attr("aria-selected",false);
				$("#li6").attr("aria-selected",false);
				$("#li7").attr("aria-selected",false);
				$("#li8").attr("aria-selected",false);
				$("#all_status").prop("checked",false);
				$(".type_status").prop("disabled",false);
				$(".type_status").prop("checked",false);
				$("#ts3").prop("checked",true);
			});
			$("#li5").click(function() {
				$(this).attr("aria-selected",true);
				$("#li1").attr("aria-selected",false);
				$("#li2").attr("aria-selected",false);
				$("#li3").attr("aria-selected",false);
				$("#li4").attr("aria-selected",false);
				$("#li6").attr("aria-selected",false);
				$("#li7").attr("aria-selected",false);
				$("#li8").attr("aria-selected",false);
				$("#all_status").prop("checked",false);
				$(".type_status").prop("disabled",false);
				$(".type_status").prop("checked",false);
				$("#ts4").prop("checked",true);
			});
			$("#li6").click(function() {
				$(this).attr("aria-selected",true);
				$("#li1").attr("aria-selected",false);
				$("#li2").attr("aria-selected",false);
				$("#li3").attr("aria-selected",false);
				$("#li4").attr("aria-selected",false);
				$("#li5").attr("aria-selected",false);
				$("#li7").attr("aria-selected",false);
				$("#li8").attr("aria-selected",false);
				$("#all_status").prop("checked",false);
				$(".type_status").prop("disabled",false);
				$(".type_status").prop("checked",false);
				$("#ts5").prop("checked",true);
				$("#searchbutton").click(function() {
					// 현재 URL 가져오기
					let currentUrl = window.location.href;
				
					
					let searchQuery = $("#li6 > .text > p").text();
					let seller_id = $(".topid").text();
					// 기존 쿼리 문자열 파싱
					var url = new URL(currentUrl);
					var searchParams = new URLSearchParams(url.search);
				
					// 파라미터 추가 또는 변경
					searchParams.set("sales_status", searchQuery);
					searchParams.set("seller_id", seller_id);
				
					// 변경된 쿼리 문자열을 새로운 URL에 적용
					url.search = searchParams.toString();
				
					// 새로운 URL로 페이지 새로고침
					window.location.href = url.toString();
					
				});
			});
			$("#li7").click(function() {
				$(this).attr("aria-selected",true);
				$("#li1").attr("aria-selected",false);
				$("#li2").attr("aria-selected",false);
				$("#li3").attr("aria-selected",false);
				$("#li4").attr("aria-selected",false);
				$("#li5").attr("aria-selected",false);
				$("#li6").attr("aria-selected",false);
				$("#li8").attr("aria-selected",false);
				$("#all_status").prop("checked",false);
				$(".type_status").prop("disabled",false);
				$(".type_status").prop("checked",false);
				$("#ts6").prop("checked",true);
			});
			$("#li8").click(function() {
				$(this).attr("aria-selected",true);
				$("#li1").attr("aria-selected",false);
				$("#li2").attr("aria-selected",false);
				$("#li3").attr("aria-selected",false);
				$("#li4").attr("aria-selected",false);
				$("#li5").attr("aria-selected",false);
				$("#li6").attr("aria-selected",false);
				$("#li7").attr("aria-selected",false);
				$("#all_status").prop("checked",false);
				$(".type_status").prop("disabled",false);
				$(".type_status").prop("checked",false);
				$("#ts7").prop("checked",true);
			});
			function getParamMap(queryString) {
				let splited = queryString.replace("?", "").split(/[=?&]/);
				let param = {};
				for(let i = 0; i < splited.length; i++) {
					param[splited[i]] = splited[++i];
				}
				return param;
			}
			
			let queryString = location.search;
			const paramObj = getParamMap(queryString); 
			//alert("아이디 : "+paramObj.id)
			//alert("비밀번호 : "+paramObj.pw)
			let large = paramObj.large;
			let pw = paramObj.pw;
		});
	</script>
	<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
	<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
				
<script>
	window.onload = function() {
		var Grid = tui.Grid;
		
		var instance = new Grid({
			el : document.getElementById('grid'), // Container element
			scrollX : true,
			bodyHeight : 450,
			columnOptions: {
			    frozenCount: 4, // 3개의 컬럼을 고정하고
			    frozenBorderWidth: 1 // 고정 컬럼의 경계선 너비를 2px로 한다.
			  },
			
			
			rowHeaders : [ 'checkbox' ],
			
			columns : [ {
				width : 54,
				header : '수정',
				name : 'modify',
				align : 'center',
				valign : 'middle'
			}, {
				width : 54,
				header : '복사',
				name : 'copy',
				align : 'center',
				valign : 'middle'
			}, {
				width : 160,
				header : '상품번호(스마트스토어)',
				name : 'pnumber',
				align : 'center',
				valign : 'middle'
			}, {
				width : 147,
				header : '판매자상품코드',
				name : 'pcode',
				align : 'center',
				valign : 'middle'
			}, {
				width : 70,
				header : '결제여부',
				name : 'payornot',
				align : 'center',
				valign : 'middle'
			}, {
				width : 160,
				header : '상품명',
				name : 'pname',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '상세설명',
				name : 'description',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '판매상태',
				name : 'salestatus',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '전시상태',
				name : 'displaystatus',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '재고수량',
				name : 'amount',
				align : 'center',
				valign : 'middle'
			}, {
				width : 120,
				header : '판매가',
				name : 'price',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '옵션',
				name : 'option',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '배송속성',
				name : 'delivery',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '택배사',
				name : 'deliverycompany',
				align : 'center',
				valign : 'middle'
			}, {
				width : 120,
				header : '배송비유형',
				name : 'deliverytype',
				align : 'center',
				valign : 'middle'
			}, {
				width : 120,
				header : '기본배송비',
				name : 'deliverycost',
				align : 'center',
				valign : 'middle'
			}, {
				width : 120,
				header : '반품배송비',
				name : 'returncost',
				align : 'center',
				valign : 'middle'
			}, {
				width : 120,
				header : '교환배송비',
				name : 'exchangecost',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '대분류',
				name : 'large',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '중분류',
				name : 'middle',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '소분류',
				name : 'sub',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '세분류',
				name : 'small',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '제조사명',
				name : 'manufacturer',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '브랜드명',
				name : 'brand',
				align : 'center',
				valign : 'middle'
			}, {
				width : 100,
				header : '모델명',
				name : 'model',
				align : 'center',
				valign : 'middle'
			}, {
				width : 150,
				header : '판매시작일',
				name : 'salestart',
				align : 'center',
				valign : 'middle'
			}, {
				width : 150,
				header : '판매종료일',
				name : 'saleend',
				align : 'center',
				valign : 'middle'
			}, {
				width : 170,
				header : '상품등록일',
				name : 'psigndate',
				align : 'center',
				valign : 'middle'
			}, {
				width : 170,
				header : '최종수정일',
				name : 'finaldate',
				align : 'center',
				valign : 'middle'
			}
			],
			data :[
			<% 
				int cnt = 0;
				for(ProductDto dto : listProductDto) {
					cnt++;
			%>
				{
				modify : '<a type="button" class="mdf_btn">수정</a>',
				copy : '<a type="button" class="mdf_btn">복사</a>',
				pnumber : '<%=dto.getPnumber() %>',
				pcode : '<%=dto.getPcode() %>',
				payornot : '<%=dto.getWhetherPayment() %>',
				pname : '<%=dto.getPname() %>',
				description : '<a type="button" class="mdf_btn">상세설명</a>',
				salestatus : '<%=dto.getSalesStatus()%>',
				displaystatus : '<%=dto.getDisplayStatus()%>',
				amount : '<%=dto.getAmount() %>',
				price : '<%=dto.getPrice() %>원',
				option : 'N',
				delivery : '일반배송',
				deliverycompany : '<%=dto.getDeliverCompany()%>',
				deliverytype : '<%=dto.getDeliveryCostType() %>',
				deliverycost : '<%=dto.getDeliveryCost() %>',
				returncost : '<%=dto.getReturn_delivery_cost() %>',
				exchangecost : '<%=dto.getExchange_cost() %>',
				large : '<%=dto.getLarge() %>',
				middle : '<%=dto.getMiddle() %>',
				sub : '<%=dto.getSub() %>',
				small : '<%=dto.getSmall() %>',
				manufacturer : '<%=dto.getManufacturer_name()%>',
				brand : '<%=dto.getBrand_name()%>',
				model : '<%=dto.getModel_name() %>',
				salestart : '<%=dto.getSales_start_period() %>',
				saleend : '<%=dto.getSales_end_period() %>',
				psigndate : '<%=dto.getProduct_registration() %>',
				finaldate : '<%=dto.getFi_modify()%>'
				}, 
			<%
				} 
			%>
			]
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
			},
			scrollbar : {
				border : '#e9ebf0',
				emptySpace : '#f8f9fd',
				background : '#ffffff'
			},
			frozenBorder :{
				border : '#e9ebf0'
			}
		}); // Call API of static method
	}
	
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
					<img src="img/headerlogo.png">
				</span>
			</div>
			<div style="clear:both;"></div>	
		</div>	
		<div class="right-header fr">
			<div class="topright fl">
				<div class="fl">
					<span class="topid">jiyoonjung</span>님
					<span class="myhome">내정보</span>
				</div>
				<div class="fl">
					<i class="bell"></i>
					<i class="newicon"></i>
				</div>
				<div class="logout fl">로그아웃</div>
				<div class="imformation fl">도움말</div>
				<div class="header-talk fl">
					<img src="img/headertalk.png"/> 
					<span>톡톡상담</span>
				</div>
				<div style="clear:both;"></div>	
			</div>
		</div>
		<div style="clear:both;"></div>	
	</div>
	<div>
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
					<img src="img/searchicon.png"/>
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
						<a href="https://sell.smartstore.naver.com/#/products/create">상품 등록</a>
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
						<a href="https://sell.smartstore.naver.com/#/notice/search">공지사항 관리</a>
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
						<a href="https://sell.smartstore.naver.com/#/naverpay/manage/order">주문통합검색</a>
					</div>
					<div>
						<a>선물 수락대기</a>
					</div>
					<div>
						<a>미결재 확인</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/sale/delivery">발주(주문)확인/발송관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/sale/delivery/situation">배송현황 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/sale/purchaseDecision">구매확정 내역</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/claim/cancel">취소 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/claim/return">반품 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/claim/exchange">교환 관리</a>
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
						<a href="https://sell.smartstore.naver.com/#/comment/">문의 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/qnas">고객문의 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/review/search">리뷰 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/event/REVIEW_EVENT/search">리뷰이벤트 관리</a>
					</div>
				</div>
			
			</div>
			<div class="menu" onclick="sidebarbtn('side_content5', 'dropicon5')">
				<div class="talk">톡톡상담관리
					<img src="img/talkicon.png"/>
				</div>
				<div id="dropicon5" class="dropbtn"></div>
			</div>
			<div id="side_content5" class="dropcontent" style="display:none;">
				<div class="droptext">
					<div>
						<a href="https://sell.smartstore.naver.com/#/talktalk/chat">톡톡 상담하기</a>
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
						<a href="https://sell.smartstore.naver.com/d/v2/home">스마트스토어</a>
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
					<img src= "img/shorcuticon.png"/>
				</div>
				<div class="subtitle">쇼핑 라이브 교육
					<img src= "img/shorcuticon.png"/>
				</div>
			</div>
			<h2 class="title mg35">네이버 비즈니스 금융센터</h2>
				<div class="shortcut">
					<div>정책지원금
						<img src= "img/shorcuticon.png"/>
					</div>
					<div class="subtitle">빠른정산
						<img src= "img/shorcuticon.png"/>
					</div>
					<div class="subtitle">사업자 대출
						<img src= "img/shorcuticon.png"/>
					</div>
					<div class="subtitle">사업자 보험
						<img src= "img/shorcuticon.png"/>
					</div>
				</div>
			<h2 class="title mg35">공식 블로그 바로가기</h2>
				<div class="shortcut">
					<div>네이버쇼핑 파트너
						<img src= "img/shorcuticon.png"/>
					</div>
					<div class="subtitle">쇼핑윈도
						<img src= "img/shorcuticon.png"/>
					</div>
				</div>
		</div>
		
		<!-- 5번째 ______________ -->
		<div class="last_leftside">
			<div class="clicktalk">
			<img class="minitalk" src="img/talkicon2.png"/>톡톡상담
			</div>
		</div>
	</div>
			<div class="fl right_side">
				<div class="seller-sub-title">
					<div class="fl">
						<div class="navbar fl"><input type="button" style="border:none; height:60px; width:20px;"/></div>
						<div><h2 class="title">상품 조회/수정
							<img src="img/helpicon.png" style="position: relative; top: 4px;">
						</h2></div>
						<div style="clear:both;"></div>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div class="seller-sub-content">
					<div class="seller-status form-section">
						<ul class="seller-status-list">
							<li id="li1" class="ssl" aria-selected="false">
								<span class="status-icon">
									<i class="seller-icon icon-all"></i>
								</span>
								<div class="text">
									<p>전체</p>
									<strong><%=count %></strong>
									<em>건</em>
								</div>
							</li>
							<li id="li2" class="ssl" aria-selected="false">
								<span class="status-icon">
									<i class="seller-icon icon-wait"></i>
								</span>
								<div class="text">
									<p>판매대기</p>
									<strong>0</strong>
									<em>건</em>
								</div>
							</li>
							<li id="li3" class="ssl" aria-selected="false">
								<span class="status-icon">
									<i class="seller-icon icon-sale"></i>
								</span>
								<div class="text">
									<p>판매중</p>
									<strong><%=cnt %></strong>
									<em>건</em>
								</div>
							</li>
							<li id="li4" class="ssl" aria-selected="false">
								<span class="status-icon">
									<i class="seller-icon icon-outofstock"></i>
								</span>
								<div class="text">
									<p>품절</p>
									<strong>0</strong>
									<em>건</em>
								</div>
							</li>
							<li id="li5" class="ssl" aria-selected="false">
								<span class="status-icon">
									<i class="seller-icon icon-unadmission"></i>
								</span>
								<div class="text">
									<p>승인대기</p>
									<strong>0</strong>
									<em>건</em>
								</div>
							</li>
							<li id="li6" class="ssl" aria-selected="false">
								<span class="status-icon">
									<i class="seller-icon icon-suspension"></i>
								</span>
								<div class="text">
									<p>판매중지</p>
									<strong>0</strong>
									<em>건</em>
								</div>
							</li>
							<li id="li7" class="ssl" aria-selected="false">
								<span class="status-icon">
									<i class="seller-icon icon-close"></i>
								</span>
								<div class="text">
									<p>판매종료</p>
									<strong>0</strong>
									<em>건</em>
								</div>
							</li>
							<li id="li8" class="ssl" aria-selected="false">
								<span class="status-icon">
									<i class="seller-icon icon-prohibition"></i>
								</span>
								<div class="text">
									<p>판매금지</p>
									<strong>0</strong>
									<em>건</em>
								</div>
							</li>
						</ul>
					</div>
					<div class="panel panel-seller">
						<div class="panel-body">
							<div class="seller-search-section">
								<ul class="seller-list-border">
									<li>
										<div class="fl">
											<label class="column_name_color">검색어</label>
										</div>
										<div class="fl">
											<label class="label_style">
												<input type="radio" name="pd" class="form_style" checked/>
												상품번호
												<span></span>
											</label>
											<span class="icon_style ml10">
												<img src="img/아이콘.png"/>
											</span>												
											<br/>
											<label class="label_style">
												<input type="radio" name="pd" class="form_style"/>
												판매자상품코드
												<span></span>
											</label>
										</div>
										<div class="fl">
											<textarea id="textarea" rows="3" placeholder="복수 검색&#13;&#10;(enter 또는 &quot;.&quot; 로 구분)" class="form_style"></textarea>
										</div>
										<div class="fl">
											<label>
												<span class="mr10">상품명</span>
												<input type="text" class="textvar form_style"/>
											</label>
											<div class="h10"></div>
											<label>
												<span class="mr10">모델명</span>
												<input type="text" class="textvar form_style"/>
											</label>
										</div>
										<div class="fl">
											<label>
												<span class="mr10">제조사명</span>
												<input type="text" class="textvar form_style"/>
											</label>
											<div class="h10"></div>
											<label>
												<span class="mr10">브랜드명</span>
												<input type="text" class="textvar form_style"/>
											</label>
										</div>
										<div style="clear:both;"></div>
									</li>
									<li>
										<div class="fl">
											<label class="column_name_color">판매상태</label>
										</div>
										<div class="fl">
											<label class="label_style label_sty mr15">
												<input type="checkbox" id="all_status" name="productStatus">
												전체
												<span></span>
											</label>
										</div>
										<div class="fl">
											<label class="label_style label_sty mr15">
													<input type="checkbox" disabled id="ts1" class="type_status" name="productStatus">
													판매대기
													<span></span>
											</label>
										</div>
										<div class="fl">
											<label class="label_style label_sty mr15">
												<input type="checkbox" disabled id="ts2" class="type_status" name="productStatus">
												판매중
												<span></span>
											</label>
										</div>
										<div class="fl">
											<label class="label_style label_sty mr15">
												<input type="checkbox" disabled id="ts3" class="type_status" name="productStatus">
												품절
												<span></span>
											</label>
										</div>
										<div class="fl">
											<label class="label_style label_sty mr15">
												<input type="checkbox" disabled id="ts4" class="type_status" name="productStatus">
												승인대기
												<span></span>
											</label>
										</div>
										<div class="fl">
											<label class="label_style label_sty mr15">
												<input type="checkbox" disabled  id="ts5" class="type_status"  name="productStatus">
												판매중지
												<span></span>
											</label>
										</div>
										<div class="fl">
											<label class="label_style label_sty mr15">
												<input type="checkbox" disabled  id="ts6" class="type_status" name="productStatus">
												판매종료
												<span></span>
											</label>
										</div>
										<div class="fl">
											<label class="label_style label_sty mr15">
												<input type="checkbox" disabled id="ts7" class="type_status" name="productStatus">
												판매금지
												<span></span>
											</label>
										</div>
										<div style="clear:both;"></div>
									</li>
									<li>
										<div class="fl">
											<label class="column_name_color">카테고리</label>
										</div>
										<div class="fl form-group" style="position: relative;">
											<div id="largecat" class="select_style">
												<div class="item">대분류</div>
											</div>
											<div id="largecatbox" class="select_dropdown">
												<div class="select_dropdown_content">
													<div data-selectable class="option disabled">대분류</div>
													<div data-selectable class="option">가구/인테리어</div>
													<div data-selectable class="option">생활/건강</div>
												</div>
											</div>
										</div>
										<div class="fl form-group" style="position: relative;">
											<div id="middlecat" class="select_style disabled">
												<div data-value class="item">중분류</div>
											</div>
											<div id="middlecatbox" class="select_dropdown">
												<div class="select_dropdown_content">
													<div data-selectable class="option disabled">중분류</div>
													<div data-selectable class="option">가구/인테리어</div>
													<div data-selectable class="option">생활/건강</div>
													<div data-selectable class="option">생활/건강</div>
													<div data-selectable class="option">생활/건강</div>
													<div data-selectable class="option">생활/건강</div>
													<div data-selectable class="option">생활/건강</div>
													<div data-selectable class="option">생활/건강</div>
													<div data-selectable class="option">생활/건강</div>
													<div data-selectable class="option">생활/건강</div>
													<div data-selectable class="option">생활/건강</div>
													<div data-selectable class="option">생활/건강</div>
													
												</div>
											</div>
										</div><div class="fl form-group" style="position: relative;">
											<div id="subcat" class="select_style disabled">
												<div data-value class="item">소분류</div>
											</div>
											<div id="subcatbox" class="select_dropdown" >
												<div class="select_dropdown_content">
													<div data-selectable class="option disabled">소분류</div>
													<div data-selectable class="option">가구/인테리어</div>
													<div data-selectable class="option">생활/건강</div>
												</div>
											</div>
										</div><div class="fl form-group" style="position: relative;">
											<div id="smallcat" class="select_style disabled">
												<div data-value class="item">세분류</div>
											</div>
											<div id="smallcatbox" class="select_dropdown"  >
												<div class="select_dropdown_content">
													<div data-selectable class="option disabled">세분류</div>
													<div data-selectable class="option">가구/인테리어</div>
													<div data-selectable class="option">생활/건강</div>
												</div>
											</div>
										</div>
										<div style="clear:both;"></div>
									</li>
							
									<li>
										<div class="fl">
											<label class="column_name_color">결제여부</label>
										</div>
										<div class="fl mr35">
											<label class="label_style">
												<input type="radio" name="payd" class="form_style" checked/>
												전체
												<span></span>
											</label>
										</div>
										<div class="fl mr35">
											<label class="label_style">
												<input type="radio" name="payd" class="form_style"/>
												결제가능 상품
												<span></span>
											</label>
										</div>
										<div class="fl mr35">
											<label class="label_style">
												<input type="radio" name="payd" class="form_style"/>
												결제불가능 상품
												<span></span>
											</label>
										</div>
										<div style="clear:both;"></div>
									</li>
									<li>
										<div class="fl" style="width:140px;">
											<label class="column_name_color">기간</label>
										</div>
										<div id="div_date" class="fl">
											<label id="lbl_date">상품등록일</label> 
											<select id="sel_date" class="selectoption">
												<option selected>상품등록일</option>
												<option>판매시작일</option>
												<option>판매종료일</option>
												<option>최종수정일</option>
											</select>
										</div>
										<div id="div_5113" class="fl">
											<button class="selectpay">오늘</button>
											<button class="selectpay ml4">1주일</button>
											<button class="selectpay ml4">1개월</button>
											<button class="selectpay ml4">3개월</button>
											<button class="selectpay ml4">6개월</button>
											<button class="selectpay ml4">1년</button>
											<button class="selectpay ml4">전체</button>
										</div>
										<div id="div_date_date" class="fl">
											<div class="fl">
												<input type="text" value="2023.05.25" />
											</div>
											<div class="fl">
												<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAeCAYAAABe3VzdAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODgwN0NCRURFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODgwN0NCRUVFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo4ODA3Q0JFQkU4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ODA3Q0JFQ0U4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjTBh6MAAAEoSURBVHjaYvz//z/DYAZMDIMcjDpw1IGjDiQAWEjVUNXUiS4EKqcYsSjFEG+rK6e9A6EWEyOGTZyRXlHMiITfo/EZkRyCzh+QNCiExxMDnkk6gFgAiB2AOAIqVgDEGlDxjoF2oCDUDA4g5oaK8QExK1RckO65GA2sBuJvQHwDiJ9AxXYB8XOo+OqBDsGZ0DToAcTJULE6INaFis8c6BBUhtIzkMS8sMgPWAiCyjk5IK4A4qVQsUtA7A0V/z/QIQiKxo9APAGImaFiNkD8HYj/4imC6BaCu4FYDFrEVELFZgGxOVR890CHIKhi/gTEJ4D4OlRsHhDfhYp3DpQDYeXbHiBmB+KXUAwSPw2VY4fKCw6EA9/Rq7nFONqrG3XgqANHHTjCHQgQYAAjWTNTyGzxagAAAABJRU5ErkJggg==" />
											</div>
											<div class="fl">~</div>
											<div class="fl">
												<input type="text" value="2023.05.25" />
											</div>
											<div class="fl">
												<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAeCAYAAABe3VzdAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODgwN0NCRURFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODgwN0NCRUVFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo4ODA3Q0JFQkU4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ODA3Q0JFQ0U4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjTBh6MAAAEoSURBVHjaYvz//z/DYAZMDIMcjDpw1IGjDiQAWEjVUNXUiS4EKqcYsSjFEG+rK6e9A6EWEyOGTZyRXlHMiITfo/EZkRyCzh+QNCiExxMDnkk6gFgAiB2AOAIqVgDEGlDxjoF2oCDUDA4g5oaK8QExK1RckO65GA2sBuJvQHwDiJ9AxXYB8XOo+OqBDsGZ0DToAcTJULE6INaFis8c6BBUhtIzkMS8sMgPWAiCyjk5IK4A4qVQsUtA7A0V/z/QIQiKxo9APAGImaFiNkD8HYj/4imC6BaCu4FYDFrEVELFZgGxOVR890CHIKhi/gTEJ4D4OlRsHhDfhYp3DpQDYeXbHiBmB+KXUAwSPw2VY4fKCw6EA9/Rq7nFONqrG3XgqANHHTjCHQgQYAAjWTNTyGzxagAAAABJRU5ErkJggg==" />
											</div>
											<div style="clear: both;"></div>
										</div>
										<div style="clear:both;"></div>
									</li>
								</ul>
							</div>
									<div class="botton_style fl">
										<button type="button" id="searchbutton">
											<span>검색</span>
										</button>
									</div>
									<div class="botton_style fl">
										<button type="button" id="resetbutton">
											<span>초기화</span>
										</button>
										<button type="button" id="detailbutton">
											<span>상세검색
												<img src="img/detailbutton.png"/>
											</span>
										</button>
									</div>
									<div style="clear:both;"></div>
						</div>
					</div>
					<div class="panel panel-seller"  style="height:740px">
						<div class="panel_f">
							<div class="fl panel-title">
							상품목록(총
							<span class="text-primary">3</span>
							개)
							</div>
							<div class="fr">
								<div class="fl h34">
									<div id="pd_datebox" class="pd_date">상품등록일순</div> 
										<select class="pdsel_date">
											<option>상품명순</option>
											<option>판매자상품코드순</option>
											<option>판매가 낮은순</option>
											<option>판매가 높은순</option>
											<option selected>상품등록일순</option>
											<option>상품수정일순</option>
											<option>판매시작일순</option>
											<option>판매종료일순</option>
											<option>인기도순</option>
											<option>누적판매건수순</option>
											<option>할인가낮은순</option>
										</select>
								</div>
								<div class="fl h34">
									<div class="pd_cnt" style="width:95px;">100개씩</div> 
								</div>
								<div class="fl h34">
									<div class="pd_excel" style="width:150px;">
										<img src="img/excel.png"/>
									엑셀 일괄작업
									</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="panel-body">
							<div style="clear:both;"></div>
							</div>
							<div>
								<div class="fl small_line mr5">
									<button class="buttype" style="width:67px;">
										<span class="fs12">선택삭제</span>
									</button>
								</div>
								<div class="fl h30 ml5 mr5">
									<div class="fl pd_change">
									판매변경
										<select class="pdchange_sel">
												<option selected>판매변경</option>
												<option>판매중</option>
												<option>판매중지</option>
											</select>
									</div> 
											
									<div class="fl ml3 pd_change">
										전시변경
										<select class="pdchange_sel">
												<option selected>전시변경</option>
												<option>전시중</option>
												<option>전시중지</option>
											</select>
									</div> 
									<div style="clear:both;"></div>
								</div>
								<div class="fl ml30">
									<button class="buttype" style="width:93px;">
										<span class="fs12">즉시할인 설정</span>
									</button>
									<button class="buttype" style="width:81px;">
										<span class="fs12">판매가 변경</span>
									</button>
									<button class="buttype" style="width:93px;">
										<span class="fs12">판매기간 변경</span>
									</button>
									<div class="fr pd_change">
										배송변경
										<select class="pdchange_sel">
												<option selected>배송변경</option>
												<option>배송정보</option>
											</select>
									</div>
								</div>
								<div class="fl ml30">
									<div class="pd_date">일괄변경</div>
								</div>
								<div class="mr10 fr">
									<button type="button" class="modifybutton">
										<span>수정저장</span>
									</button>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="text-primary mt5 mb5">
							관리자 검수가 필요한 채널 ‘쇼핑윈도’의 경우에는 전시상태를 직접 변경하실 수 없습니다.
							</div>
							<div id="grid"></div>
							<div  style="text-align: center;">
								<button type="button" class="numberbutton">
											<span>1</span>
								</button>
							</div>
							<div style="text-align: center;">
								<button type="button" class="savebutton">
											<span>수정 항목 저장</span>
								</button>
							</div>
						</div>	
					</div>
					<div class="seller-sub-title form-section form-section-font" style="height:36px;">
						<div class="fl t5">가격 관리
							<img src="img/아이콘.png"/>
						</div>
						<div class="fl text-primary text-liner t5">카탈로그 가격관리</div>
						<div style="clear:both;"></div>
					</div>
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
</body>
</html>
