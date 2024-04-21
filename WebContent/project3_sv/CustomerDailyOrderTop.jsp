<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
   <% 
   CommonDao commonDao = new CommonDao();
	String seller_id = request.getParameter("seller_id");
	CommonDto dto = null;
 	if(seller_id==null){
 		seller_id="jiyoonjung";
		dto = commonDao.colorselect(seller_id);
	}else {
		seller_id = request.getParameter("seller_id");
		dto = commonDao.colorselect(seller_id);
		
	} 
 	Long pnumber = Long.parseLong(request.getParameter("pnumber"));
 	ProductDao productdao = new ProductDao();
 	ProductDto dto1 = productdao.select1(pnumber);
 	
 	SellerDao sellerdao = new SellerDao();
 	SellerDto sellerdto = sellerdao.select(seller_id);
 	
 	ANCMDao ancmdao = new ANCMDao();
 	ANCMDto ancmdto = ancmdao.select1(pnumber);

 	StoreDto storedto = sellerdao.selectName(seller_id);
 	
 	String buyer_id = request.getParameter("buyer_id");
 	int purchase_amount= Integer.parseInt(request.getParameter("purchase_amount"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CustomerDailyTopContent</title>
	<link rel="stylesheet" href="../css/CustomerDailyOrderTop.css" />
	<script src="../js/jquery-3.7.0.min.js"></script>
	<script>
		$(function() {
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
			//준비중입니다 띄우기
			$(".preparing").click(function() {
				alert("준비중입니다.");
			});

			calc();
			
			let buyer_id = $(".nickname").text();
			$("#buyer_id").val(buyer_id);
		});
		function calc() {
			let unit = $(".unit").text().replace(",","");
			let stunit = ","+unit.slice(-3);
			let stunit2 = unit.slice(0,-3)+stunit;
			$(".unit").html(stunit2);
			let ttprice = $("#ttprice").text();
			let stunit3 = ","+ttprice.slice(-3);
			let stunit4 = ttprice.slice(0,-3)+stunit3;
			$("#ttprice").text(stunit4);
		}
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function(){				
			document.getElementById("deliveryarea").addEventListener("click", function(){ //주소입력칸을 클릭하면					
			//카카오 지도 발생					
				new daum.Postcode({					
					oncomplete: function(data) { //선택시 입력값 세팅			
						document.getElementById("deliveryarea").value = data.address; // 주소 넣기					
	  					document.getElementById('postNum').value = data.zonecode;// 주소 넣기	
						document.getElementById("detailDeliveryarea").focus(); 포커스				
					}					
				}).open();					
			});	
			
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
				<a href="DailyTopSellerinfo.jsp" class="myself">
					<img src="img/profile.jpg" class="profile"/>
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
		<div class="subjectbar">
			<div class="storename">
				<div class="alarm fl">
					<div class="alarm2">
						<button type="button" class="topcolor alarm3">
							<span class="bell"></span>
							<span class="belltext">알림받기</span>
						</button>
					</div>
				</div>
				<div class="fl center">
					<h1 class="storemiddle">
						<a href="CustomerDailyTop.jsp">
							<span class="storemainname"><%=storedto.getStore_name() %></span>
						</a>
					</h1>
				</div>
				<div class="fr today">
					<div class="todayandtotal">
						<span>오늘
							<em class="visit">1</em>
						</span>
						<span class="total">전체
							<em class="visit">596</em>
						</span>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div class="topmenu">
				<div class="menucontent">
					<ul class="ulstype">
						<li class="listyle">
							<a href="DailyTop01.jsp" class="listtype">전체상품
							</a>
						</li>
					</ul>
					<ul class="ulstype">
						<li class="listyle2">
							<a href="DailyTopQNA.jsp" class="submenulist">묻고 답하기</a>
						</li>
						<li class="listyle2">
							<a href="DailyTopANCM.jsp"  class="submenulist">공지사항</a>
						</li>
						<li class="listyle2">
							<a class="submenulist preparing">리뷰이벤트</a>
						</li>
						<li class="listyle2">
							<a class="submenulist preparing">쇼핑스토리</a>
						</li>
						<li class="listyle2">
							<a href="DailyTopSellerinfo.jsp" class="submenulist">판매자 정보</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
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
					<div class="sellcon">
						<div class="fl sellconimg">
							<div class="conimg">
								<div class="sellimg">
									<img src="Images/<%=dto1.getImage()%>">
								</div>
							</div>
							<div class="reviewscore">
								<div class="reviewdiv">
									<span class="reviewspan">리뷰수</span>
									<strong class="reviewstrong">0</strong>
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
											<input type="number" class="amountinput" value="<%=purchase_amount %>"/>
											<button type="button" class="plus">
												<span class="plus_"></span>
											</button>
										</div>
									</div>
								</div>
								<div class="paybox">
									<div class="npay">
										<div class="npaybtn">
											<div class="npaya2"></div>
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
								<div class="totalpricebox">
									<strong class="ttpricett">총 결제 금액</strong>
									<div class="ttpricebox">
										<em class="ttamount">총 수량 <span class="tqty"><%=purchase_amount %></span>개 (배송비 포함금액)</em>
										<strong class="ppricestrong skincolor">
												<span id="ttprice" class="colorprice qtyprice"><%=purchase_amount*dto1.getPrice()+dto1.getDeliveryCost()%></span>
												<span class="colorwon">원</span>
										</strong>
									</div>
								</div>
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
				<div class="menutab">
					<ul class="tabul">
						<li class="tabli1">
							<a class="taba" aria-current="true">주문정보</a>
						</li>
					</ul>
				</div>
				<form action="OrderActionTop.jsp" method="post">
				<input type="hidden" id="buyer_id" name="buyer_id" value="<%=buyer_id%>">
									<div class="detailcon" style="display:block">
					<div class="pinfor">
						<strong class="pintitle">배송정보</strong>
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
										<td colspan="1" class="ptabletd"><b><input type="text" name="pnumber" class="deliveryInput" value="<%=dto1.getPnumber()%>"></b></td>
										<th scope="row" class="ptableth">구매수량</th>
										<td colspan="1" class="ptabletd"><input type="text" class="deliveryInput" name="purchase_amount" value="<%=purchase_amount%>"></td>
									</tr>
									<tr>
										<th scope="row" class="ptableth">옵션선택</th>
										<td colspan="3" class="ptabletd">
											<% OptionSelectDao optionselDao = new OptionSelectDao();
												OptionDto optiondto = optionselDao.option1(pnumber);
												if(optiondto!=null){
												ArrayList<OptionDto> optionList = optionselDao.option1(pnumber,optiondto.getName());
												OptionDto optiondto2 = null;
												ArrayList<OptionDto> optionList2 = null;
												String value = null;
												OptionDto optiondto3 = null;
												String value2 = null;
												ArrayList<OptionDto> optionList3 = null;
											%>
											<select name="value">
												<option disabled selected><%=optiondto.getName() %></option>
												<%for(OptionDto d : optionList) { %>
												<option value="<%=d.getValue() %>"><%=d.getValue() %><%optiondto2 = optionselDao.option2(pnumber, optiondto.getName(), d.getValue());  %>
												<% 
													value= d.getValue();
													optionList2 = optionselDao.option2(pnumber, optiondto.getName(), d.getValue(), optiondto2.getName2());
												%>
												</option>
												<%} %>
											</select>
											<select name="value2">
												<option disabled selected><%=optiondto2.getName2() %></option>
												<%for(OptionDto d : optionList2) { %>
												<option value="<%=d.getValue2() %>"><%=d.getValue2() %><%optiondto3 = optionselDao.option3(pnumber, optiondto.getName(), value, optiondto2.getName2(), d.getValue2()); %>
												<% 
													value2= d.getValue2();
													optionList3 = optionselDao.option3(pnumber, optiondto.getName(), d.getValue(), optiondto2.getName2(),d.getValue2(),optiondto3.getName3());
												%>
												</option>
												<%} %>
											</select>
											<select name="value3">
												<option disabled selected><%=optiondto3.getName3() %></option>
												<%for(OptionDto d : optionList3) { %>
												<option value="<%=d.getValue3() %>"><%=d.getValue3() %></option>
												<%} 
												}%>
											</select>
										</td>
									<tr>
									<th scope="row" class="ptableth">수취인명</th>
										<td colspan="3" class="ptabletd"><input type="text" placeholder="수취인명 입력" class="deliveryInput" name="recipient_name"></td>
									</tr>
								</tbody>
							</table>	
						</div>
					
						
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
										<th scope="row" class="ptableth">배송지</th>
										<td colspan="3" class="ptabletd"><input type="text" id="deliveryarea"placeholder="배송지 입력" class="deliveryInput" name="deliveryAddress"></td>
									</tr>
									<tr>
										<th scope="row" class="ptableth">우편번호</th>
										<td colspan="3" class="ptabletd"><input type="text" id="postNum" class="deliveryInput" name="postNum"></td>
									</tr>
									<tr>
										<th scope="row" class="ptableth">상세주소</th>
										<td colspan="3" class="ptabletd"><input type="text" id="detailDeliveryarea" placeholder="상세주소 입력" class="deliveryInput" name="detailDeliveryAddress"></td>
									</tr>
									<tr>
										<th scope="row" class="ptableth">핸드폰번호</th>
										<td colspan="3" class="ptabletd"><input type="text" placeholder="핸드폰번호 입력" class="deliveryInput" name="phone"></td>
									</tr>
									<tr><th scope="row" class="ptableth">배송메세지입력</th>
										<td colspan="3" class="ptabletd"><textarea class="deliveryInput" placeholder="배송메세지 입력" name="delivery_message"></textarea>
									</tr>
								</tbody>
							</table>
							<button type="submit" id="naverPayBtn" style="margin-top : 30px;" class="npaya"></button>	
						</div>
					</div>
				</div>
				</form>

				<% String phone = sellerdto.getPhone(); %>
									<% String phone0 = phone.substring(0, 3) + "-"
							                + phone.substring(3, 7) + "-"
							                + phone.substring(7); %>
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