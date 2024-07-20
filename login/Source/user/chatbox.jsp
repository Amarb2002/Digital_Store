<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if (session.getAttribute("uname") != null) {
%>
<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
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
        }

        .chat-container {
            height: 80vh;
            background: rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            border-color: black;
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
            position: relative;
        }

        .contact img {
            width: 40px;
            height: 40px;
        }

        .contact-info {
            display: flex;
            flex-direction: column;
            margin-left: 10px;
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
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .chat-header h1 {
            margin: 0;
            padding: 20px 0;
            text-align: center;
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
            max-width: 80%;
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

        .remove-btn {
            position: absolute;
            left: 310px;
            background: rgb(242, 94, 94);
            border: none;
            color: black;
            font-size: 2em;
            cursor: pointer;
            padding: 2px 5px;
            line-height: 1;
            width: 55px;
            border-radius: 30%;
            text-align: center;
        }
        .contacts h1 {
            margin: 0;
            padding: 20px 0;
            text-align: center;
        }
    </style>
</head>

<body>
    
        <div class="row chat-container">
            <div class="col-md-4 contacts">
                <h1>Cart Item's</h1>

                <%
                int i=1;
                int sum=0;
                int count=0;
                int no=0;
                int u_id=0;
                    int[] price=new int[10];
                    String[] name=new String[10];
                    String email=session.getAttribute("uname").toString();
                    ResultSet rs2 = s.stm.executeQuery("SELECT * FROM users WHERE email='"+ email+"'");
                    if(rs2.next()){
                    u_id=rs2.getInt("u_id");
                    ResultSet rs1 = s1.stm.executeQuery("SELECT * FROM cart WHERE u_id='" + u_id + "'");
                    while(rs1.next()){
                        int s_id=rs1.getInt("s_id");
                    ResultSet rs = s2.stm.executeQuery("SELECT * FROM services WHERE s_id='" + s_id + "'");
                        
                    while (rs.next()) 
                        { 
                            count=count++;
                         price[i]=Integer.parseInt(rs.getString("s_cost"));
                         name[i]=rs.getString("s_name");
                         sum=sum+price[i];
                        i++;
                        int id=rs.getInt("s_id");

                %>
                <div class="contact" data-name="Khalid" data-avatar="avatar1.png" data-status="Khalid is online">
                    
                    <img src="assets/img/digiasset/<%=rs.getString("s_image") %>" alt="Khalid" class="rounded-circle">
                    <div class="contact-info ml-2">
                        <span class="name"><%=rs.getString("s_name")%></span>
                        <span class="status">Khalid is online</span>
                    </div>
                    <a class="remove-btn" href="cart_remove.jsp?s_id=<%=id%>">&times</a>
                </div>

              <%}}}%>
            </div>
            <div class="col-md-8 chat-box">
                <div class="chat-header">
                    <h1>Cart Summary</h1>
                </div>
                <div class="chat-messages p-3">
                    <jsp:include page="cart_bill.jsp"></jsp:include>

                    <div class="container ">
        
        <table id="cartTable" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Charge</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <!-- Sample items -->
                <%
                int index=0;
                  ResultSet rs4 = s2.stm.executeQuery("SELECT * FROM cart WHERE u_id='" + u_id + "'");
                    while (rs4.next()) 
                        { 
                        index=index+1;
                %>             
                <tr>
                    <td><%=name[index]%></td>                  
                    <td>$<%=price[index]%></td>
                    <td>150</td>
                    <td>$<%=price[index]+150%></td>
                </tr>

            <%}
            int GST=((sum+(150*index))/100)*8;
            int subtotal=sum+(150*index);
            int total=(sum+(150*index))+GST;
        %>
            </tbody>
        </table>
        <div class="summary">
            <p>Subtotal: <span id="subtotal">$<%=subtotal%></span></p>
            <p>GST (8%): <span id="gst">$<%=GST%></span></p>
            <p>Total: <span id="total">$<%=total%></span></p>
        </div>
        
    </div>
                </div>
                <div class="chat-input d-flex p-3 border-top">
                    <a href="Billing.jsp" id="payButton" class="btn btn-primary btn-block">Proceed to Payment</a>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
<%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>