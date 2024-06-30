<%@page import="java.sql.*"%>
<%@page import="Digi.DoorStep_DB"%>
<jsp:useBean id="s" class="Digi.DoorStep_DB"/>
<jsp:getProperty name="s" property="conn"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services</title>
    <style>
        .services {
            text-align: center;
        }

        .service-list {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-left: 70px;
        }

        .service-item {
            flex: 1 0 21%;
            margin: 10px;
            box-sizing: border-box;
            text-align: center;
        }

        .service-item img {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }

        @media (max-width: 600px) {
            .service-item {
                flex: 1 0 35%;
            }
        }

        @media (min-width: 601px) and (max-width: 1024px) {
            .service-item {
                flex: 1 0 28%;
            }

            .btn-div span {
                margin-left: 10px;
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
    <jsp:include page="sidebar.jsp"></jsp:include>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="contenar">
        <section class="services" id="services">
            <h2>Our Services</h2>
            <div class="service-list">
                <%
                  ResultSet rs=s.stm.executeQuery("select * from services");
                  while(rs.next()){ 
                    int i=0;
                %>
                <div class="service-item">
                    <img src="assets/img/digiasset/<%=rs.getString("s_image") %>" alt="Service <%=i+1 %>">
                    <h3><%=rs.getString("s_name") %></h3>
                    <p><%=rs.getString("s_description") %></p>
                    <a href="#"><div class="btn-div">
                        <span>Book</span>
                    </div></a>
                </div>
                <%
                    i++;
                  } 
                %>
            </div>
        </section>
    </div>
        <jsp:include page=""></jsp:include>
</body>
</html>
