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
            String a_id=request.getParameter("a_id");

    ResultSet rs = s.stm.executeQuery("SELECT * FROM agents WHERE a_id='" + a_id + "'");
    if(rs.next()){
      String email=rs.getString("email_id");
            int z = s.stm.executeUpdate("DELETE FROM agents WHERE a_id='" + a_id + "'");
            int x = s.stm.executeUpdate("DELETE FROM login WHERE username='" + email + "'");
            out.println("<script> alert('Agent deleted..'); document.location='agents.jsp';</script>");
          }
   
%>
<%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
