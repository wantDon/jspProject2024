<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="rMgr" class="hanSeungEun.ReservationMgr" />
<jsp:useBean id="bean" class="hanSeungEun.ReservationBean" />
<jsp:setProperty property="*" name="bean"/>

<%
    // �޺� �ڽ����� ���õ� ������
    String branchName = request.getParameter("branch");

    // ���õ� ������ ���� ID ����
    int branchId = 0;
    if(branchName.equals("Los Angeles")){
        branchId = 1;
    } else if(branchName.equals("New York")){
        branchId = 2;
    } else if(branchName.equals("Seoul")){
        branchId = 3;
    }
    bean.setFrnum(branchId);
    
%>
<% 
	request.setCharacterEncoding("EUC-KR");
	boolean result = rMgr.inRes(bean);
	String msg = "���࿡ �����߽��ϴ�." ;
	String location = "reservation2.jsp";
	if(result){
		msg = "������ �Ϸ��߽��ϴ�.";
		location = "reservation2.jsp";
	}
%>

<script type = "text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>