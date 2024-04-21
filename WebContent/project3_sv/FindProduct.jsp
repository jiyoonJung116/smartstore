<%@page import="dto.카테고리Dto"%>
<%@page import="dao.카테고리Dao"%>
<%@page import="dto.자유상품상세검색Dto"%>
<%@page import="dao.SsFreeProductDisplay2Dao"%>
<%@page import="dao.SsFreeProductAddRemoveDao"%>
<%@page import="dto.FreeProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.FreeProductSearchDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    		request.setCharacterEncoding("utf-8");
            
            SsFreeProductDisplay2Dao listFreeProduct = new SsFreeProductDisplay2Dao();
            	
            String loginId = "jiyoonjung";
            String search = request.getParameter("search");
            long pNumber = 0L;
    	    if(request.getParameter("pNumber")!=null)
    	    	pNumber = Long.parseLong(request.getParameter("pNumber"));
            String pName = request.getParameter("pName");
            String model = request.getParameter("model");
            String scode = request.getParameter("scode");
            String choose = request.getParameter("choose");
            String order = request.getParameter("order");
            
            if (search!=null && search.equals("상품명")) {
                pName = request.getParameter("textareaValue");
            } else if (search!=null &&search.equals("모델명")) {
                model = request.getParameter("textareaValue");
            } else if (search!=null &&search.equals("상품번호")){
            	pNumber = Long.parseLong(request.getParameter("pNumber"));
            } else if (search!=null &&search.equals("판매자상품코드")){
            	scode = request.getParameter("scode");
            } 
            
    			
            ArrayList<자유상품상세검색Dto> listfree = listFreeProduct.list상세검색(search, pNumber, pName, model, scode, choose, order);
    %>
    <%
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
	    
	    int category_id=0;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스마트스토어 판매자 상품 찾기</title>
