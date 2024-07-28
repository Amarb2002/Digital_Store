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
    

        int z=s.stm.executeUpdate("insert into services values(null,'"+name+"','"+desc+"','"+req+"','"+cost+"','"+s_image+"')");
        out.println("<script> alert('Added in to Services...');document.location='home.jsp';</script>");
   

}
%>