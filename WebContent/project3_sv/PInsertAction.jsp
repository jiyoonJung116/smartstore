<%-- <%@ page import="dto.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	request.setCharacterEncoding("utf-8");
		카테고리Dao categoryDao = new 카테고리Dao();
	    ArrayList<카테고리Dto> list카테고리Dto1 = categoryDao.cate1();
	    String large = request.getParameter("large");
	    String middle = request.getParameter("middle");
	    String sub = request.getParameter("sub");
	    String small = request.getParameter("small");
	    ArrayList<카테고리Dto> list카테고리Dto2 = categoryDao.cate2(large);
	    ArrayList<카테고리Dto> list카테고리Dto3 = categoryDao.cate3(large,middle);
	    ArrayList<카테고리Dto> list카테고리Dto4 = categoryDao.cate4(large,middle,sub);
	    int 카테고리num = categoryDao.categoryNum(large,middle,sub,small);
    	
	   	String seller_id="";
		int category_id=0;
		String pcode="";
		String pname="";
		String description="";
		int amount=0;
		int price=0;
		String vat="";
		String delivery_company="";
		int delivery_cost=0;
		String return_delivery_company="";
		int return_delivery_cost=0;
		int exchange_cost=0;
		String manufacturer_name="";
		String brand_name="";
		String model_name="";
		String as_number="";
		String as_announcement="";
		String seller_note="";
		String notice="";
		String image="";
		상품등록Dao productInsertDao = new 상품등록Dao();
		
		String name="";
		String fvalue="";
		String name2="";
		String f2value="";
		String name3="";
		String f3value="";
		옵션Dao optionDao = new 옵션Dao();
		
		/* OptionlistDao optionlistDao = new OptionlistDao();
		ArrayList<OptionDto> listOptionDto = optionlistDao.optionselect();
		OptionNameDto optionnamedto = optionlistDao.optionnameselect(); */
		
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품등록</title>
	<link rel="stylesheet" href="css/ProductInsert.css" />
	<link rel="stylesheet" href="css/TopSidebar.css"/>
	<script src="js/jquery-3.7.0.min.js"></script>

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
		<script>
		$(function() {
			$(".cgradio1").click(function() {
				$(".catchoose").css("display","none");
				$(".catinsert").css("display","block");
			});
			$(".cgradio2").click(function() {
				$(".catinsert").css("display","none");
				$(".catchoose").css("display","block");
			});
			
			//옵션가 플러스마이너스 바꾸기
			$(".option_plusbt").click(function() {
				if($(".dropdown-pm").css("display")==="none"){
					$(".dropdown-pm").css("display","block");
				}else {
					$(".dropdown-pm").css("display","none");
				}
			});
			$(".dropdown-p").click(function() {
				$(".option_plusbt").html('+ <span class="caret"></span>');
				$(".dropdown-pm").css("display","none");
			});
			$(".dropdown-m").click(function() {
				$(".option_plusbt").html('- <span class="caret"></span>');
				$(".dropdown-pm").css("display","none");
			});
			//옵션 YN바꾸기
			$(".option_yn").click(function() {
				if($(".dropdown-yn").css("display")==="none"){
					$(".dropdown-yn").css("display","block");
				}else {
					$(".dropdown-yn").css("display","none");
				}
			});
			$(".dropdown-y").click(function() {
				$(".option_yn").html('Y <span class="caret"></span>');
				$(".dropdown-yn").css("display","none");
			});
			$(".dropdown-n").click(function() {
				$(".option_yn").html('N <span class="caret"></span>');
				$(".dropdown-yn").css("display","none");
			});
			
			//옵션명개수바꾸기
			$("#opqty").change(function() {
				$("#opqtybox").text(this.value);
				if(this.value==="2개"){
					$(".op2").css("display","block");
					$(".op3").css("display","none");
				}else if(this.value==="3개") {
					$(".op2").css("display","block");
					$(".op3").css("display","block");
				}else {
					$(".op2").css("display","none");
					$(".op3").css("display","none");
				}
			});
			//등록순 (정렬순서바꾸기)
			$("#order").change(function() {
				$("#orderbox").text(this.value);
			});
			//택배사 바꾸기
			$("#dcompany").change(function() {
				$("#dcompanybox").text(this.value);
			});
			//상품별배송비 바꾸기
			$("#pdfee").change(function() {
				$("#pdfeebox").text(this.value);
				if(this.value==="무료") {
					$(".d_priceinsert").attr("disabled",true);
				}else {
					$(".d_priceinsert").attr("disabled",false);
				}
			});
			//반품교환배송비 바꾸기
			$("#repdfee").change(function() {
				$("#repdfeebox").text(this.value);
			});
			//준비중입니다 alert띄우는 class 
			$(".preparing").click(function() {
				alert("준비중입니다.");
			});
			//대분류 카테고리 선택하면 초록색으로 변하는 클래스 주기
			$(".cate-large").click(function() {
				$(".cate-large").attr("class","cate-large");
				$(this).attr("class","cate-large on");
			/* 	
				let large=$(this).text();
				// 현재 URL 가져오기
				let currentUrl = window.location.href;
			
				// 기존 쿼리 문자열 파싱
				var url = new URL(currentUrl);
				var searchParams = new URLSearchParams(url.search);
				
				// 파라미터 추가 또는 변경
				searchParams.set("large", large);
			
				// 변경된 쿼리 문자열을 새로운 URL에 적용
				url.search = searchParams.toString();
			
				// 새로운 URL로 페이지 새로고침
				window.location.href = url.toString(); */
			});
			$(".cate-middle").click(function() {
				$(".cate-middle").attr("class","cate-middle");
				$(this).attr("class","cate-middle on");
				
				let middle=$(this).text();
				// 현재 URL 가져오기
				let currentUrl = window.location.href;
			
				// 기존 쿼리 문자열 파싱
				var url = new URL(currentUrl);
				var searchParams = new URLSearchParams(url.search);
				
				// 파라미터 추가 또는 변경
				searchParams.set("middle", middle);
			
				// 변경된 쿼리 문자열을 새로운 URL에 적용
				url.search = searchParams.toString();
			
				// 새로운 URL로 페이지 새로고침
				window.location.href = url.toString();
			});
			$(".cate-sub").click(function() {
				$(".cate-sub").attr("class","cate-sub");
				$(this).attr("class","cate-sub on");
				
				let sub=$(this).text();
				// 현재 URL 가져오기
				let currentUrl = window.location.href;
			
				// 기존 쿼리 문자열 파싱
				var url = new URL(currentUrl);
				var searchParams = new URLSearchParams(url.search);
				
				// 파라미터 추가 또는 변경
				searchParams.set("sub", sub);
			
				// 변경된 쿼리 문자열을 새로운 URL에 적용
				url.search = searchParams.toString();
			
				// 새로운 URL로 페이지 새로고침
				window.location.href = url.toString();
			});
			$(".cate-small").click(function() {
				$(".cate-small").attr("class","cate-small");
				$(this).attr("class","cate-small on");
				let small=$(this).text();
				// 현재 URL 가져오기
				let currentUrl = window.location.href;
			
				// 기존 쿼리 문자열 파싱
				var url = new URL(currentUrl);
				var searchParams = new URLSearchParams(url.search);
				
				// 파라미터 추가 또는 변경
				searchParams.set("small", small);
			
				// 변경된 쿼리 문자열을 새로운 URL에 적용
				url.search = searchParams.toString();
			
				// 새로운 URL로 페이지 새로고침
				window.location.href = url.toString();
			});
			 
			let seller_id = $(".topid").text();
			let category_id = <%=카테고리num %>;
			$("#input_seller_id").val(seller_id);
			$("#input_category_id").val(category_id);
		});
		</script>
	<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

	<script>
		function actbtn(a, b){
			let bc = document.getElementById(a);
			let cb = document.getElementById(b);
			if(bc.style.display=="none"){
				bc.style.display="block";
				cb.className = "fr afterbtn";
			}else if(bc.style.display=="block"){
				bc.style.display="none";
				cb.className = "fr activebtn";
			}
		}
  		function daybtn1(){
			let ds = document.getElementById("daysuljung");
			ds.style.display="block";
		} 
  		function daybtn2(){
			let ds = document.getElementById("daysuljung");
			ds.style.display="none";
		} 
  		function optionbtn1(){
			let os = document.getElementById("optionsuljung");
			os.style.display="block";
		} 
  		function optionbtn2(){
			let os = document.getElementById("optionsuljung");
			os.style.display="none";
		} 
		
		
	</script>
	<script>
	window.onload = function() {
		var Grid = tui.Grid;

		var instance = new Grid({
			el : document.getElementById('grid'), // Container element
			scrollX : true,
			bodyHeight : 300,
			width : 1570,
			rowHeaders : [ 'checkbox' ],
			header : {
				complexColumns: [{
	        	  	width : 333,
					header : '옵션명',
					name : 'optionname',
					childNames: ['옵션1', '옵션2','옵션3']
		          }
		        ],
		        height : 80
		      },
			columns : [ {
				width : 111,
				header : '<%=(optionnamedto==null?"":optionnamedto.getName())%>',
				name : '옵션1',
				align : 'center',
				valign : 'middle'
				
			},{
				width : 111,
				header : '<%=(optionnamedto==null?"":optionnamedto.getName2())%>',
				name : '옵션2',
				align : 'center',
				valign : 'middle'
			},{
				width : 111,
				header : '<%=(optionnamedto==null?"":optionnamedto.getName3())%>',
				name : '옵션3',
				align : 'center',
				valign : 'middle'
			}, {
				width : 320,
				header : '옵션가',
				name : 'optionprice',
				align : 'center',
				valign : 'middle'
			}, {
				width : 320,
				header : '재고수량',
				name : 'amount',
				align : 'center',
				valign : 'middle'
			}, {
				width : 140,
				header : '판매상태',
				name : 'salestatus',
				align : 'center',
				valign : 'middle'
			}, {
				width : 320,
				header : '관리코드',
				name : 'settingcode',
				align : 'center',
				valign : 'middle'
			}, {
				width : 80,
				header : '사용여부',
				name : 'yesorno',
				align : 'center',
				valign : 'middle'
			}, 
			],
			
		data : [ 
			<% 
			if(listOptionDto == null) {
				
			}else {
			for(OptionDto dto : listOptionDto) {
				%>
			{
			옵션1 : '<%= dto.getValue()%>',
			옵션2 : '<%= dto.getValue2()%>',
			옵션3 : '<%= dto.getValue3()%>',
			optionprice : '<%=dto.getPrice()%>',
			amount : '<%= dto.getAmount()%>', 
			salestatus : '<%= dto.getSales_status()%>',
			settingcode : '',
			yesorno : 'Y'
			}, 
			<%
				} 
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
					text : '#303236',
					showVerticalBorder : true,
					showHorizontalBorder : true
				},
				rowHeader : {
					showHorizontalBorder : true,
					showVerticalBorder : true
					
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
	<!-- --------------------content 시작----------------------------------------------------- -->
		<form action="ProductInsertAction.jsp" method="post">
		<input type="hidden" id="input_seller_id" name="seller_id" value="<%=seller_id%>"/>
		<div class="fl right_side">
				<div class="seller-sub-title">
					<div class="fl">
						<div class="navbar fl"><input type="button" style="border:none; height:60px; width:20px;"/></div>
						<div>
							<h2 class="title">상품등록
								<span class="warnningtext">
									<i class="doticon"></i>
								필수항목</span>
							</h2>
						</div>
					</div>
				</div>
				<div class="seller-sub-content">
					<div class="seller-alert errorbar preparing">
						<p class="sub-title">
							<img src="img/warnning.png"/>
						임시저장 된 내용(</p>
						<em class="text-danger text-number">0</em>
						<p class="sub-title">건)을 불러오시겠습니까?</p>
						<img src="img/rightarrow.png" class="fr"style="position:relative;top:7px;left:40px;"/>
					</div>
				
					<!-- 복사등록 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content1','clickborder1')">
							<div class="fl content-title">복사등록</div>
							<div id="clickborder1" class="fr activebtn" ></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content1" class="content-content" style="display:none; height:74px;">
							<div class="preparing copyregi">
								<input type="text" class="copyregi1" readonly placeholder="최근 등록한 상품 선택"/>
							</div>
						</div>
					</div>
					<!-- 카테고리 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content2','clickborder2')">
							<div class="fl content-title mtm6">카테고리
								<i class="musticon"></i>
								<img src="img/support.png"/>
							</div>
							<div id="clickborder2" class="fr afterbtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content2" class="content-content" style="display:block;">
							<div class="mt20">
								<div class="fl"style="height:34px">
									<input type="radio" name="category" class="radio" id="catradio1"/>
									<label class="cgradio1" for="catradio1">카테고리명 검색</label>
									<input type="radio" name="category" class="radio" id="catradio2"  checked="checked"/>
									<label class="cgradio2" for="catradio2">카테고리명 선택</label>
								</div>
								<div class="fl">
									<button type="button" class="catbut preparing ml10">카테고리 템플릿</button>
								</div>
								<div class="fl ml10">
									<label style="position:absolute; top:98px; padding:5px 16px 5px 26px;">
										<input type="checkbox"/>템플릿 추가
										<span></span>
									</label>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="catinsert" style="display:none;">
								<input type="text" readonly placeholder="카테고리명 입력" class="preparing"/>
							</div>
							<div class="catchoose" style="display:block;">
									<div class="categorystyle">
								<div class="fl categorystyle1 categorystyle3">
									<ul class="data-group ulstyle">
									
										<%for(카테고리Dto dto : list카테고리Dto1) { %>
											<% if(dto.getLarge().equals(large)) { %>
												<% if(dto.getLarge().equals("-")) { %>
												<% }else { %>
													<li><a role="button" class="cate-large on"><%=dto.getLarge() %></a></li>
												<% } %>
											<% }else { %>
												<% if(dto.getLarge().equals("-")) { %>
												<% }else { %>
										<li><a role="button" class="cate-large" href="ProductInsert.jsp?large=<%=dto.getLarge() %>"><%=dto.getLarge() %></a></li>
												<% } %>
											<% } %>
										<% } %>
									</ul>
								</div>
								<div class="fl categorystyle1">
									<ul class="data-group ulstyle">
										<li><a class="opaciting">중분류</a></li>
										<!---->
										<%for(카테고리Dto dto : list카테고리Dto2) { %>
											<% if(dto.getMiddle().equals(middle)) { %>
												<% if(dto.getMiddle().equals("-")) { %>
													<% }else { %>
														<li><a role="button" class="cate-middle on"><%=dto.getMiddle() %></a></li>
													<% } %>
												<% }else { %>
													<% if(dto.getMiddle().equals("-")) { %>
													<% }else { %>
										<li><a role="button" class="cate-middle"><%=dto.getMiddle() %></a></li>
												<% } %>
											<% } %>
										<% } %>
									</ul>
								</div>
								<div class="fl categorystyle1">
									<ul class="data-group ulstyle">
										<li><a class="opaciting">소분류</a></li>
										<!---->
										<%for(카테고리Dto dto : list카테고리Dto3) { %>
											<% if(dto.getSub().equals(sub)) { %>
												<% if(dto.getSub().equals("-")) { %>
													<% }else { %>
												<li><a role="button" class="cate-sub on"><%=dto.getSub() %></a></li>
													<% } %>
											<% }else { %>
												<% if(dto.getSub().equals("-")) { %>
												<% }else { %>
												<li><a role="button" class="cate-sub"><%=dto.getSub() %></a></li>
												<% } %>
											<% } %>
										<% } %>
									</ul>
								</div>
								<div class="fl categorystyle1">
									<ul class="data-group ulstyle">
										<li><a class="opaciting">세분류</a></li>
									<%for(카테고리Dto dto : list카테고리Dto4) { %>
											<% if(dto.getSmall().equals(small)) { %>
													<li><a role="button" class="cate-small on"><%=dto.getSmall() %></a></li>
											<% }else { %>
												<li><a role="button" class="cate-small"><%=dto.getSmall() %></a></li>
											<% } %>
										<% } %>
									</ul>
								</div>
								<div style="clear:both;"></div>
								<input type="hidden" name="category_id" id="input_category_id" value="<%=category_id%>">
							</div>
							</div>
							<input type="hidden" name="">
							<div class="greentext" style="margin-bottom:10px;">상품과 맞지 않는 카테고리에 등록할 경우 강제 이동되거나 판매중지, 판매금지 될 수 있습니다.</div>
						</div>
					</div>
					<!-- 상품명 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content3','clickborder3')">
							<div class="fl content-title mtm6">상품명
								<i class="musticon"></i>
								<img src="img/support.png"/>
							</div>
							<div id="clickborder3" class="fr afterbtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content3" class="content-content" style="display:block; height:167px;">
							<div style="width:100%;">
								<div class="fl" style="width:95%;">
									<input type="text" name="pname" class="productname"/>
								</div>
								<div class="fr" style="width:5%;">
									<span class="inputnumber">
										<span class="green">0</span>/100
									</span>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="greentext mt2">판매 상품과 직접 관련이 없는 다른 상품명, 스팸성 키워드 입력 시 관리자에 의해 판매 금지될 수 있습니다.</div>
							<div class="greentext mt2">유명 상품 유사문구를 무단으로 도용하여 ~스타일, ~st 등과 같이 기재하는 경우 별도 고지 없이 제재될 수 있습니다.</div>
							<div class="greentext mt2">전용 상품명을 사용 중인 경우 대표 상품명 수정 시에도 전용 상품명으로 노출됩니다.</div>
							<div class="greentext mt2">상품명을 검색최적화 가이드에 잘 맞게 입력하면 검색 노출에 도움이 될 수 있습니다.
									<button type="button" class="preparing pnamecheck">상품명 검색품질 체크</button>
							</div>
						
						</div>
					</div>
					<!-- 판매가 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content4','clickborder4')">
							<div class="fl content-title">판매가
								<i class="musticon" style="left: 5px; position: relative;"></i>
							</div>
							<div id="clickborder4" class="fr afterbtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content4" class="content-content" style="display:block;">
							<div class="mb16">
								<div class="fl mt20">
									<label class="control_label">판매가
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl">
									<input type="tel" name="price" class="priceinsert mt20" placeholder="숫자만 입력" >
									<span class="won mt20">원</span><br/>
									<div class="greentext">네이버 쇼핑을 통한 주문일 경우 네이버쇼핑 매출연동수수료 2%가 네이버페이 결제수수료와 별도로 과금됩니다.</div>
									<div class="greentext mt2">판매가, 할인가를 활용한 비정상 거래는 자동 탐지되어 판매지수에 포함되지 않으니 유의해주세요.</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">할인
										<img src="img/subtitleafter.png"/>
									</label>
								</div>
								<div class="fl"style="height:34px">
									<input type="radio" name="discount" class="radio" id="dcradio1"/>
									<label for="dcradio1" style="width:75px;">설정함</label>
									<input type="radio" name="discount" class="radio" id="dcradio2" checked="checked"/>
									<label for="dcradio2" style="width:75px;">설정안함</label>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">판매기간</label>
								</div>
								<div class="fl"style="height:34px">
									<input type="radio" name="saleperiod" class="radio" id="saleperiod1" onclick="daybtn1()"/>
									<label for="saleperiod1" style="width:75px;">설정함</label>
									<input type="radio" name="saleperiod" class="radio" id="saleperiod2" checked="checked" onclick="daybtn2()"/>
									<label for="saleperiod2" style="width:75px;">설정안함</label>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_con_line" id="daysuljung" style="display:none;">
									<div class="fl">
										<label class="control_label">기간설정
											<i class="musticon" style="left:2px; position: relative;"></i>
										</label>
									</div>
									<div class="fl">
										<div class="fl">
												<button class="select_pay">3일</button>
												<button class="select_pay ml4">5일</button>
												<button class="select_pay ml4">7일</button>
												<button class="select_pay ml4">15일</button>
												<button class="select_pay ml4">30일</button>
												<button class="select_pay ml4">60일</button>
												<button class="select_pay ml4">90일</button>
												<button class="select_pay ml4">120일</button>
											</div>
											<div id="div_date_date" class="fl">
												<div class="fl">
													<input type="text"/>
												</div>
												<div class="fl">
													<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAeCAYAAABe3VzdAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODgwN0NCRURFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODgwN0NCRUVFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo4ODA3Q0JFQkU4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ODA3Q0JFQ0U4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjTBh6MAAAEoSURBVHjaYvz//z/DYAZMDIMcjDpw1IGjDiQAWEjVUNXUiS4EKqcYsSjFEG+rK6e9A6EWEyOGTZyRXlHMiITfo/EZkRyCzh+QNCiExxMDnkk6gFgAiB2AOAIqVgDEGlDxjoF2oCDUDA4g5oaK8QExK1RckO65GA2sBuJvQHwDiJ9AxXYB8XOo+OqBDsGZ0DToAcTJULE6INaFis8c6BBUhtIzkMS8sMgPWAiCyjk5IK4A4qVQsUtA7A0V/z/QIQiKxo9APAGImaFiNkD8HYj/4imC6BaCu4FYDFrEVELFZgGxOVR890CHIKhi/gTEJ4D4OlRsHhDfhYp3DpQDYeXbHiBmB+KXUAwSPw2VY4fKCw6EA9/Rq7nFONqrG3XgqANHHTjCHQgQYAAjWTNTyGzxagAAAABJRU5ErkJggg==" />
												</div>
												<div class="fl">~</div>
												<div class="fl">
													<input type="text" />
												</div>
												<div class="fl">
													<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAeCAYAAABe3VzdAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODgwN0NCRURFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODgwN0NCRUVFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo4ODA3Q0JFQkU4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ODA3Q0JFQ0U4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjTBh6MAAAEoSURBVHjaYvz//z/DYAZMDIMcjDpw1IGjDiQAWEjVUNXUiS4EKqcYsSjFEG+rK6e9A6EWEyOGTZyRXlHMiITfo/EZkRyCzh+QNCiExxMDnkk6gFgAiB2AOAIqVgDEGlDxjoF2oCDUDA4g5oaK8QExK1RckO65GA2sBuJvQHwDiJ9AxXYB8XOo+OqBDsGZ0DToAcTJULE6INaFis8c6BBUhtIzkMS8sMgPWAiCyjk5IK4A4qVQsUtA7A0V/z/QIQiKxo9APAGImaFiNkD8HYj/4imC6BaCu4FYDFrEVELFZgGxOVR890CHIKhi/gTEJ4D4OlRsHhDfhYp3DpQDYeXbHiBmB+KXUAwSPw2VY4fKCw6EA9/Rq7nFONqrG3XgqANHHTjCHQgQYAAjWTNTyGzxagAAAABJRU5ErkJggg==" />
												</div>
												<div style="clear: both;"></div>
											</div>
									</div>
									<div style="clear:both;"></div>
								</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">부가세
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl"style="height:34px">
									<input type="radio" name="vat" class="radio" id="vat1" value="과세" checked="checked"/>
									<label for="vat1" style="width:75px;">과세상품</label>
									<input type="radio" name="vat" class="radio" id="vat2" value="면세"/>
									<label for="vat2" style="width:75px;">면세상품</label>
									<input type="radio" name="vat" class="radio" id="vat3" value="영세"/>
									<label for="vat3" style="width:75px;">영세상품</label>
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
					</div>
					<!-- 네이버풀필먼트 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content5','clickborder5')">
							<div class="fl content-title mtm6">네이버 풀필먼트
								<img src="img/support.png"/>
							</div>
							<div id="clickborder5" class="fr activebtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content5" class="content-content" style="display:none; height:74px;">
						<h1 style="text-align:center; color: #00c73c;">준비중입니당</h1>
						
						</div>
					</div>
					<!-- 재고수량 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content6','clickborder6')">
							<div class="fl content-title">재고수량
								<i class="musticon"></i>
							</div>
							<div id="clickborder6" class="fr afterbtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content6" class="content-content" style="display:block; height:74px;">
							<div class="fl">
								<input type="tel" name="amount" class="priceinsert mt20" placeholder="숫자만 입력" >
								<span class="won mt20">개</span>
								<div class="greentext" style="position: relative;top: -17px;left: 43px;width: 1000px;">옵션 재고수량을 사용하면, 옵션의 재고수량으로 적용되어 자동으로 입력됩니다.</div>
							</div>
						</div>
					</div>
					<!-- 옵션 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content7','clickborder7')">
							<div class="fl content-title mtm6">옵션
								<img src="img/support.png"/>
							</div>
							<div id="clickborder7" class="fr activebtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content7" class="content-content" style="display:none;">
							<div class="first_line">
								<div class="fl">
									<label class="control_label">선택형
										<img src="img/subtitleafter.png"/>
									</label>
								</div>
								<div class="fl"style="height:34px">
									<input type="radio" name="opselect" class="radio" id="opselect1" onclick="optionbtn1()"/>
									<label for="opselect1" style="width:75px;">설정함</label>
									<input type="radio" name="opselect" class="radio" id="opselect2" checked="checked" onclick="optionbtn2()"/>
									<label for="opselect2" style="width:75px;">설정안함</label>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div id="optionsuljung" style="display:none; position: relative; top:5px;padding-bottom: 10px;">
								<div class="sub_line">
									<div class="fl">
										<label class="control_label" style="position:relative; left:35px;">옵션 입력방식</label>
									</div>
									<div class="fl l60">
										<div class="fl mr35">
												<label class="label_style">
													<input type="radio" name="optioninsert"checked/>
													직접입력하기
													<span></span>
												</label>
											</div>
											<div class="fl mr35">
												<label class="label_style">
													<input type="radio" name="optioninsert"/>
													엑셀 일괄등록
													<span></span>
												</label>
											</div>
											<div class="fl mr35">
												<label class="label_style">
													<input type="radio" name="optioninsert"/>
													다른상품 옵션 불러오기
													<span></span>
												</label>
											</div>
											<div style="clear:both;"></div>
									</div>
									<div style="clear:both;"></div>
								</div>
								
								<div class="sub_con_line">
								 	<div class="sub_line">
										<div class="fl">
											<label class="control_label" style="position:relative; left:35px;">옵션 구성타입
												<i class="musticon" style="left:2px; position: relative;"></i>
												<img src="img/subtitleaftergrey.png"/>
											</label>
										</div>
										<div class="fl l60">
											<div class="fl mr35">
												<label class="label_style">
													<input type="radio" name="optionchoice"/>
													단독형
													<span></span>
												</label>
											</div>
											<div class="fl">
												<label class="label_style l37">
													<input type="radio" name="optionchoice" checked/>
													조합형
													<span></span>
												</label>
											</div>
											<div style="clear:both;"></div>
											<div class="greentext l-25">옵션별 재고수량이나 옵션가 설정이 필요하면 조합형을 선택해 주세요.</div>
										</div>
										<div style="clear:both;"></div>
								</div>
							</div>
								<div class="sub_con_line" style="height: 67px;">
								 	<div class="sub_sub_line">
										<div class="fl">
											<label class="control_label" style="position:relative; left:35px;">옵션명 개수
												<i class="musticon" style="left:2px; position: relative;"></i>
											</label>
										</div>
										<div class="fl l37">
												<div class="regi_select_style">
											<div id="opqtybox" class="regi_item">1개</div>
										</div>
										<select id="opqty" class="delivery_conpany">
											<option class="opone" role="button" selected>1개</option>
											<option class="optwo" role="button">2개</option>
											<option class="opthree" role="button">3개</option>
										</select>
										</div>
										<div style="clear:both;"></div>
								</div>
							</div>
								<div class="sub_con_line" style="height: 67px;">
								 	<div class="sub_sub_line">
										<div class="fl">
											<label class="control_label" style="position:relative; left:35px;">정렬 순서
												<i class="musticon" style="left:2px; position: relative;"></i>
											</label>
										</div>
										<div class="fl">
											<div class="fl l37">
												<div class="regi_select_style">
													<div id="orderbox" class="regi_item">등록순</div>
												</div>
												<select id="order" class="delivery_conpany">
													<option selected>등록순</option>
													<option>가나다순</option>
													<option>낮은 가격순</option>
													<option>높은 가격순</option>
												</select>
											</div>
										</div>
										<div style="clear:both;"></div>
								</div>
							</div>
								<div class="sub_con_line">
								 	<div class="sub_sub_line">
										<div class="fl">
											<label class="control_label" style="position:relative; left:35px;">옵션입력
												<i class="musticon" style="left:2px; position: relative;"></i>
											</label>
										</div>
										<div class="fl l37" style="width: 335px;">
											<label class="control_label">옵션명</label>
											<input type="text" placeholder="예시:컬러" name="name" class="option_style">
											<input type="text" placeholder="예시:컬러" name="name2" class="option_style op2 mt10" style="display:none;">
											<input type="text" placeholder="예시:컬러" name="name3" class="option_style op3 mt10" style="display:none;">
											
										</div>
										<div class="fl l37 ml10" style="width: 550px;">
											<label class="control_label">옵션값</label>
											<input type="text" placeholder="예시:빨강,노랑 (,로 구분)" name="fvalue" class="option_style">
											<input type="text" placeholder="예시:빨강,노랑 (,로 구분)" name="f2value" class="option_style op2 mt10" style="display:none;">
											<input type="text" placeholder="예시:빨강,노랑 (,로 구분)" name="f3value" class="option_style op3 mt10" style="display:none;">
											
										</div>
										<div class="fl l37 ml10">
											<a role="button" class="plus_btn t31">
												<i class="small_plus"></i>
											</a>
										</div>
										<div style="clear:both;"></div>
										<div style="width: 335px; margin-left: 217px;">
											<button type="button" id="optionlistbtn" onclick="selectFunction();" class="option_btn mt10">
												옵션목록으로 적용
											</button>
										</div>
								</div>
							</div>
								<div class="sub_con_line">
								 	<div class="sub_sub_line">
										<label class="control_label" style="position:relative; left:35px;">옵션목록
											<i class="musticon" style="left:2px; position: relative;"></i>
											(총 <span class="green">0</span>개)
										</label>
								<div>
									<div class="fl">
										<button  type="button" class="buttype" style="width:67px; position:relative; left:35px; top:3px;">
											<span class="fs12">선택삭제</span>
										</button>
									</div>
									<div class="fr" style="position:relative; right:35px;">
										<div class="fl">옵션가
											<img src="img/subtitleaftergrey.png" style="position: relative;top: 5px;"/>
										</div>
										<div class="fl mr7 input-group">
												<button type="button" class="option_plusbt">+
													<span class="caret"></span>
												</button>
												<ul class="dropdown-pm">
													<li><a class="dropdown-p">+</a></li>
													<li><a class="dropdown-m">-</a></li>
												</ul>
												<input type="tel" class="op_price"/>
											</div>
										<div class="fl mr7">재고수량
											<input type="tel" class="op_price"/>
										</div>
										<div class="fl mr7" style="position: relative;">사용여부
											<button  type="button"  class="option_yn">Y
													<span class="caret"></span>
											</button>
											<ul class="dropdown-yn">
													<li><a class="dropdown-y">Y</a></li>
													<li><a class="dropdown-n">N</a></li>
											</ul>
										</div>
										<div class="fl">
											<a role="button" class="totalmodify">선택목록 일괄수정</a>
										</div>
										<div style="clear:both;"></div>
									</div>
									<div style="clear:both;"></div>
								</div>
									<div id="grid"></div>
									<div class="last_grey">
										<div class="fr mt5">
											<div class="fl mr7">
												<button  type="button" class="buttype" style="width:67px;">
													<span class="fs12">목록추가</span>
												</button>
											</div>
											<div class="fl mr35">
												<button type="button"  class="buttype">
												 	<img src="img/excel.png"/>
													<span class="fs12">엑셀다운</span>
												</button>
											</div>
											<div style="clear:both;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">직접입력형
										<img src="img/subtitleafter.png"/>
									</label>
								</div>
								<div class="fl"style="height:34px">
									<input type="radio" name="opinsert" class="radio" id="opinsert1"/>
									<label for="opinsert1" style="width:75px;">설정함</label>
									<input type="radio" name="opinsert" class="radio" id="opinsert2" checked="checked"/>
									<label for="opinsert2" style="width:75px;">설정안함</label>
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
					</div>
					<!-- 상품이미지 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content8','clickborder8')">
							<div class="fl content-title mtm6">상품이미지
								<i class="musticon"></i>
								<img src="img/support.png"/>
							</div>
							<div id="clickborder8" class="fr afterbtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content8" class="content-content" style="display:block; height:943px;">
							<div class="first_line">
								<div class="fl">
									<label class="control_label">대표이미지
										<i class="musticon" style="left:2px; position: relative;"></i>
										<img src="img/support.png" style="top:6px; left:4px; position:relative;"/>
									</label>
								</div>
								<div class="fl">
									<a role="button" class="btn_img">
										<i class="plus_icon"></i>
									</a>
									<input type="text" name="image" style="border : none;" value="<%=image%>"/>
									<div class="greentext">권장 크기 : 1000 x 1000 (윈도대상 750 x 1000)</div>
									<div class="greentext mt2">대표이미지 기준 1000x1000 이상 이미지를 등록하시면, 이미지 확대 기능이 제공됩니다.</div>
									<div class="greentext mt2">쇼핑검색에 노출되지 않는 경우 가이드를 확인해주세요.</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">추가이미지
										<span class="subnumber">(
											<span class="green" style="font-style:normal;">0</span>
											/ 9 )
										</span>
									</label>
								</div>
								<div class="fl">
									<a role="button" class="btn_img preparing">
										<i class="plus_icon"></i>
									</a>
									<a role="button" class="btn_defalt" disabled="disabled">순서변경</a>
									<div class="greentext">권장 크기 : 1000 x 1000 (윈도대상 750 x 1000)</div>
									<div class="greentext mt2">추가이미지는 최대 9개까지 설정할 수 있습니다.</div>
									<div class="greentext mt2">jpg,jpeg,gif,png,bmp 형식의 정지 이미지만 등록됩니다.(움직이는 이미지의 경우 첫 번째 컷이 등록)</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">동영상
										<img src="img/support.png" style="top:6px; left:4px; position:relative;"/>
									</label>
								</div>
								<div class="fl">
									<a role="button" class="btn_img preparing">
										<i class="plus_icon"></i>
									</a>
									<a role="button" class="btn_defalt" disabled="disabled" style="width: 111px;">GIF 미리보기</a>
									<div class="greentext">권장 동영상 길이: 최대 1분</div>
									<div class="greentext mt2" style="text-decoration: underline; margin-bottom:10px;">좋은 동영상 등록하는 방법 보기 ></div>
									<div class="con_line pb0" style="width:1391px;">
										<a role="button" class="btn_ex">동영상 노출 예시보기</a>
									</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="sub_line">
								<div class="fl">
									<label class="control_label" style="position:relative; left:40px;">동영상 타이틀</label>
								</div>
								<div class="fl">
									<div class="fl" style="width:95%;">
										<input type="text" class="uccname" disabled="disabled"/>
									</div>
									<div class="fr" style="width:5%;">
										<span class="inputnumber20">
											<span class="green">0</span>/20
										</span>
									</div>
									<div style="clear:both;"></div>
									<div class="greentext">상품 상세 및 통합 검색 노출시 활용되는 문구입니다.</div>
									<div class="greentext mt2">상품과 직접 관련 없는 내용 입력 시 판매금지될 수 있습니다.</div>
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
					</div>
					<!-- 상세설명 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content9','clickborder9')">
							<div class="fl content-title mtm6">상세설명
								<i class="musticon"></i>
								<img src="img/support.png"/>
							</div>
							<div id="clickborder9" class="fr afterbtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content9" class="content-content" style="display:block; height:423px;">
							<div class="first_line description_con">
								<div class="description_con_con">
									<a role="button" class="descriptionself">
										<span>직접 작성</span>
									</a>
									<a role="button" class="descriptionhtml">
										<span class="htmlchoose">HTML 작성</span>
									</a>
								</div>
								<textarea name="description"></textarea>
							</div>
							<div class="redtext">외부 링크(네이버 폼 등)를 통한 개인정보(휴대폰 번호, 이메일 주소) 수집은 금지되므로 등록시 노출이 제재될 수 있습니다.</div>
							<div class="greentext mt0">상품명과 직접적 관련 없는 상세설명, 외부 링크 입력 시 관리자에 의해 판매 금지 될 수 있습니다.</div>
							<div class="greentext mt0">안전거래정책에 위배될 경우 관리자에 의해 제재조치가 있을 수 있습니다.</div>
							<div class="greentext mt0">네이버 이외의 외부링크, 일부 스크립트 및 태그는 자동 삭제될 수 있습니다.</div>
							<div class="greentext mt0">상세설명 권장 크기 : 가로 860px</div>
						</div>
					</div>
					<!-- 상품주요정보 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content10','clickborder10')">
							<div class="fl content-title">상품 주요정보
								<i class="musticon"></i>
							</div>
							<div id="clickborder10" class="fr activebtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content10" class="content-content" style="display:none; height:210px;">
							<div class="first_line">
								<div class="fl">
									<label class="control_label">모델명
										<img src="img/support.png" style="top:6px; left:4px; position:relative;"/>
									</label>
								</div>
								<div class="fl">
									<input type="text" class="modelinsert" name="model_name" >
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">브랜드
										<img src="img/support.png" style="top:6px; left:4px; position:relative;"/>
									</label>
								</div>
								<div class="fl">
									<input type="text" class="modelinsert" name="brand_name" >
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">제조사</label>
								</div>
								<div class="fl">
									<input type="text" name="manufacturer_name" class="modelinsert" >
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
					</div>
					<!-- 상품정보제공고시 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content11','clickborder11')">
							<div class="fl content-title mtm6">상품정보제공고시
								<img src="img/support.png"/>
							</div>
							<div id="clickborder11" class="fr activebtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content11" class="content-content" style="display:none; height:74px;">
							<h1 style="text-align:center; color: #00c73c;">준비중입니당</h1>
						</div>
					</div>
					<!-- 배송 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content12','clickborder12')">
							<div class="fl content-title mtm6">배송
								<i class="musticon"></i>
								<img src="img/support.png"/>
							</div>
							<div id="clickborder12" class="fr activebtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content12" class="content-content" style="display:none; height:470px;">
								<div class="mb16">
								<div class="fl mt20">
									<label class="control_label">배송여부
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
									<div class="fl mt20">
										<div class="fl" style="height:34px">
										<input type="radio" name="delivery" class="radio" id="delivery_yes" checked="checked"/>
										<label for="delivery_yes">배송</label>
										<input type="radio" name="delivery" class="radio" id="delivery_no"/>
										<label for="delivery_no">배송없음</label>
										</div>
										<div class="fl">
											<button type="button" class="catbut preparing ml10">배송비 템플릿</button>
										</div>
										<div class="fl ml10">
											<label style="position:absolute; top:98px; padding:5px 16px 5px 26px;">
												<input type="checkbox"/>템플릿 추가
												<span></span>
											</label>
										</div>
									<div style="clear:both;"></div>
									</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">배송방법
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl">
									<input type="radio" name="delivery_way" class="radio" id="delivery_way1" checked="checked"/>
									<label for="delivery_way1">택배,소포,등기</label>
									<input type="radio" name="delivery_way" class="radio" id="delivery_way2"/>
									<label for="delivery_way2">직접배송(화물배달)</label>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">택배사
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl"style="height:34px">
									<div class="regi_select_style">
										<div id="dcompanybox" class="regi_item">선택</div>
									</div>
									<select name="delivery_company" id="dcompany" class="delivery_conpany">
										<option selected disabled>선택</option>
										<option value="CJ대한통운">CJ대한통운</option>
										<option value="롯데택배">롯데택배</option>
									</select>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">배송속성
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl">
									<input type="radio" name="delivery_td" class="radio" id="delivery_td1" checked="checked"/>
									<label for="delivery_td1">일반배송</label>
									<input type="radio" name="delivery_td" class="radio" id="delivery_td2"/>
									<label for="delivery_td2">오늘출발</label>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line" style="height: 67px;">
								<div class="fl">
									<label class="control_label">상품별 배송비
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl">
									<div class="regi_select_style">
										<div id="pdfeebox" class="regi_item">유료</div>
									</div>
									<select  id="pdfee" class="delivery_conpany">
										<option selected>유료</option>
										<option>무료</option>
									</select>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="d_sub_line" style="height:34px">
								<div class="fl">
									<label class="control_label">기본 배송비
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl">
									<input type="tel" name="delivery_cost" class="d_priceinsert" placeholder="숫자만 입력">
									<span class="d_won">원</span>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">출고지
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl">
									<div class="fl bluetext">
										<div style="font-weight: 600;">상품출고지</div>
										<div>서울특별시 서대문구 증가로 101-8 (우:03693)</div>
									</div>
									<div class="fl">
										<button type="button" class="catbut ml10">판매자 주소록</button>
									</div>
									<div style="clear:both;"></div>
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
					</div>
					<!-- 반품/교환 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content13','clickborder13')">
							<div class="fl content-title mtm6">반품/교환
								<i class="musticon"></i>
								<img src="img/support.png"/>
							</div>
							<div id="clickborder13" class="fr activebtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content13" class="content-content" style="display:none; height:368px;">
							<div class="first_line">
								<div class="fl">
									<label class="control_label">반품/교환 택배사
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl">
									<div class="regi_select_style">
										<div id="repdfeebox" class="regi_item">선택</div>
									</div>
									<select id="repdfee" name="return_delivery_company" class="delivery_conpany">
										<option selected disabled>기본 반품택배사(한진택배)</option>
										<option value="CJ대한통운">CJ대한통운</option>
										<option value="롯데택배">롯데택배</option>
									</select>
									<div class="greentext" style="margin-top: -19px;">기본 반품택배사는 네이버페이 지정택배(한진택배)로 최초 자동설정 됩니다.</div>
									<div class="greentext mt2">별도 계약된 택배사로 설정을 원하시는 경우,
										<span class="bluetext">[판매자정보>택배사 계약정보 확인] 영역을 통해 '택배사 계약정보 확인완료'후 기본 반품택배사를 설정해주세요.</span>
									</div>
									<div class="greentext mt2" style="text-decoration: underline;">반품택배사 설정 자세히 보기 ></div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">반품배송비(편도)
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl">
									<input type="tel" name="return_delivery_cost" class="re_priceinsert" placeholder="숫자만 입력" >
									<span class="re_won">원</span>
									<div class="greentext ">최초 배송시의 배송비가 무료인 경우 왕복 배송비 0원이 청구됩니다.</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">교환배송비(왕복)
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl">
									<input type="tel" name="exchange_cost" class="re_priceinsert" placeholder="3,000" >
									<span class="re_won">원</span>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl">
									<label class="control_label">반품교환지
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl">
									<div class="fl bluetext">
										<div style="font-weight: 600;">상품출고지</div>
										<div>서울특별시 서대문구 증가로 101-8 (우:03693)</div>
									</div>
									<div class="fl">
										<button type="button" class="catbut ml10">판매자 주소록</button>
									</div>
									<div style="clear:both;"></div>
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
					</div>
					<!-- A/S, 특이사항 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content14','clickborder14')">
							<div class="fl content-title mtm6">A/S, 특이사항
								<i class="musticon"></i>
								<img src="img/support.png"/>
							</div>
							<div id="clickborder14" class="fr activebtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content14" class="content-content" style="display:none; height:390px;">
							<div class="first_line">
								<div class="fl mt5">
									<label class="control_label">A/S전화번호
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl">
									<input type="text" name="as_number" class="codeinsert">
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl mt5">
									<label class="control_label">A/S안내
										<i class="musticon" style="left:2px; position: relative;"></i>
									</label>
								</div>
								<div class="fl">
									<textarea name="as_announcement" class="asinsert"></textarea>
									<div class="greentext" style="margin-top:100px;">법률에 근거하지 않은 판매자의 임의적인 A/S 규정 및 청약철회 기준 안내 시, 이용정지 및 관련 법에 의거하여 제재될 수 있습니다.</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl mt5">
									<label class="control_label">판매자 특이사항
										<img src="img/support.png"/>
									</label>
								</div>
								<div class="fl">
									<textarea name="seller_note" class="asinsert"></textarea>
									<div class="greentext" style="margin-top:100px;">· 청약철회, 배송기간 및 방법, 교환/반품의 보증 및 추가비용, 판매일시/판매지역/판매수량/인도지역 등과 관련해서 특이사항이 있는 경우, 해외배송상품인 경우 입력합니다.</div>
									<div class="greentext mt2">· 법률에 근거하지 않은 판매자의 임의적인 판매규정 및 청약철회 기준 안내 시, 이용정지 및 관련 법에 의거하여 제재될 수 있습니다.</div>
								</div>
								<div style="clear:both;"></div>
							</div>
						
						
						
						
						</div>
					</div>
					<!-- 추가상품 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content15','clickborder15')">
							<div class="fl content-title mtm6">추가상품
								<img src="img/support.png"/>
							</div>
							<div id="clickborder15" class="fr activebtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content15" class="content-content" style="display:none; height:74px;">
							<h1 style="text-align:center; color: #00c73c;">준비중입니당</h1>
						</div>
					</div>
					<!-- 구매/혜택 조건 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content16','clickborder16')">
							<div class="fl content-title mtm6">구매/혜택 조건
								<img src="img/support.png"/>
							</div>
							<div id="clickborder16" class="fr activebtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content16" class="content-content" style="display:none; height:74px;">
							<h1 style="text-align:center; color: #00c73c;">준비중입니당</h1>
						</div>
					</div>
					<!-- 검색설정 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content17','clickborder17')">
							<div class="fl content-title mtm6">검색설정
								<img src="img/support.png"/>
							</div>
							<div id="clickborder17" class="fr activebtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content17" class="content-content" style="display:none; height:74px;">
							<h1 style="text-align:center; color: #00c73c;">준비중입니당</h1>
						</div>
					</div>
					<!-- 판매자 코드 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content18','clickborder18')">
							<div class="fl content-title mtm6">판매자 코드
								<img src="img/support.png"/>
							</div>
							<div id="clickborder18" class="fr activebtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content18" class="content-content" style="display:none; height:273px;">
							<div class="first_line">
								<div class="fl mt5">
									<label class="control_label">판매자 상품코드</label>
								</div>
								<div class="fl">
									<input type="text" name="pcode" class="codeinsert">
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl mt5">
									<label class="control_label">판매자 바코드</label>
								</div>
								<div class="fl">
									<input type="text" class="codeinsert">
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl mt5">
									<label class="control_label">판매자 내부코드1</label>
								</div>
								<div class="fl">
									<input type="text" class="codeinsert">
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="con_line">
								<div class="fl mt5">
									<label class="control_label">판매자 내부코드2</label>
								</div>
								<div class="fl">
									<input type="text" class="codeinsert">
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
					</div>
					<!-- 노출 채널 -->
					<div class="panel">
						<div class="title-line" onclick="actbtn('blind-content19','clickborder19')">
							<div class="fl content-title mtm6">노출 채널
								<img src="img/support.png"/>
							</div>
							<div id="clickborder19" class="fr activebtn"></div>
							<div style="clear:both;"></div>
						</div>
						<div id="blind-content19" class="content-content" style="display:none; height:74px;">
							<h1 style="text-align:center; color: #00c73c;">준비중입니당</h1>
						</div>
					</div>
					<!-- 쇼핑검색에 잘 노출되려면! -->
					<div class="lastone">
						<button type="reset" class="canclebtn">취소</button>
						<button type="button" class="savebtn">저장</button>
					</div>
				</div>
			</div>
		<div class="tempoandsave">
			<div class="fl">
				<button type="button" class="temposavebtn">노출설정</button>
			</div>
			<div class="fr">
				<button type="button" class="temposavebtn">임시저장</button>
				<button type="submit" class="finalsavebtn">저장하기</button>
				<button type="reset" class="canclesavebtn">취소</button>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div style="clear:both;"></div>
		</form>
	</div>
</body>
</html> --%>