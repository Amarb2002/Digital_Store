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
height:60px;
width:60px;
    display: flex;
    align-items: center;
    
    justify-content: center;
    font:15px;
}

 .popup-button:hover {
/* Ensure it appears on top of other elements */
    background-color: red;
    color: #fff;

/* } .popup-button:active {
/* Ensure it appears on top of other elements */
    background-color: red;
   

} */
</style>
</head>
<body>

    <!-- ======= Mobile nav toggle button ======= -->
    <!-- <button type="button" class="mobile-nav-toggle d-xl-none"><i class="bi bi-list mobile-nav-toggle"></i></button> -->
    <i class="bi bi-list mobile-nav-toggle d-lg-none"></i>
    <!-- ======= Header ======= -->
    <header id="header" class="d-flex flex-column justify-content-center">

        <nav id="navbar" class="navbar nav-menu">
            <ul>
                <li><a href="#hero" class="nav-link scrollto active"><i class="bx bx-home"></i> <span>Dashbord</span></a></li>
                <li><a href="#about" class="nav-link scrollto"><i class="bx bx-user"></i> <span>Servies</span></a></li>
                <li><a href="#about" class="nav-link scrollto"><i class="fa-solid fa-cart-shopping"></i> <span>cart</span></a></li>
                <li><a href="#resume" class="nav-link scrollto"><i class="fa-solid fa-book"></i> <span>My Orders</span></a></li>
                <li><a href="#portfolio" class="nav-link scrollto"><i class="fa-solid fa-user-tie"></i> <span>Support</span></a></li>
            </ul>
        </nav>
        <!-- .nav-menu -->

    </header>
    <!-- End Header -->


    <!-- End Portfolio Section -->

    <!-- ======= Services Section ======= -->

    <!-- End Contact Section -->

    </main>
    <!-- End #main -->
 <!-- ======= Hero Section ======= -->
    <!-- View End-->
    <!-- popup button start-->
    <%-- <button class=" popup-button nav-link scrollto active" id="openPopup">
        <i class="fa fa-envelope"></i>B
    </button> --%>
    <!-- Popup div -->
     <a  class="popup-button" id="openPopup"><i id="myIcon" class="fa fa-envelope"></i></a>   
    <div class="popup container mt-5" id="popupDiv">
         <!-- Close button -->
        <jsp:include page="chatbox.jsp"></jsp:include>
    </div>
    <script>    
    // active color
    // document.getElementById('openPopup').addEventListener('click', function() {
    // this.classList.toggle('active');
    // });
</script>
    <script> // Get references to the button and popup div
    const openButton = document.getElementById('openPopup');
    const popupDiv = document.getElementById('popupDiv');
    const closeButton = document.getElementById('closePopup');
    const myIcon = document.getElementById('myIcon');


    // Function to open the popup
    function openPopup() {
        popupDiv.style.display = 'block';
        myIcon.className = 'fa-solid fa-xmark'; 
    }

    // Function to close the popup
    function closePopup() {
        popupDiv.style.display = 'none';
        myIcon.className = 'fa fa-envelope'; 
    }

    // Event listener for the open button
    openButton.addEventListener('click', function() {
        if(popupDiv.style.display!='block'){
        openPopup();
        
        }else{
            closePopup();
            
        }
    });

    // myIcon.className = 'fa-solid fa-xmark'; 
    // myIcon.className = 'fa fa-envelope'; 
</script>



  
    
<!-- popup button End-->

    <!-- Vendor JS Files -->
   
<script src="Desine/popup.js"></script>
<jsp:include page="mata.jsp"></jsp:include>
</body>

</html>