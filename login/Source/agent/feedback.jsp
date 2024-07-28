<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if (session.getAttribute("uname") != null) {
%>
<%@page import="java.sql.*"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s" property="conn"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        /* General styling */
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Container for feedback and old feedback */
        .feedback-container {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 10px;
            background-color: rgb(242, 242, 242);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        /* Feedback section styling */
        .feedback-section {
            flex: 1;
            margin-right: 20px;
        }

        .feedback-section h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .feedback-section form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .feedback-section label {
            font-size: 16px;
            font-weight: 600;
            color: #555555;
        }

        .feedback-section input, .feedback-section textarea {
            padding: 12px;
            border: 1px solid #cccccc;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .feedback-section input:focus, .feedback-section textarea:focus {
            border-color: #3498db;
            outline: none;
        }

        .feedback-section textarea {
            resize: vertical;
        }

        .feedback-section button {
            padding: 12px;
            border: none;
            border-radius: 8px;
            background-color: #3498db;
            color: #ffffff;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .feedback-section button:hover {
            background-color: #2980b9;
        }

        /* Old feedback section styling */
        .old-feedback-section {
            flex: 1;
            max-width: 600px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            overflow-y: auto;
            max-height: 400px;
        }

        .old-feedback-section h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .old-feedback {
            margin-bottom: 20px;
        }

        .old-feedback h3 {
            margin: 0;
            font-size: 18px;
            color: #555555;
        }

        .old-feedback p {
            margin: 5px 0;
            font-size: 16px;
            color: #777777;
        }

        /* Responsive styling */
        @media (max-width: 768px) {
            .feedback-container {
                flex-direction: column;
                padding: 20px;
            }

            .feedback-section, .old-feedback-section {
                margin: 0;
                max-width: 100%;
            }

            .feedback-section h2, .old-feedback-section h2 {
                font-size: 20px;
            }

            .feedback-section input, .feedback-section textarea {
                font-size: 14px;
            }

            .feedback-section button {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="sidebar.jsp"></jsp:include>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="meta.jsp"></jsp:include>
 <!-- Feedback Section -->
 </br>
 </br>
 </br>
 </br>
 <%
String email = session.getAttribute("uname").toString();
        ResultSet rs2 = s.stm.executeQuery("SELECT * FROM agents WHERE email_id='" + email + "'");
        if (rs2.next()) {
            int a_id = rs2.getInt("a_id");
            String name=rs2.getString("center_name");
           

%>
    <div class="feedback-container">
        <div class="feedback-section">
            <h2>Leave Your Feedback</h2>
            <form action="feedback_ins.jsp" method="post">
                <label for="feedback-name">Name:</label>
                <input type="text" id="feedback-name" name="name" value="<%=name%>" required>

                <label for="feedback-email">Email:</label>
            <input type="email" value="<%=email%>" id="feedback-email" name="email" required>

                <label for="feedback-message">Your Feedback:</label>
                <textarea id="feed" name="feed" rows="4" required></textarea>

                <button type="submit">Submit Feedback</button>
            </form>
        </div>
        <div class="old-feedback-section">
            <h2>Old Feedback</h2>
            <%
            ResultSet rs1 = s.stm.executeQuery("SELECT * FROM feedback where a_id='" + a_id + "'");
       while(rs1.next()) {
        %>
            <div class="old-feedback">
                <h3><%=name%></h3>
                <p>Email: <%=email%></p>
                <p>Message: <%=rs1.getString("feedback")%></p>
            </div>
            
            <%}%>
            <!-- Add more feedback entries as needed -->
        </div>
    </div>
    <%}%>

    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
