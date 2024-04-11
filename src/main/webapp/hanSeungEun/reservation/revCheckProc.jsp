<%@ page import="hanSeungEun.ReservationBean" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="rMgr" class="hanSeungEun.ReservationMgr" />
<jsp:useBean id="uMgr" class="hanSeungEun.UserMgr" />
<jsp:useBean id="uBean" class="hanSeungEun.UserBean" />
<jsp:useBean id="bean" class="hanSeungEun.ReservationBean" />  
<%	
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String phonenum = request.getParameter("phonenum");
	String pwd = request.getParameter("pwd");
	ReservationBean result = rMgr.checkRev(Integer.parseInt(num), name, phonenum, pwd);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나의 예약 정보</title>
<link rel="stylesheet" href="revCheckProc.css">
</head>
<body>
<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">나의 예약 정보</label>
    <section id="content1">
            <p>회원님의 예약정보입니다.</p>
            <div class="revOut center" id="num">
                <span class="span_font">회원번호</span>
                <span class= "result"><%= result.getNum() %></span>
            </div>
            <div class="revOut center" id="name">
                <span class="span_font">이름</span>
                <span class= "result"><%= result.getName() %></span>
            </div>
            <div class="revOut center" id="phone">
                <span class="span_font">전화번호</span>
                <span class= "result"><%= result.getPhonenum() %></span>
            </div>
            <div class="revOut center" id="population">
                <span class="span_font">예약인원</span>
                <span class= "result"><%= result.getPopulation() %></span>
            </div>
            <div class="revOut center" id="frnum">
                <span class="span_font">지점번호</span>
                <span class= "result"><%= result.getFrnum() %></span>
            </div>
            <div class="revOut center" id="date">
                <span class="span_font">날짜</span>
                <span class= "result"><%= result.getReservdate() %></span>
            </div>
            <div class="revOut center" id="time">
                <span class="span_font">시간</span>
                <span class= "result"><%= result.getTime() %></span>
            </div>
            <button type="button" class="btn_ok center" onclick="window.location.href='reservation2.jsp'">확인</button>
    </section>
</div>
</body>
</html>