<link rel="stylesheet" href="../css/FindProduct.css" />
<script src="../js/jquery-3.7.0.min.js"></script>
<script>
	function unit(a, b) {
		let u = document.getElementById(a);
		let n = document.getElementById(b);

		if (u.style.display == "none") {
			u.style.display = "block";
		} else if (u.style.display == "block") {
			u.style.display = "none";
		}
	}
	

	$(function() {
		/* $(".btn-default2").click(function() {
		    if ($('.form_style').is(':checked')) {
		        let search = $('input[name="payd"]:checked').val();	// 상품번호, 상품명, 모델명, 판매자 상품코드 중 1개 선택
		        let textareaValues = $('.pnamest').map(function() {
		            return $(this).val();
		        }).get();

		        let productNumber = ''; // 상품번호 입력 필드 값
		        let sellerCode = ''; // 판매자코드 입력 필드 값
		        let model = ''; // 모델명 입력 필드 값
		        let productName = ''; // 상품명 입력 필드 값

		        if (search === '상품명') {
		            productName = textareaValues[0];
		        } else if (search === '모델명') {
		            model = textareaValues[2];
		        } else if (search === '판매자상품코드') {
		            sellerCode = textareaValues[1];
		        } else if (search === '상품번호') {
		            productNumber = textareaValues[3];
		        }

		        let choose = $('input[name="choose"]:checked').val();	// 전체, 무료배송, 리뷰
		        let order = $('input[name="sort"]:checked').val();	// 인기도순, 누적판매순, 최신등록순, 리뷰수순

		        let encodedSearch = encodeURIComponent(search);
		        let encodedProductNumber = encodeURIComponent(productNumber);
		        let encodedSellerCode = encodeURIComponent(sellerCode);
		        let encodedModel = encodeURIComponent(model);
		        let encodedProductName = encodeURIComponent(productName);
		        let encodedChoosepr = encodeURIComponent(choose);
		        let encodedOrder = encodeURIComponent(order);

		        location.href = "../project3_sv/FindProduct.jsp?search=" + encodedSearch + "&pNumber=" + encodedProductNumber +
		            "&scode=" + encodedSellerCode + "&model=" + encodedModel + "&pName=" + encodedProductName +
		            "&choose=" + encodedChoosepr + "&order=" + encodedOrder;
		    }
		}); */

		 $(".btn-default2").click(function() {
			  if ($('.form_style').is(':checked')) {
			    let search = $('input[name="payd"]:checked').val();	//상품번호, 상품명, 모델명, 판매자 상품코드 4중 1클릭 
			    let textareaValue = $('.pnamest').val(); //입력값
			    let choose = $('input[name="choose"]:checked').val();	//전체, 무료배송, 리뷰
			    let order = $('input[name="sort"]:checked').val();	//인기도순, 누적판매순, 최신등록순, 리뷰수순
			    
				let encodedSearch = encodeURIComponent(search);
			    let encodedTextareaValue = encodeURIComponent(textareaValue);
				let encodedChoosepr = encodeURIComponent(choose);
				let encodedOrder = encodeURIComponent(order); 
				
				alert(textareaValue);
				 location.href = "../project3_sv/FindProduct.jsp?search=" + encodedSearch + "&textareaValue=" + encodedTextareaValue +
	             "&choose=" + encodedChoosepr + "&order=" + encodedOrder;
			    
			  }
			}); 
		$(".prepare, .button5, #discount, .choosecategory1").click(function() {
			alert("준비중입니다");
		});
		$("#0").click(function() {
			if ($(this).prop('checked')) {
				$('#1').prop('checked', true);
				$('#2').prop('checked', true);
				$('#3').prop('checked', true);
			} else {
				$('#1').prop('checked', false);
				$('#2').prop('checked', false);
				$('#3').prop('checked', false);
			}
		});
		$(".option").click(function() {
			let option_value = $(this).attr("data-value");
			if (option_value === "50") {
				$(".item").text("50개씩");
			} else if (option_value === "100") {
				$(".item").text("100개씩");
			} else if (option_value === "200") {
				$(".item").text("200개씩");
			} else if (option_value === "300") {
				$(".item").text("300개씩");
			} else if (option_value === "400") {
				$(".item").text("400개씩");
			} else if (option_value === "500") {
				$(".item").text("500개씩");
			}
		});
		$(".select-input").click(function() {
			$(this).toggleClass("rotate");
		});

		$("#sel_namename").change(function() {
			$("#lbl_selectleft").text(this.value);
		});

		$(".selectize-input").click(
				function() {
					$(this).toggleClass("rotate");
					if ($(this).hasClass("rotate")) {
						$(this).parent().find(".selectize-dropdown").css(
								'display', 'block');
					} else {
						$(this).parent().find(".selectize-dropdown").css(
								'display', 'none');
					}
				});

		$(".selectize-dropdown-content").click(function() {
			$(this).css("display", "none");
		});

		$("#total").click(function() {
			if ($(this).prop('checked')) {
				$('#common_order').prop('checked', true);
				$('#today_start').prop('checked', true);
				$('#reservation').prop('checked', true);
				$('#subscribe').prop('checked', true);
				$('#rental').prop('checked', true);
			} else {
				$('#common_order').prop('checked', false);
				$('#today_start').prop('checked', false);
				$('#reservation').prop('checked', false);
				$('#subscribe').prop('checked', false);
				$('#rental').prop('checked', false);
			}
		});

		$(".searchstyle3").click(function() {
					$(this).parents(".totalstyle").find(".categorystyle").css(
							'display', 'none');
					$(this).css('background-color', '#00c73c');
					$(this).css('color', '#fff');
					$(this).parents(".totalstyle").find(".searchstyle1").css(
							'background-color', 'white');
					$(this).parents(".totalstyle").find(".searchstyle1").css(
							'color', '#666');
					$(this).parents(".totalstyle").find(".searchstyle1").css(
							'border', '1px solid #dbdde2');
					$(this).parents(".totalstyle").find("#choosecategory").css(
							'display', 'none');
					$(this).parents(".totalstyle").find("#choosecategory1")
							.css('display', 'none');
					$(this).parents(".totalstyle").find("#detailsearch1").css(
							'display', 'block');
					$(this).parents(".totalstyle").find("#detailsearch2").css(
							'display', 'block');
					$(this).parents(".totalstyle").find("#detailsearch3").css(
							'display', 'block');
					$(this).parents(".totalstyle").find("#detailsearch4").css(
							'display', 'block');
					$(this).parents(".totalstyle").find("#detailsearch5").css(
							'display', 'block');
					$(this).parents(".totalstyle").find(".choose_category")
							.css('display', 'none');
					$(this).parents(".totalstyle").find(".choose_category1")
							.css('display', 'none');
					$(this).parents(".totalstyle").find(".seller-data").css(
							'display', 'none');
					$(this).parents(".totalstyle").find("#pname").css(
							'display', 'block');
				}); /*상품번호 등 상세검색*/
				
				$("#white1").click(function() {
					  let boxst = $(this).closest(".ag-row-focus").css('background-color');
					  if (boxst === 'rgb(255, 255, 255)') {
					    $(this).closest(".ag-row-focus").css('background-color', '#e9f4f5');
					  } else if (boxst === 'rgb(233, 244, 245)') {
					    $(this).closest(".ag-row-focus").css('background-color', '#fff');
					  }
					});
				$("#white2").click(function() {
					  let boxst = $(this).closest(".ag-row").css('background-color');
					  if (boxst === 'rgb(255, 255, 255)') {
					    $(this).closest(".ag-row").css('background-color', '#e9f4f5');
					  } else if (boxst === 'rgb(233, 244, 245)') {
					    $(this).closest(".ag-row").css('background-color', '#fff');
					  }
					});
				$("#white3").click(function() {
					  let boxst = $(this).closest(".ag-row").css('background-color');
					  if (boxst === 'rgb(255, 255, 255)') {
					    $(this).closest(".ag-row").css('background-color', '#e9f4f5');
					  } else if (boxst === 'rgb(233, 244, 245)') {
					    $(this).closest(".ag-row").css('background-color', '#fff');
					  }
					});
				

		$(".searchstyle1").click(function() {
					$(this).parents(".totalstyle").find(".categorystyle").css('display', 'block');
					$(this).css('background-color', '#00c73c');
					$(this).css('color', '#fff');
					$(this).css('border', '1px solid #00ae34');
					$(this).parents(".totalstyle").find(".searchstyle3").css('background-color', 'white');
					$(this).parents(".totalstyle").find(".searchstyle3").css('color', '#666');
					$(this).parents(".totalstyle").find(".searchstyle3").css('border', '1px solid #dbdde2');
					$(this).parents(".totalstyle").find("#choosecategory").css('display', 'block');
					$(this).parents(".totalstyle").find("#choosecategory1").css('display', 'block');
					$(this).parents(".totalstyle").find("#detailsearch1").css('display', 'none');
					$(this).parents(".totalstyle").find("#detailsearch2").css('display', 'none');
					$(this).parents(".totalstyle").find("#detailsearch3").css('display', 'none');
					$(this).parents(".totalstyle").find("#detailsearch4").css('display', 'none');
					$(this).parents(".totalstyle").find("#detailsearch5").css('display', 'none');
					$(this).parents(".totalstyle").find(".choose_category").css('display', 'block');
					$(this).parents(".totalstyle").find(".choose_category1").css('display', 'block');
					$(this).parents(".totalstyle").find("#deliveryinfo").css('display', 'none');
					$(this).parents(".totalstyle").find("#pnumber_search").css('display', 'none');
					$(this).parents(".totalstyle").find("#pcode_search").css('display', 'none');
					$(this).parents(".totalstyle").find("#mname").css('display', 'none');
					$(this).parents(".totalstyle").find("#pname").css('display', 'none');
				});/*카테고리 검색*/

		$(".button1").click(function() {
					$(this).parents(".searchstyle5").find("#pnumber_search").css(
							'display', 'block');
					$(this).parents(".searchstyle5").find("#pname").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#pcode_search").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#mname").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#deliveryinfo").css(
							'display', 'none');
				}); /*상품번호*/

		$(".button2").click(function() {
					$(this).parents(".searchstyle5").find("#pname").css(
							'display', 'block');
					$(this).parents(".searchstyle5").find("#pnumber_search").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#pcode_search").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#mname").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#deliveryinfo").css(
							'display', 'none');
				}); /*상품명*/

		$(".button3").click(function() {
					$(this).parents(".searchstyle5").find("#mname").css(
							'display', 'block');
					$(this).parents(".searchstyle5").find("#pname").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#pnumber_search").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#pcode_search").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#deliveryinfo").css(
							'display', 'none');
				}); /*모델명*/

		$(".button4").click(function() {
					$(this).parents(".searchstyle5").find("#pcode_search").css(
							'display', 'block');
					$(this).parents(".searchstyle5").find("#pname").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#mname").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#pnumber_search").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#deliveryinfo").css(
							'display', 'none');
				}); /*판매자상품코드*/

		$(".button5").click(function() {
					$(this).parents(".searchstyle5").find("#deliveryinfo").css(
							'display', 'block');
					$(this).parents(".searchstyle5").find("#pnumber_search").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#pcode_search").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#pname").css(
							'display', 'none');
					$(this).parents(".searchstyle5").find("#mname").css(
							'display', 'none');
				}); /*배송정보*/

		$(".detailsearch2").click(function() {
			$(this).parent().find("#pname").css('display', 'block');
		});

		$("#choosecategory").click(function() {
					$(this).parents(".searchstyle5").find(".categorystyle")
							.css('display', 'block');
					$(this).parents(".searchstyle5").find(".seller-data").css(
							'display', 'none');
				});

		$("#choosecategory1").click(function() {
					$(this).parents(".searchstyle5").find(".seller-data").css(
							'display', 'block');
					$(this).parents(".searchstyle5").find(".categorystyle")
							.css('display', 'none');
				});
		
		$(".btn-primary").click(function() {
			  let prNumber = $(".ag-row").find(".pnum").text();
			  let str_pr_number = "";
			  $(".ag-row").find(".pnum").each(function(idx, item) {
				 if($(item).prev().find("input").is(':checked')) {
					 //alert("checked : " + idx);
					 if(str_pr_number.length>0) {
						 str_pr_number += "_";
					 }
					 str_pr_number += $(item).text().trim();
				 } 
			  });
			  
			  let pr_number_array = str_pr_number.split("_");
			  let pr_number_long_array = pr_number_array.map(function(str) {
			    return parseInt(str, 10);
			  });

			  let pr_number_params = pr_number_long_array.join(","); 
				  location.href = "FindProducInsertAction.jsp?pr_number_long_array=" + encodeURIComponent(pr_number_params);

			  

			});
		$(".cate-large").click(function() {
			$(".cate-large").attr("class","cate-large");
			$(this).attr("class","cate-large on");
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
		let category_id = <%=카테고리num %>;
		$("#input_category_id").val(category_id);
	});
