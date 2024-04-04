<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="uMgr" class = "hanSeungEun.UserMgr"></jsp:useBean>
<% 
	String id = request.getParameter("id");
	boolean result = uMgr.checkId(id);
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="join.css">
    <title>회원가입</title>
    
    <script type="text/javascript" src="script.js"></script>
	<script type="text/javascript">
		function idCheck(id) {
			if(id==""){
				alert("아이디를 입력하세요.");
				document.regFrm.id.focus();
				return;//이후에 코드를 실행이 안됨. 함수를 빠져나감.
			}

		}
	</script>
	
</head>

<body class="allstyles vertical_center">
    <div class="wrap center ">
        <div class="logo_wrap">
            <a href="index.jsp"><img src="img/logo.png" alt="로고" class="img_logo"></a>
        </div><!--logo_wrap-->
       <form name="joinFrm" method="post" action="userProc.jsp">
            <div class="inner center">
                <label>아이디</label>
                <input placeholder="아이디" name="id" >
                <button type="submit" onClick="idCheck(this.form.id.value)">중복</button>
                <div class="idCheck_alert"></div>
                <label>비밀번호</label>
                <input type="password" placeholder="비밀번호" name="pwd">
            </div>

            <div class="inner center">
                <label>이름</label>
                <input placeholder="이름" class="position" name="name">
                <div class="select">
                    <label>성별</label>
                    <input type="radio" value="2" name="gender" id="gender2"><label for="gender2">여자</label>
                    <input type="radio" value="1" name="gender" id="gender1"><label for="gender1">남자</label>
                </div>
                <label>생년월일</label>
                <input placeholder="19900101" name="birth">
                <label>이메일</label>
                <input placeholder="이메일" name="email">
                <button>인증</button>
                <label>휴대번호</label>
                <input placeholder="'-'빼고 입력" name="phone">
            </div>
            <div class="btn_wrap center">
                <input type="submit" value="회원가입" class="btn_join" onclick="inputCheck()">
            </div>
       </form>
    </div>
</body>
</html>