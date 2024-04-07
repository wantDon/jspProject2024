<%@page import="kimJeongTae.ReservationBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="mgr" class="kimJeongTae.TrainScheduleMgr"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	ReservationBean bean = new ReservationBean();

	bean.setUser(1);
	bean.setPhonenum(request.getParameter("phonNum"));
	bean.setEmail(request.getParameter("email"));
	bean.setPopulation(Integer.parseInt(request.getParameter("population")));
	bean.setCarflag(Boolean.parseBoolean(request.getParameter("parking")));
	bean.setReservdate(request.getParameter("reservationDate"));
	mgr.updateReservationBean(bean);
	response.sendRedirect("myPage.jsp");
%>


</body>
</html>