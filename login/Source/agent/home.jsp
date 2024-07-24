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
        .services {
            text-align: center;
            margin-top: 20px;
        }

        .service-list {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px; /* Add gap between items */
            padding: 0 10px;
        }

        .service-item {
            flex: 1 1 calc(25% - 40px); /* 4 items per row, subtracting gap */
            max-width: 300px; /* Maximum width for each item */
            box-sizing: border-box;
            text-align: center;
            margin: 10px; /* Margin for spacing */
        }

        .service-item img {
            width: 100%;
            height: 200px; /* Fixed height */
            object-fit: cover; /* Ensures the image covers the whole area */
            border-radius: 10px;
        }

        @media (max-width: 600px) {
            .service-item {
                flex: 1 1 100%; /* Take full width on small screens */
            }
        }

        @media (min-width: 601px) and (max-width: 1024px) {
            .service-item {
                flex: 1 1 calc(50% - 40px); /* Two items per row on medium screens */
            }
        }

        @media (min-width: 1025px) {
            .service-item {
                flex: 1 1 calc(25% - 40px); /* Four items per row on large screens */
            }
        }

        .btn-div {
            background-color: rgb(74, 122, 212);
            border-radius: 6px;
            color: white;
            height: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        .btn-div span {
            font-size: 16px;
        }

        .btn-div:hover {
            background-color: rgb(58, 91, 135);
        }
    </style>
</head>
<body>
   <jsp:include page="header.jsp"></jsp:include>
    
    <div class="contenar">
        <section class="services" id="services">
            <h2>Our Services</h2>
            <div class="service-list">
                <%
                  try {
                      ResultSet rs = s.stm.executeQuery("select * from services");
                      while(rs.next()){ 
                          int i = rs.getInt("s_id");
                %>
                <div class="service-item">
                    <img src="assets/img/digiasset/<%=rs.getString("s_image") %>" alt="Service <%=i %>">
                    <h3><%=rs.getString("s_name") %></h3>
                    <p><%=rs.getString("s_description") %></p>
                    <a href="cart_ins.jsp?s_id=<%=i %>"><div class="btn-div">
                        <span>Book</span>
                    </div></a>
                </div>
                <%
                      }
                      rs.close();
                  } catch (SQLException e) {
                      e.printStackTrace();
                  }
                %>
            </div>
        </section>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
     <jsp:include page="sidebar.jsp"></jsp:include>
    
</body>
</html>
<%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
