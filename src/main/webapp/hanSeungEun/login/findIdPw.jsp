<%@page contentType="text/html;charset=EUC-KR"%>

<jsp:setProperty property="*" name="findIdFrom"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findId.css">
<title>���̵� ã��</title>

<script>     
     function login() {
        window.location.href = 'login.jsp';
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
        <form name="findIdFrom" method="post" action="findProc.jsp">
            <p>��ϵ� ȸ�������� �Է����ּ���.</p>
            <div class="name_input center">
                <span class="span_font">�̸�</span>
                <input id="name" name="name" placeholder="�̸� �Է�">
            </div>
            <div class="email_input center">
                <span class="span_font">�̸���</span>
                <input id="email" name="email" type="email" placeholder="�̸��� �Է�">
            </div>
            <input type="submit" class="center btn_next" value="����">
        </form>
    </section>
    
     <section id="content2">
        <form>
            <p>��ϵ� ȸ�������� �Է����ּ���.</p>
            <div class="name_input center">
                <span class="span_font">�̸�</span>
                <input type="id" placeholder="�̸� �Է�">
            </div>
            <div class="email_input center">
                <span class="span_font">�̸���</span>
                <input type="email" placeholder="�̸��� �Է�">
            </div>
            <div class="id_input center">
                <span class="span_font">���̵�</span>
                <input type="id" placeholder="���̵� �Է�">
            </div>
            <button class="center btn_next">����</button>
        </form>
    </section>
    </div><!-- main -->
</body>
       
</html>

