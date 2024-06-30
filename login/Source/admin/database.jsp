<%@page import="java.sql.*"%>
<%@page import="Digi.DoorStep"%>
<jsp:useBean id="s" class="Digi.DoorStep"/>
<jsp:getProperty name="s" property="conn"/>
<%
    String un=request.getParameter("id");
    String as=request.getParameter("sa");
    ResultSet rs=s.stm.executeQuery("select * from login where s_answer='"+as+"'");
    while(rs.next())
    {%><%}>