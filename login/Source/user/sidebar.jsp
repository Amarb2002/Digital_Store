<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="Desine/popup.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .popup-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000; /* Ensure it appears on top of other elements */
            background-color: rgb(54, 119, 224);
            color: #fff;
            cursor: pointer;
            border-radius: 40px;
            height: 60px;
            width: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
        }

        .popup-button:hover {
            background-color: red;
            color: #fff;
        }
    </style>
</head>
<body>
    <!-- Mobile nav toggle button -->
    <i class="bi bi-list mobile-nav-toggle d-lg-none"></i>

    <!-- Header -->
    <header id="header" class="d-flex flex-column justify-content-center">
        <nav id="navbar" class="navbar nav-menu">
            <ul>
                <li><a href="dashbord.jsp" class="nav-link scrollto <%= request.getRequestURI().contains("dashbord.jsp") ? "active" : "" %>"><i class="bx bx-home"></i> <span>Dashbord</span></a></li>
                <li><a href="home.jsp" class="nav-link scrollto <%= request.getRequestURI().contains("home.jsp") ? "active" : "" %>"><i class="bx bx-user"></i> <span>Services</span></a></li>
                <li><a href="mybooking.jsp" class="nav-link scrollto <%= request.getRequestURI().contains("mybooking.jsp") ? "active" : "" %>"><i class="fa-solid fa-cart-shopping"></i> <span>My Booking</span></a></li>
                <li><a href="history.jsp" class="nav-link scrollto <%= request.getRequestURI().contains("history.jsp") ? "active" : "" %>"><i class="fa-solid fa-book"></i> <span>History</span></a></li>
                <li><a href="feedback.jsp" class="nav-link scrollto <%= request.getRequestURI().contains("feedback.jsp") ? "active" : "" %>"><i class="fa-solid fa-user-tie"></i> <span>FeedBack</span></a></li>
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <main>
        <!-- Your main content goes here -->
    </main>

    <!-- Popup Button and Popup Div -->
    <%if(request.getRequestURI().contains("home.jsp")||request.getRequestURI().contains("dashbord.jsp")){%>
    <a class="popup-button" id="openPopup"><i id="myIcon" class="fa-solid fa-cart-shopping"></i></a>   
    <div class="popup container mt-5" id="popupDiv">
        <jsp:include page="chatbox.jsp"></jsp:include>
    </div>
<%}%>
    <!-- JavaScript to toggle the popup -->
    <script>
        const openButton = document.getElementById('openPopup');
        const popupDiv = document.getElementById('popupDiv');
        const myIcon = document.getElementById('myIcon');

        function openPopup() {
            popupDiv.style.display = 'block';
            myIcon.className = 'fa-solid fa-xmark'; 
        }

        function closePopup() {
            popupDiv.style.display = 'none';
            myIcon.className = 'fa-solid fa-cart-shopping'; 
        }

        openButton.addEventListener('click', function() {
            if (popupDiv.style.display != 'block') {
                openPopup();
            } else {
                closePopup();
            }
        });
    </script>
    <jsp:include page="mata.jsp"></jsp:include>
</body>
</html>
