<%@page contentType="text/html;charset=EUC-KR"%>
<%
	String Path=request.getContextPath() + "/hanSeungEun/script.jsp";
%>
<jsp:setProperty property="*" name="findIdFrom"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findId.css">
<title>���̵� ã��</title>
<script type="text/javascript" src="<%=Path%>"></script>
<script>     
     function login() {
        window.location.href = 'login.jsp';
     }
     
</script>

</head>
<body onLoad="findIdFrom.name.focus()">
	<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">���̵� ã��</label>

    <input id="tab2" type="radio" name="tabs">
    <label for="tab2" onclick="findPw()">��й�ȣ ã��</label>

    <section id="content1">
        <form name="findIdFrom" method="post" action="findIdProc.jsp">
            <p>��ϵ� ȸ�������� �Է����ּ���.</p>
            <div class="name_input center">
                <span class="span_font">�̸�</span>
                <input id="name" name="name" placeholder="�̸� �Է�">
            </div>
            <div class="email_input center">
                <span class="span_font">�̸���</span>
                <input id="email" name="email" type="email" placeholder="�̸��� �Է�">
            </div>
            <input type="submit" class="center btn_next" value="����" onclick="inputCheck1()">
        </form>
    </section>
    
        <section id="content2">
        <form name="findIPwFrom" method="post" action="findIdProc.jsp">
            <p>��ϵ� ȸ�������� �Է����ּ���.</p>
            <div class="name_input center">
                <span class="span_font">�̸�</span>
                <input id="name" name="name" placeholder="�̸� �Է�">
            </div>
            <div class="email_input center">
                <span class="span_font">���̵�</span>
                <input id="email" name="email" type="email" placeholder="�̸��� �Է�">
            </div>
            <input type="submit" class="center btn_next" value="����">
        </form>
    </section>
</body>
       
</html>

