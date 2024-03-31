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

        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">
        <script src="../assets/vendor/jquery/jquery.min.js"></script>

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
                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800 font-weight-bold">Home</h1>
                        </div>
                        <div class="row row-cols-1 row-cols-xl-2">
                            <div class="col p-4">
                                <div class="card ">
                                    <%                                       
                                        dbConnect query1 = new dbConnect();
                                        ResultSet rs = null;
                                        String sql = "SELECT * FROM \"public\".\"user\" INNER JOIN \"public\".patient ON \"public\".patient.user_id = \"public\".\"user\".\"id\" WHERE \"public\".\"user\".id = '" + id + "'";
                                        rs = query1.sqlquery(sql);
                                        rs.next();

                                    %>
                                    <div class="card-header">My Profile</div>
                                    <div class="card-body">
                                        <div class="d-flex justify-content-center mb-4">
                                            <img src="../assets/img/profile-pic.jpg" style="height:200px;width:200px;object-fit: cover;border-radius: 100%">
                                        </div>
                                        <hr>
                                        <div class="mt-4">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend " >
                                                    <span class="input-group-text " id="basic-addon1">Name</span>
                                                </div>
                                                <input type="text" class="form-control" value="<%out.println(rs.getString("name"));%>"readonly>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Date of Birth</span>
                                                </div>
                                                <input type="text" class="form-control" value="<%out.println(rs.getString("dob"));%>" readonly>
                                            </div>   
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Gender</span>
                                                </div>
                                                <input type="text" class="form-control" value="<%out.println(rs.getString("gender"));%>"readonly>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Address</span>
                                                </div>
                                                <textarea class="form-control" aria-label="With textarea" readonly><%out.println(rs.getString("address"));%></textarea>
                                            </div>


                                        </div>
                                    </div>
                                    <div class="card-footer"><a class="btn btn-secondary" href="edit_profile.jsp">Update Profile</a></div>
                                </div>
                            </div>
                            <div class="col p-4">
                                <h5 class="font-weight-bolder">Upcoming Appointment</h5>
                                <%
                                    LocalDate currentDate = LocalDate.now();
                                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                    String formattedDate = currentDate.format(formatter);

                                    ResultSet rs2 = null;
                                    String sql2 = "SELECT * ,doctor.name AS doc_name, patient.name AS patient_name, appointment.status AS app_status  FROM \"public\".patient "
                                            + "INNER JOIN \"public\".appointment ON \"public\".appointment.patient_id = \"public\".patient.\"id\" "
                                            + "INNER JOIN \"public\".slot ON \"public\".appointment.slot_id = \"public\".slot.\"id\" "
                                            + "INNER JOIN \"public\".doctor ON \"public\".slot.doctor_id = \"public\".doctor.\"id\" "
                                            + "WHERE \"public\".patient.user_id = '" + id + "' AND \"public\".slot.date >= '" + formattedDate + "'";
                                    rs2 = query1.sqlquery(sql2);
                                    int i = 1;
                                    if (rs2.next()) {
                                        do {
                                %>

                                <div class="card card-body mb-3">
                                    <div class="row">
                                        <div class="col-2 text-center">
                                            <span class="badge badge-primary text-wrap rounded-circle icon-modify"><i class="fa-solid fa-calendar-check" style="font-size:30px"></i></span>
                                        </div>
                                        <div class="col-10">
                                            <div class="d-sm-flex align-items-center justify-content-between">
                                                <h6 class="font-weight-bolder"><span class="mr-2"><%out.println(rs2.getString("date"));%></span> | <span class="ml-2"><%out.println(rs2.getString("time"));%></span> </h6>
                                                <span class="badge <%out.println(rs2.getString("app_status").equals("booked") ? "badge-success" : "badge-danger"); %>"> <%out.println(rs2.getString("app_status"));%> </span>
                                            </div>
                                            <span class="font-weight-bold mr-4 name-span" ><%out.println(rs2.getString("doc_name"));%></span>
                                            <span class="font-weight-light"> Room 2</span>
                                        </div>
                                    </div>
                                </div>
                                <% } while (rs2.next());
                                } else {%>
                                <div class="card card-body mb-3">
                                    <div class="row">
                                        <div class="col-2 text-center">
                                            <span class="badge badge-primary text-wrap rounded-circle icon-modify"><i class="fa-solid fa-face-sad-tear" style="font-size:30px"></i></span>
                                        </div>
                                        <div class="col-10">
                                            <div class="d-grid">
                                                <h6 class="font-weight-bolder">No appointment made at this moment</h6>
                                                <a class="btn btn-dark" href="slot.jsp">View Slot</a>
                                            </div>                  
                                        </div>

                                    </div>
                                    <%
                                        }
                                    %>
                                </div>

                            </div>
                        </div>
                        <!-- /.container-fluid -->

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
            <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../assets/js/sb-admin-2.min.js"></script>


    </body>

</html>
<%
    }
%>
