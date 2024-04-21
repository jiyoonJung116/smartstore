<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장바구니</title>
	<link rel="stylesheet" href="../css/basket.css"/>
	<script src="../js/jquery-3.7.0.min.js"></script>
	<script>
		$(function(){
			 $(".storecheck").on("click", function() {
				    var ariaCheck = $(this).attr("aria-check");

				    // 속성 값을 토글하여 변경
				    if (ariaCheck === "true") {
				      $(this).attr("aria-check", "false");
				    } else {
				      $(this).attr("aria-check", "true");
				    }

				    // aria-check가 true이면 스타일 변경
				    if ($(this).attr("aria-check") === "true") {
				      // back_check 클래스에 aria_true 클래스 추가
				      $(this).find(".back_check").addClass("aria_true");

				      // p_btn 버튼도 true로 변경
				      $(".p_btn").attr("aria-check", "true");
				      $(".p_btn > span").addClass("aria_true");
				    } else {
				      // back_check 클래스에 aria_true 클래스 제거
				      $(this).find(".back_check").removeClass("aria_true");

				      // p_btn 버튼도 false로 변경
				      $(".p_btn").attr("aria-check", "false");
				      $(".p_btn > span").removeClass("aria_true");
				    }
				  });

				  // p_btn 버튼 클릭 이벤트 처리
				  $(".p_btn").on("click", function() {
				    var ariaCheck = $(this).attr("aria-check");

				    // 속성 값을 토글하여 변경
				    if (ariaCheck === "true") {
				      $(this).attr("aria-check", "false");
				      $(".p_btn > span").addClass("aria_true");
				    } else {
				      $(this).attr("aria-check", "true");
				      $(".p_btn > span").removeClass("aria_true");
				    }
				  });
		});
	</script>
