<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findRev.css">
<title>�����ȣ ã��</title>
</head>
<body>
<div class="main vertical_center">
    <input id="tab1" type="radio" name="tabs" checked>
    <label for="tab1">�����ȣ ã��</label>
    <section id="content1">
        <form name="findRevFrom" method="post" action="findRevProc.jsp">
            <p>���� �� �ۼ��ߴ� ȸ�������� �Է����ּ���.</p>
            <div class="name_input center">
                <span class="span_font">�̸�</span>
                <input name="name" placeholder="�̸� �Է�">
            </div>
            <div class="phone_input center">
                <span class="span_font">��ȭ��ȣ</span>
                <input name="phonenum" placeholder="��ȭ��ȣ �Է�">
            </div>
            <div class="phone_input center">
                <span class="span_font">��й�ȣ</span>
                <input name="pwd" placeholder="��й�ȣ �Է�">
            </div>
            <input type="submit" id="btn_ok" class="center" onclick="setInnerHTML()" value="Ȯ��">
        </form>
    </section>
</div>
</body>
</html>