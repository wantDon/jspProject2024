<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="uMgr" class="hanSeungEun.UserMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="findId.css">
<title>��й�ȣ ã��</title>
</head>
<body>
	<div class="main vertical_center">
	    <input id="tab1" type="radio" name="tabs" checked>
	    <label for="tab1">���̵� ã��</label>
	
	    <input id="tab2" type="radio" name="tabs">
	    <label for="tab2">��й�ȣ ã��</label>
	
		 <section id="content2">
	        <form name="findPwFrom" method="post" action="sucessProc.jsp">
	        	<div class="pwd_input center">
	                <span class="span_font">��й�ȣ</span>
	                <input name="pwd" placeholder="��й�ȣ �Է�">
	            </div>
	            <input type="submit" class="center btn_next" value="Ȯ��">
	        </form>
	    </section>
    </div><!-- main -->
</body>
</html>