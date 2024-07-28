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
            String u_id=request.getParameter("u_id");
         
    ResultSet rs = s.stm.executeQuery("SELECT * FROM users WHERE u_id='" + u_id + "'");
    if(rs.next()){
      String email=rs.getString("email");
            int z = s.stm.executeUpdate("DELETE FROM users WHERE u_id='" + s_id + "'");
            int x = s.stm.executeUpdate("DELETE FROM login WHERE username='" + email + "'");
            out.println("<script> alert('User deleted..'); document.location='users.jsp';</script>");
          }
   
%>
<%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