</head>
<body>
<!-- 상단 바 -->
	<div class="header">
		<div class="header_toptop">
			<div>
				<div class="toptop_height">
					<div class="toptop_bar">
						<div class="fl left_con">
							<a class="naverlogo" href="https://www.naver.com/"></a>
							<a class="naverpay" href="https://new-m.pay.naver.com/pcpay?page=1"></a>
						</div>
						
						<div class="fr right_con">
							<a class="basket_space" href="">
								<span class="basket_icon">
									<svg width="19" height="19" viewBox="0 0 19 19" fill="none" class="_gnbHeader_icon_3CZKN"><mask id="iconGradationBasket_19x19_white_svg__TinW11UTYKa" maskUnits="userSpaceOnUse" x="-0.944" y="0.583" width="20" height="19" fill="#000"><path fill="#fff" d="M-.944.583h20v19h-20z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M9.493 1.583a4.004 4.004 0 00-4.004 4.004v.747H2.191c-.731 0-1.272.67-1.105 1.37l2.265 9.502a.97.97 0 00.948.739h10.402a.97.97 0 00.948-.74l2.265-9.501c.167-.7-.373-1.37-1.105-1.37h-3.312v-.747a4.004 4.004 0 00-4.004-4.003zm2.948 4.75v-.746a2.948 2.948 0 10-5.897 0v.747h5.898z"></path></mask><path fill-rule="evenodd" clip-rule="evenodd" d="M9.493 1.583a4.004 4.004 0 00-4.004 4.004v.747H2.191c-.731 0-1.272.67-1.105 1.37l2.265 9.502a.97.97 0 00.948.739h10.402a.97.97 0 00.948-.74l2.265-9.501c.167-.7-.373-1.37-1.105-1.37h-3.312v-.747a4.004 4.004 0 00-4.004-4.003zm2.948 4.75v-.746a2.948 2.948 0 10-5.897 0v.747h5.898z" fill="#fff"></path><path d="M14.382 6.833a.5.5 0 100-1v1zm-.885-1a.5.5 0 100 1v-1zm.885 0h-.885v1h.885v-1zm-8.893.5v1a1 1 0 001-1h-1zm-4.403 1.37l-.973.233.973-.232zm2.265 9.503l.973-.232-.973.232zm12.298 0l.973.232-.973-.232zm2.265-9.502l-.973-.232.973.232zm-4.417-1.37h-1a1 1 0 001 1v-1zm-1.056 0v1a1 1 0 001-1h-1zm-5.897 0h-1a1 1 0 001 1v-1zm-.055-.747a3.004 3.004 0 013.004-3.003v-2a5.004 5.004 0 00-5.004 5.003h2zm0 .747v-.747h-2v.747h2zm-1.43 1h.43v-2h-.43v2zm-2.868 0h2.868v-2H2.19v2zm-.132.138a.096.096 0 01.021-.088c.024-.03.06-.05.11-.05v-2C.837 5.334-.207 6.586.114 7.936l1.946-.464zm2.265 9.502L2.06 7.472l-1.946.464 2.266 9.502 1.945-.464zm-.025-.03h.002l.002.001.006.004a.038.038 0 01.008.009c.003.004.006.01.007.016l-1.945.464a1.97 1.97 0 001.92 1.507v-2zm10.402 0H4.299v2h10.402v-2zm-.025.03a.053.053 0 01.007-.016.038.038 0 01.008-.01.024.024 0 01.006-.003h.003v2a1.97 1.97 0 001.922-1.507l-1.946-.464zm2.265-9.502l-2.265 9.502 1.946.464 2.265-9.502-1.946-.464zm-.132-.138c.051 0 .087.02.111.05a.096.096 0 01.021.088l1.946.464c.322-1.35-.722-2.602-2.078-2.602v2zm-3.312 0h3.312v-2h-3.312v2zm-1-1.747v.747h2v-.747h-2zM9.493 2.584a3.004 3.004 0 013.004 3.003h2A5.004 5.004 0 009.493.583v2zm3.948 3.75v-.747h-2v.747h2zm0-.747A3.948 3.948 0 009.493 1.64v2c1.076 0 1.948.872 1.948 1.948h2zM9.493 1.64a3.948 3.948 0 00-3.949 3.948h2c0-1.076.873-1.948 1.949-1.948v-2zM5.544 5.587v.747h2v-.747h-2zm1 1.747h.146v-2h-.146v2zm.146 0h1.313v-2H6.69v2zm1.313 0h2.944v-2H8.003v2zm2.944 0h1.365v-2h-1.365v2zm1.365 0h.13v-2h-.13v2z" fill="#000" fill-opacity="0.1" mask="url(#iconGradationBasket_19x19_white_svg__TinW11UTYKa)"></path></svg>
									<em class="update_cnt">1</em>
								</span> 장바구니
							</a>
							<div class="mypage">
								<a>
									<img class="mypage_img"src="https://phinf.pstatic.net/contact/20210417_77/1618626149687kjjgn_JPEG/profileImage.jpg?type=s80"/>
									<span class="nickname">긍정부자</span>
									<span class="arrowdown"></span>
								</a>
							</div>
							<div class="hotkey">
								<div class="bell">
									<a>
										<span class="bell_icon"></span>
										<em class="new_cnt">11</em>
									</a>
								</div>
							</div>
							<div class="hotkey">
								<div class="mail">
									<a>
										<span class="mail_icon"></span>
										<em class="new_cnt">99+</em>
									</a>
								</div>
							</div>
							<div class="hotkey">
								<div class="menu">
									<a>
										<span class="menu_icon"></span>
									</a>
								</div>
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>				
				</div>
				 <div style="clear:both;"></div>
				<div class="top_under">
					<div class="under_width">
							<div class="fl navershop">
								<a class="shoplogo" href="https://shopping.naver.com/home"></a>
							</div>
							<div class="fl shoplive">
								<a class="shoplive_logo" href="https://shoppinglive.naver.com/home"></a>
							</div>
							<div class="fl search">
								<div class="input_search">
									<div>
										<input type="text" class="search_txt"/>
										<button type="button" class="autof">
											<span></span>
										</button>
										<div class="click_btn">
											<svg width="50" height="34" viewBox="0 0 50 34" fill="none" class="_searchInput_icon_DaIWa"><path fill="#00C73C" stroke="#00A030" d="M.5.5h49v33H.5z"></path><g filter="url(#iconMagnifierBox_50x34_green_svg__filter0_d_4_5922)" stroke="#fff" stroke-width="2"><path d="M28 20l6 5"></path><circle cx="23.5" cy="15.5" r="6.5"></circle></g><defs><filter id="iconMagnifierBox_50x34_green_svg__filter0_d_4_5922" x="14" y="6" width="22.64" height="21.768" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feColorMatrix in="SourceAlpha" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"></feColorMatrix><feOffset></feOffset><feGaussianBlur stdDeviation="1"></feGaussianBlur><feComposite in2="hardAlpha" operator="out"></feComposite><feColorMatrix values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.35 0"></feColorMatrix><feBlend in2="BackgroundImageFix" result="effect1_dropShadow_4_5922"></feBlend><feBlend in="SourceGraphic" in2="effect1_dropShadow_4_5922" result="shape"></feBlend></filter></defs></svg>
										</div>	
									</div>
								</div>
							</div>
							<div class="shop_best">
								<a href="https://search.shopping.naver.com/best/home?categoryCategoryId=ALL&categoryDemo=F02&categoryRootCategoryId=ALL&chartDemo=F02&chartRank=1&period=P1D&windowCategoryId=20000050&windowDemo=F02&windowRootCategoryId=20000050">
									<svg width="60" height="14" viewBox="0 0 60 14" class="_siteButton_text_icon_2KCsd"><path d="M10.542 7.394l.826-1.26c-1.904-.322-4.452-1.946-4.452-4.13v-.728H5.208v.728c0 2.212-2.408 3.78-4.438 4.074.252.448.504.882.77 1.316 1.708-.35 3.864-1.652 4.508-3.332.714 1.666 2.786 2.954 4.494 3.332zm1.148 4.158v-1.288H8.876v-2.66H7.238v2.66H4.816v-2.66H3.178v2.66H.42v1.288h11.27zm11.158-3.486V.632H21.21v7.434h1.638zm-2.954-5.152V1.612h-6.93v1.302h6.93zm.476 4.41l-.126-1.232c-.56.07-1.092.126-1.652.182l.104-.882.19-1.764c-.532-.042-1.05-.098-1.582-.154l-.14 2.898c-.518.014-1.022.028-1.54.028-.042-.966-.112-1.946-.14-2.926l-1.624.168c.112.938.196 1.862.294 2.772h-1.61c.084.462.14.91.224 1.358 2.576.014 5.754-.126 7.602-.448zm-1.806 5.684c2.772 0 4.382-.896 4.382-2.352 0-1.484-1.61-2.38-4.382-2.38-2.758 0-4.354.896-4.354 2.38 0 1.456 1.596 2.352 4.354 2.352zm0-1.302c-1.68 0-2.688-.378-2.688-1.05 0-.7 1.008-1.078 2.688-1.078 1.708 0 2.702.378 2.702 1.078 0 .672-.994 1.05-2.702 1.05zm12.924.258c2.184 0 3.206-1.008 3.206-2.66v-.35c0-1.4-.826-2.114-2.058-2.296 1.204-.294 1.596-1.148 1.596-2.03v-.294c0-1.652-1.036-2.464-3.178-2.464h-3.92v10.094h4.354zM30.4 5.986h-1.488V3.354h1.372c1.512 0 2.128.224 2.128 1.078v.252c0 1.208-.72 1.296-2.012 1.302zm.136 4.494h-1.624V7.442h1.358c1.918 0 2.59.308 2.59 1.358v.308c0 1.19-.742 1.372-2.324 1.372zm12.246 1.484V10.48h-4.816V7.526h4.424V6.07h-4.424V3.354h4.718V1.87h-6.496v10.094h6.594zm4.896.154c1.96 0 3.71-.7 3.71-2.954v-.182c0-1.386-.798-2.366-3.178-2.898-1.19-.266-2.184-.406-2.184-1.386V4.53c0-.546.588-1.218 1.862-1.218.812 0 1.47.098 2.282.63l.84-1.386c-1.022-.658-2.044-.84-3.15-.84-2.73 0-3.612 1.624-3.612 2.842v.182c0 2.338 1.89 2.632 3.57 2.996 1.148.252 1.778.602 1.778 1.414v.154c0 .686-.56 1.204-1.834 1.204-1.204 0-2.212-.462-2.828-.98l-.868 1.428c.784.644 2.156 1.162 3.612 1.162zm9.152-.154V3.382h2.954V1.87H52.07v1.512h2.968v8.582h1.792z" fill="#FFF" fill-rule="nonzero"></path></svg>
									<span class="shop_txt">쇼핑BEST</span>
								</a>
							</div>
							<div class="my_shop">
								<div class="shop_icon">
									<svg width="12" height="12" viewBox="0 0 12 12" class="_myButton_icon_2H5fU"><path d="M11.29 9.642l-.001-.022v-.042l-.002-.004a.79.79 0 00-.377-.605l-.004-.006-3.352-1.936v-.693A2.48 2.48 0 008.61 4.3V3.083A2.47 2.47 0 006.146.605a2.47 2.47 0 00-2.464 2.478V4.3c0 .842.417 1.586 1.056 2.034v.693l-3.35 1.934-.002.004A.786.786 0 001 9.641c0 .02.002.04.003.059v1.8h10.286V9.641h0z" stroke="#FFF" fill="none" fill-rule="evenodd"></path></svg>
									<svg width="45" height="14" viewBox="0 0 45 14" class="_myButton_text_icon_3L7su"><path d="M10.542 7.394l.826-1.26c-1.904-.322-4.452-1.946-4.452-4.13v-.728H5.208v.728c0 2.212-2.408 3.78-4.438 4.074.252.448.504.882.77 1.316 1.708-.35 3.864-1.652 4.508-3.332.714 1.666 2.786 2.954 4.494 3.332zm1.148 4.158v-1.288H8.876v-2.66H7.238v2.66H4.816v-2.66H3.178v2.66H.42v1.288h11.27zm10.158-3.486V.632H20.21v7.434h1.638zm-2.954-5.152V1.612h-6.93v1.302h6.93zm.476 4.41l-.126-1.232c-.56.07-1.092.126-1.652.182l.104-.882.19-1.764c-.532-.042-1.05-.098-1.582-.154l-.14 2.898c-.518.014-1.022.028-1.54.028-.042-.966-.112-1.946-.14-2.926l-1.624.168c.112.938.196 1.862.294 2.772h-1.61c.084.462.14.91.224 1.358 2.576.014 5.754-.126 7.602-.448zm-1.806 5.684c2.772 0 4.382-.896 4.382-2.352 0-1.484-1.61-2.38-4.382-2.38-2.758 0-4.354.896-4.354 2.38 0 1.456 1.596 2.352 4.354 2.352zm0-1.302c-1.68 0-2.688-.378-2.688-1.05 0-.7 1.008-1.078 2.688-1.078 1.708 0 2.702.378 2.702 1.078 0 .672-.994 1.05-2.702 1.05zm9.236.258V3.438c.238.728.378 1.176.518 1.526l2.086 5.32h1.428l2.114-5.32c.126-.364.266-.686.476-1.526v8.526h1.694V1.87H32.54l-2.38 6.272-2.478-6.272h-2.548v10.094H26.8zm14.382 0v-3.99L44.64 1.87h-1.96l-2.352 4.452-2.394-4.452h-2.002l3.458 6.104v3.99h1.792z" fill="#FFF" fill-rule="nonzero"></path></svg>
									
								</div>
							</div>
							<div style="clear:both;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="delivery">
		<div class="delivery_con">
			<div class="fl delivery_txt">
				<button type="button" class="deli_btn">일반배송
					<span class="deli_num">1</span>
				</button>
			</div>
			<div class="deli_step">
				<div>장바구니</div>
				<div>
					<svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_status--2cyINN3I2q"><path d="M5.834 14.572a.5.5 0 1 0 .707.707l-.707-.707zM11.813 9.3l.353.354a.5.5 0 0 0 0-.708l-.354.354zM6.54 3.321a.5.5 0 1 0-.707.708l.707-.708zm0 11.958l5.625-5.625-.707-.708-5.625 5.626.707.707zm5.625-6.333L6.541 3.321l-.707.708 5.625 5.625.707-.708z" fill="#000" fill-opacity="0.1"></path></svg>
					주문/결제
				</div>
				<div>
					<svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_status--2cyINN3I2q"><path d="M5.834 14.572a.5.5 0 1 0 .707.707l-.707-.707zM11.813 9.3l.353.354a.5.5 0 0 0 0-.708l-.354.354zM6.54 3.321a.5.5 0 1 0-.707.708l.707-.708zm0 11.958l5.625-5.625-.707-.708-5.625 5.626.707.707zm5.625-6.333L6.541 3.321l-.707.708 5.625 5.625.707-.708z" fill="#000" fill-opacity="0.1"></path></svg>
					완료
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	<div class="total_click">
		<div class="all_width">
			<div class="fl">
