<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
	
   <% 
   CommonDao commonDao = new CommonDao();
   String seller_id = request.getParameter("seller_id");
   CommonDto dto = null;
     Long pnumber = 0L;
     if(request.getParameter("pnumber")==null) {
        pnumber = 4897832395L;
     } else {
        pnumber = Long.parseLong(request.getParameter("pnumber"));
     }
     
     
    int startNum = 0;
    int endNum=0;
    int pageNum = 0;
    int count = 0;
    try{ 
       pageNum = Integer.parseInt(request.getParameter("page"));
    } catch (Exception e) {
       pageNum=1;
    }
    endNum = pageNum*5;
    startNum = endNum - 4;
    ////////// 페이징/////////
      LocalDate yesterday = LocalDate.now().plusDays(1);
      String inquiry_date = yesterday.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));   
    ////////////날짜 셀렉트 //////
    
    CustomerInquiryUpdateDao customerInquiryUpdateDao = new CustomerInquiryUpdateDao();
      CustomerInquiryDao customerInquiryDao = new CustomerInquiryDao();
    ArrayList<CustomerInquiryDto> listCustomerInquiryDto = null;
    /////////문의 셀렉트Dao//////////////
     String 판매자아이디 ="";
     String 상품번호 ="";
     String 구매자아이디="";
     ///////////insert 파라미터/////////////////////
     String inquiry_content ="";
     int serial_number =0;
     customerInquiryUpdateDao.Update(inquiry_content, seller_id, serial_number);
    ////////////update 파라미터/////////////////////////
     String id="";
     try {
        id= (String)session.getAttribute("id");
     } catch(NullPointerException e) {
        e.printStackTrace();
        id="";
     }
     ////////session 아이디 받는 거/////////
     if(seller_id==null){
        seller_id="jiyoonjung";
      dto = commonDao.colorselect(seller_id);
      listCustomerInquiryDto= customerInquiryDao.select(seller_id, inquiry_date,pnumber,startNum,endNum);// 문의 
      count = customerInquiryDao.count(seller_id,pnumber);//paging
      
   } else {
      seller_id = request.getParameter("seller_id");
      dto = commonDao.colorselect(seller_id);
      listCustomerInquiryDto = customerInquiryDao.select(seller_id, inquiry_date,pnumber,startNum,endNum); // 문의
      count = customerInquiryDao.count(seller_id,pnumber);//paging
   } 
     ProductDao productdao = new ProductDao();
     ProductDto dto1 = productdao.select1(pnumber);
     
     SellerDao sellerdao = new SellerDao();
     SellerDto sellerdto = sellerdao.select(seller_id);
     
     ANCMDao ancmdao = new ANCMDao();
     ANCMDto ancmdto = ancmdao.select1(pnumber);

     StoreDto storedto = sellerdao.selectName(seller_id);

  	
  	/* 리뷰구간 */
	try {
		pageNum = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException e) {
		//pageNum을 1로 만들어.
		pageNum = 1;
	}
	/* long pnumber = Long.parseLong(request.getParameter("pnumber")); */
	ReviewDao reviewDao = new ReviewDao();
	ArrayList<ReviewDto> listReviewDto = reviewDao.review_select2(pnumber, pageNum);
	
	int reviewCount = reviewDao.countByReview(pnumber);
	/* 건들면 안됩니당°˖✧◝(⁰▿⁰)◜✧˖° */ 
	
	String customer_id = "moon";
	TalkTalkChatContentPurchaseDao purchase = new TalkTalkChatContentPurchaseDao();
	/* System.out.println(customer_id);
	System.out.println(seller_id);
	System.out.println(pnumber); */  
	/* 톡톡구간 */
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CustomerDailyLeftContent</title>
	<link rel="stylesheet" href="../css/CustomerDailyLeftContent.css" />
	<script src="../js/jquery-3.7.0.min.js"></script>
	 <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
	    var IMP = window.IMP;
	    IMP.init("imp76427768");
	    function requestPay() {
	        IMP.request_pay(
	          {
	            pg: "INIpayTest",
	            pay_method: "card",
	            merchant_uid: "57008833-33004",
	            name: "당근 10kg",
	            amount: 1004,
	            buyer_email: "Iamport@chai.finance",
	            buyer_name: "포트원 기술지원팀",
	            buyer_tel: "010-1234-5678",
	            buyer_addr: "서울특별시 강남구 삼성동",
	            buyer_postcode: "123-456",
	          },
	          function (rsp) {
	            // callback
	            //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
	          }
	        );
	      }
    </script>
	<script>
	<!-- API적용 건들면 안됩니당°˖✧◝(⁰▿⁰)◜✧˖° -->
	function share() {
	    var url = encodeURI(encodeURIComponent(document.getElementById('url').value));
	    var title = encodeURI(document.getElementById('title').value);
	    var shareURL = "https://share.naver.com/web/shareView?url=" + url + "&title=" + title;
	    document.location = shareURL;
	}
		$(function() {
			$(".qna_leftbtn").click(function() {
	            let customer_id = $(".nickname").text();
	            let pnumber = $(".ptabletd > b").text();
	            let seller_id = $("#param_id").text();
	            let encodedcustomer_id= encodeURIComponent(customer_id);
	            let encodedpnumber = encodeURIComponent(pnumber);
	            let encodedseller_id = encodeURIComponent(seller_id);
	            url = "Question.jsp?customer_id="+encodedcustomer_id+"&pnumber="+encodedpnumber+"&seller_id="+encodedseller_id;
	            window.open(url);
	         });
	         $('.qnact2in').click(function() {
	              var parent = $(this).closest('.qna_contentin2');
	              var index = parent.next('.qna_detail').attr('class').match(/bn(\d+)/)[1];
	              
	              if ($('.bn' + index).css('display') === 'none') {
	                   $('.bn' + index).css('display', 'block');
	                 } else {
	                   $('.bn' + index).css('display', 'none');
	                 }
	            });   
//////////////////////리뷰//////////////////////////
			$(".btn_delete").click(function(){
				let reviewNum = $(this).data("review-num");
		        location.href = "ReviewWriteDeleteAction.jsp?reviewNum=" + reviewNum;
			});//리뷰삭제
			
			 $(".btn_update").click(function(){
					let seller_id = $("#param_id").text();
					  let pnumber = $(".ptabletd > b").text();
					  let buyer_id = "moon";
					  let reviewNum = $(this).data("review-num");
					  let encoded_seller_id = encodeURIComponent(seller_id);
					  let encoded_pnumber = encodeURIComponent(pnumber);
					  let encoded_buyer_id = encodeURIComponent(buyer_id);
					  let encoded_reviewNum = encodeURIComponent(reviewNum);
			          location.href = "ReviewUpdate.jsp?seller_id=" + encoded_seller_id + "&pnumber=" + encoded_pnumber + "&buyer_id=" + encoded_buyer_id
			          					+"&reviewNum="+encoded_reviewNum;
				});//리뷰수정
			
			//////////////////////리뷰//////////////////////////
			$(".review_btn").click(function(){
				  let seller_id = $("#param_id").text();
				  let pnumber = $(".ptabletd > b").text();
				  let buyer_id = "moon";
				  let button = document.querySelector('.review_modify_bt.btn_update');
					// data-review-num 속성 값 가져오기
				  let reviewNum = button.getAttribute('data-review-num');
				  let encoded_seller_id = encodeURIComponent(seller_id);
				  let encoded_pnumber = encodeURIComponent(pnumber);
				  let encoded_buyer_id = encodeURIComponent(buyer_id);
				  let encoded_reviewNum = encodeURIComponent(reviewNum);
				  let url = "ReviewWrite_copy.jsp?seller_id=" + encoded_seller_id + "&pnumber=" + encoded_pnumber + "&buyer_id=" + encoded_buyer_id;
				  window.open(url);
			}); 
			////////////건들면 안됩니당°˖✧◝(⁰▿⁰)◜✧˖°///////////////
			//////////////////////톡톡//////////////////////////
			$(".paytalk").click(function(){
				  let customerId ="jimin56";
				  let seller_id = $("#param_id").text();
				  let encoded_customerId = encodeURIComponent(customerId); 
				  let encoded_seller_id = encodeURIComponent(seller_id); 
				  let width = 965; 
				  let height = 1200; 
				  /* let url = "TalkTalkPurchase.jsp?pnumber=" + encoded_pnumber; */
				  let url = "TalkTalkPurchase.jsp?customerId="+encoded_customerId+"&seller_id="+encoded_seller_id;
				  window.open(url, "_blank", "width=" + width + ", height=" + height);
			});
			////////////건들면 안됩니당°˖✧◝(⁰▿⁰)◜✧˖°///////////////
			$(".taba").click(function() {
				$(".taba[aria-current=true]").attr("aria-current","false");
				$(this).attr("aria-current","true");
				if($(this).text()==='상세정보'){
					$(".detailcon").css('display','block');
					$(".p_review").css('display','none');
					$(".p_qna").css('display','none');
				}
				if($(this).text()==='리뷰'){
					$(".detailcon").css('display','none');
					$(".p_review").css('display','block');
					$(".p_qna").css('display','none');
					$(".return_exchange").css('display','none');
				}
				if($(this).text()==='Q&A'){
					$(".detailcon").css('display','none');
					$(".p_review").css('display','none');
					$(".p_qna").css('display','block');
					$(".return_exchange").css('display','none');
				}
				if($(this).text()==='반품/교환정보'){
					$(".detailcon").css('display','none');
					$(".p_review").css('display','none');
					$(".p_qna").css('display','none');
					$(".return_exchange").css('display','block');
				}
				
			});
			
			$(".plus").click(function(){
				let amt = Number($(".amountinput").val());
				if(amt>0) {
					$(".minus").attr("class","minus")
				}
				$(".amountinput").val(amt+1);
				calc();
				qtychange();
			});
			$(".minus").click(function(){
				let amt = Number($(".amountinput").val());
				if(amt>1){
					$(".amountinput").val(amt-1);
					calc();
					qtychange();
				}
				
			});
			//준비중입니다 띄우기
			$(".preparing").click(function(){
				alert("준비중입니다.");
				
			});
			
			//알림받기
			$(".alarm3").click(function() {
				if($(".belltext").text()==="알림받기"){
					$(this).attr("aria-pressed","true");
					$(this).attr("class","alarm3");
					$(".belltext").text("알림받는중");
				}else {
					$(this).attr("aria-pressed","false");
					$(this).attr("class","alarm3 topcolor");
					$(".belltext").text("알림받기");
				}
			});
			$("html, body").click(function(){
				calc();
				qtychange();
				
			});
			calc();
			qtychange();
			$("#buyer_id").val($(".nickname").text());
		});

		function calc() {
			let unit = $(".unit").text().replace(",","");
			let amt = $(".amountinput").val();
			let price = unit * amt;
			let stprice = ""+price;
			let result1 = ","+stprice.slice(-3);
			let result2 = stprice.slice(0,-3)+ result1;
			$(".qtyprice").html(result2);
			let stunit = ","+unit.slice(-3);
			let stunit2 = unit.slice(0,-3)+stunit;
			$(".unit").html(stunit2);
		}
		function qtychange() {
			let qty = $(".amountinput").val();
			$(".tqty").html(qty);
			$("#purchase_amount").val(qty);
		}
	</script>
	<style>
	.topcolor {
		background-color : <%=dto.getColor_theme()%>;
	}
	.listtype:hover {
		color: <%=dto.getColor_theme()%>;
	}
	.orderpay {
		color: <%=dto.getColor_theme()%>;
	}
	.skincolor {
		color: <%=dto.getColor_theme()%>;
	}
	</style>
