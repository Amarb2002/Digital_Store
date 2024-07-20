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
            margin-left: 220px;
            padding: 20px;
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
    <jsp:include page="sidebar.jsp"></jsp:include>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar placeholder -->
            <!-- Include your sidebar HTML here -->

            <main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Monitor health of your business</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-2">
                            <button type="button" class="btn btn-sm btn-outline-secondary">Week</button>
                            <button type="button" class="btn btn-sm btn-outline-secondary">Month</button>
                            <button type="button" class="btn btn-sm btn-outline-secondary">Year</button>
                        </div>
                        <button type="button" class="btn btn-sm btn-outline-secondary">
                            <span data-feather="calendar"></span>
                            <i class="far fa-calendar-alt"></i>
                        </button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm bg-gradient">
                            <div class="card-body">
                                <h5 class="card-title">Views</h5>
                                <p class="card-text">31 <span>+3 last day</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm bg-gradient-blue">
                            <div class="card-body">
                                <h5 class="card-title">Clients</h5>
                                <p class="card-text">63 <span>+1 last day</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm bg-gradient-white">
                            <div class="card-body">
                                <h5 class="card-title">Purchases</h5>
                                <p class="card-text">10 <span>+1 last day</span></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">Total profit</h5>
                                <canvas id="profitChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">Properties</h5>
                                <ul class="list-unstyled">
                                    <li class="media mb-3">
                                        <img src="image1.jpg" class="mr-3" alt="Windmills Loft" style="width: 50px; height: 50px;">
                                        <div class="media-body">
                                            <h6 class="mt-0 mb-1">Windmills Loft</h6>
                                            <span>25% increase</span>
                                        </div>
                                    </li>
                                    <li class="media mb-3">
                                        <img src="image2.jpg" class="mr-3" alt="Seaview Villa" style="width: 50px; height: 50px;">
                                        <div class="media-body">
                                            <h6 class="mt-0 mb-1">Seaview Villa</h6>
                                            <span>18% increase</span>
                                        </div>
                                    </li>
                                    <li class="media mb-3">
                                        <img src="image3.jpg" class="mr-3" alt="Family Villa" style="width: 50px; height: 50px;">
                                        <div class="media-body">
                                            <h6 class="mt-0 mb-1">Family Villa</h6>
                                            <span>12% increase</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
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
                    label: 'Income',
                    data: [300000, 200000, 400000, 500000, 600000, 700000, 800000],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    fill: false
                }, {
                    label: 'Expense',
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
                            text: 'Amount'
                        }
                    }
                }
            }
        });
    </script>
        <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
