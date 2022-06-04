<%-- 
    Document   : about
    Created on : 22 Apr, 2022, 9:10:06 PM
    Author     : smit sheth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>ROYAL CARS - Car Rental HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="<c:url value='/resources/img/favicon.ico'/>" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="<c:url value='https://fonts.gstatic.com'/>">
    <link href="<c:url value='https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Rubik&display=swap'/>"
        rel="stylesheet">

    <!-- Font Awesome -->
    <link href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css'/>" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<c:url value='lib/owlcarousel/assets/owl.carousel.min.css'/>" rel="stylesheet">
    <link href="<c:url value='lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css'/>" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
</head>

<body>
    <%
        HttpSession usersession = request.getSession(Boolean.FALSE);
        String user = (String)usersession.getAttribute("user");
    %>
    <!-- Navbar Start -->
    <div class="nav-bar">
        <div style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-secondary navbar-dark py-3 py-lg-0 pl-3 pl-lg-5">
                <a href="index" class="navbar-brand">
                    <h1 class="text-uppercase text-primary mb-1">Carverse</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                    <div class="navbar-nav ml-auto py-0">
                        <a href="index" class="nav-item nav-link">Home</a>
                        <a href="about" class="nav-item nav-link">About</a>
                        <a href="car" class="nav-item nav-link ">Cars</a>
                        
                        <c:if test="${empty user}">
                            <a href="login" class="nav-item nav-link ">Login</a>
                            <a href="register" class="nav-item nav-link ">Register</a>
                        </c:if>
                        
                        <c:if test="${not empty user && !user.equals('admin')}">
                            <a href="#" class="nav-item nav-link ">Hello_${user}</a>
                            <a href="logout" class="nav-item nav-link ">Logout</a>
                        </c:if>
                            
                        <c:if test="${not empty user && user.equals('admin')}">
                            <a href="caradd" class="nav-item nav-link ">Add_Car</a>
                            <!--<a href="adminbooking" class="nav-item nav-link ">View_Bookings</a>-->
                            <a href="logout" class="nav-item nav-link ">Logout</a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->



    <!-- About Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <h1 class="display-1 text-primary text-center">01</h1>
            <h1 class="display-4 text-uppercase text-center mb-5">Welcome To <span class="text-primary">Carverse</span></h1>
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <img class="w-75 mb-4" src="<c:url value='/resources/img/about.png'/>" alt="">
                    <p>Welcome to CARVERSE, here you will be able to rent the cars of your choice.<br>We have huge number
                        of cars to choose</p>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-light p-4 mb-4" style="height: 150px;">
                        <!-- <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4" style="width: 100px; height: 100px;"> -->
                        <!-- <i class="fa fa-2x fa-headset text-secondary"></i> -->
                        <!-- </div> -->
                        <h4 class="text-uppercase m-0">24/7 Car Rental Support</h4>
                    </div>
                </div>
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-secondary p-4 mb-4" style="height: 150px;">
                        <!-- <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4" style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-car text-secondary"></i>
                        </div> -->
                        <h4 class="text-light text-uppercase m-0">Car Reservation Anytime</h4>
                    </div>
                </div>
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-light p-4 mb-4" style="height: 150px;">
                        <!-- <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4" style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-map-marker-alt text-secondary"></i>
                        </div> -->
                        <h4 class="text-uppercase m-0">Lots Of Pickup Locations</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Banner Start -->
    <div style="text-align:center">
        <!-- <div class="container-fluid py-5"> -->
            <div class="container py-5">
                <div class="row mx-0">
                    <div class="col-lg-6 px-0">
                        <div class="px-5 bg-dark d-flex align-items-center justify-content-between"
                            style="height: 350px;">
                            <div class="text-left">
                                <h3 class="text-uppercase text-light mb-3">Looking for a car?</h3>
                                <br>
                                <a class="btn btn-primary py-2 px-4" href="car">Start Now</a>
                            </div>
                            <img class="img-fluid flex-shrink-0 mr-n5 w-50 ml-4" src="<c:url  value='/resources/img/banner-right.png'/>" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->


   


    
    <div class="container-fluid bg-dark py-4 px-sm-3 px-md-5">
        <p class="mb-2 text-center text-body">&copy; <a href="index">www.carverse.com</a>. All Rights Reserved.</p>
		
							
        <p class="m-0 text-center text-body">Designed by <a href="index">Neel and Smit</a></p>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
