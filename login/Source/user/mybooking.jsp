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
    <title>Booking Services</title>
    
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <br><br>
    <div class="booking-container">
        <h1>Booking Status</h1>
        <%
        int statusIndex=0;
        int statusIndexx=0;
        int count = 0;
        String status = "";
        String email = session.getAttribute("uname").toString();
        ResultSet rs2 = s.stm.executeQuery("SELECT * FROM users WHERE email='" + email + "'");
        if (rs2.next()) {
            int u_id = rs2.getInt("u_id");
            ResultSet rs1 = s1.stm.executeQuery("SELECT * FROM booking  WHERE c_id='" + u_id + "'");
            while (rs1.next()) {
                status = rs1.getString("status");
                if(!status.equals("Delivered")){
                count++;
                int b_id = rs1.getInt("b_id");
                int s_id = rs1.getInt("s_id");
                
                ResultSet rs = s2.stm.executeQuery("SELECT * FROM services WHERE s_id='" + s_id + "'");
                while (rs.next()) {
                    
                    statusIndex = 0;
        %>
        <div class="booking-card">
            <% if (status.equals("booked")) {
                statusIndex = 1;
            } else if (status.equals("Agent Accept")) {
                statusIndex = 2;
            } else if (status.equals("Out for Delivery")) {
                statusIndex = 3;
            } else if (status.equals("Reached")) {
                statusIndex = 4;
            } else if (status.equals("Request payment")) {
                statusIndexx = 5;
            }%>
            <div class="booking-header">
                <h2><%= rs.getString("s_name") %></h2>
                <a href="view.jsp?s_id=<%=s_id%>" class="booking-status">View</a>
            </div>
            <div class="order-status">
                <div class="status-bar">
                    <div class="status-bar-fill" style="width:<%= (statusIndex - 1) * 33.3 %>%;"></div>
                </div>
                <div class="status-step <%= statusIndex >= 1 ? "completed" : "" %>">
                    <div class="circle <%= statusIndex >= 1 ? "completed" : "" %>"></div>
                    <div class="label <%= statusIndex >= 1 ? "completed" : "" %>">Booked</div>
                </div>
                <div class="status-step <%= statusIndex >= 2 ? "completed" : "" %>">
                    <div class="circle <%= statusIndex >= 2 ? "completed" : "" %>"></div>
                    <div class="label <%= statusIndex >= 2 ? "completed" : "" %>">Agent Accept</div>
                </div>
                <div class="status-step <%= statusIndex >= 3 ? "completed" : "" %>">
                    <div class="circle <%= statusIndex >= 3 ? "completed" : "" %>"></div>
                    <div class="label <%= statusIndex >= 3 ? "completed" : "" %>">Agent Out for Services</div>
                </div>
                <div class="status-step <%= statusIndex >= 4 ? "completed" : "" %>">
                    <div class="circle <%= statusIndex >= 4 ? "completed" : "" %>"></div>
                    <div class="label <%= statusIndex >= 4 ? "completed" : "" %>">Reached</div>
                </div>
            </div>
            <% if (statusIndex == 4) { %>
            <button class="btn completed">Delivered</button>
            <% } else if(statusIndexx == 5){
                %><a href="payment_ins.jsp?b_id=<%= b_id %>"><button class="btn">Work done </button></a><%
            }else  { %>
            <a href="delete_booking.jsp?b_id=<%= b_id %>"><button class="btn">Cancel</button></a>
            <% } %>
        </div>
        <%
                }}
            }
        }
        if (count == 0) {
        %>
        <h2>Items Not Found!</h2>
        <% } %>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <jsp:include page="sidebar.jsp"></jsp:include>
    <style>
        .booking-container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        .booking-container h1 {
            display: flex;
            justify-content: center;
            padding: 20px;
            font-size: 24px;
        }
        .booking-card {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .booking-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .booking-status {
            font-weight: bold;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .order-status {
            display: flex;
            align-items: center;
            margin-top: 10px;
            margin-bottom: 10px;
            position: relative;
            padding: 20px 0;
        }
        .status-bar {
            position: absolute;
            top: 31%;
            left: 0;
            height: 4px;
            width: 75%;
            background-color: #ddd;
            z-index: 1;
            margin-left: 140px;
        }
        .status-bar-fill {
            height: 4px;
            background-color: #4CAF50;
            z-index: 2;
        }
        .status-step {
            flex: 1;
            position: relative;
            text-align: center;
            z-index: 3;
        }
        .circle {
            width: 24px;
            height: 24px;
            background: #ccc;
            border-radius: 50%;
            display: inline-block;
            position: relative;
        }
        .circle.completed {
            background: #4CAF50;
            color: white;
        }
        .label {
            margin-top: 10px;
            font-size: 14px;
            color: rgb(92, 92, 92);
        }
        .label.active, .label.completed {
            color: #4CAF50;
        }
        .btn.completed {
            background: rgb(176, 176, 176);
            color: white;
        }
        .btn {
            background: rgb(176, 176, 176);
            color: white;
        }
        /* Responsive styling */
        @media (max-width: 768px) {
            .booking-container {
                width: 100%;
                padding: 10px;
            }
            .booking-container h1 {
                font-size: 20px;
                padding: 10px;
            }
            .booking-header {
                flex-direction: column;
                align-items: flex-start;
            }
            .booking-status {
                margin-top: 10px;
            }
            .order-status {
                flex-direction: column;
                align-items: center;
                padding: 10px 0;
            }
            .status-bar {
                width: 100%;
                left: 0;
                top: 50%;
            }
            .status-step {
                margin-bottom: 20px;
            }
            .status-bar-fill {
                width: calc(100% * ((<%= statusIndex - 1 %>) / 4));
            }
        }
    </style>
</body>

</html>
<%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
