<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findId.css">
<title>���̵� ã��</title>

<script>
	//���̵� ã�⿡�� ���� ��ư ������ �� div ����
     function setInnerHTML() {
     const element = document.getElementById('content1');
        element.innerHTML 
         = '<div class="center id_out">����� ���̵�� <input></input> �Դϴ�.</div>' +
           '<div class="center"><button type="button" class="btn_login" onclick="login()">�α���</button></div>'
     } 
     // �α��� ��ư ������ �� �α��� ������ �̵�      
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
                <input id="name" placeholder="�̸� �Է�">
            </div>
            <div class="email_input center">
                <span class="span_font">�̸���</span>
                <input id="email" type="email" placeholder="�̸��� �Է�">
            </div>
            <input type="button" id="btn_next" class="center" onclick="setInnerHTML()" value="����">
        </form>
    </section>
    </div><!-- main -->
</body>
       
</html>

