<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if (session.getAttribute("uname") != null) {
%>

    <title>accepting...</title>
    <%@page import="java.sql.*"%>
    <%@page import="Digi.DoorStep_DB"%>
    <jsp:useBean id="s" class="Digi.DoorStep_DB"/>
    <jsp:getProperty name="s" property="conn"/>
    <%@page import="java.sql.*"%>
    <%@page import="Digi.DoorStep_DB"%>
    <jsp:useBean id="s1" class="Digi.DoorStep_DB"/>
    <jsp:getProperty name="s1" property="conn"/>
        <%@page import="java.sql.*"%>
    <%@page import="Digi.DoorStep_DB"%>
    <jsp:useBean id="s2" class="Digi.DoorStep_DB"/>
    <jsp:getProperty name="s2" property="conn"/>
                <%
                    String b_id=request.getParameter("b_id");
                    String user = session.getAttribute("uname").toString();
                    String status="Delivered    ";
                    ResultSet rs1 = s.stm.executeQuery("SELECT * FROM users WHERE email='" + user + "'");
                    if (rs1.next()) {
                        ResultSet rs = s1.stm.executeQuery("SELECT * FROM booking WHERE b_id='" + b_id + "'");
                        if(rs.next()){
                        
                    
                            
                        int z1 = s2.stm.executeUpdate("UPDATE booking SET status = '"+status+"' WHERE b_id = '"+b_id+"'");


                    }} else {
                        out.println("<script>alert('agents invalid'); history.back();</script>");
                    }
                 %>
                 <script> document.location='mybooking.jsp';</script>
                 <%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
