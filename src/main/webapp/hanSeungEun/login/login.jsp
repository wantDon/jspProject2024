<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String path=request.getContextPath() + "/jeongJiYoon/HomePage.jsp";
%>
      
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <title>로그인</title>
    
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
</head>
<body class="allstyles">
    <div class="wrap vertical_center">
        <div class="logo_wrap">
            <a href="<%=path%>"><img src="../img/logo.png" alt="로고" class="img_logo"></a>
        </div><!--logo_wrap-->

        <div class="input_wrap">
            <div class="login_wrap" style="padding-top:20px">
                <form method="post" action="loginProc.jsp">
                    <input type="text" name="id" class="login_box" placeholder="아이디" style="width:99%">
                    <input type="password" name="pwd" class="border_radius_1 login_box"  placeholder="비밀번호" style="width:99%">
                
	                <a href="findIdPw.jsp" class="find_text">아이디/비번찾기</a>
	                <div style="clear: both;"></div>
	
	                <p class="social_text">개인정보 보호를 위해 공용 PC에서 사용 후 SNS 계정의 로그아웃 상태를 반드시 확인해주세요.</p>
	
	                <div class="allcenter social_list">
	                    <a href="javascript:void(0)" id="naverIdLogin_loginButton" class="social_list_1"><img src="../img/icon_naver.png" alt="네이버"></a>
	                    <a href="javascript:void(0)" class="social_list_1"><img src="../img/icon_kakao.png" alt="카카오" onclick="kakaoLogin()"></a>
	                    <a href="#" class="social_list_1"><img src="../img/icon_google.png" alt="구글"></a>
	                </div>
	
	                <input type = "submit" class="allcenter btn_login" value = "로그인">
	                <div style="margin-top: 5px;"><a href="../join.jsp" class="text_link">회원가입</a></div>
                </form>
            </div><!--login_wrap-->
        </div><!--input_wrap-->
    </div><!--wrap-->
    
    
    <!-- 네이버로그인 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "d5LTGWv1q9MJSH1J27mw", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
					callbackUrl: "http://localhost/teamProject_jsp/jeongJiYoon/HomePage.jsp", 
					// 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
					isPopup: false,
					callbackHandle: true
				}
			);	
		
		naverLogin.init();
		
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					var id = naverLogin.user.getId();
					var name = naverLogin.user.getName();
					var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
					
					console.log(naverLogin.user); 
		    		
					if( id == undefined || id == null) {
						alert("아이디는 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					if( name == undefined || name == null) {
						alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					if( mobile == undefined || mobile == null) {
						alert("휴대번호는 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					if( gender == undefined || gender == null) {
						alert("성별은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					if( birthday == undefined || birthday == null) {
						alert("생일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					if( birthyear == undefined || birthyear == null) {
						alert("생일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});		
		
		var testPopUp;
		function openPopUp() {
		    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
		}
		function closePopUp(){
		    testPopUp.close();
		}		
		function naverLogout() {
			openPopUp();
			setTimeout(function() {
				closePopUp();
				}, 1000);		
		}
		//접근 토큰 삭제 요청
		//https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=d5LTGWv1q9MJSH1J27mw&client_secret=36CqL7njdb&access_token=AAAAOXxzzaM4J02mVMleplPUzENeNiEcB58TxTJb-v6Hi4BCuzIXrN6-Af5yo_cWTTEYcRZRyhlx8NhTi_ij2NxDJrI&service_provider=NAVER
	</script>
</body>
</html>
