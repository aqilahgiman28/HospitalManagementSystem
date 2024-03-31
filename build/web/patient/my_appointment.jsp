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
        <script src="https://cdn.lordicon.com/lordicon.js"></script>
        <!-- Custom fonts for this template-->
        <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">


        <!-- Custom styles for this template-->
        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">
        <script src="../assets/vendor/jquery/jquery.min.js"></script>

    </head>
    <style>

        .nav-link{
            margin:0px 20px 10px 0px;
        }
        .name-span{
            color:#2c4964;
        }
        .list-app{
            min-width:900px;
            margin:0px 10px
        }
        #view-app{
            color:black;
            text-decoration: none;
        }
         #view-app:hover{
            color:grey;
        }
    </style>

    <body id="page-top">

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
                            <h1 class="h3 mb-0 text-gray-800 font-weight-bold">My Appointment</h1>
                        </div>
                        <%
                            if ("added".equals(request.getParameter("appStatus"))) {
                        %>
                        <div class="alert alert-success" role="alert">
                            Appointment successfully booked!!
                        </div>
                        <% } else if ("failed".equals(request.getParameter("appStatus"))) {%>
                        <div class="alert alert-danger" role="alert">
                            data fail to add!
                        </div>
                        <% } else if ("failedUpdate".equals(request.getParameter("appStatus"))) {%>
                        <div class="alert alert-danger" role="alert">
                            data fail to update!
                        </div>
                        <% } %>

                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link btn btn-secondary active rounded-pill px-5" id="pills-all-tab" data-bs-toggle="pill" data-bs-target="#pills-all" type="button" role="tab" aria-controls="pills-all" aria-selected="true">All</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link btn btn-secondary rounded-pill px-5" id="pills-upcoming-tab" data-bs-toggle="pill" data-bs-target="#pills-upcoming" type="button" role="tab" aria-controls="pills-upcoming" aria-selected="false">Upcoming</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link btn btn-secondary rounded-pill px-5" id="pills-past-tab" data-bs-toggle="pill" data-bs-target="#pills-past" type="button" role="tab" aria-controls="pills-past" aria-selected="false">Past</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent" style="overflow-x: auto">
                            <div class="tab-pane fade show active" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab">

                                <div class="row mb-3 list-app" >
                                    <div class="card card-body text-light py-2 font-weight-bolder" style="background-color:#1977cc" >
                                        <div class="row align-items-center">
                                            <div class="col-1 align-middle">#</div>
                                            <div class="col-3">Date Time</div>
                                            <div class="col-2">Doctor</div>
                                            <div class="col-2">Room</div>
                                            <div class="col-2">Status</div>
                                            <div class="col-2 ">Action</div>

                                        </div>
                                    </div>
                                </div>
                                <%
                                    LocalDate currentDate = LocalDate.now();
                                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                    String formattedDate = currentDate.format(formatter);
                                    dbConnect query1 = new dbConnect();

                                    Integer id = (Integer) request.getSession().getAttribute("user_id");

                                    ResultSet rs = null;
                                    String sql = "SELECT *,appointment.id AS app_id, doctor.name AS doc_name, patient.name AS patient_name, appointment.status AS app_status FROM \"public\".patient "
                                            + "INNER JOIN \"public\".appointment ON \"public\".appointment.patient_id = \"public\".patient.\"id\" "
                                            + "INNER JOIN \"public\".slot ON \"public\".appointment.slot_id = \"public\".slot.\"id\" "
                                            + "INNER JOIN \"public\".doctor ON \"public\".slot.doctor_id = \"public\".doctor.\"id\" "
                                            + "WHERE \"public\".patient.user_id = '" + id + "' ORDER BY \"public\".slot.\"date\" DESC";
                                    rs = query1.sqlquery(sql);
                                    int i = 1;
                                    if (rs.next()) {
                                        do {
                                            LocalDate dateFromDB = LocalDate.parse(rs.getString("date"));
                                %>
                                <div class="row mb-1 list-app">
                                    <div class="card card-body my-0"  >
                                        <div class="row align-items-center">
                                            <div class="col-1" ><%out.println(i);%></div>
                                            <a class="col-3" id="view-app" href="view_appointment.jsp?app_id=<%out.println(rs.getString("app_id"));%>"><%out.println(rs.getString("date"));%> | <%out.println(rs.getString("time"));%></a>
                                            <div class="col-2"><%out.println(rs.getString("doc_name"));%></div>
                                            <div class="col-2">Room 1</div>
                                            <div class="col-2"><span class="badge <%out.println(rs.getString("app_status").equals("booked") ? "badge-success" : "badge-danger"); %>"> <%out.println(rs.getString("app_status"));%> </span></div>
                                            <div class="col-2 ">
                                                <button class="btn btn-danger w-100  btn-cancelation "<%out.println(rs.getString("app_status").equals("booked") && dateFromDB.isAfter(LocalDate.now()) ? "" : "disabled"); %>
                                                        data-id="<%out.println(rs.getString("app_id"));%>" >Cancel</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <% i++;
                                    } while (rs.next());
                                } else {%>
                                <div class="row mb-1 list-app">
                                    <div class="card card-body my-0">
                                        <div class="row align-items-center">
                                            <div class="col-12">No Appointment made at this moment </div>                                     
                                        </div>
                                    </div>
                                </div>
                                <%}%>

                            </div>



                            <div class="tab-pane fade" id="pills-upcoming" role="tabpanel" aria-labelledby="pills-upcoming-tab">


                                <div class="row mb-3 list-app" >
                                    <div class="card card-body text-light py-2 font-weight-bolder" style="background-color:#1977cc" >
                                        <div class="row align-items-center">
                                            <div class="col-1 align-middle">#</div>
                                            <div class="col-3">Date Time</div>
                                            <div class="col-2">Doctor</div>
                                            <div class="col-2">Room</div>
                                            <div class="col-2">Status</div>
                                            <div class="col-2 ">Action</div>

                                        </div>
                                    </div>
                                </div>
                                <%

                                    ResultSet rs2 = null;
                                    String sql2 = "SELECT *,appointment.id AS app_id, doctor.name AS doc_name, patient.name AS patient_name, appointment.status AS app_status FROM \"public\".patient "
                                            + "INNER JOIN \"public\".appointment ON \"public\".appointment.patient_id = \"public\".patient.\"id\" "
                                            + "INNER JOIN \"public\".slot ON \"public\".appointment.slot_id = \"public\".slot.\"id\" "
                                            + "INNER JOIN \"public\".doctor ON \"public\".slot.doctor_id = \"public\".doctor.\"id\" "
                                            + "WHERE \"public\".patient.user_id = '" + id + "' AND \"public\".slot.date >='" + formattedDate + "' "
                                            + "ORDER BY \"public\".slot.\"date\" DESC";

                                    rs2 = query1.sqlquery(sql2);
                                    int x = 1;
                                    if (rs2.next()) {
                                        do {
                                %>
                                <div class="row mb-1 list-app">
                                    <div class="card card-body my-0">
                                        <div class="row align-items-center">
                                            <div class="col-1"><%out.println(x);%></div>
                                            <div class="col-3"><%out.println(rs2.getString("date"));%> | <%out.println(rs2.getString("time"));%></div>
                                            <div class="col-2"><%out.println(rs2.getString("doc_name"));%></div>
                                            <div class="col-2">Room 1</div>
                                            <div class="col-2"><span class="badge <%out.println(rs2.getString("app_status").equals("booked") ? "badge-success" : "badge-danger"); %>"> <%out.println(rs2.getString("app_status"));%> </span></div>
                                            <div class="col-2 "><button class="btn btn-danger w-100  btn-cancelation "<%out.println(rs2.getString("app_status").equals("booked") ? "" : "disabled"); %>
                                                                        data-id="<%out.println(rs2.getString("app_id"));%>" >Cancel</button></div>

                                        </div>
                                    </div>
                                </div>

                                <% x++;
                                    } while (rs2.next());
                                } else {%>
                                <div class="row mb-1 list-app">
                                    <div class="card card-body my-0">
                                        <div class="row align-items-center">
                                            <div class="col-12">No Appointment made at this moment </div>                                     
                                        </div>
                                    </div>
                                </div>
                                <%}%>


                            </div>
                            <div class="tab-pane fade" id="pills-past" role="tabpanel" aria-labelledby="pills-past-tab">
                                <div class="row mb-3 list-app" >
                                    <div class="card card-body text-light py-2 font-weight-bolder" style="background-color:#1977cc" >
                                        <div class="row align-items-center">
                                            <div class="col-1 align-middle">#</div>
                                            <div class="col-5">Date Time</div>
                                            <div class="col-2">Doctor</div>
                                            <div class="col-2">Room</div>
                                            <div class="col-2">Status</div>

                                        </div>
                                    </div>
                                </div>
                                <%

                                    ResultSet rs3 = null;
                                    String sql3 = "SELECT *,appointment.id AS app_id, doctor.name AS doc_name, patient.name AS patient_name, appointment.status AS app_status FROM \"public\".patient "
                                            + "INNER JOIN \"public\".appointment ON \"public\".appointment.patient_id = \"public\".patient.\"id\" "
                                            + "INNER JOIN \"public\".slot ON \"public\".appointment.slot_id = \"public\".slot.\"id\" "
                                            + "INNER JOIN \"public\".doctor ON \"public\".slot.doctor_id = \"public\".doctor.\"id\" "
                                            + "WHERE \"public\".patient.user_id = '" + id + "' AND \"public\".slot.date <='" + formattedDate + "' "
                                            + "ORDER BY \"public\".slot.\"date\" DESC";

                                    rs3 = query1.sqlquery(sql3);
                                    int y = 1;
                                    if (rs3.next()) {
                                        do {
                                %>
                                <div class="row mb-1 list-app">
                                    <div class="card card-body my-0">
                                        <div class="row align-items-center">
                                            <div class="col-1"><%out.println(y);%></div>
                                            <div class="col-5"><%out.println(rs3.getString("date"));%> | <%out.println(rs3.getString("time"));%></div>
                                            <div class="col-2"><%out.println(rs3.getString("doc_name"));%></div>
                                            <div class="col-2">Room 1</div>
                                            <div class="col-2"><span class="badge <%out.println(rs3.getString("app_status").equals("booked") ? "badge-success" : "badge-danger"); %>"> <%out.println(rs3.getString("app_status"));%> </span></div>

                                        </div>
                                    </div>
                                </div>

                                <% y++;
                                    } while (rs3.next());
                                } else {%>
                                <div class="row mb-1 list-app">
                                    <div class="card card-body my-0">
                                        <div class="row align-items-center">
                                            <div class="col-12">No Appointment made at this moment </div>                                     
                                        </div>
                                    </div>
                                </div>
                                <%}%>

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
            <!-- End of Page Wrapper -->
            <form action="../appcancelation" method="post" >
                <div class="modal fade" id="app-cancelation-modal" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
                                <button type="button" class="close btn-close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="text-center">
                                    <lord-icon src="https://cdn.lordicon.com/axteoudt.json" trigger="loop" delay="2000" style="width:100px;height:100px">
                                    </lord-icon>
                                    <p class="font-weight-light">Are you sure want to cancel this appointment?</p>

                                </div>
                                <input type="hidden" name="app_id" id="appointment_id">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary  btn-close" data-dismiss="modal" >Close</button>
                                <button type="submit" class="btn btn-primary">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

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

        <script>
            $(document).ready(function () {
                $(document).on('click', '.btn-cancelation', function () {
                    var app_id = $(this).data('id');

                    $("#app-cancelation-modal").find('#appointment_id').val(app_id);
                    $("#app-cancelation-modal").modal("show");
                })

                $(document).on('click', '.btn-close', function () {
                    $(".modal").modal("hide");
                })
            })

        </script>

    </body>

</html>
<%    };
%>

