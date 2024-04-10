<%@page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="uMgr" class="hanSeungEun.UserMgr" />

<%
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   int mode = uMgr.loginMember(id, pwd);

   if(mode==0){
      response.sendRedirect("logError.jsp?mode=0");
   }else if(mode==1){
      response.sendRedirect("logError.jsp?mode=1");
   }else if(mode==2){
      session.setAttribute("idKey",id);
      response.sendRedirect("../index.jsp");
   }
%>
