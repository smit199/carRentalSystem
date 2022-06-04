<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Car Rental System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <link href="<c:url value='/resources/img/favicon.ico'/>" rel="icon">

    <link rel="preconnect" href="<c:url value='https://fonts.gstatic.com'/>">
    <link href='<c:url value="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Rubik&display=swap"/>' rel="stylesheet"> 

    <link href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css'/>" rel="stylesheet">
    <!--<link href="<c:url value='/resources/all.min.css'/>" rel="stylesheet">-->
    <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
</head>

<body>
    <%
        HttpSession usersession = request.getSession(Boolean.FALSE);
        String user = (String)usersession.getAttribute("user");
    %>
    <!-- Navbar Start -->
    <div class="nav-bar">
        <div  style="z-index: 9;">
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
<!--                    <a href="login" class="nav-item nav-link ">Login</a>
                        <a href="register" class="nav-item nav-link ">Register</a-->

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
<!--                            <a href="adminbooking" class="nav-item nav-link ">View_Bookings</a>-->
                            <a href="logout" class="nav-item nav-link ">Logout</a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Carousel Start -->
    <div class="container-fluid p-0" style="margin-bottom: 90px;">
        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="<c:url value='/resources/img/carousel-1.jpg'/>" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h1 class="text-white text-uppercase mb-md-3">Rent A Car</h1>
                            <h1 class="display-1 text-white mb-md-4">Best Rental Cars In Your Location</h1>
                            <a href="car" class="btn btn-primary py-md-3 px-md-5 mt-2">Reserve Now</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="<c:url value='/resources/img/carousel-2.jpg'/>" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h4 class="text-white text-uppercase mb-md-3">Rent A Car</h4>
                            <h1 class="display-1 text-white mb-md-4">Quality Cars with Unlimited Miles</h1>
                            <a href="car" class="btn btn-primary py-md-3 px-md-5 mt-2">Reserve Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                    <span class="carousel-control-prev-icon mb-n2"></span>
                </div>
            </a>
            <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                    <span class="carousel-control-next-icon mb-n2"></span>
                </div>
            </a>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- About Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <h1 class="display-1 text-primary text-center">01</h1>
            <h1 class="display-4 text-uppercase text-center mb-5">Welcome To <span class="text-primary">Carverse</span></h1>
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <img class="w-75 mb-4" src="<c:url value='/resources/img/about.png'/>" alt="">
                    <p>Welcome to CARVERSE, here you will be able to rent the cars of you choice.<br>We have huge number of cars to choose</p>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-light p-4 mb-4" style="height: 150px;">
                        <h4 class="text-uppercase m-0">24/7 Car Rental Support</h4>
                    </div>
                </div>
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-secondary p-4 mb-4" style="height: 150px;">
                        <h4 class="text-light text-uppercase m-0">Car Reservation Anytime</h4>
                    </div>
                </div>
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-light p-4 mb-4" style="height: 150px;">
                        <h4 class="text-uppercase m-0">Lots Of Pickup Locations</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->
    

    
    <div class="container-fluid bg-dark py-4 px-sm-3 px-md-5">
        <p class="mb-2 text-center text-body">&copy; <a href="index">www.carverse.com</a>. All Rights Reserved.</p>
		
        <p class="m-0 text-center text-body">Designed by <a href="index">Neel and Smit</a></p>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <!--<script src="<c:url value='/resources/bootstrap.bundle.min.js'/>"></script>-->
</body>

</html>