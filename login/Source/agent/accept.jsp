<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if (session.getAttribute("uname") != null) {
%>

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
                    String status="";
                    ResultSet rs1 = s.stm.executeQuery("SELECT * FROM agents WHERE email_id='" + user + "'");
                    if (rs1.next()) {
                        ResultSet rs = s1.stm.executeQuery("SELECT * FROM booking WHERE b_id='" + b_id + "'");
                        if(rs.next()){
                        status=rs.getString("status");
                        if(status.equals("booked"))
                        {
                            status="Agent Accept";
                        }else if(status.equals("Agent Accept")){
                                status="Out for Delivery";
                        }else if(status.equals("Out for Delivery")){
                                status="Reached";
                        }else if(status.equals("Reached")){
                                status="Request payment";
                        }
                    
                        int a_id = rs1.getInt("a_id");    
                        int z1 = s2.stm.executeUpdate("UPDATE booking SET a_id='"+a_id+"',status = '"+status+"' WHERE b_id = '"+b_id+"'");


                    }} else {
                        out.println("<script>alert('agents invalid'); history.back();</script>");
                    }
                 %>
                 <script> document.location='view_req.jsp?b_id=<%=b_id%>';</script>
                 <%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
