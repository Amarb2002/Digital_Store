<title>Validating...</title>
<%@page import="java.sql.*"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s" property="conn"/>
<%
     String chk=request.getParameter("valid");
     if(chk!=null)
    {
		String un=request.getParameter("uname");
		String ps=request.getParameter("pass");
		ResultSet rs=s.stm.executeQuery("select * from login where username='"+un+"'");
		if(rs.next())
		{
			ResultSet rs1=s.stm.executeQuery("select * from login where username='"+un+"' and password='"+ps+"'");
			if(rs1.next())
			{
					String utp=rs1.getString("type");
					session.setAttribute("uname",un);
					if(utp.equals("admin"))
					{
						response.sendRedirect("Source/admin/dashbord.jsp");
					}
					else if(utp.equals("user"))
					{
						response.sendRedirect("Source/user/dashbord.jsp");
					}
					else if(utp.equals("agent"))
					{
						response.sendRedirect("Source/agent/dashbord.jsp");
					}
			}
			else
			{
			out.println("<script>alert('Invalid or wrong password');document.location='index.jsp';</script>");
				
			}
		}
		else
		{
		out.println("<script>alert('Invalid username or username not found...!');document.location='index.jsp';</script>");
		
		}		
    }
    else
    {
      out.println("<script>history.back();</script>");
    }
    				
%>