<%-- 
    Document   : caradd
    Created on : 24 Apr, 2022, 8:42:08 PM
    Author     : smit sheth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carverse | ADD CAR</title>
    <link href="<c:url value='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css'/>" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="<c:url value='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js'/>"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <link href="<c:url value='/resources/img/favicon.ico'/>" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="<c:url value='https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Rubik&display=swap'/>"
        rel="stylesheet">

    <!-- Font Awesome -->
    <link href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css'/>" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <!-- <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" /> -->

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
</head>

<body>
    <div class="nav-bar-2">
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
                        <a href="caradd" class="nav-item nav-link ">add car</a>
<!--                        <a href="adminbooking" class="nav-item nav-link ">view bookings</a>-->
                        <a href="logout" class="nav-item nav-link ">Logout</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <section class="vh-100">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="<c:url value='/resources/img/about.png'/>" class="img-fluid" alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    
                    <div class="p-3" style="text-align: center">
                        <h2 class="text-red text-uppercase mb-md-3">Insert Car Details</h2>
                    </div>
                    
                    <c:if test="${not empty isCarAdded && !isCarAdded}">
                        <div class="alert alert-danger mb-md-3">
                            unable to add car, please try again!
                        </div>
                    </c:if>
                    
                    <c:if test="${not empty isCarAdded && isCarAdded}">
                        <div class="alert alert-success mb-md-3">
                            Car is added successfully!
                        </div>
                    </c:if>
                    
                    <form method='post' action="caradd">
                        
                        <div class="form-outline mb-4 mt-4">
                            <label class="form-label" for="form3Example3">Car Name</label>
                            <input type="text" id="form3Example3" class="form-control form-control-md"
                                name="cname" placeholder="Enter Car name" required/>
                        </div>
                        
                        <label class="form-label" for="form3Example3">Fuel Type</label>
                        <select class="form-select mb-4 form-control form-control-md"
                                aria-label="Default select example" name="fueltype" >

                            <option value="petrol">Petrol</option>
                            <option value="diesel">Diesel</option>
                        </select> 
                        
                        <div class="form-outline mb-4 mt-4">
                            <label class="form-label" for="form3Example3">Car's owner Name</label>
                            <input type="text" id="form3Example3" class="form-control form-control-md"
                                name="cowner" placeholder="Enter Car's owner name" required/>
                        </div>
                        
                        <div class="form-outline mb-4 mt-4">
                            <label class="form-label" for="form3Example3">owner's mobile no.</label>
                            <input type="tel" id="form3Example3" class="form-control form-control-md"
                                name="owner_mobile" placeholder="Enter Car's owner's contact number" required
                                pattern="[0-9]{10}" oninput="this.setCustomValidity('')" 
                                oninvalid="this.setCustomValidity('mobile number must be 10 digit number')"/>
                        </div>
                        
                        <div class="form-outline mb-4 mt-4">
                            <label class="form-label" for="form3Example3">owner's Emailid</label>
                            <input type="email" id="form3Example3" class="form-control form-control-md"
                                name="owner_email" placeholder="Enter Car's owner's email address" required/>
                        </div>
                        
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example3">City</label>
                            <input type="text" id="form3Example3" class="form-control form-control-md"
                                   placeholder="Enter available city" name="city" required/>
                        </div>
                        
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example3">Car Seats</label>
                            <input type="text" id="form3Example3" class="form-control form-control-md"
                                placeholder="Enter number of seats in car" name="seat"/>
                        </div>
                        
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example3">Price per day</label>
                            <input type="text" id="form3Example3" class="form-control form-control-md"
                                   placeholder="Enter rent price" name="price"/>
                        </div>
                        
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example3">Car Description</label>
                            <input type="textarea" id="form3Example3" class="form-control form-control-md"
                                   placeholder="Enter description" name="description" required/>
                        </div>
                        
                        <div class="text-center text-lg-start mt-4 pt-2">
                            <input type="submit" value="Add Car" class="btn btn-primary btn-lg"
                                style="padding-left: 2.5rem; padding-right: 2.5rem;">
                            <p class="small fw-bold mt-2 pt-1 mb-0"><a href="index" class="link-danger">Back to
                                    home page ?</a></p>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        </div>
    </section>
</body>

</html>
