<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Button Click Example</title>
    <script>
        function insertData() {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", window.location.href, true); // Use the current page URL
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    alert(xhr.responseText);
                }
            };

            var i = 10; // Change these values as needed
            var j = 10; // Change these values as needed
            xhr.send("i=" + i + "&j=" + j);
        }
    </script>
</head>
<body>
    <button onclick="insertData()">Insert</button>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String url = "jdbc:mysql://localhost:3306/DigiDoorStep"; // URL of the database
        String username = "root"; // Database username
        String password = ""; // Database password

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            int i = Integer.parseInt(request.getParameter("i"));
            int j = Integer.parseInt(request.getParameter("j"));

            String sql = "INSERT INTO cart (column1, column2) VALUES (?, ?)"; // Adjust column names
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, i);
            pstmt.setInt(2, j);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                response.getWriter().write("Data inserted successfully!");
            } else {
                response.getWriter().write("Data insertion failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
        return;
    }
%>
</body>
</html>