</script>
</head>
<body>
	<div class="background">
		<div class="top_style">
			<button type="button" class="close">
				<img class="img_style xbt" src="../Images/x.png">
			</button>
			<h3 class="font_style">스마트스토어 판매자 상품 찾기</h3>
		</div>
		<div class="totalstyle">
			<div class="totalstyle1">
				<div class="searchstyle">
					<label class="searchstyle1">
						<span class="searchstyle2">카테고리 검색</span>
					</label> 
					<label class="searchstyle3">
						<span class="searchstyle2">상품번호등 상세검색 검색</span>
					</label>
				</div>
			</div>
			<div class="searchstyle4">
				<div class="searchstyle5">
					<div>
						<div class="seller">
							<ul class="seller-list-border">
								<li>
									<div class="fl mr35 choose_category">
										<label class="label_style"> 
											<input type="radio" name="cate" class="form_style" checked /> 카테고리 선택 
											<span id="choosecategory"></span>
										</label>
									</div>
									<div class="fl mr36 choose_category1">
										<label class="label_style"> 
											<input type="radio" name="cate" class="form_style prepare"/> 상품이 등록된 카테고리 선택 
											<span id="choosecategory1"></span>
										</label>
									</div>
									<ul class="seller-list-border">
										<li>
											<div id="detailsearch1" class="fl mr40" style="display: none;">
												<label class="label_style"> 
													<input type="radio" name="payd" class="form_style" value="상품번호" /> 상품번호 
													<span class="button1"></span>
												</label>
											</div>
											<div id="detailsearch2" class="fl mr36" style="display: none;">
												<label class="label_style"> 
													<input type="radio" name="payd" class="form_style" value="상품명" checked /> 상품명 
													<span class="button2"></span>
												</label>
											</div>
											<div id="detailsearch3" class="fl mr38" style="display: none;">
												<label class="label_style"> 
												<input type="radio" name="payd" class="form_style" value="모델명" /> 모델명 
												<span class="button3"></span>
												</label>
											</div>
											<div id="detailsearch4" class="fl mr39" style="display: none;">
												<label class="label_style"> 
													<input type="radio" name="payd" class="form_style" value="판매자상품코드" /> 판매자상품코드 
													<span class="button4"></span>
												</label>
											</div>
											<div id="detailsearch5" class="fl mr39" style="display: none;">
												<label class="label_style"> 
													<input type="radio" name="payd" class="form_style" /> 배송정보 
													<span class="button5"></span>
												</label>
											</div>
											<div style="clear: both;"></div>
										</li>
									</ul>
									<div style="clear: both;"></div>
								</li>
							</ul>

							<div id="pname" style="display: none;">
								<input type="text" class="pnamest" placeholder="상품명을 입력하세요" title="상품명 입력">
							</div>
							<div id="mname" style="display: none;">
								<input type="text" class="pnamest" placeholder="모델명을 입력하세요" title="모델명 입력">
							</div>
							<div id="pnumber_search" style="display: none;">
								<input type="text" class="pnamest" placeholder="상품번호를 입력하세요" title="상품번호 입력">
							</div>
							<div id="pcode_search" style="display: none;">
								<input type="text" class="pnamest" placeholder="판매자코드를 입력하세요" title="판매자코드 입력">
							</div>
							<div id="deliveryinfo" class="form-inline" style="display: none;">
								<div class="form-group form-group-sm" style="min-width: 205px">
									<div class="selectize-control ng-pristine ng-untouched ng-valid single">
										<div class="selectize-input items full has-options has-items ng-valid ng-pristine focus input-active dropdown-active">
											<div class="item">배송비 유형 전체</div>
											<input type="text" autocomplete="off" tabindex="0" readonly
												style="width: 4px; opacity: 1; position: relative; left: 0px;">
										</div>
										<div class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
											style="display: none; width: 206px; top: 30px; left: 0px; visibility: visible;">
											<div class="selectize-dropdown-content">
												<div class="option selected">배송비 유형 전체</div>
												<div class="option active">무료</div>
												<div class="option">유료</div>
											</div>
										</div>
									</div>
									<select class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty"
										style="width: 4px; opacity: 0; position: absolute; left: -10000px; display: none;">
										<option value="">배송비 유형 전체</option>
									</select>
								</div>
							</div>


							<div class="seller-data category-list" style="display: none;">
								<div>
									<div class="data-group">
										<div class="seller-input">
											<p>
												<label>
													<input id="total" type="checkbox" class="ng-valid ng-dirty ng-valid-parse ng-touched ng-empty">전체
													<span id="total"></span>
												</label>
											</p>
											<!---->
											<p>
												<label>
													<input id="common_order" type="checkbox" class="ng-valid ng-not-empty ng-dirty ng-valid-parse ng-touched">
													스포츠/레저 &gt; 요가/필라테스 &gt; 요가매트
													<span></span>
												</label>
											</p>
											<!---->
											<p>
												<label>
													<input id="today_start" type="checkbox" class="ng-pristine ng-untouched ng-valid ng-empty">
													디지털/가전 &gt; 카메라/캠코더용품 &gt; 렌즈용품 &gt; 렌즈캡
													<span></span>
												</label>
											</p>
											<!---->
											<p>
												<label>
													<input id="reservation" type="checkbox" class="ng-pristine ng-untouched ng-valid ng-empty">
													가구/인테리어 &gt; DIY자재/용품 &gt; 가구부속품 &gt; 기타가구부속품
													<span></span>
												</label>
											</p>
											<!---->
											<p>
												<label>
													<input id="subscribe" type="checkbox" class="ng-pristine ng-untouched ng-valid ng-empty">
													가구/인테리어 &gt; 홈데코 &gt; 쿠션/방석 &gt; 팔꿈치/손목쿠션
													<span></span>
												</label>
											</p>
											<!---->
											<p>
												<label>
													<input id="rental" type="checkbox" class="ng-pristine ng-untouched ng-valid ng-empty">
														생활/건강 &gt; 악기 &gt; 관악기 &gt; 리코더
													<span></span>
												</label>
											</p>
											<!---->
										</div>
									</div>
								</div>
							</div>
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
										<li><a role="button" class="cate-large" href="FindProduct.jsp?large=<%=dto.getLarge() %>"><%=dto.getLarge() %></a></li>
												<% } %>
											<% } %>
										<% } %>
									</ul>
								</div>
								<div class="fl categorystyle1">
									<ul class="data-group ulstyle">
										<li><a class="opaciting">중분류</a></li>
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
								<div class="fl categorystyle1 categorystyle2 categorystyle4">
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
							<ul class="seller-list-border ul-style">
								<li class="liststyle">
									<div class="fl">
										<label class="column_name_color">선택</label>
									</div>
									<div class="fl mr36">
										<label class="label_style"> <input type="radio" name="choose" class="form_style" value="전체" checked /> 전체 
											<span></span>
										</label>
									</div>
									<div class="fl mr36">
										<label class="label_style"> 
										<input type="radio" name="choose" class="form_style" value="무료배송" /> 무료배송 
										<span></span>
										</label>
									</div>
									<div class="fl mr36">
										<label class="label_style"> 
										<input type="radio" name="choose" class="form_style" /> 즉시할인 
										<span id="discount"></span>
										</label>
									</div>
									<div class="fl mr37">
										<label class="label_style"> 
										<input type="radio" name="choose" class="form_style" value="리뷰" /> 리뷰 
										<span></span>
										</label>
									</div>
									<div style="clear: both;"></div>
								</li>
							</ul>
							<ul class="seller-list-border ul-style">
								<li class="liststyle liststyle2">
									<div class="fl">
										<label class="column_name_color">정렬</label>
									</div>
									<div class="fl mr36">
										<label class="label_style"> 
											<input type="radio" name="sort" class="form_style" value="인기도순" checked /> 인기도순 
											<span id="popular"></span>
										</label>
									</div>
									<div class="fl mr36">
										<label class="label_style"> 
											<input type="radio" name="sort" class="form_style" value="누적판매순" /> 누적판매순 
											<span></span>
										</label>
									</div>
									<div class="fl mr36">
										<label class="label_style"> 
										<input type="radio" name="sort" class="form_style" value="최신등록순" /> 최신등록순 
										<span></span>
										</label>
									</div>
									<div class="fl mr37">
										<label class="label_style"> 
										<input type="radio" name="sort" class="form_style" value="리뷰수순"/> 리뷰수순 
										<span></span>
										</label>
									</div>
									<div style="clear: both;"></div>
								</li>
							</ul>
							<div class="sellerbtn">
								<button type="submit" class="btn btn-default2">검색</button>
								<button type="button" class="btn btn-default prepare">초기화</button>
							</div>
						</div>
					</div>
				</div>
				<div class="sellerbtngroup" style="height: 50px">
					<div class="btnleft">
						<p class="textsub subtext">
							<span class="textnumber primary">3</span>개의 상품이 조회되었습니다. 
							<em class="mobile-right">
							<span class="text-muted hidden-xs bar">|</span>
								<span class="visible-xs-inline square-bracket">[</span>선택된 상품 
								<span class="text-info text-number">0</span>개
								<span class="visible-xs-inline square-bracket">]</span>
							</em>
						</p>
					</div>
					<div class="btnright hidden-xs">
						<div class="formgroup btn-group-sm" onclick="unit('unitcontent','unitcontent1')">
							<div class="control ng-pristine ng-untouched ng-valid single">
								<div class="select-input items ng-valid ng-pristine has-options full has-items">
									<div data-value="50" class="item">50개씩</div>
									<input type="text" autocomplete="off" tabindex="0" readonly style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
								</div>
								<div id="unitcontent" class="dropdown single ng-pristine ng-untouched ng-valid"
									style="display: none; visibility: visible; width: 487.922px; top: 31px; left: 0px;">
									<div id="unitcontent1" class="dropdown-content">
										<div data-value="50" class="option selected">50개씩</div>
										<div data-value="100" class="option">100개씩</div>
										<div data-value="200" class="option">200개씩</div>
										<div data-value="300" class="option">300개씩</div>
										<div data-value="400" class="option">400개씩</div>
										<div data-value="500" class="option">500개씩</div>
									</div>
								</div>
							</div>
							<select class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty" 
							style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
								<option value="50" selected="selected">50개씩</option>
							</select>
						</div>
					</div>
				</div>
				<div class="seller-area tbtheme" style="width: 100%; height: 320px;">
					<div class="root-wrapper layout-normal agltr">
						<div class="root-wrapper-body ag-layout-normal">
							<div class="root ag-unselectable ag-layout-normal" style="overflow-x: auto; overflow-y:auto">
								<div class="ag-head ag-pivot-off" style="height: 40px; min-height: 40px;">
									<div class="ag-left-header ag-hidden" style="width: 0px; max-width: 0px; min-width: 0px;">
										<div class="ag-header-row" style="top: 0px; height: 40px; width: 0px;"></div>
									</div>
									<div class="ag-header-viewport">
										<div class="ag-header-container" style="width: 2280px; transform: translateX(0px);">
											<div class="ag-header-row" style="top: 0px; height: 40px; width: 2280px;">
												<div class="ag-header-cell" style="width: 100px; left: 150px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">이미지</span> 
																<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span>
															</span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 250px; left: 250px;">
													<div class="ag-header-cell-resize"></div>
													<!--AG-CHECKBOX-->
													<div
														class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">상품명</span> 
															<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span>
															</span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 500px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container" role="presentation">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">채널</span> 
																<span class="ag-header-icon ag-filter-icon ag-hidden">
																	<span class="ag-icon ag-icon-filter"></span>
																</span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 600px;">
													<div class="ag-header-cell-resize"></div>
													<div
														class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">판매상태</span> 
																<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span></span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 700px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">전시상태</span> 
															<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span></span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 800px;">
													<div class="ag-header-cell-resize"></div>
													<div
														class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">판매가</span> 
															<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span>
															</span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 900px;">
													<div class="ag-header-cell-resize"></div>
													<div
														class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">할인가(PC)</span> 
																<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span></span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 1000px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">할인가(모바일)</span> 
																<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span></span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 1100px;">
													<div class="ag-header-cell-resize"></div>
													<div
														class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container" role="presentation">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">리뷰수</span> 
															<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span>
															</span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 1200px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">평점</span> 
															<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span>
															</span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 1300px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">판매자즉시할인(PC)</span>
															<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span>
															</span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 1400px;">
													<div class="ag-header-cell-resize"></div>
													<div
														class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">판매자즉시할인(모바일)</span>
															<span class="ag-header-icon ag-filter-icon ag-hidden">
															<span class="ag-icon ag-icon-filter"></span></span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 120px; left: 1500px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">대분류</span> 
															<span class="ag-header-icon ag-filter-icon ag-hidden">
															<span class="ag-icon ag-icon-filter"></span></span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 120px; left: 1620px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">중분류</span> 
															<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span>
															</span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 120px; left: 1740px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container" role="presentation">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">소분류</span> 
															<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span>
															</span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 120px; left: 1860px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">세분류</span> 
															<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span>
															</span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 1980px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text">배송비유형</span> 
																<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span>
															</span>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 1980px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 1980px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 50px; left: 0px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div>
														<div class="seller-input ag-header-cell-label">
															<label>
															<input id="0" type="checkbox" class="ag-selection-checkbox">
																<span class="ag-header-cell-text whitebox"></span>
															</label>
														</div>
													</div>
												</div>
												<div class="ag-header-cell" style="width: 100px; left: 50px;">
													<div class="ag-header-cell-resize"></div>
													<div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation">
														<label class="ag-hidden"></label>
														<div class="ag-wrapper ag-input-wrapper" role="presentation">
															<input type="checkbox" class="ag-hidden">
															<div>
																<i class="seller-icon grid-checkbox-unchecked"></i>
															</div>
														</div>
													</div>
													<div class="ag-cell-label-container">
														<div class="ag-header-cell-label">
															<span class="ag-header-cell-text" >상품번호</span> 
															<span class="ag-header-icon ag-filter-icon ag-hidden">
																<span class="ag-icon ag-icon-filter"></span>
															</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="ag-pinned-right-header ag-hidden" style="width: 0px; max-width: 0px; min-width: 0px;">
										<div class="ag-header-row" role="row" aria-rowindex="1" style="top: 0px; height: 40px; width: 0px;"></div>
									</div>
								</div>
								<div class="ag-floating-top" style="min-height: 0px; height: 0px; display: none; overflow-y: hidden;">
									<div class="ag-pinned-left-floating-top ag-hidden"></div>
									<div class="ag-floating-top-viewport">
										<div class="ag-floating-top-container" style="transform: translateX(0px);"></div>
									</div>
									<div class="ag-pinned-right-floating-top ag-hidden"></div>
									<div class="ag-floating-top-full-width-container ag-hidden"></div>
								</div>
								<div
									class="ag-body-viewport ag-layout-normal ag-row-no-animation" style=" width: 2096px; height: 600px;">
									<div class="ag-pinned-left-cols-container ag-hidden" style="height: 120px;">
										<div class="ag-row ag-row-even ag-row-level-0 ag-row-position-absolute ag-row-first ag-row-focus ag-row-selected"
											style="height: 40px; transform: translateY(0px);"></div>
										<div class="ag-row ag-row-no-focus ag-row-odd ag-row-level-0 ag-row-position-absolute"
											style="height: 40px; transform: translateY(40px);"></div>
										<div class="ag-row ag-row-no-focus ag-row-even ag-row-level-0 ag-row-position-absolute ag-row-last"
											style="height: 40px; transform: translateY(80px);"></div>
									</div>
									<div class="ag-center-cols-clipper">
										<div class="ag-center-cols-viewport">
											<div class="ag-center-cols-container" style="width: 2280px; ">
												<% 
													for(int i=0; i<=listfree.size()-1; i++) {
														자유상품상세검색Dto dto = listfree.get(i);
												%>
												<div role="row" row-index="<%=i%>" aria-rowindex="2" row-id="<%=i%>"
													class="ag-row ag-row-even ag-row-level-0 ag-row-position-absolute ag-row-first ag-row-focus ag-row-selected"
													style="height: 40px; transform: translateY(<%=40*i%>px);">
													<div tabindex="-1" role="gridcell" class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-focus"
														style="width: 50px; left: 0px;">
														<div class="seller-input ag-header-cell-label">
															<label>
																<input id="checkbox1" type="checkbox" class="ag-selection-checkbox">
																<span class="white1 ag-header-cell-text whitebox" onclick="toggleProductRegistration()"></span>
															</label>
														</div>
													</div>
													<div tabindex="-1" role="gridcell" class="pnum ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value" style="width: 100px; left: 50px;">
														<%=dto.getPnumber() %>
													</div>
													<div tabindex="-1" role="gridcell" class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value" style="width: 100px; left: 150px;">
														<span>
															<img src=<%=dto.getImage() %> style="height: 40px" class="full-img">
														</span>
													</div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 250px; left: 250px;"><%=dto.getPname() %></div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 100px; left: 500px;">스마트스토어</div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 100px; left: 600px;"><%=dto.getSalesStatus() %></div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 100px; left: 700px;"><%=dto.getDisplayStatus() %></div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 100px; left: 800px;"><%=dto.getPrice() %></div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 100px; left: 900px;"><%=dto.getPrice() %></div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 100px; left: 1000px;"><%=dto.getPrice() %></div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 100px; left: 1100px;"><%=dto.getReviewCount() %></div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 100px; left: 1100px;"><%=dto.getGrade() %></div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 100px; left: 1200px;">0</div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 100px; left: 1300px;">0</div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 100px; left: 1400px;">0</div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 120px; left: 1500px;"><%=dto.getLarge() %></div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 120px; left: 1620px;"><%=dto.getMiddle() %></div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 120px; left: 1740px;"><%=dto.getSub() %></div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 120px; left: 1860px;"><%=dto.getSmall() %></div>
													<div class="ag-cell ag-cell-not-inline-editing ag-cell-with-height text-center ag-cell-value"
														style="width: 100px; left: 1980px;"><%=dto.getDct() %></div>
												</div>
												<%} %>
											</div>
										</div>
									</div>
									<!--  -->
									<div class="ag-pinned-right-cols-container ag-hidden" style="height: 120px;">
										<div class="ag-row ag-row-even ag-row-level-0 ag-row-position-absolute ag-row-first ag-row-focus ag-row-selected"
											style="height: 40px; transform: translateY(0px);"></div>
										<div class="ag-row ag-row-no-focus ag-row-odd ag-row-level-0 ag-row-position-absolute"
											style="height: 40px; transform: translateY(40px);"></div>
										<div class="ag-row ag-row-no-focus ag-row-even ag-row-level-0 ag-row-position-absolute ag-row-last"
											style="height: 40px; transform: translateY(80px);"></div>
									</div>
									<div class="ag-full-width-container" role="presentation" style="height: 120px;"></div>
								</div>
								<div class="ag-floating-bottom" style="min-height: 0px; height: 0px; display: none; overflow-y: hidden;">
									<div class="ag-pinned-left-floating-bottom ag-hidden"></div>
									<div class="ag-floating-bottom-viewport">
										<div class="ag-floating-bottom-container" style="transform: translateX(0px);"></div>
									</div>
									<div class="ag-pinned-right-floating-bottom ag-hidden"></div>
									<div class="ag-floating-bottom-full-width-container ag-hidden"></div>
								</div>
								<div class="ag-body-horizontal-scroll" style="height: 17px; max-height: 17px; min-height: 17px;">
									<div class="ag-horizontal-left-spacer ag-scroller-corner" style="width: 0px; max-width: 0px; min-width: 0px;"></div>
									<div class="ag-body-horizontal-scroll-viewport" style="height: 17px; max-height: 17px; min-height: 17px;">
										<div class="ag-body-horizontal-scroll-container" style="width: 2280px; height: 17px; max-height: 17px; min-height: 17px;"></div>
									</div>
									<div class="ag-horizontal-right-spacer ag-scroller-corner" style="width: 0px; max-width: 0px; min-width: 0px;"></div>
								</div>
								<div class="ag-overlay ag-hidden">
									<div class="ag-overlay-panel">
										<div class="ag-overlay-wrapper ag-layout-normal"></div>
									</div>
								</div>
							</div>
						</div>
						<nav class="seller-pagination">
							<span class="ag-paging-row-summary-panel _sell_pageRowSummaryPanel" style="display: none;"> 
								<span class="_sell_firstRowOnPage">1</span>[[TO]] 
								<span class="_sell_lastRowOnPage">3</span>[[OF]]
								<span class="_sell_recordCount">3</span> 
								<span class="_sell_current">1</span> 
								<span class="_sell_total">1</span>
							</span>
							<div class="visible-xs">
								<div class="_mobile_pagination">
									<button type="button" class="btn btn-default _page" data-page="-1" disabled>
										<i class="seller-icon icon-left" aria-hidden="true"></i>
									</button>
									<span class="text-primary">1</span>/<span>1</span>
									<button type="button" role="button" class="btn btn-default _page">
										<i class="seller-icon icon-right"></i>
									</button>
								</div>
							</div>
							<div class="hidden-xs">
								<ul class="pagination _pc_pagination">
									<li class="_page active" data-page="0">
										<a class="btntype1" href="">1 
											<span class="sr-only">(현재 페이지)</span>
										</a>
									</li>
								</ul>
							</div>
						</nav>
						<div class="modal-footer">
							<div class="seller-btn-area btntype">
								<button class="btn btn-default" type="button">취소</button>
								<button class="btn btn-primary" type="button" onclick="handleProductRegistration()">상품등록</button>
							</div>
							<div class="modal-footer ng-hide">
								<div class="seller-btn-area">
									<span>
										<button class="btn btn-default" type="button">닫기</button>
									</span> 
									<span>
										<button class="btn btn-primary" type="submit">저장</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>