<%-- 
    Document   : carbooking
    Created on : 25 Apr, 2022, 7:55:06 PM
    Author     : smit sheth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="java.util.List" %>
<%@page import="com.carrent.beans.Car"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>CARVERSE | Car Booking</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="<c:url value='/resources/img/favicon.ico'/>" rel="icon">
    
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="<c:url value='https://fonts.gstatic.com'/>">
    <link href="<c:url value='https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Rubik&display=swap'/>" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css'/>" rel="stylesheet">


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
    <div class="nav-bar-2">
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
                        <a href="index.html" class="nav-item nav-link">Home</a>
                        <a href="about.html" class="nav-item nav-link">About</a>
                        <a href="car.html" class="nav-item nav-link ">Cars</a>
<!--                        <a href="login.html" class="nav-item nav-link ">Login</a>
                        <a href="Register.html" class="nav-item nav-link ">Register</a>-->
                        <c:if test="${empty user}">
                            <a href="login" class="nav-item nav-link ">Login</a>
                            <a href="register" class="nav-item nav-link ">Register</a>
                        </c:if>
                        
                        <c:if test="${not empty user && !user.equals('admin')}">
                            <a href="#" class="nav-item nav-link ">Hello ${user}</a>
                            <a href="logout" class="nav-item nav-link ">Logout</a>
                        </c:if>
                            
                        <c:if test="${not empty user && user.equals('admin')}">
                            <a href="caradd" class="nav-item nav-link ">add car</a>
                            <a href="adminbooking" class="nav-item nav-link ">view bookings</a>
                            <a href="logout" class="nav-item nav-link ">Logout</a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->

    <!-- Page Header Start -->
    <div class="container-fluid page-header-2 mt-5">
        <h1 class="display-3 text-uppercase text-white mb-3">Car Booking</h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href="">Home</a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0">Car Booking</h6>
        </div>
    </div>
    <!-- Page Header Start -->

    <!-- Detail Start -->
    <div class="container-fluid">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-uppercase mb-5">${carById.getCname()}</h1>
            <div class="row align-items-center pb-2">
<!--                <div class="col-lg-6 mb-4">
                    <img class="img-fluid" src="img/bg-banner.jpg" alt="">
                </div>-->
                <div class="col-lg-6 mb-4">
                    <h4 class="mb-2">&#x20B9; ${carById.getPrice()}/day</h4><br>
                    <p>${carById.getDescription()}</p>
                    <p>Fuel Type: ${carById.getFueltype()}</p>
                    <p>Seats: ${carById.getSeat()}</p>
                    <p>Available in: ${carById.getCity()}</p>
                    <p>Car Owner: ${carById.getCowner()}</p>
                    <p>Owner's Mobile No: ${carById.getOwner_mobile()}</p>
                    <p>Owner's Email Address: ${carById.getOwner_email()}</p>
                    
                    
                    <div class="text-center text-lg-start mt-4 pt-2">
                            <a href="https://mail.google.com/mail/u/0/?to=${carById.getOwner_email()}&su=SUBJECT&body=BODY&fs=1&tf=cm" 
                               class="btn btn-primary py-md-3 px-md-5 mt-2" target="_blank">Message Owner</a>
                            <p class="small fw-bold mt-2 pt-1 mb-0"><a href="car"
                      class="link-danger">Back to Cars</a></p>
                        </div>
                </div>
            </div>
            
        </div>
    </div>
    <!-- Detail End -->

    
    
    <!-- Car Booking Start -->
<!--    <div class="container-fluid pb-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <h2 class="mb-4">Personal Detail</h2>
                    <div class="mb-5">
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" placeholder="First Name" required="required">
                            </div>
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" placeholder="Last Name" required="required">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="email" class="form-control p-4" placeholder="Your Email" required="required">
                            </div>
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" placeholder="Mobile Number" required="required">
                            </div>
                        </div>
                    </div>
                    <h2 class="mb-4">Booking Detail</h2>
                    <div class="mb-5">
                        <div class="row">
                            <div class="col-6 form-group">
                                <div class="date" id="date2" data-target-input="nearest">
                                    <input type="text" class="form-control p-4 datetimepicker-input" placeholder="Pickup Date"
                                        data-target="#date2" data-toggle="datetimepicker" />
                                </div>
                            </div>
                            <div class="col-6 form-group">
                                <div class="time" id="time2" data-target-input="nearest">
                                    <input type="text" class="form-control p-4 datetimepicker-input" placeholder="Pickup Time"
                                        data-target="#time2" data-toggle="datetimepicker" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <div class="date" id="date2" data-target-input="nearest">
                                    <input type="text" class="form-control p-4 datetimepicker-input" placeholder="End Date"
                                        data-target="#date2" data-toggle="datetimepicker" />
                                </div>
                            </div>
                            <div class="col-6 form-group">
                                <div class="time" id="time2" data-target-input="nearest">
                                    <input type="text" class="form-control p-4 datetimepicker-input" placeholder="End Time"
                                        data-target="#time2" data-toggle="datetimepicker" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <div class="time" id="time2" data-target-input="nearest">
                                    <select class="form-select mb-4 form-control form-control-md" aria-placeholder="Select Payment Mode"
                                aria-label="Default select example" name="fueltype" >

                            <option value="cash">Cash</option>
                            <option value="cheque">Cheque</option>
                            <option value="upi">UPI</option>
                            <option value="debit">Debit Card</option>
                            <option value="credit">Credit Card</option>
                        </select> 
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control py-3 px-4" rows="3" placeholder="Special Request" required="required"></textarea>
                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                            <button type="button" class="btn btn-primary btn-lg"
                              style="padding-left: 2.5rem; padding-right: 2.5rem;">Book Car</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>-->
    <!-- Car Booking End -->

    <div class="container-fluid bg-dark py-4 px-sm-3 px-md-5">
        <p class="mb-2 text-center text-body">&copy; <a href="#">www.carverse.com</a>. All Rights Reserved.</p>
		
        <p class="m-0 text-center text-body">Designed by <a href="#">Neel and Smit</a></p>
    </div>

    <script src="js/main.js"></script>
</body>

</html>
