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
                    String feed=request.getParameter("feed");
                    String user = session.getAttribute("uname").toString();
                    ResultSet rs1 = s.stm.executeQuery("SELECT * FROM agents WHERE email_id='" + user + "'");
                    if (rs1.next()) {
                        int a_id = rs1.getInt("a_id");    
                        int z1 = s2.stm.executeUpdate("INSERT INTO feedback VALUES(null,null,'"+a_id+"','"+feed+"')");
                        out.println("<script>alert('FeedBack Submited..'); document.location='feedback.jsp';</script>");

                    } else {
                        out.println("<script>alert('agents invalid'); history.back();</script>");
                    }
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
