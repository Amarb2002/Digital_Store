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
<%@page import="java.sql.*"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s3" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s3" property="conn"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        .booking-date {
    font-size: 14px;
    color: rgb(92, 92, 92);
    margin-bottom: 10px;
    text-align: right; /* Align the date text to the right */
}
        .booking-container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        .booking-container h1 {
            display: flex;
            justify-content: center;
        }
        .booking-card {
            display: flex;
            gap: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .booking-card img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }
        .booking-details {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .service-name {
            font-size: 18px;
            font-weight: bold;
        }
        .service-description {
            margin-top: 5px;
            font-size: 14px;
            color: rgb(92, 92, 92);
        }
        .booking-status {
            font-weight: bold;
            color: green;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            align-self: flex-end;
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
    </style>
</head>
<body>
    <jsp:include page="sidebar.jsp"></jsp:include>
    <jsp:include page="header.jsp"></jsp:include>
</br>
</br>
</br>
    <div class="booking-container">
        <h1>Work Progress</h1>
        <%
        int count = 0;
        String status = "";
        String email = session.getAttribute("uname").toString();
        ResultSet rs2 = s.stm.executeQuery("SELECT * FROM agents WHERE email_id='" + email + "'");
        if (rs2.next()) {
            int a_id = rs2.getInt("a_id");
            ResultSet rs1 = s1.stm.executeQuery("SELECT * FROM booking WHERE a_id='" + a_id + "'");
            while (rs1.next()) {
                count++;
                int b_id = rs1.getInt("b_id");
                int s_id = rs1.getInt("s_id");
                int u_id = rs1.getInt("c_id");
                ResultSet rs3 = s2.stm.executeQuery("SELECT * FROM users WHERE u_id='" + u_id + "'");
                    if(rs3.next()){
                ResultSet rs = s3.stm.executeQuery("SELECT * FROM services WHERE s_id='" + s_id + "'");

               if(rs.next()) {
                    
                    status = rs1.getString("status");
                    int statusIndex = 0;
        %>
        <div class="booking-card">
            <img src="assets/img/testimonials/<%=rs3.getString("u_image") %>" alt="Image description">
            <div class="booking-details">
                <div class="booking-date">
                    <%=rs1.getString("b_date")%> <!-- Assuming you have booking_date in your result set -->
        </div>
                <h2 style="font-size: 25px;" class="service-name"><%= rs.getString("s_name") %></h2>

                <p class="service-description"><%= rs.getString("s_description") %></p>
                 

                <a href="view_req.jsp?b_id=<%=b_id%>" class="booking-status">View</a>
            </div>
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
</body>
</html>
<%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>