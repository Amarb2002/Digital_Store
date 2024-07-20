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
    <title>DigiDoorStep Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .sidebar {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            z-index: 100;
            padding: 48px 0 0;
            border-right: 1px solid #eee;
            background-color: #343a40;
            color: white;
        }
        .sidebar .nav-link {
            font-weight: 500;
            color: #ddd;
        }
        .sidebar .nav-link:hover {
            color: #007bff;
        }
        .main {
            margin-left: auto;
            margin-right: auto;
            padding: 20px;
            max-width: 1200px;
        }
        .card {
            border: none;
            border-radius: 10px;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: 500;
        }
        .bg-gradient {
            background: linear-gradient(135deg, #f54ea2, #ff7676);
            color: white;
        }
        .bg-gradient-blue {
            background: linear-gradient(135deg, #42e695, #3bb2b8);
            color: white;
        }
        .bg-gradient-white {
            background: linear-gradient(135deg, #f0f4f8, #d9e6f2);
            color: black;
        }
    </style>
</head>
<body>

   <jsp:include page="header.jsp"></jsp:include>   

    <div class="container-fluid main">
        </br>
</br>
</br>
<%
        int agents=0;
        String name="";
        int booking=0;
        int services=0;
        String email=session.getAttribute("uname").toString();
        ResultSet rs = s.stm.executeQuery("SELECT * FROM users WHERE email='"+ email+"'");
        if(rs.next()){
            name=rs.getString("name");
            int u_id=rs.getInt("u_id");
            ResultSet rs1 = s.stm.executeQuery("SELECT * FROM booking WHERE c_id='" + u_id + "'");
            while(rs1.next()){
                booking++;
            }
            rs1.close();
            
            rs1 = s1.stm.executeQuery("SELECT * FROM services ");
            while(rs1.next()){
                services++;
            }
            rs1.close();
             rs1 = s1.stm.executeQuery("SELECT * FROM agents ");
            while(rs1.next()){
                agents++;
            }
            rs1.close();
        }
%>
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Welcome To The Digital-Door Mr.<%=name%> </h1>
            <div class="btn-toolbar mb-2 mb-md-0">
                
                <button type="button" class="btn btn-sm btn-outline-secondary">
                    <span data-feather="calendar"></span>
                    <i class="far fa-calendar-alt"></i>
                </button>
            </div>
        </div>

        <div class="row">
            <div  class="col-md-4">
                <div style="background: #ff6385;" class="card mb-4 shadow-sm bg-gradient">
                    <div class="card-body">
                        <h5 class="card-title">Services</h5>
                        <p class="card-text"><%=services%>    <span> (Latest update)</span></p>
                    </div>
                </div>
            </div>
              <div class="col-md-4">
                <div class="card mb-4 shadow-sm bg-gradient-white">
                    <div class="card-body">
                        <h5 class="card-title">Agent's</h5>
                        <p class="card-text"><%=agents%><span> (Latest update)</span></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm bg-gradient-blue">
                    <div class="card-body">
                        <h5 class="card-title">Booked</h5>
                        <p class="card-text"><%=booking%><span> (Latest update)</span></p>
                    </div>
                </div>
            </div>
          
        </div>

        <div class="row">
            <div class="col-md-8">
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Comparison </h5>
                        <canvas id="profitChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Follow Step's</h5>
                        <ul class="list-unstyled">
                            <li class="media mb-3">
                                
                                <i style="width: 60px; height: 50px; margin-top: 0px;margin-left: 8px; font-size:30px" class="fa-solid fa-magnifying-glass"></i>
                                <div class="media-body">
                                    <h6 class="mt-0 mb-1">Choose Service </h6>
                                    <span>a service which you want. </span>
                                </div>
                            </li>
                            <li class="media mb-3">
                                <i style="width: 60px; height: 50px; margin-top: 0px;margin-left: 8px; font-size:30px" class="fa-solid fa-credit-card"></i>
                                <div class="media-body">
                                    <h6 class="mt-0 mb-1">Make a payment. </h6>
                                    <span>in the card make a payment. </span>
                                </div>
                            </li>
                            <li class="media mb-3">
                               <i style="width: 60px; height: 50px; margin-top: 0px;margin-left: 8px; font-size:30px" class="fa-solid fa-check"></i>
                                <div class="media-body">
                                    <h6 class="mt-0 mb-1">Check the status. </h6>
                                    <span> where is your application?  </span>
                                </div>
                            </li>
                            <li class="media mb-3">
                                <i style="width: 60px; height: 50px; margin-top: 0px;margin-left: 8px; font-size:30px" class="fa-solid fa-phone"></i>
                                <div class="media-body">
                                    <h6 class="mt-0 mb-1">Contact.  </h6>
                                    <span> Agent may contact you.   </span>
                                </div>
                            </li>
                            <li class="media mb-3">
                                <i style="width: 60px; height: 50px; margin-top: 0px;margin-left: 8px; font-size:30px" class="fa-solid fa-truck"></i>
                                <div class="media-body">
                                    <h6 class="mt-0 mb-1">Delivered.  </h6>
                                    <span>service delivered to your house.</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        var ctx = document.getElementById('profitChart').getContext('2d');
        var profitChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['June', 'July', 'August', 'September', 'October', 'November', 'December'],
                datasets: [{
                    label: "Agent's",
                    data: [300000, 200000, 400000, 500000, 600000, 700000, 800000],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    fill: false
                }, {
                    label: "Customer's",
                    data: [150000, 100000, 200000, 250000, 300000, 350000, 400000],
                    borderColor: 'rgba(255, 99, 132, 1)',
                    fill: false
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        display: true,
                        title: {
                            display: true,
                            text: 'Month'
                        }
                    },
                    y: {
                        display: true,
                        title: {
                            display: true,
                            text: ''
                        }
                    }
                }
            }
        });
    </script>
    <jsp:include page="footer.jsp"></jsp:include>
    <jsp:include page="sidebar.jsp"></jsp:include>
</body>
</html>
<%
  } else {
    out.println("<script>alert('Your Session Expired. Please Re-logIn..!'); document.location='../../index.jsp';</script>");
  }
%>
