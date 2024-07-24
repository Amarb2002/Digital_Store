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
        .body {
            font-family: Arial, sans-serif;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .profile-edit-container {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            max-width: 750px; /* Adjust the max-width as needed */
            text-align: center; /* Center align content */
        }
        .profile-photo {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background-color: #ddd;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 20px;
            overflow: hidden;
            cursor: pointer; /* Change cursor to pointer to indicate clickability */
        }
        .profile-photo img {
            width: 100%;
            height: auto;
        }
        .profile-edit-container h2 {
            margin-top: 0;
            color: #333;
        }
        .form-group {
            margin-bottom: 20px; /* Adjust spacing between form groups */
            display: flex;
            flex-direction: column; /* Align label and input vertically */
            align-items: flex-start; /* Align items to the start */
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #666;
            width: auto; /* Let label width adjust automatically */
            text-align: left; /* Align text to the left */
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group input:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
        }
        .form-group button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
        .file-input {
            display: none; /* Hide the file input */
        }
    </style>
</head>
<body>
    <jsp:include page="sidebar.jsp"></jsp:include>
    <jsp:include page="header.jsp"></jsp:include>
    <%
     String email = session.getAttribute("uname").toString();
        ResultSet rs2 = s.stm.executeQuery("SELECT * FROM users WHERE email='" + email + "'");
        if(rs2.next()) {%>
    <div class="body">
        <div class="profile-edit-container">
            <div class="profile-photo" id="profilePhoto">
                <img src="assets/img/testimonials/<%=rs2.getString("u_image")%>" alt="Profile Photo">
            </div>
            <form action="profile_update.jsp" method="post">
            <input type="file" name="fileInput" id="fileInput" class="file-input" accept="image/*">
            <h2>Edit Profile</h2>
            
                <div class="form-group">
                    <label for="username">FullName</label>
                    <input type="text" value="<%=rs2.getString("name")%>" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" value="<%=rs2.getString("email")%>" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="bio">Mobile No</label>
                    <input type="text" id="mobile" value="<%=rs2.getString("phone")%>" name="mobile">
                </div>
                <div class="form-group">
                    <label for="bio">Address</label>
                    <input type="text" id="address" value="<%=rs2.getString("address")%>" name="address">
                </div>
                <div class="form-group">
                    <button type="submit">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
    <%}%>
    <jsp:include page="footer.jsp"></jsp:include>
    <script>
        document.getElementById('profilePhoto').addEventListener('click', function() {
            document.getElementById('fileInput').click();
        });

        document.getElementById('fileInput').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.querySelector('.profile-photo img').src = e.target.result;
                }
                reader.readAsDataURL(file);
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