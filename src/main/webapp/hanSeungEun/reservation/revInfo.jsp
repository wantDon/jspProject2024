<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나의 예약 정보</title>
<link rel="stylesheet" href="findRev.css">
</head>
<body>
<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">나의 예약 정보</label>
    <section id="content1">
        <form name="findRevFrom" method="post" action="findRevProc.jsp">
            <p>회원님의 예약정보입니다.</p>
            <div class="phone_input center">
                <span class="span_font">회원번호</span>
                <input name="phonenum" placeholder="전화번호 입력">
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
            <input type="submit" id="btn_ok1" onclick="setInnerHTML()" value="확인">
        </form>
    </section>
</div>
</body>
</html>