<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if (session.getAttribute("uname") != null) {
%>
<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s" property="conn"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FeedBox</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f8f9fa;
        }

        .chat-container {
            width: 60%;
            height: 80vh;
            margin-top: 80px;
            background: rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            border: 1px solid black;
            display: flex;
            flex-direction: column;
            backdrop-filter: blur(10px);
            overflow: hidden;
            justify-self: center;
        }

        .chat-box {
            flex: 1;
            display: flex;
            flex-direction: column;
            background: rgba(255, 255, 255, 0.4);
        }

        .chat-header {
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .chat-header h1 {
            margin: 0;
            color: white;
        }

        .chat-messages {
            flex: 1;
            overflow-y: auto;
            padding: 20px;
        }

        .feedback {
            color: white;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .feedback h2, .feedback p {
            margin: 5px 0;
        }

        .chat-input {
            border-top: 1px solid #ddd;
            padding: 20px;
        }

        .btn-primary {
            width: 100%;
            padding: 10px;
        }
    </style>
</head>

<body>
    <div class="chat-container" style="background: rgba(8, 8, 8, 0.63);">
        <div class="chat-box">
            <div class="chat-header">
                <h1>FeedBack Box</h1>
            </div> 

            <div class="chat-messages">
                <div class="container">
                    <div class="feedback">
                        <h2>Name: John Doe</h2>
                        <p>Email: john.doe@example.com</p>
                        <p>Message: This is a sample feedback message.</p>
                    </div>

                    <!-- Add more feedback blocks as needed -->
                </div>
            </div>
            <div class="chat-input">
                <a href="Billing.jsp" id="payButton" class="btn btn-primary">Proceed to Payment</a>
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
