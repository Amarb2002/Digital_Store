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
            background-color: rgb(230, 230, 230);
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

        .feedback-section a {
            padding: 12px;
            border: none;
            border-radius: 8px;
            background-color: #3498db;
            color: #ffffff;
            font-size: 18px;
            cursor: pointer;
            justify-item: center;
            transition: background-color 0.3s;
        }
        .feedback-section .btn {
            padding: 12px;
            border: none;
            border-radius: 8px;
            
            color: #ffffff;
            font-size: 18px;
            cursor: pointer;
            justify-item: center;
            transition: background-color 0.3s;
        }

        .feedback-section a:hover {
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
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .old-feedback img {
            width: 75px;
            height: 75px;
            border-radius: 50%;
            margin-right: 20px;
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

            .feedback-section .btn {
                margin-bottom: 10px;
                font-size: 16px;
            }

            .old-feedback img {
                width: 40px;
                height: 40px;
                margin-right: 10px;
            }

            .old-feedback h3 {
                font-size: 16px;
            }

            .old-feedback p {
                font-size: 14px;
            }
        }
         .old-feedback .img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }
        .btn .done:hover {
            background-color: #2980b9;
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
 String user=session.getAttribute("uname").toString();
String status="";
String u_id=request.getParameter("u_id");

// sdfghjkl

// dfghjkl;
        
            
    ResultSet rs = s.stm.executeQuery("SELECT * FROM users WHERE u_id='" + u_id + "'");
    if(rs.next()){

    String name=rs.getString("name");
    String email=rs.getString("email");
    String phone=rs.getString("phone");
    String img=rs.getString("u_image");
    String address=rs.getString("address");
  
%>
    <div class="feedback-container">
        <div class="feedback-section">
            <h2>User Details. </h2>
            <form action="submitFeedback.jsp" method="post">
                <%-- hear i need --%>
                 <div class="old-feedback">
                <img class="img" src="assets/img/testimonials/<%=img%>" alt="John Doe">
                <div>
                    <h3 style="font-size: 40px;"><b><%=name%></b></h3>
                
                </div>
            </div>
            <div class="old-feedback">
                
                <div>
                    <h3><b>Phone No:</b> <%=phone%></h3>
                    <p><b>Email:</b> <%=email%> </p>
                    
                </div>
            </div>
     <div class="btn">
                <%-- <div class="btn"> --%>
               
                <a style="color: white;background-color: #d66767;" href="del_users?u_id=<%=u_id%>"> Remove</a>

            </div>
            </form>
        </div>
        <div class="old-feedback-section">
            <h2>Address</h2>
            <div class="old-feedback">
                <%-- <img src="path/to/profile1.jpg" alt="John Doe"> --%>
                <div>
                    <h3></h3>
                    <p><%=address%></p>
                    <p></p>
                </div>
            </div>
            <%-- <div class="old-feedback">
                <img src="path/to/profile2.jpg" alt="Jane Smith">
                <div>
                    <h3>Jane Smith</h3>
                    <p>Email: jane.smith@example.com</p>
                    <p>Message: Could be better. Had some issues.</p>
                </div>
            </div> --%>
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
