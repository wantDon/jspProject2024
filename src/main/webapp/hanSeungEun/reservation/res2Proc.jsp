<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="rMgr" class="hanSeungEun.ReservationMgr" />
<jsp:useBean id="bean" class="hanSeungEun.ReservationBean" />
<jsp:setProperty property="*" name="bean"/>

<%
    // 콤보 박스에서 선택된 지점명
    String branchName = request.getParameter("branch");

    // 선택된 지점에 따라서 ID 설정
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
	String msg = "예약에 실패했습니다." ;
	String location = "reservation2.jsp";
	if(result){
		msg = "예약을 완료했습니다.";
		location = "reservation2.jsp";
	}
%>

<script type = "text/javascript">
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>