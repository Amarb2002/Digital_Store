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
    String user = session.getAttribute("uname").toString();
    ResultSet rs1 = s.stm.executeQuery("SELECT * FROM users WHERE email='" + user + "'");
    if (rs1.next()) {
        String s_id = request.getParameter("s_id");
        int u_id = rs1.getInt("u_id");
        ResultSet rs2 = s.stm.executeQuery("SELECT * FROM cart WHERE s_id='" + s_id + "' AND u_id='" + u_id + "'");
        if (rs2.next()) {
            int z = s.stm.executeUpdate("DELETE FROM cart WHERE u_id='" + u_id + "' AND s_id='" + s_id + "'");
            out.println("<script> alert('Removed from cart...'); document.location='home.jsp';</script>");
        } else {
            out.println("<script> alert('Service not found in your cart'); history.back();</script>");
        }
    }
}
%>
