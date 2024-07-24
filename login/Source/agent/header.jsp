<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if (session.getAttribute("uname") != null) {
%>
<%@page import="java.sql.*"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s" property="conn"/>
<% 
  String un = session.getAttribute("uname").toString();  
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DIGITAL-DOOR</title>
    <link rel="icon" href="assets/door-open-solid.ico" type="image/svg+xml">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        .header1 {
            background-color: #333;
            color: white;
            padding: 1rem 0;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            transition: background-color 0.3s;
        }

        .header1.transparent {
            background-color: rgba(51, 51, 51, 0.8);
        }

        .container1 {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .brand1 {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .nav1 ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }

        .nav1 ul li {
            margin: 0 1rem;
        }

        .nav1 ul li a {
            color: white;
            text-decoration: none;
            transition: color 0.3s;
        }

        .nav1 ul li a:hover {
            color: #00bfa5;
        }

        .get-started-btn1 {
            background-color: #00bfa5;
            color: white;
            padding: 0.5rem 1rem;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .get-started-btn1:hover {
            background-color: #009688;
        }

        .profile {
            position: relative;
            display: inline-block;
            margin-left: -110px; /* Adjust this value to move the profile icon to the left */
        }

        .profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;

        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: white;
            width: 250px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        .dropdown-content img.profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .dropdown-content h3 {
            margin: 0;
            font-size: 20px;
        }

        .dropdown-content p {
            margin: 5px 0;
            color: #555;
        }

        .dropdown-content .profile-stats {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
            font-size: 14px;
            color: #333;
        }

        .dropdown-content .profile-stats div {
            text-align: center;
        }

        .dropdown-content .profile-stats div span {
            display: block;
            font-weight: bold;
        }

        .dropdown-content a {
            display: block;
            color: black;
            padding: 10px 0;
            text-decoration: none;
            border-top: 1px solid #eee;
        }

        .dropdown-content a:hover {
            background-color: #f9f9f9;
        }

        .profile:hover .dropdown-content {
            display: block;
        }

        .contenar {
            padding: 20px;
        }

        .btn-logout {
            display: block;
            width: 100%;
            text-align: center;
            padding: 10px;
            margin-top: 10px;
            background-color: red;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn-logout:hover {
            background-color: darkred;
        }

        .name {
            color: red;
        }

         @media (max-width: 768px) {
            .container1 {
                flex-direction: row;
                justify-content: space-between;
                align-items: center;
            }

            .brand1 {
                flex-grow: 1;
            }

            .profile {
                order: 2;
            }

            .nav1 {
                display: none;
            }
        }
    </style>
</head>
<body>
    <header class="header1" id="header1">
        <div class="container1">
            <div class="brand1">Digital-Door</div>
            <%
                ResultSet rs = s.stm.executeQuery("SELECT * FROM agents WHERE email_id='" + un + "'");
                if (rs.next()) { 
            %>
            <div class="profile">
                <form action="../../logout.jsp" method="post">
                    <i style="margin-right:30px;" class="fas fa-user-circle fa-2x"></i>
                    <div class="dropdown-content">
                        <img src="assets/img/testimonials/<%= rs.getString("a_image") %>" alt="Profile Picture" class="profile-pic">
                        <h3 class="name"><%=rs.getString("center_name") %></h3>
                        <p><%= rs.getString("center_id") %></p>
                        <p><%= rs.getString("email_id") %></p>
                        
                        <div class="profile-stats">
                            <div>
                                <span>34</span>
                               Services
                            </div>
                            <div>
                                <span>31</span>
                                Delivered
                            </div>
                        </div>
                        <a href="profile.jsp">Manage Your Account</a>
                        <a href="#manage-settings">Manage Settings</a>
                        <button class="btn-logout">Logout</button>
                    </div>
                </form>
            </div>
            <% 
                }
            %>
        </div>
    </header>
   

    <script>
        window.addEventListener('scroll', function() {
            var header = document.getElementById('header1');
            if (window.scrollY > 50) {
                header.classList.add('transparent');
            } else {
                header.classList.remove('transparent');
            }
        });
    </script>
</body>
</html>
<%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