<!-- 				<button type="button" class="allcheck_box" role="checkbox" aria-checked="true"> -->
<!-- 					<span> -->
<!-- 						<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_check--3-_9ZRQGKX"><path d="M12.945 4L14.1 5.154 6.387 12.8 2 8.4l1.155-1.153 3.232 3.246L12.945 4z" fill="#C7CACD"></path></svg> -->
<!-- 					</span> 전체 선택 -->
<!-- 				</button> -->
			</div>
			<div class="fr">
				<button type="button" class="choose_click">
					<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_delete--2NfiVYXLHf"><path d="M13 2.5l.707.707-4.646 4.647 4.646 4.646-.707.707-4.646-4.646-4.647 4.646L3 12.5l4.647-4.646L3 3.207l.707-.707 4.647 4.647L13 2.5z" fill="#BDC0C6"></path></svg>
					<span>선택</span>삭제
				</button>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	<div class="content">
		<div class="content_box">
			<div class="order_box">
				<div class="home_check">
					<div class="nickname_check">
						<button type="button" aria-checked="true" role="checkbox" class="storecheck">
						 	<span class="back_check">
						 		<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_check--3-_9ZRQGKX"><path d="M12.945 4L14.1 5.154 6.387 12.8 2 8.4l1.155-1.153 3.232 3.246L12.945 4z" fill="#C7CACD"></path></svg>
						 	</span>
						</button>
						<div class="storename">
							<a href="https://smartstore.naver.com/customerfordaily?NaPm=ct%3Dlj55liuu%7Cci%3Dcheckout%7Ctr%3Dmyc%7Ctrx%3Dnull%7Chk%3Da2fbaea4a1ba52603020429eaabb2d7911a776f5">
								CustomerDaily
								<span>
									<svg width="22" height="20" viewBox="0 0 22 20" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12.505 18.5a.75.75 0 0 0 1.5 0h-1.5zm.75-6.002h.75a.75.75 0 0 0-.75-.75v.75zm-5.003 0v-.75a.75.75 0 0 0-.75.75h.75zm-.75 6.002a.75.75 0 0 0 1.5 0h-1.5zm12.476-6.756a.75.75 0 0 0 1.059-1.063l-1.059 1.063zM10.758 1.5l.53-.531a.75.75 0 0 0-1.059 0l.53.531zM.471 10.681a.75.75 0 0 0 1.058 1.063L.471 10.681zM14.005 18.5v-6.002h-1.5V18.5h1.5zm-.75-6.752H8.252v1.5h5.003v-1.5zm-5.753.75V18.5h1.5v-6.002h-1.5zm13.535-1.817L11.287.97 10.23 2.03l9.749 9.713 1.059-1.063zM10.229.968L.471 10.681l1.058 1.063 9.758-9.712L10.23.968z" fill="#242424"></path><path d="M2.499 18.5a.75.75 0 0 0 1.5 0h-1.5zm1.5-9.505a.75.75 0 1 0-1.5 0h1.5zm15.007 0a.75.75 0 0 0-1.5 0h1.5zm-1.5 9.503a.75.75 0 0 0 1.5 0h-1.5zM4 18.5V8.995H2.5V18.5H4zm13.507-9.504v9.502h1.5V8.996h-1.5z" fill="#242424"></path></svg>
								</span>
							</a>
						</div>
					</div>
				</div>
				<div class="totalp_box">
					<div class="p_box">
						<div class="pcheck">
							<button type="button" class="p_btn" role="checkbox" aria-checked="true">
						 	<span>
						 		<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_check--3-_9ZRQGKX"><path d="M12.945 4L14.1 5.154 6.387 12.8 2 8.4l1.155-1.153 3.232 3.246L12.945 4z" fill="#C7CACD"></path></svg>
						 	</span>
						</button>
						</div>
						<div class="fl product_box">
							<div class="product">
								<div class="imforp">
									<div class="fl pimg">
										<img src="https://shop-phinf.pstatic.net/20200418_185/1587177491423jftcj_JPEG/24540879945101569_322730714.jpg?type=f500_500"/>
									</div>
									<div class="p_txt">
										<div class="title">
											월드온 NBR 요가매트 30mm 25mm 필라테스 매트 운동
										</div>
										<div class="pprice">29,900원</div>
										<div class="smart_name">
											<a href="https://smartstore.naver.com/customerfordaily?NaPm=ct%3Dlj5bgq2l%7Cci%3Dcheckout%7Ctr%3Dmyc%7Ctrx%3Dnull%7Chk%3Dcd9e317636609c3dcfcda094f4894c9f32fd5480">CustomerDaily</a>
											<span class="smart_store">스마트스토어</span>
										</div>
									</div>
									<button type="button" class="like_icon" >
										<svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M12.3254 24C18.9529 24 24.3254 18.6274 24.3254 12C24.3254 5.37258 18.9529 0 12.3254 0C5.69802 0 0.325439 5.37258 0.325439 12C0.325439 18.6274 5.69802 24 12.3254 24Z" fill="black" fill-opacity="0.15"></path><path d="M11.3072 8.67807C10.7551 8.14078 10.0217 7.84619 9.24447 7.84619C8.46578 7.84619 7.73383 8.14078 7.18354 8.67778C6.03946 9.78922 6.03946 11.6001 7.18324 12.7133L12.3149 17.6345L17.6113 12.5573C18.6119 11.4527 18.5583 9.73932 17.4675 8.67807C16.9166 8.14078 16.1844 7.84619 15.4063 7.84619C14.6267 7.84619 13.8939 8.14078 13.3427 8.67778L11.0767 10.8587C10.7962 11.1232 10.6418 11.4748 10.6418 11.8471C10.6418 12.2196 10.7962 12.5712 11.0764 12.836C11.656 13.383 12.601 13.383 13.1817 12.836L15.3909 10.7195" stroke="white"></path></svg>
									</button>
									<a class="link_home" href="https://smartstore.naver.com/customerfordaily?NaPm=ct%3Dlj5bgq2l%7Cci%3Dcheckout%7Ctr%3Dmyc%7Ctrx%3Dnull%7Chk%3Dcd9e317636609c3dcfcda094f4894c9f32fd5480"></a>
								</div>
							</div>
						</div>
						<div class=" fl order_table">
							<div class="num_box">
								<div class="order_num">상품 주문 수량 : 1개</div>
							</div>
							<button type="button" class="order_correction">주문수정</button>
						</div>
						<div class="fl price_box">
							<div class="pwon">
								<span>상품금액</span>
								<em>
									<span class="money">29,900원</span>
								</em>
							</div>
							<div class="order_start">
								<button type="button" class="order_gobtn">주문하기</button>
							</div>
						</div>
						<div class="fl deli_pricebox">
							<div class="deli_pbox">
								<span class="deli_pboxspan">배송비
									 <em>
										<span class="money2">3,000원</span>
									</em>
								</span>
								
							</div>
						</div>
								<div style="clear:both;"></div>
					</div>
					<div class="p_box">
						<div class="pcheck">
							<button type="button" class="p_btn" role="checkbox" aria-checked="true">
						 	<span>
						 		<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_check--3-_9ZRQGKX"><path d="M12.945 4L14.1 5.154 6.387 12.8 2 8.4l1.155-1.153 3.232 3.246L12.945 4z" fill="#C7CACD"></path></svg>
						 	</span>
						</button>
						</div>
						<div class="fl product_box">
							<div class="product">
								<div class="imforp">
									<div class="fl pimg">
										<img src="https://shop-phinf.pstatic.net/20200418_185/1587177491423jftcj_JPEG/24540879945101569_322730714.jpg?type=f500_500"/>
									</div>
									<div class="p_txt">
										<div class="title">
											월드온 NBR 요가매트 30mm 25mm 필라테스 매트 운동
										</div>
										<div class="pprice">29,900원</div>
										<div class="smart_name">
											<a href="https://smartstore.naver.com/customerfordaily?NaPm=ct%3Dlj5bgq2l%7Cci%3Dcheckout%7Ctr%3Dmyc%7Ctrx%3Dnull%7Chk%3Dcd9e317636609c3dcfcda094f4894c9f32fd5480">CustomerDaily</a>
											<span class="smart_store">스마트스토어</span>
										</div>
									</div>
									<button type="button" class="like_icon" >
										<svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M12.3254 24C18.9529 24 24.3254 18.6274 24.3254 12C24.3254 5.37258 18.9529 0 12.3254 0C5.69802 0 0.325439 5.37258 0.325439 12C0.325439 18.6274 5.69802 24 12.3254 24Z" fill="black" fill-opacity="0.15"></path><path d="M11.3072 8.67807C10.7551 8.14078 10.0217 7.84619 9.24447 7.84619C8.46578 7.84619 7.73383 8.14078 7.18354 8.67778C6.03946 9.78922 6.03946 11.6001 7.18324 12.7133L12.3149 17.6345L17.6113 12.5573C18.6119 11.4527 18.5583 9.73932 17.4675 8.67807C16.9166 8.14078 16.1844 7.84619 15.4063 7.84619C14.6267 7.84619 13.8939 8.14078 13.3427 8.67778L11.0767 10.8587C10.7962 11.1232 10.6418 11.4748 10.6418 11.8471C10.6418 12.2196 10.7962 12.5712 11.0764 12.836C11.656 13.383 12.601 13.383 13.1817 12.836L15.3909 10.7195" stroke="white"></path></svg>
									</button>
									<a class="link_home" href="https://smartstore.naver.com/customerfordaily?NaPm=ct%3Dlj5bgq2l%7Cci%3Dcheckout%7Ctr%3Dmyc%7Ctrx%3Dnull%7Chk%3Dcd9e317636609c3dcfcda094f4894c9f32fd5480"></a>
								</div>
							</div>
						</div>
						<div class=" fl order_table">
							<div class="num_box">
								<div class="order_num">상품 주문 수량 : 1개</div>
							</div>
							<button type="button" class="order_correction">주문수정</button>
						</div>
						<div class="fl price_box">
							<div class="pwon">
								<span>상품금액</span>
								<em>
									<span class="money">29,900원</span>
								</em>
							</div>
							<div class="order_start">
								<button type="button" class="order_gobtn">주문하기</button>
							</div>
						</div>
						<div class="fl deli_pricebox">
							<div class="deli_pbox">
								<span class="deli_pboxspan">배송비
									 <em>
										<span class="money2">3,000원</span>
									</em>
								</span>
								
							</div>
						</div>
								<div style="clear:both;"></div>
					</div>
					<div style="clear:both;"></div>
				<div class="total_price">
					<div class="pay_total">
						<div class="pay_calc">
							<div class="choose_price">
								<span class="choose_pricespan">선택상품금액</span>
								<em>
									<span class="money3">29,900원</span>
								</em>
							</div>
							<span class="plus">
								<svg width="15" height="14" viewBox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill="#C7C7C7" d="M.502 6h14v2h-14z"></path><path fill="#C7C7C7" d="M6.502 0h2v14h-2z"></path></svg>
							</span>
							<div class="total_paydeli">
								<span class="paydeli_span">총 배송비</span>
								<em>
									<span class="money4">3,000원</span>
								</em>
							</div>
							<span class="minus">
								<svg width="15" height="2" viewBox="0 0 15 2" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill="#C7C7C7" d="M.502 0h14v2h-14z"></path></svg>
							</span>
							<div class="discount">
								<span class="discount_span">할인예상금액</span>
								<em>
									<span class="money5">0원</span>
								</em>
							</div>
						</div>
						<div class=total_payarea>
							<div class="payarea_inner">
								<div class="price_area">
									<span class="total_payspan">주문금액</span>
									<em>
										<span class="money6">32,900원</span>
									</em>
								</div>
								
							</div>
						</div>
					</div>
					<div class="link_payment">
							<a class="link_buy">
								<em>CustomerDaily</em>
								 &nbsp;
								 1
								 건 주문하기
							</a>
						</div>
				</div>
			<div style="clear:both;"></div>
				</div>
			<div style="clear:both;"></div>
			</div>
		</div>
	</div>
	<div class="explanation">
		<div>장바구니 상품은
			<em>최대 30일간 저장</em>
			됩니다.
		</div>
		<div>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</div>
		<div>오늘출발 정보는 판매자가 설정한 정보에 의해 제공되며, 물류위탁 상품인 경우 물류사의 사정에 따라 실제와 다를 수 있습니다.</div>
		<div>일부 상품의 경우 카드 할부기간이 카드사 제공 기간보다 적게 제공될 수 있습니다.</div>
	</div>
	<div class="buttom_orderarea">
		<div class="payment_bar">
			<div class="payment_content">
				<button type="button" class="paycon_txt">
					<span class="paycon_span">총 주문금액</span>
					<em>
						<span class="money7">32,900원</span>
						<svg width="16" height="17" viewBox="0 0 16 17" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico--3qz69NgEHC"><path opacity="0.9" d="M5.02414 10.3285L4.57129 9.84852L7.99986 6.21426L11.4284 9.84852L10.9756 10.3285L7.99986 7.1743L5.02414 10.3285Z" fill="white" stroke="white" stroke-width="0.5"></path><rect x="0.5" y="1" width="15" height="15" rx="7.5" stroke="white" stroke-opacity="0.6"></rect></svg>
					</em>
				</button>
				<button class="click_totalbtn">
				총 주문하기 
					<span>1</span>
				</button>
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
</body>
</html>












