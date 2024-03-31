<%-- 
    Document   : login
    Created on : Mar 21, 2024, 8:43:31 AM
    Author     : nur_n
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Medilab</title>
        <meta content="" name="description">
        <meta content="" name="keywords">
        <link rel="icon" href="assets/img/hospital_icon.png" >

        <!-- Custom styles for this template-->
        <link href="assets/css/sb-admin-2.min.css" rel="stylesheet">
    </head>
    <body style="background-color:#1977cc">

        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5" style="height:100vdh">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block"> <img src="https://source.unsplash.com/random/?doctor" style="height:100%;width: 100%;object-fit: cover"></div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                        </div>
                                        <form class="user" action="checklogin" method="post">
                                            <div class="form-group">
                                                <input type="email" class="form-control "
                                                       id="exampleInputEmail" name="email" aria-describedby="emailHelp"
                                                       placeholder="Enter Email Address...">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control " name="password"
                                                       id="exampleInputPassword" placeholder="Password">
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox small">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck">
                                                    <label class="custom-control-label" for="customCheck">Remember
                                                        Me</label>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary btn-user btn-block">
                                                Login
                                            </button>

                                        </form>
                                        <hr>

                                        <div class="text-center">
                                            <a class="small" href="patient/registration.jsp">Create an Account!</a>
                                        </div>
                                        <div class="text-center">
                                            <a class="small" href="index.jsp">View Our Web-site</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <jsp:include page="component/js-link.jsp" /> 

    </body>


</html>
