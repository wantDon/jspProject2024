<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="Umgr" class = "hanSeungEun.UserMgr"/> <!--db 연동을 위해 작성 -->
<% 
	String id = request.getParameter("id");
	boolean result = Umgr.checkId(id);
%>
<!doctype html>
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
				document.joinFrm.id.focus();
				return;//이후에 코드를 실행이 안됨. 함수를 빠져나감.
			}
			var alertDiv = document.getElementById("idCheck_alert");
			if (id === "true") {
                alertDiv.innerHTML = "<b>" + id + "</b>는 이미 존재하는 ID입니다.";
            } else {
                alertDiv.innerHTML = "<b>" + id + "</b>는 사용 가능합니다.";
            }
		}
	</script>
	
</head>

<body class="allstyles vertical_center" onLoad="joinFrm.id.focus()">
    <div class="wrap center ">
        <div class="logo_wrap">
            <a href="index.jsp"><img src="../img/logo.png" alt="로고" class="img_logo"></a>
        </div><!--logo_wrap-->
       <form name="joinFrm" method="post" action="userProc.jsp" onsubmit="return false;">
            <div class="inner center">
                <label>아이디</label>
                <input name="id" placeholder="아이디">
                <button type="button" onClick="idCheck(this.form.id.value)">중복</button>
                <div class="idCheck_alert" id="idCheck_alert">
				</div>
                <label>비밀번호</label>
                <input type="password" name="pwd" placeholder="비밀번호" >
            </div>
		
            <div class="inner center">
                <label>이름</label>
                <input placeholder="이름" name="name" class="position" >
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
                <input type="button" value="회원가입" class="btn_join" onclick="inputCheck()">
            </div>
       </form>
    </div>
</body>
</html>