<title>PROCESSING.....</title>
<%@page import="java.sql.*"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s" property="conn"/>
<%
	String ch=request.getParameter("Submit");
	if(ch==null)
	{
		out.println("<script>history.back();</script>");
	}
	else
	{
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String a_id=request.getParameter("a_id");
		String c_id=request.getParameter("c_id");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String qustion=request.getParameter("question");
		String answer=request.getParameter("answer");
		
		ResultSet rs=s.stm.executeQuery("select * from agents where email_id='"+email+"'");
		if(!rs.next())
		{
			int z=s.stm.executeUpdate("insert into agents values(null,'"+name+"','"+c_id+"','"+a_id+"','"+email+"','"+phone+"','user.jpg','"+address+"')");
			
			int z1=s.stm.executeUpdate("insert into login values(null,'"+email+"','"+phone+"','agent','"+qustion+"','"+answer+"')");
	
			out.println("<script>alert('Registed Successfully');alert('Username is Email. & Password is Your Mobile no.');document.location='index.jsp';</script>");
		}
		else
		{
			out.println("<script>alert('email ID. Already Used or Exists');history.back();</script>");
		}
	}
					
%>