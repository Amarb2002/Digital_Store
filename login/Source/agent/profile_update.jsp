<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname") != null) {
%>
    <title>your page is loding ...</title>
    <%@page import="java.sql.*"%>
    <%@page import="Digi.DoorStep_DB"%>
    <jsp:useBean id="s" class="Digi.DoorStep_DB"/>
    <jsp:getProperty name="s" property="conn"/>
    <% 
    String user=session.getAttribute("uname").toString();
    ResultSet rs1=s.stm.executeQuery("select * from agents where email_id='"+user+"'");
    if(rs1.next()){
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String agent_id=request.getParameter("a_id");
        String mobile=request.getParameter("mobile");
        String address=request.getParameter("address");
        String u_image=request.getParameter("fileInput");
        String s1=request.getParameter("fileInput");
        int a_id=rs1.getInt("a_id");
        int z=s.stm.executeUpdate("UPDATE agents SET center_name = '"+name+"', email_id = '"+email+"',agent_id='"+agent_id+"',phone_no = '"+mobile+"',address = '"+address+"',a_image = '"+u_image+"' WHERE a_id='"+a_id+"';");
        out.println("<script> alert('Profile Updated Sussfully');document.location='home.jsp';</script>");
    }else{
        out.println("<script> alert('we Cont Found Profile...!');history.back();</script>");
    }
}
%>