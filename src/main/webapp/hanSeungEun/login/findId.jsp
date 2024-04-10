<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findId.css">
<title>아이디 찾기</title>

<script>
	//아이디 찾기에서 다음 버튼 눌렀을 때 div 변경
     function setInnerHTML() {
     const element = document.getElementById('content1');
        element.innerHTML 
         = '<div class="center id_out">당신의 아이디는 <input></input> 입니다.</div>' +
           '<div class="center"><button type="button" class="btn_login" onclick="login()">로그인</button></div>'
     } 
     // 로그인 버튼 눌렀을 때 로그인 페이지 이동      
     function login() {
        window.location.href = 'login.jsp';
     }
</script>

</head>
<body>
	<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">아이디 찾기</label>

    <input id="tab2" type="radio" name="tabs">
    <label for="tab2">비밀번호 찾기</label>

    <section id="content1">
        <form name="findIdFrom" method="post" action="findProc.jsp">
            <p>등록된 회원정보를 입력해주세요.</p>
            <div class="name_input center">
                <span class="span_font">이름</span>
                <input id="name" placeholder="이름 입력">
            </div>
            <div class="email_input center">
                <span class="span_font">이메일</span>
                <input id="email" type="email" placeholder="이메일 입력">
            </div>
            <input type="button" id="btn_next" class="center" onclick="setInnerHTML()" value="다음">
        </form>
    </section>
    </div><!-- main -->
</body>
       
</html>

