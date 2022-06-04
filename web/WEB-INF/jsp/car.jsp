<%-- 
    Document   : car
    Created on : 24 Apr, 2022, 8:09:44 PM
    Author     : smit sheth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="java.util.List" %>
<%@page import="com.carrent.beans.Car" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Best Cars for Rent</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <link href="<c:url value='/resources/img/favicon.ico'/>" rel="icon">

    <link rel="preconnect" href="<c:url value='https://fonts.gstatic.com'/>">
    <link href="<c:url value='https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Rubik&display=swap'/>"
        rel="stylesheet">

    <link href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css'/>" rel="stylesheet">

    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">

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
<!--                    <a href="login" class="nav-item nav-link ">Login</a>
                        <a href="register" class="nav-item nav-link ">Register</a-->

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
                            <!--<a href="adminbooking" class="nav-item nav-link ">view bookings</a>-->
                            <a href="logout" class="nav-item nav-link ">Logout</a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->




    <!-- Rent A Car Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-uppercase text-center mb-5">Find Your Car</h1>
            <div class="row">


                <c:forEach var = "allCars" items="${allCars}" >
                    <div class="col-lg-4 col-md-6 mb-2">
                        <div class="rent-item mb-4">
                            <h4 class="text-uppercase mb-4"><c:out value="${allCars.getCname()}"/></h4>
                            
                            <p class="text-uppercase mb-4"><c:out value="${allCars.getDescription()}"/></p>
                            <c:if test="${empty user}">
                                <a class="btn btn-primary px-3" href="login">More Details</a>
                            </c:if>
                            
                            <c:if test="${not empty user && !user.equals('admin')}">
                                <a class="btn btn-primary px-3" href="getcar?carId=${allCars.getCarid()}">More Details</a>
                            </c:if>
                            
                            <c:if test="${not empty user && user.equals('admin')}">
                                <a class="btn btn-primary px-3" href="getcar?carId=${allCars.getCarid()}">Update</a>
                                <a class="btn btn-primary px-3" href="deletecar?carId=${allCars.getCarid()}">Delete</a>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>
    <!-- Rent A Car End -->

    <div class="container-fluid bg-dark py-4 px-sm-3 px-md-5">
        <p class="mb-2 text-center text-body">&copy; <a href="#">www.carverse.com</a>. All Rights Reserved.</p>


        <p class="m-0 text-center text-body">Designed by <a href="#">Neel and Smit</a></p>
    </div>



    <!-- JavaScript Libraries -->
    <script src="<c:url value='https://code.jquery.com/jquery-3.4.1.min.js'/>"></script>
                <script src="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js'/>"></script>
                <script src="<c:url value='lib/easing/easing.min.js'/>"></script>
                <script src="<c:url value='lib/waypoints/waypoints.min.js'/>"></script>
    <script src="<c:url value='lib/owlcarousel/owl.carousel.min.js'/>"></script>
    <script src="<c:url value='lib/tempusdominus/js/moment.min.js'/>"></script>
    <script src="<c:url value='lib/tempusdominus/js/moment-timezone.min.js'/>"></script>
    <script src="<c:url value='lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js'/>"></script>
    <script src="<c:url value='/resources/js/matchheight.js'/>"></script>
    <script>    
        $(document).ready(function(){
            $(".rent-item p").matchHeight();
        })
    </script>
    <!-- Template Javascript -->
    <script src="<c:url value='js/main.js'/>"></script>
</body>

</html>
