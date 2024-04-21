<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="../css/Login.css"/>
	<script src="../js/jquery-3.7.0.min.js"></script>
	<script>
		$(function() {
			$(".preparing").click(function() {
				alert("준비중입니다.");
			});
			$(".btn_delete").click(function () {
				$("#id").val("");
			});
			$(".btn_delete").click(function () {
				$("#pw").val("");
			});
		});
		
	</script>
</head>
<body>
	<div class= "header">
		<div class= "header-center">
			<div class= "header-logo"></div>
			<div class="header-lang">
				<select class="droplang">
					<option value="kr">한국어</option>
					<option value="eng">English</option>
					<option value="ch">中文(简体)</option>
					<option value="tw">中文(简体)</option>
				</select>
			</div>
		</div>
	</div>
	<!-- 센터  -->
	<div class="center">
		<div class="login">
			<div class="logintop">
				<div class="loginmenu">
					<div class="menu_st">
						<span class="menu_text">
							<span>ID로그인</span>
						</span>
					</div>
				</div>
				<div class="loginmenu">
					<div class="menu_nd preparing">
						<span class="menu_text">
							<span class="textco">일회용 번호</span>
						</span>
					</div>
				</div>
				<div class="loginmenu">
					<div class="menu_th preparing">
						<span class="menu_text">
							<span class="textco">QR코드</span>
						</span>
					</div>
				</div>
			</div>
			<div class="login_center">
				<div class="center_inner">
					<div class="top_msg">
						<span class="msg_text">
							네이버에 로그인하여
							<em class="accent">네이버 커머스 ID</em>
							서비스를<br/>
							이용하실 수 있습니다.
						</span>
						<br/>
						<br/>
						<span>
						공용 PC에서 사용하시는 경우 보안을 위해 서비스 이용 후  
						<br/>
						네이버에서도 반드시 로그아웃해 주세요.
						</span>
					</div>
					<form method="post" action="LoginAction.jsp">
						<div class="login_text">
							<div class="id_input">
								<div class="icon_cell"></div>
									<span class="id_icon"></span>
									<input type="text" name="id" id="id" placeholder="아이디" class="input_text">
									<span class="btn_delete">
										<span class="btnicon">
										</span>
									</span>
			
							</div>
							<div class="pw_input">
								<div class="icon_cell"></div>
									<span class="pw_icon"></span>
									<input type="password" id="pw" name="pw" placeholder="비밀번호" class="input_text">
									<span class="btn_delete">
										<span class="btnicon"></span>
									</span>
							</div>
						</div>
					
					<div class="keep_login">
						<div class="keep_click">
								<input type="checkbox" id="keep" name="keep_log" class="keep_box"/>
							<label for="keep" class="keep_text">
								로그인 상태 유지
							</label>
						</div>
					</div>
					<div class="login_btn">
						<input type="submit" class="click_login" id="login_success" value="로그인"/>
					</div>
					</form>	
					</div>
				</div>
			</div>
			<div class="find_menu">
				<div class="find_cell">
					<div class="find_text fl">
						<a class="find_font" href="findpw.html">
							비밀번호 찾기
						</a>
					</div>
					<div class="find_text fl">
						<a class="find_font" href="findId.html">아이디 찾기</a>
					</div>
					<div class="find_text fl">
						<a class="find_font" href="signup.html">회원가입</a>
					</div>
				</div>
			</div>
			
			<div class="banner">
				<div class="bannerpt">
					<img src="../Images/loginbanner.png"/>
				</div>
			</div>
		</div>
		
		<!-- 푸터 -->
		<div class="footer">
			<div class="footer_inner">
				<ul class="footer_link">
					<li><a href="https://policy.naver.com/rules/service.html" class="footer_itme">
						<span class="footer_text">이용약관</span>
					</a></li>
					<li>
						<a class="footer_item" href="http://www.naver.com/rules/privacy.html"><span class="footer_text"><strong>개인정보처리방침</strong></span></a>
					</li>
					<li>
						<a class="footer_item" href="http://www.naver.com/rules/disclaimer.html"><span class="footer_text">책임의 한계와 법적고지</span></a>
					</li>
					<li>
						<a class="footer_item" href="https://help.naver.com/support/service/main.nhn?serviceNo=532"><span class="footer_text">회원정보 고객센터</span></a>
					</li>
				</ul>
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
		<div style="clear:both;"></div>
</body>
</html>