<%-- 
    Document   : home
    Created on : Mar 21, 2024, 9:13:59 AM
    Author     : nur_n
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbcon.dbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if (session.getAttribute("user_id") == null) {
        response.sendRedirect("/HospitalManagementSystem/login.jsp");
    } else {%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../assets/img/hospital_icon.png" >
        <title>Medilab | HM System</title>

        <!-- Custom fonts for this template-->
        <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">


        <!-- Custom styles for this template-->
        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">

    </head>
    <style>
        .input-group-text{
            background-color: #2c4964;
            color:white;
            font-weight: 700;
            min-width:150px
        }
        .icon-modify{
            background-color: #2c4964;
            padding:15px;
        }
        .name-span{
            color:#2c4964;
        }
    </style>

    <body id="page-top">
        <%
            Integer id = (Integer) request.getSession().getAttribute("user_id");

        %>

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="component/sidebar.jsp" /> 
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <jsp:include page="component/topbar.jsp" /> 
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <%if ("updated".equals(request.getParameter("status"))) {%>
                        <div class="alert alert-success" role="alert">
                            Your profile updated successfully!!
                        </div>
                        <% } else if ("failed".equals(request.getParameter("status"))) {%>
                        <div class="alert alert-danger" role="alert">
                            Profile failed to update!!
                        </div>
                        <% }%>

                        <div class="d-flex justify-content-center mb-3 w-100" >
                            <%    dbConnect query1 = new dbConnect();
                                   ResultSet rs = null;
                                   String sql = "SELECT * FROM \"public\".\"user\" INNER JOIN \"public\".patient ON \"public\".patient.user_id = \"public\".\"user\".\"id\" WHERE \"public\".\"user\".id = '" + id + "'";
                                   rs = query1.sqlquery(sql);
                                   rs.next();

                            %>
                            <form action="../updatepatient" method="post">
                                <div class="card " style="max-width:500px;">

                                    <div class="card-header">My Profile</div>
                                    <div class="card-body">
                                        <div class="d-flex justify-content-center mb-4">
                                            <img src="https://source.unsplash.com/random/?person" style="height:200px;width:200px;object-fit: cover;border-radius: 100%">
                                        </div>
                                        <hr>
                                        <div class="mt-4">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend " >
                                                    <span class="input-group-text " id="basic-addon1">Name</span>
                                                </div>
                                                <input type="text" class="form-control" name="name" value="<%out.println(rs.getString("name"));%>" >
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Date of Birth</span>
                                                </div>
                                                <input type="date" name="dob" value=<%out.println(rs.getString("dob").trim());%> class="form-control" />
                                            </div>   
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Gender</span>
                                                </div>
                                                <select class="form-control r custom-select col-8 " id="inputGroupSelect01" id="gender" name="gender"  required>
                                                    <option disabled selected value="0">Choose...</option>
                                                    <option value="male" <%out.println("male".equals(rs.getString("gender")) ? "selected" : "");%> >Male</option>
                                                    <option value="female"<%out.println("female".equals(rs.getString("gender")) ? "selected" : "");%>>Female</option>
                                                </select>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Address</span>
                                                </div>
                                                <textarea class="form-control" aria-label="With textarea"  name="address"><%out.println(rs.getString("address"));%></textarea>
                                            </div>

                                            <p class="font-weight-bold">Contact Details</p>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend " >
                                                    <span class="input-group-text " id="basic-addon1">Phone Number</span>
                                                </div>
                                                <input type="text" class="form-control col-8"
                                                       id="phone_number" name="phone_number" value="<%out.println(rs.getString("phone_number"));%>" required>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend " >
                                                    <span class="input-group-text " id="basic-addon1">Email</span>
                                                </div>
                                                <input type="email mb-3" class="form-control col-8"
                                                       id="email"  name="email" value="<%out.println(rs.getString("email"));%>" required>
                                            </div>
                                            <div class="input-group  mb-3">
                                                <div class="input-group-prepend " >
                                                    <span class="input-group-text " id="basic-addon1">Username</span>
                                                </div>
                                                <input type="email" class="form-control col-8"
                                                       id="email"  name="email" value="<%out.println(rs.getString("username"));%>" required>
                                            </div>
                                            <div class="input-group">
                                                <div class="input-group-prepend " >
                                                    <span class="input-group-text " id="basic-addon1">Password</span>
                                                </div>
                                                <input type="password" class="form-control col-8"
                                                       id="password" name="password" >
                                            </div>
                                            <span class="font-weight-light text-secondary"style="font-size:x-small">*Skip this input if don't want to change the password</span>
                                            <div class=" mb-3" id="password-strength-status"></div>

                                            <div class="input-group">
                                                <div class="input-group-prepend " >
                                                    <span class="input-group-text " id="basic-addon1">Confirm Password</span>
                                                </div>
                                                <input type="password" class="form-control col-8"
                                                       id="confirm-password"  name="confirm-password" >
                                            </div>
                                            <span class="font-weight-light text-secondary"style="font-size:x-small">*Skip this input if don't want to change the password</span>
                                            <div id="password-confirm-status"></div>


                                        </div>
                                    </div>
                                    <div class="card-footer"><button class="btn btn-secondary" type="submit">Update Profile</button></div>
                                </div>
                            </form>

                        </div>
                    </div>
                    <!-- End of Main Content -->

                    <!-- Footer -->
                    <footer class="sticky-footer bg-white">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>Copyright &copy; Your Website 2021</span>
                            </div>
                        </div>
                    </footer>
                    <!-- End of Footer -->

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Page Wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Bootstrap core JavaScript-->
            <script src="../assets/vendor/jquery/jquery.min.js"></script>
            <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="../assets/js/sb-admin-2.min.js"></script>

            <script src="../assets/vendor/jquery/jquery.min.js"></script>
            <script>
                $(document).ready(function () {
                    $('#password').on('input', function () {
                        var number = /([0-9])/;
                        var alphabets = /([a-zA-Z])/;
                        var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;
                        var password = $(this).val().trim();
                        if (password.length < 6) {
                            $('#password-strength-status').removeClass();
                            $('#password-strength-status').addClass('alert alert-danger');
                            $('#password-strength-status').html("Weak (should be atleast 6 characters.)");
                            $('#register-btn').prop('disabled', true);
                        } else {
                            if (password.match(number) && password.match(alphabets) && password.match(special_characters)) {
                                $('#password-strength-status').removeClass();
                                $('#password-strength-status').addClass('alert alert-success');
                                $('#password-strength-status').html("Strong");
                                $('#register-btn').prop('disabled', false);

                            } else {
                                $('#password-strength-status').removeClass();
                                $('#password-strength-status').addClass('alert alert-warning');
                                $('#password-strength-status').html("Medium (should include alphabets, numbers and special characters.)");
                                $('#register-btn').prop('disabled', true);

                            }
                        }
                    })
                })
                $("#confirm-password").on('input', function () {
                    var password = $("#password").val();
                    var confirmPassword = $("#confirm-password").val();
                    if (password != confirmPassword) {
                        $('#password-confirm-status').removeClass();
                        $('#password-confirm-status').addClass('alert alert-danger');
                        $('#password-confirm-status').html("Password does not match !");
                        $('#register-btn').prop('disabled', true);

                    } else {

                        $('#password-confirm-status').removeClass();
                        $('#password-confirm-status').addClass('alert alert-success');
                        $('#password-confirm-status').html("Password match !");
                        $('#register-btn').prop('disabled', false);

                    }
                });
            </script>


    </body>

</html>
<%
    }
%>
