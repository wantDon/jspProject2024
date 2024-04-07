<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<jsp:useBean id="mgr" class="kimJeongTae.TrainScheduleMgr"/>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	mgr.deleteReservationBean(1);
	response.sendRedirect("myPage.jsp");


%>
</body>
</html>