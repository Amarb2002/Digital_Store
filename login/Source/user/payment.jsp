<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if (session.getAttribute("uname") != null) {
%>
<title>Processing Payment</title>
<%@page import="java.sql.*"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s" property="conn"/>
<%@page import="java.sql.*"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s1" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s1" property="conn"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Processing</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            background: linear-gradient(to right, #89f7fe, #66a6ff);
        }

        .processing-container {
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 30px;
            margin: 50px auto;
            max-width: 500px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .processing-message {
            font-size: 24px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="processing-container">
            <h1 class="processing-message">Processing Payment...</h1>
            <%
                String user = session.getAttribute("uname").toString();
                ResultSet rs1 = s.stm.executeQuery("SELECT * FROM users WHERE email='" + user + "'");
                if (rs1.next()) {
                    int u_id = rs1.getInt("u_id");
                    ResultSet rs2 = s1.stm.executeQuery("SELECT * FROM cart WHERE u_id='" + u_id + "'");
                        while(rs2.next()){     
                        int s_id = rs2.getInt("s_id");               // Logic to process payment here
                    // For example, you could mark the cart items as purchased
                    
                    // Clear the cart
                    
                    int z1 = s.stm.executeUpdate("insert into booking values(null,'"+u_id+"',null,'"+s_id+"','booked')");
                }
                    int z = s.stm.executeUpdate("DELETE FROM cart WHERE u_id='" + u_id + "'");
                    out.println("<script>alert('Payment Successful!'); document.location='Bill.jsp';</script>");
                } else {
                    out.println("<script>alert('Payment Failed!'); history.back();</script>");
                }
            %>
        </div>
    </div>
</body>
</html>
<%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
