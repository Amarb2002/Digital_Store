<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if (session.getAttribute("uname") != null) {
%>
<title>your page is loading...</title>
<%@page import="java.sql.*"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s" property="conn"/>
<%
            String s_id=request.getParameter("s_id");
            int z = s.stm.executeUpdate("DELETE FROM services WHERE s_id='" + s_id + "'");
            out.println("<script> alert('Service deleted..'); document.location='home.jsp';</script>");
   
%>
<%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
