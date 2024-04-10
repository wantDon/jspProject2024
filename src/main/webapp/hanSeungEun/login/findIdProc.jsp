<%@page contentType="text/html;charset=EUC-KR"%>
<jsp:useBean id="uMgr" class="hanSeungEun.UserMgr" />

<% 
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String id = uMgr.findId(name, email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findId.css">
<title>���̵� ã��</title>

<script>
     // �α��� ��ư ������ �� �α��� ������ �̵�      
     function login() {
        window.location.href = 'login.jsp';
     }
     function goBack() {
         window.history.back();
     }
</script>

</head>
<body>
	<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">���̵� ã��</label>

    <input id="tab2" type="radio" name="tabs">
    <label for="tab2">��й�ȣ ã��</label>

    <section id="content1">
        <form name="findIdFrom" method="post" action="findIdProc.jsp">
            <div class="center id_out">����� ���̵�� <span><%=id%></span> �Դϴ�.</div>
            <div class="center">
            <button type="button" class="btn_back" onclick="goBack()">�ڷΰ���</button>
            <button type="button" class="btn_login" onclick="login()">�α���</button>
            </div>
        </form>
    </section>
    </div><!-- main -->
</body>
       
</html>

