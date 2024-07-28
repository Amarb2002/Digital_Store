<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if (session.getAttribute("uname") != null) {
%>
<title>your page is loding ...</title>
<%@page import="java.sql.*"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s" property="conn"/>
<% 
String name=request.getParameter("name");
String desc=request.getParameter("desc");
String req=request.getParameter("req");
String cost=request.getParameter("cost");
String s_image=request.getParameter("fileInput");
String s1=request.getParameter("fileInput");
String s_id=request.getParameter("s_id");
    
     int z=s.stm.executeUpdate("UPDATE services SET s_name = '"+name+"', s_description = '"+desc+"',s_requirement = '"+req+"',s_cost = '"+cost+"',s_image = '"+s_image+"' WHERE s_id='"+s_id+"';");
            out.println("<script> alert('Service Updated Sussfully');document.location='home.jsp';</script>");  

}
%>