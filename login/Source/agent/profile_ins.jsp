<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if (session.getAttribute("uname") != null) {
%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s" property="conn"/>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s2" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s2" property="conn"/>
<%
String s1 = request.getParameter("photo");
String saveFile = "";
String contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
{
    DataInputStream in = new DataInputStream(request.getInputStream());
    int formDataLength = request.getContentLength();
    byte dataBytes[] = new byte[formDataLength];
    int byteRead = 0;
    int totalBytesRead = 0;
    while (totalBytesRead < formDataLength) 
    {
        byteRead = in.read(dataBytes, totalBytesRead, formDataLength - totalBytesRead);
        totalBytesRead += byteRead;
    }
    String file = new String(dataBytes);
    saveFile = file.substring(file.indexOf("filename=\"") + 10);                                        
    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
    saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));              
    int lastIndex = contentType.lastIndexOf("=");
    String boundary = contentType.substring(lastIndex + 1, contentType.length());
    int pos;
    pos = file.indexOf("filename=\"");                                                                  
    pos = file.indexOf("\n", pos) + 1;
    pos = file.indexOf("\n", pos) + 1;
    pos = file.indexOf("\n", pos) + 1;
    int boundaryLocation = file.indexOf(boundary, pos) - 4;
    int startPos = ((file.substring(0, pos)).getBytes()).length;
    int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
    File ff = new File(getServletContext().getRealPath("/") + "Digital_Store/login/Source/agent/assets/img/testimonials/" + saveFile);
    FileOutputStream fileOut = new FileOutputStream(ff);
    fileOut.write(dataBytes, startPos, (endPos - startPos));
    fileOut.flush();
       String user=session.getAttribute("uname").toString();
    ResultSet rs1=s.stm.executeQuery("select * from agents where email_id='"+user+"'");
        if(rs1.next()){
         int a_id=rs1.getInt("a_id");
    int k = s.stm.executeUpdate("UPDATE agents SET a_image='" + saveFile + "' where a_id='" + a_id + "'");
      }
    fileOut.close();
    session.removeAttribute("uname");
}
%>
<script>
alert("Photo Uploaded Successfully.");
<%-- document.location = "home.jsp"; --%>
</script>
<%
}
%>