</head>
<body>
	<!-- 상단바 -->
	<div id="header" class="topcolor firsttop">
		<div class="topmargin topcolor">
			<div class="fl">
				<a class="naverlogo" href="https://www.naver.com"></a>
				<a class="navershopinglogo" href="https://shopping.naver.com/home"></a>
			</div>
			<div class="fr">
				<a class="likestore">관심스토어</a>
				<a class="mypage">마이페이지</a>
				<a class="basket">장바구니</a>
				<a class="nickname">jiyoonjung</a>
				<a class="listcube"></a>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div class="topmargin topcolor secondtop">
			<div class="fl">
				<a href="DailyLeftSellerinfo.jsp" class="myself">
					<img src="../Images/profile.jpg" class="profile"/>
					<span class="introduce"><%=storedto.getStore_introduce() %></span>
					<span class="blind" id="param_id">jiyoonjung</span>
				</a>
				<span class="likecustomer">관심고객수 1</span>
				<button type="button" class="que"></button>
			</div>
			<div class="fr searchbar">
				<div class="searchinsert">
					<input type=text class="search1" placeholder="검색어를 입력해보세요"/>
					<button type="button" class="searchbtn">
						<span class="serchdetailbtn topcolor"></span>
					</button>
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	<!-- 컨텐츠 -->
	<div id="container" class="conmargin">
		<div class="fl">
			<div class="subjectbar">
				<div class="storename">
					<div class="center">
						<h1 class="storemiddle">
							<a href="CustomerDailyLeft.jsp">
								<span class="storemainname"><%=storedto.getStore_name() %></span>
							</a>
						</h1>
					</div>
					<div class="alarm">
						<div class="alarm2">
							<button type="button" class="topcolor alarm3">
								<span class="bell"></span>
								<span class="belltext">알림받기</span>
							</button>
						</div>
					</div>
				</div>
				<div class="topmenu">
					<div class="menucontent">
						<ul class="ulstype">
							<li>
								<a href="DailyLeft01.jsp" class="listtype">전체상품
								</a>
							</li>
						</ul>
						<ul class="ulstype2">
							<li class="listyle2">
								<a href="DailyLeftQNA.jsp" class="submenulist">묻고 답하기</a>
							</li>
							<li class="listyle2">
								<a href="DailyLeftANCM.jsp" class="submenulist">공지사항</a>
							</li>
							<li class="listyle2">
								<a class="preparing submenulist">리뷰이벤트</a>
							</li>
							<li class="listyle2">
								<a class="preparing submenulist">쇼핑스토리</a>
							</li>
							<li class="listyle2">
								<a href="DailyLeftSellerinfo.jsp" class="submenulist">판매자 정보</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="today">
					<div class="todayandtotal">
						<span>오늘
							<em class="visit">1</em>
						</span>
						<span class="total">전체
							<em class="visit">596</em>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="fr">
			<div class="right">
				<div>
			<div class="contage">
					<div class="h39">
							<div class="way">
								<ul class="wayul">
									<li class="wayli">
										<a class="waya">홈</a>
									</li>
									<li class="wayli">
										<a class="waya">스포츠/레저</a>
										<button type="button" class="waybtn"></button>
									</li>
									<li class="wayli">
										<a class="waya">요가/필라테스</a>
										<button type="button" class="waybtn"></button>
									</li>
									<li class="wayli">
										<a class="wayal">
											요가매트
											<span class="wayan">(총</span>
											<strong>1</strong>
											<span class="wayan">개)</span>
										</a>
										<button type="button" class="waybtn"></button>
									</li>
								</ul>
							</div>
					</div>
					<form action="CustomerDailyOrder.jsp" method="post">
					<input type="hidden" id="buyer_id" name="buyer_id" value=""/>
						<div class="sellcon">
							<div class="fl sellconimg">
								<div class="conimg">
									<div class="sellimg">
										<img src="../Images/<%=dto1.getImage()%>">
									</div>
								</div>
								<div class="reviewscore">
									<div class="reviewdiv">
										<span class="reviewspan">리뷰수</span>
										<strong class="reviewstrong"><%=reviewCount%></strong>
									</div>
									<div class="reviewdiv">
										<span class="reviewspan">사용자 총 평점</span>
										<strong class="reviewstrong">0.0
											<span class="reviewslash"></span>
										5</strong>
									</div>
									<p class="reviewp">아직 작성된 리뷰가 없습니다.</p>
								</div>
							</div>
							<div class="fr sellcontext">
								<div class="context">
									<div class="sellname">
										<div class="pname">
											<h3 class="pnameh3"><%=dto1.getPname()%></h3>
											<input type="hidden" name="pnumber" value="<%=dto1.getPnumber()%>">
										</div>
										<div class="pprice">
											<div class="ppricediv">
												<strong class="ppricestrong skincolor">
													<span class="colorprice unit"><%=dto1.getPrice()%></span>
													<span class="colorwon">원</span>
												</strong>
											</div>
										</div>
									</div>
									<div class="deliverybox">
										<div class="deliverycon">
											<span class="dtext">택배배송</span>
											<span class="dtext">
												<span class="dprice"><%=dto1.getDeliveryCost()%></span>
												원
												<span class="orderpay">(주문시 결제)</span>
											</span>
										</div>
									</div>
									<div class="amountbox">
										<div class="amountcon">
											<div class="amounpm">
												<button type="button" class="opa02 minus"></button>
												<input type="number" class="amountinput" id="purchase_amount" name="purchase_amount" value="1"/>
												<button type="button" class="plus">
													<span class="plus_"></span>
												</button>
											</div>
										</div>
									</div>
									<div class="totalpricebox">
										<strong class="ttpricett">총 상품 금액</strong>
										<div class="ttpricebox">
											<em class="ttamount">총 수량 <span class="tqty">1</span>개</em>
											<strong class="ppricestrong skincolor">
													<span class="colorprice qtyprice"><%=dto1.getPrice()%></span>
													<span class="colorwon">원</span>
											</strong>
										</div>
									</div>
									<div class="paybox">
										<div class="npay">
											<div class="npaybtn">
												<button role="submit" id="naverPayBtn" class="npaya"></button>
											</div>
										</div>
										<div class="npay">
											<div class="paytalk">
												<a role="button" class="talkbtn"></a>
											</div>
											<div class="paylikey">
												<a role="button" class="likeybtn"></a>
											</div>
											<div class="paybasket">
												<a role="button" class="bskbtn"></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div style="clear:both;"></div>
						</div>
					</form>
				<div class="menutab">
					<ul class="tabul">
						<li class="tabli1">
							<a class="taba" aria-current="true">상세정보</a>
						</li>
						<li class="tabli">
							<a class="taba">리뷰</a>
						</li>
						<li class="tabli">
							<a class="taba">Q&amp;A</a>
						</li>
						<li class="tabli">
							<a class="taba">반품/교환정보</a>
						</li>
					</ul>
				</div>
				<div class="detailcon" style="display:block">
					<div class="pinfor">
						<strong class="pintitle">상품정보
							<button class="singo">신고하기</button>
						</strong>
						<div>
							<table class="ptable">
								<colgroup>
									<col width="160"/>
									<col/>
									<col width="160"/>
									<col/>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="ptableth">상품번호</th>
										<td colspan="1" class="ptabletd"><b><%=dto1.getPnumber()%></b></td>
										<th scope="row" class="ptableth">상품상태</th>
										<td colspan="1" class="ptabletd">신상품</td>
									</tr>
										<tr><th scope="row" class="ptableth">원산지</th>
										<td colspan="3" class="ptabletd">국산</td>
									</tr>
								</tbody>
							</table>	
						</div>
						<p class="pinqu">상품정보 관련 문의사항은 
							<a class="pqna" role="button">Q&amp;A</a>
							에 남겨주세요.
						</p>
						<% String phone = sellerdto.getPhone(); %>
									<% String phone0 = phone.substring(0, 3) + "-"
							                + phone.substring(3, 7) + "-"
							                + phone.substring(7); %>
						<div class="asrecipient">
							<table class="ptable">
								<colgroup>
									<col width="160"/>
									<col/>
									<col width="160"/>
									<col/>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="ptableth">영수증발급</th>
										<td colspan="3" class="ptabletd">신용카드전표, 현금영수증발급</td>
									</tr>
										<tr><th scope="row" class="ptableth">A/S 안내</th>
										<td colspan="3" class="ptabletd"><%=phone0 %><br/>하자로 인한 반품/교환은 판매자 부담<br/>고객 변심으로 인한 반품/교환은 구매자 부담.<br/>A/S는 전화번호나 카톡으로 연락 부탁 드립니다.</td>
									</tr>
								</tbody>
							</table>	
						</div>
					</div>
					<div>
						<div class="gongji">
							<strong class="titlestr">공지사항</strong>
							<div><%=(ancmdto==null ? "": ancmdto.getContent()) %></div>
						</div>
						<div class="sangse">
							<div class="sangsediv">
								<strong class="titlestr">상세설명</strong>
								<div><%=dto1.getDescription()%></div>
							</div>
						</div>
						<div>
							<div class="pinfo_demo">
								<strong class="titlestr">상품정보 제공고시</strong>
								<table class="ptable">
								<colgroup>
									<col width="160"/>
									<col/>
									<col width="160"/>
									<col/>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="ptableth">품명 / 모델명</th>
										<td colspan="3" class="ptabletd"><%=dto1.getPname()%></td>
									</tr>
									<tr>
										<th scope="row" class="ptableth">옵션</th>
										<td colspan="3" class="ptabletd"></td>
									</tr>
									<tr>
										<th scope="row" class="ptableth">제조자(사)</th>
										<td colspan="3" class="ptabletd"><%=dto1.getManufacturer_name()%></td>
									</tr>
									<tr>
										<th scope="row" class="ptableth">브랜드</th>
										<td colspan="3" class="ptabletd"><%=dto1.getBrand_name()%></td>
									</tr>
									<tr>
										<th scope="row" class="ptableth">A/S 책임자와 전화번호</th>
										<td colspan="3" class="ptabletd"><%=sellerdto.getName() %> (<%=phone0 %>)</td>
									</tr>
								</tbody>
							</table>	
							</div>
							<div class="pinfo_demo">
								<strong class="titlestr">거래조건에 관한 정보</strong>
								<table class="ptable">
								<colgroup>
									<col width="345"/>
									<col/>
			
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="ptableth">재화등의 배송방법에 관한 정보</th>
										<td colspan="3" class="ptabletd">택배</td>
									</tr>
									<tr>
										<th scope="row" class="ptableth">제품하자가 아닌 소비자의 단순변심에 따른 청약철회 시 소비자가 부담하는 반품비용 등에 관한 정보</th>
										<td colspan="3" class="ptabletd">편도 <%=dto1.getExchange_cost()%>원 (최초 배송비 무료인 경우 6000원 부과)</td>
									</tr>
									<tr>
										<th scope="row" class="ptableth">제품하자가 아닌 소비자의 단순변심에 따른 청약철회가 불가능한 경우 그 구체적 사유와 근거</th>
										<td colspan="3" class="ptabletd">전자상거래 등에서의 소비자보호에 관한 법률 등에 의한 청약철회 제한 사유에 해당하는 경우 및 기타 객관적으로 이에 준하는 것으로 인정되는 경우 청약철회가 제한될 수 있습니다.</td>
									</tr>
									<tr>
										<th scope="row" class="ptableth">재화등의 A/S 관련 전화번호</th>
										<td colspan="3" class="ptabletd"><%=phone0 %></td>
									</tr>
									<tr>
										<th scope="row" class="ptableth">거래에 관한 약관의 내용 또는 확인할 수 있는 방법</th>
										<td colspan="3" class="ptabletd">상품상세 페이지 및 페이지 하단의 이용약관 링크를 통해 확인할 수 있습니다.</td>
									</tr>
								</tbody>
							</table>	
						</div>
					</div>
				</div>
			</div>
			<div class="p_review" style="display:none">
				<div class="rv_title">
					<strong class="rv_titles">상품리뷰</strong>
					<div class="rv_titlesub">상품을 구매하신 분들이 작성하신 리뷰입니다.리뷰 작성시 아래 금액만큼 포인트가 적립됩니다.
						<dl class="rv_dl">
							<dt class="rv_dt">텍스트 리뷰 :</dt>
							<dd class="rv_dd skincolor">50원</dd>
							<dt class="rv_dt">포토/동영상 리뷰 :</dt>
							<dd class="rv_dd skincolor">150원</dd>
							<dt class="rv_dt">한달사용 텍스트 리뷰 :</dt>
							<dd class="rv_dd skincolor">50원</dd>
							<dt class="rv_dt">한달사용 포토/동영상 리뷰 :</dt>
							<dd class="rv_dd skincolor">150원</dd>
						</dl>
					</div>
					<!-- //////////////////////리뷰////////////////////////// -->
					<div>
						<a class="review_btn" role="button">리뷰 작성하기</a>
					</div>
					
					<!-- ////////////건들면 안됩니당°˖✧◝(⁰▿⁰)◜✧˖°/////////////// -->
				</div>
				<div class="rv_con">
					<div class="rv_con_title">
						<strong class="rv_con_titles">리뷰 
							<span class="rv_con_titlespan"><%=reviewCount%></span>건
						</strong>
					</div>
					<div class="rv_content">
						<div class="rv_content2">
							<div style="display:block;">
								<ul class="review_content">
								<!--  -->
								<%for(ReviewDto dto2 : listReviewDto) { %>
									<li class="review_contentli">
										<div class="review_contentdiv">
											<div class="review_contenttb">
												<div class="review_contenttbc1 <%=dto2.getReviewNum()%>">
													<div class="review_buyer">
														<div class="review_buyerimg">
														 	<img src="https://phinf.pstatic.net/contact/20230301_214/1677667180157tPxcd_JPEG/KakaoTalk_20201115_184021887_01.jpg?type=f76_76" data-src="https://phinf.pstatic.net/contact/20230301_214/1677667180157tPxcd_JPEG/KakaoTalk_20201115_184021887_01.jpg?type=f76_76" class="rev_img" alt="프로필_image">
														</div>
														<div class="review_buyerstar">
															<div class="rev_star">
																<span class="rev_starout">
																	<span class="rev_starin" style="width: <%= dto2.getBuyer_grade() * 20 %>%;"></span>
																</span>
																<em class="rev_starnum"><%=dto2.getBuyer_grade() %></em>
															</div>
															<div class="rev_buyerinfo">
																<strong class="ootd">jimin56</strong>
																<span class="ootd"><%=dto2.getReview_registration_date2() %></span>
															</div>
														</div>
													</div>
													<div class="review_text">
													 	<span class="review_text0"><%=dto2.getReview_content() %></span>
													</div>
													<button type="button" class="review_modify_bt btn_update" data-review-num="<%= dto2.getReviewNum() %>">수정</button>
													<button type="button" class="review_modify_bt btn_delete" data-review-num="<%= dto2.getReviewNum() %>">삭제</button>
													<!-- API적용 건들면 안됩니당°˖✧◝(⁰▿⁰)◜✧˖° -->
													<span style="position: relative; top: 5px;">
														<script type="text/javascript" src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
														<script type="text/javascript">
														new ShareNaver.makeButton({"type": "c" , "title":""});
														</script>
													</span>
													<form id="myform" style="position: relative; left: 123px; bottom: 25px;">
													    URL 입력: <input type="text" id="url" style="border: 1px solid #d4cfcf; background: white;" value="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&oquery=%EB%84%A4%EC%9D%B4%EB%B2%84+%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%84%BC%ED%84%B0&ie=utf8&query=%EB%84%A4%EC%9D%B4%EB%B2%84+%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%84%BC%ED%84%B0"><br/>
													    Title 입력: <input type="text" id="title" value="제목을 입력하세요" style="border: 1px solid #d4cfcf; background: white;"><br/>
													</form>
													  <input type="button" value="네이버공유하기" onclick="share()" style ="border: 1px solid #d4cfcf; background: white;position: relative; left: 247px; bottom: 22px;"/>
													<!-- API적용 건들면 안됩니당°˖✧◝(⁰▿⁰)◜✧˖°-->
												</div>
												<div class="review_contenttbc2">
													<span class="review_conspan">
														<img src="../Images/<%=dto2.getPhoto_video()%>" width="80" height="80" class="review_consimg" alt="review_image">
													</span>
												
												</div>
											</div>
										</div>
									</li>
									<%} %>
									<%-- <div style="padding-left: 200px;">
										<%for(int i = 1 ; i<=10; i++){ %>
											<a href="CustomerDailyLeftContent.jsp?page=<%=i%>"><%=i%></a> 
										<%} %>
									</div> --%>
									<!-- ////////////건들면 안됩니당°˖✧◝(⁰▿⁰)◜✧˖°/////////////// -->
								</ul>
							</div>
							<div class="rv_content3" style="display:none;">
								<p>아직 작성된 리뷰가 없습니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="p_qna" style="display:none">
            <h3 class="pqna_titles">Q&amp;A</h3>
            <p class="pqna_title">구매하시려는 상품에 대해 궁금한 점이 있으신 경우 문의해주세요.
                <a class="pqna_titlea">'판매자 톡톡문의'</a>
                를 통해 판매자와 간편하게 1:1 상담도 가능합니다.
             </p>
            <div class="qna_con">
               <div class="qna_btnbox">
                  <div class="fl qna_leftcon">
                     <form>
                     <input type ="hidden" id="seller_id" name="seller_id" value="<%=판매자아이디 %>"/>
                     <input type="hidden" id="customer_id" name="customer_id" value="<%=구매자아이디%>"/>
                     <input type ="hidden" id="pnumber" name="pnumber" value="<%=상품번호 %>"/>
                     
                     <a class="qna_leftbtn" role="button">상품 Q&amp;A 작성하기</a>
                     </form>
                     <a class="qna_rightbtn" role="button" href="https://shopping.naver.com/my/qna">나의 Q&amp;A 조회</a>
                  </div>
                  <div class="fr">
                     <div class="myqna">
                        <label class="myqnalb">
                           <span class="myqnalbspan">내 Q&amp;A 보기</span>
                           <i class="myqna_onoff"><span class="blind">OFF</span></i>
                        </label>
                     </div>
                     <div class="myanswer">
                        <a href="#" class="answerstate" role="button" aria-expanded="false" aria-haspopup="listbox">답변상태</a>
                     </div>
                     <div style="clear:both;"></div>
                  </div>
                  <div style="clear:both;"></div>
               </div>
               <div class="qna_content">
                  <div class="qna_contentin">
                     <div class="qna_ct1">
                        <span class="qna_ct1in">답변상태</span>
                     </div>
                     <div class="qna_ct2">
                        <span class="qna_ct2in">문의내용</span>
                     </div>
                     <div class="qna_ct3">
                        <span class="qna_ct3in">작성자</span>
                     </div>
                     <div class="qna_ct4">
                        <span class="qna_ct4in">작성일</span>
                     </div>
                  </div>
                  <div style="display:block;">
                  <% 
                     int cnt = 0;
                     for(CustomerInquiryDto dto2 : listCustomerInquiryDto) {
                     cnt++;
                  %>   
                     <div class="qna_contentin2">
                        <div class="qna_ct1">
                           <span class="qnact1in"><%=dto2.getStatus() %></span>
                           <span class="blind serinum" style="position:relative!important; display:inline-block;"><%=dto2.getSerial_number() %></span>
                        </div>
                        <div class="qnact2">
                           <span class="qnact2in"><%=dto2.getInquiry_content() %></span>
                        </div>
                        <div class="qna_ct3">
                           <span class="qnact3in"><%=dto2.getcustomer_id() %></span>
                        </div>
                        <div class="qna_ct4">
                           <span class="qnact4in"><%=dto2.getInquiry_date2() %></span>
                        </div>
                     </div>
                     <div class="qna_detail bn<%=cnt%>">   <!--  style="display:  세션하고!-->
                        <div class="qna_dtbox"> 
                           <p class="qna_dtcon"><%=dto2.getInquiry_content() %></p>
                           <div class="qna_button">
                              <a class="qna_bt update" href="QuestionUpdate.jsp?seller_id=<%=seller_id %>&serial_number=<%=dto2.getSerial_number()%>">수정</a>
                              <a href="InquiryDeleteAction.jsp?seller_id=<%=seller_id%>&serial_number=<%=dto2.getSerial_number()%>"class="qna_bt delete">삭제</a>
                           </div>
                        </div>
                     </div>
                      <% } %>
                  </div>
                  <div class="qna_cont" style="display:none;">
                     <p class="qna_contp">작성된 상품 Q&amp;A가 없습니다.</p>
                  </div>
                  <div style="padding-top : 50px; text-align : center;">
                  <%
                  for(int i=1; i<=count/5+1; i++) {
                  %>
                     <a href="CustomerDailyLeftContent.jsp?seller_id=<%=seller_id%>&page=<%=i%>" class="pagenumber"><%=i %></a>
                  <% } %>
                  </div>
               </div>
            </div>
         </div>
			<div class="return_exchange" style="display:none">
				<h3 class="re_titles">반품/교환정보</h3>
				<div class="re_info">
					<strong class="re_infost"><%=storedto.getStore_name() %> 반품/교환 안내</strong>
					<p class="re_infop">반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소 등을 협의하신 후 반품상품을 발송해 주시기 바랍니다.</p>
				</div>
				<table class="ptable">
					<colgroup>
						<col width="150">
						<col width="410">
						<col width="150">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="ptableth">판매자 지정택배사</th>
							<td colspan="3" class="ptabletd"><%=dto1.getDeliverCompany() %></td>
						</tr>
						<tr>
							<th scope="row" class="ptableth">반품배송비</th>
							<td class="ptabletd">편도 <%=dto1.getReturn_delivery_cost() %>원 (최초 배송비 무료인 경우 6000원 부과)</td>
							<th scope="row" class="ptableth">교환배송비</th>
							<td class="ptabletd"><%=dto1.getExchange_cost() %>원</td>
						</tr>
						<tr>
							<th scope="row" rowspan="2" class="ptableth">반품/교환 사유에 따른 요청 가능 기간</th>
							<td colspan="3" class="ptabletd">구매자 단순 변심은 상품 수령 후 7일 이내(구매자 반품배송비 부담)</td>
						</tr>
						<tr>
							<td colspan="3" class="ptabletd">표시/광고와 상이, 계약 내용과 다르게 이행된 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내 (판매자 반품 배송비 부담)<br/>
							둘 중 하나 경과 시 반품/교환 불가</td>
						</tr>
						<tr>
							<th scope="row" rowspan="7" class="ptableth">반품/교환 불가능 사유</th>
							<td colspan="3" class="ptabletd">
								<ul class="table_ul">
									<li class="table_li">
										<span class="table_lispan">1.</span>
										반품요청기간이 지난 경우
									</li>
									<li class="table_li">
										<span class="table_lispan">2.</span>
										구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)
									</li>
									<li class="table_li">
										<span class="table_lispan">3.</span>
										구매자의 책임있는 사유로 포장이 훼손되어 상품 가치가 현저히 상실된 경우 (예: 식품, 화장품, 향수류, 음반 등)
									</li>
									<li class="table_li">
										<span class="table_lispan">4.</span>
										구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 (라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)
									</li>
									<li class="table_li">
										<span class="table_lispan">5.</span>
										시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우
									</li>
									<li class="table_li">
										<span class="table_lispan">6.</span>
										고객의 요청사항에 맞춰 제작에 들어가는 맞춤제작상품의 경우 (판매자에게 회복불가능한 손해가 예상되고, 그러한 예정으로 청약철회권 행사가 불가하다는 사실을 서면 동의 받은 경우)
									</li>
									<li class="table_li">
										<span class="table_lispan">7.</span>
										복제가 가능한 상품 등의 포장을 훼손한 경우 (CD/DVD/GAME/도서의 경우 포장 개봉 시)
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>	
			<div class="etc">
				<strong class="sellerinfo">판매자정보</strong>
				<table class="ptable" style="margin-top: 15px;">
					<colgroup>
						<col width="150">
						<col width="360">
						<col width="150">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="ptableth">상호명</th>
							<td colspan="3" class="ptabletd"><%=sellerdto.getName() %> (개인)</td>
						</tr>
						<tr>
							<th scope="row" class="ptableth">사업장소재지</th>
							<td colspan="3" class="ptabletd"><%=sellerdto.getWorkplace()%> (메일:<a class="tba"><%=sellerdto.getEmail()%></a>)
							<div class="sellernumber">
									
								 고객센터:<%=phone0%>
								<span class="ing">인증</span>
								<button type="button" class="wrongnumber">잘못된 번호 신고</button>
							</div>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="ptabletd4">
								<em class="ptabletdem">판매자정보(전화번호, 이메일, 주소 등)는 해당 판매자의 명시적 동의 없이 영리 목적인 마케팅·광고 등 용도로 활용할 수 없습니다.</em>
								판매자의 명시적 동의 없이 판매자의 정보를 수집 및 활용하여 영리 목적인 마케팅·광고 등 용도로 활용하는 경우 정보통신망법 등 관련 법령에 의거하여<br/>
								과태료 부과 및 형사처벌의 대상이 될 수 있습니다.
							</td>
						</tr>
					</tbody>
				</table>	
			</div>
			</div>
			</div>
			<div class="last" style="width:1020px;">
					<div class="lastfooter">
						<div class="footer1">
							<p class="fanounce">반품 배송비, 반품 배송주소 등은 해당 상품 페이지 내 안내를 참고해주세요.</p>
							<div class="footer11">
								<div class="sellername fl"><%=sellerdto.getName() %></div>
								<div class="sellernumber2 fl">
									<%=phone0 %>
									<span class="ing">인증</span>
									<button type="button" class="wrongnumber">잘못된 번호 신고</button>
								</div>
								<div class="sellerinfo fl">
									<button type="button" class="sellerinfm">판매자 정보</button>
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
						<div class="footer2">
							<ul class="ft2_ul">
								<li class="ft2_li"><a href="https://policy.naver.com/rules/service.html" class="ft2_lia" target="_blank">네이버 약관</a></li>
								<li class="ft2_li"><a href="https://new-m.pay.naver.com/member/terms-policy/npay-usage" class="ft2_lia" target="_blank">네이버페이 이용약관</a></li>
								<li class="ft2_li"><a href="https://new-m.pay.naver.com/member/terms-policy/finance" class="ft2_lia" target="_blank">전자금융거래 이용약관</a></li>
								<li class="ft2_li"><a href="http://mktg.naver.com/privacy/privacy.html" class="ft2_lia" target="_blank"><strong>개인정보처리방침</strong></a></li>
								<li class="ft2_li"><a href="/main/rules/responsibility" class="ft2_lia" target="_blank">책임의 한계와 법적고지</a></li>
								<li class="ft2_li"><a href="http://www.naver.com/rules/youthpolicy.html" class="ft2_lia" target="_blank">청소년보호정책</a></li>
								<li class="ft2_li"><a href="https://ips.smartstore.naver.com/owner/intro" class="ft2_lia" target="_blank">지식재산권신고센터</a></li>
								<li class="ft2_li"><a href="https://ips.smartstore.naver.com/main/rules/safety" class="ft2_lia" target="_blank">안전거래 가이드</a></li>
								<li class="ft2_li"><a href="http://help.pay.naver.com" class="ft2_lia" target="_blank">쇼핑&amp;페이 고객센터</a></li>
							</ul>
							<div class="ft2_div">
								<div class="fl ft2_div1">
									<strong>네이버㈜</strong>
									<div class="ft2_div1in">
										사업자등록번호 220-81-62517
										<span class="ft2_div1inspan"></span>
										통신판매업신고번호 2006-경기성남-0692호<br/>
										대표이사 최수연
										<span class="ft2_div1inspan"></span>
										경기도 성남시 분당구 정자일로 95, NAVER 1784, 13561<br>
										전화 1588-3819
										<span class="ft2_div1inspan"></span>이메일
										<a href="mailto:helpcustomer@naver.com" class="ft2_div1ina" target="_blank">helpcustomer@naver.com</a>
										<span class="ft2_div1inspan"></span>
										<a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208162517" target="_blank" class="ft2_div1ina">사업자등록정보 확인</a><br/>
										호스팅 서비스 제공 : NAVER Cloud
									</div>
								</div>
								<div class="fl ft2_div2">
									<strong>고객센터</strong>
									<div class="ft2_div2in">
										강원도 춘천시 퇴계로 89 강원전문건설회관<br/>
										전화 1588-3819
										<a href="#" class="ft2_div2ina" target="_blank">전화전클릭</a><br/>
										결제도용신고 1588-3816<br/>
										<a href="https://help.pay.naver.com/mail/form.help" class="ft2_div1ina" target="_blank">
											<strong>1:1문의 바로가기</strong>
										</a>
									</div>
								</div>
								<div class="fl ft2_div3">
									<strong>전자금융거래 분쟁처리</strong>
									<div class="ft2_div3in">전화 1588-3819<br/>
										<a href="https://help.pay.naver.com/mail/form.help" class="ft2_div3ina" target="_blank">
											<strong>1:1문의 바로가기</strong>
										</a>
									</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<p class="ft2_p">
								네이버㈜는 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매자에게 있습니다.
								<a href="https://help.pay.naver.com/faq/alias/cashpay01.help" class="ft2_pa">자세히보기</a>
							</p>
							<div class="naverlast">
								<a href="http://www.naver.com/" target="_blank" class="naverlasta">
									<span class="blind">NAVER</span>
								</a>
								<em>Copyright ©</em>
								<a href="http://www.navercorp.com/" target="_blank" class="naverlasta1">
								<strong>NAVER Corp.</strong>
								</a>
								All Rights Reserved.
							</div>
			
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
</body>
</html>