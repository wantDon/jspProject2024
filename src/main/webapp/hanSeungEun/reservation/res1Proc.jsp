<!-- ȸ�� ���� proc -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="rMgr" class="hanSeungEun.ReservationMgr" />
<jsp:useBean id="bean" class="hanSeungEun.ReservationBean" />
<jsp:useBean id="uMgr" class="hanSeungEun.UserMgr" />
<jsp:useBean id="uBean" class="hanSeungEun.UserBean" />
<jsp:setProperty property="*" name="bean"/>

<% 
	//�α��ε� ���̵� ������
	String id = (String)session.getAttribute("idKey");
	//System.out.print(id);
	request.setCharacterEncoding("EUC-KR");
	boolean result = rMgr.inRes(bean, id);
	String msg = "���࿡ �����߽��ϴ�." ;
	String location = "reservation1.jsp";
	if(result){
		msg = "������ �Ϸ��߽��ϴ�.";
		location = "reservation1.jsp";
	}
%>

<script type = "text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>