<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <title>로그인</title>
</head>
<body class="allstyles">
    <div class="wrap vertical_center">
        <div class="logo_wrap">
            <a href="index.jsp"><img src="img/logo.png" alt="로고" class="img_logo"></a>
        </div><!--logo_wrap-->

        <div class="input_wrap">
            <div class="login_wrap">
                <form method="post" action="loginProc.jsp">
                    <input type="text" name="id" class="login_box" placeholder="아이디">
                    <input type="password" name="pwd" class="border_radius_1 login_box"  placeholder="비밀번호">
                
	                <a href="#" class="find_text">아이디/비번찾기</a>
	                <div style="clear: both;"></div>
	
	                <p class="social_text">개인정보 보호를 위해 공용 PC에서 사용 후 SNS 계정의 로그아웃 상태를 반드시 확인해주세요.</p>
	
	                <div class="allcenter social_list">
	                    <a href="#" class="social_list_1"><img src="img/icon_naver.png" alt="네이버"></a>
	                    <a href="#" class="social_list_1"><img src="img/icon_kakao.png" alt="카카오"></a>
	                    <a href="#" class="social_list_1"><img src="img/icon_google.png" alt="구글"></a>
	                </div>
	
	                <input type = "submit" class="allcenter btn_login" value = "로그인">
	                <div style="margin-top: 5px;"><a href="join.jsp" class="text_link">회원가입</a></div>
                </form>
            </div><!--login_wrap-->
        </div><!--input_wrap-->
    </div><!--wrap-->
</body>
</html>
