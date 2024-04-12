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
<title>���� ���� ����</title>
<link rel="stylesheet" href="revCheckProc.css">
</head>
<body>
<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">���� ���� ����</label>
    <section id="content1">
            <p>{ <span><%= result.getName() %></span> } ȸ������ ���������Դϴ�.</p>
            <table class="center">
	            <tr>
	                <th>ȸ����ȣ</th>
	                <td><%= result.getNum() %></td>
	            </tr>
		        <tr>
		            <th>�̸�</th>
		            <td><%= result.getName() %></td>
		        </tr>
		        <tr>
		            <th>��ȭ��ȣ</th>
		            <td><%= result.getPhonenum() %></td>
		        </tr>
		        <tr>
		            <th>�����ο�</th>
		            <td><%= result.getPopulation() %></td>
		        </tr>
		        <tr>
		            <th>������ȣ</th>
		            <td><%= result.getFrnum() %></td>
		        </tr>
		        <tr>
		            <th>��¥</th>
		            <td><%= result.getReservdate() %></td>
		        </tr>   
		        <tr>
		            <th>�ð�</th>
		            <td><%= result.getTime() %></td>
		        </tr> 
            </table>
            <button type="button" class="btn_ok center" onclick="window.location.href='reservation2.jsp'">Ȯ��</button>
    </section>
</div>
</body>
</html>