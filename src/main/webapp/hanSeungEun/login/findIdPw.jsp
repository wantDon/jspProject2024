<%@page contentType="text/html;charset=EUC-KR"%>

<jsp:setProperty property="*" name="findIdFrom"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findId.css">
<title>아이디 찾기</title>

<script>     
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
                <input id="name" name="name" placeholder="이름 입력">
            </div>
            <div class="email_input center">
                <span class="span_font">이메일</span>
                <input id="email" name="email" type="email" placeholder="이메일 입력">
            </div>
            <input type="submit" class="center btn_next" value="다음">
        </form>
    </section>
    
     <section id="content2">
        <form>
            <p>등록된 회원정보를 입력해주세요.</p>
            <div class="name_input center">
                <span class="span_font">이름</span>
                <input type="id" placeholder="이름 입력">
            </div>
            <div class="email_input center">
                <span class="span_font">이메일</span>
                <input type="email" placeholder="이메일 입력">
            </div>
            <div class="id_input center">
                <span class="span_font">아이디</span>
                <input type="id" placeholder="아이디 입력">
            </div>
            <button class="center btn_next">다음</button>
        </form>
    </section>
    </div><!-- main -->
</body>
       
</html>

