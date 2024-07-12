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

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Interface</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            /* background: linear-gradient(to right, #89f7fe, #66a6ff); */
        }

        .chat-container {
            height: 80vh;
            /* background: rgba(255, 255, 255, 0.5); */
            background: rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            overflow: hidden;
            backdrop-filter: blur(10px);
        }

        .contacts {
            height: 100%;
            overflow-y: auto;
            background: rgba(255, 255, 255, 0.5);
        }

        .contact {
            display: flex;
            align-items: center;
            padding: 10px;
            cursor: pointer;
        }

        .contact img {
            width: 40px;
            height: 40px;
        }

        .contact-info {
            display: flex;
            flex-direction: column;
        }

        .name {
            font-weight: bold;
        }

        .status {
            color: gray;
        }

        .chat-box {
            height: 100%;
            display: flex;
            flex-direction: column;
            background: rgba(255, 255, 255, 0.5);
        }

        .chat-header {
            border-bottom: 1px solid #ddd;
        }

        .chat-messages {
            flex: 1;
            overflow-y: auto;
        }

        .message {
            margin-bottom: 10px;
        }

        .message p {
            display: inline-block;
            max-width: 70%;
        }

        .message.received p {
            background: #f1f1f1;
        }

        .message.sent p {
            background: #daf8e3;
        }

        .time {
            font-size: 0.8em;
            color: gray;
        }

        .chat-input {
            border-top: 1px solid #ddd;
        }
    </style>
</head>

<body>
    <div class="container p-3"> 
        <div class="row chat-container">
            <div class="col-md-4 contacts">
                <input type="text" placeholder="Search..." class="form-control search-bar my-3">
                <%
                    String email=session.getAttribute("uname").toString();
                    ResultSet rs2 = s.stm.executeQuery("SELECT * FROM users WHERE email='"+ email+"'");
                    if(rs2.next()){
                    int u_id=rs2.getInt("u_id");
                    ResultSet rs1 = s1.stm.executeQuery("SELECT * FROM cart WHERE u_id='" + u_id + "'");
                    while(rs1.next()){
                        int s_id=rs1.getInt("s_id");
                    ResultSet rs = s2.stm.executeQuery("SELECT * FROM services WHERE s_id='" + s_id + "'");
                    while (rs.next()) 
                        { 
                  
                %>
                <div class="contact" data-name="Khalid" data-avatar="avatar1.png" data-status="Khalid is online">
                    <img src="assets/img/digiasset/<%=rs.getString("s_image") %>" alt="Khalid" class="rounded-circle">
                    <div class="contact-info ml-2">

                        <span class="name"><%=rs.getString("s_name")%></span>
                        <span class="status">Khalid is online</span>
                    </div>
                </div>
              <%}}}%>
            <!-- Add more contacts as needed -->
            </div>
            <div class="col-md-8 chat-box">
                <div class="chat-header d-flex align-items-center p-3 border-bottom">
                    <img src="./assets/img/favicon.png" alt="Avatar" class="rounded-circle chat-avatar">
                    <span class="chat-name ml-2">Select a contact to start chatting</span>
                </div>
                <div class="chat-messages p-3">
                    <!-- Chat messages will appear here -->
                </div>
                <div class="chat-input d-flex p-3 border-top">
                    <input type="text" placeholder="Type your message..." class="form-control">
                    <button class="btn btn-primary ml-2">Send</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="Desine/script.js">
 
    </script>
</body>

</html>
<%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
