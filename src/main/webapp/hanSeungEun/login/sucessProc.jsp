<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="Umgr" class = "hanSeungEun.UserMgr"/>
<jsp:useBean id="bean" class = "hanSeungEun.UserBean"/>
<jsp:setProperty name="mBean" property="*" />

<% 
	String msg = "��й�ȣ�� �����Ǿ����ϴ�."+
			     "�ٽ� �α������ּ���." ;		
	String location = "login/login.jsp";
%>
<script type = "text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>