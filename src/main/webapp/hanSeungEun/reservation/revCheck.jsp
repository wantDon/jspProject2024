<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findRev.css">
<title>예약조회</title>
</head>
<body>
<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">예약조회</label>
    <section id="content1">
        <form name="findRevFrom" method="post" action="revCheckProc.jsp">
            <p>예약 시 작성했던 회원정보를 입력해주세요.</p>
             <div class="revNum_input center">
                <span class="span_font">예약번호</span>
                <input name="num" placeholder="예약번호 입력">
            </div>
            <div class="name_input center">
                <span class="span_font">이름</span>
                <input name="name" placeholder="이름 입력">
            </div>
            <div class="phone_input center">
                <span class="span_font">전화번호</span>
                <input name="phonenum" placeholder="전화번호 입력">
            </div>
            <div class="phone_input center">
                <span class="span_font">비밀번호</span>
                <input name="pwd" placeholder="비밀번호 입력">
            </div>
            <div class="center" style="display:block">
                <input type="submit" id="btn_ok" value="확인">
        		<button type="button" class="btn_scRev" onclick="window.location.href='findRev.jsp'">예약번호 찾기</button>
            </div>
        </form>
    </section>
</div>
</body>
</html>