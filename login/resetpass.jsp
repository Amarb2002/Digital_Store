<title>Resting Password...</title>
<%@page import="java.sql.*"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s" property="conn"/>
<%
     String chk=request.getParameter("Submit");
     if(chk!=null)
    {
     	    String un=request.getParameter("un");
     		String np=request.getParameter("npass");
            String cp=request.getParameter("cpass");
            if(np.equals(cp))
            {
                int z=s.stm.executeUpdate("update login set password='"+np+"' where username='"+un+"'");
                 out.println("<script>alert('Password Reset Successfully');document.location='index.jsp';</script>");
            }
            else
            {
                out.println("<script>alert('New & Confirm Password does not matched..!');history.back();</script>");
            }
    }
    else
    {
      out.println("<script>history.back();</script>");
    }
    				
%>