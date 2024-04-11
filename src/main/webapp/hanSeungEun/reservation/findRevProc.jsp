<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="rMgr" class="hanSeungEun.ReservationMgr" />    
<% 
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String phonenum = request.getParameter("phonenum");
	String pwd = request.getParameter("pwd");
	int revNum = rMgr.findRev(name, phonenum, pwd);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findRev.css">
<title>�����ȣ ã��</title>
<script>
     // ���� ��ȸ ��ư ������ �� �α��� ������ �̵�      
     function revcheck() {
        window.location.href = 'revCheck.jsp';
     }
     //�����ϱ� ������ �� ���� �������� �̵�
     function rev() {
        window.location.href = 'reservation2.jsp';
     }
</script>
</head>
<body>
<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">�����ȣ ã��</label>
    <section id="content1">
        <form name="findRevFrom" method="post" action="sucessProc.jsp">
            <div class="center rev_out">����� �����ȣ�� <span><%=revNum%></span> �Դϴ�.</div>
            <div class="center">
            <button type="button" class="btn_check" onclick="revcheck()">������ȸ</button>
            <button type="button" class="btn_rev" onclick="rev()">�����ϱ�</button>
            </div>
        </form>
    </section>
</div>
</body>
</html>