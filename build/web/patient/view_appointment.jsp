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

        .input-group-text{
            background-color: #2c4964;
            color:white;
            font-weight: 700;
            min-width:100px
        }
        .icon-modify{
            background-color: #2c4964;
            padding:15px;
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

                        <%
                            dbConnect query1 = new dbConnect();

                            Integer id = (Integer) request.getSession().getAttribute("user_id");
                            String appointment_id = request.getParameter("app_id").trim();

                            ResultSet rs = null;
                            String sql = "SELECT *,appointment.id AS app_id, doctor.name AS doc_name, patient.name AS patient_name, appointment.status AS app_status FROM \"public\".patient "
                                    + "INNER JOIN \"public\".appointment ON \"public\".appointment.patient_id = \"public\".patient.\"id\" "
                                    + "INNER JOIN \"public\".slot ON \"public\".appointment.slot_id = \"public\".slot.\"id\" "
                                    + "INNER JOIN \"public\".doctor ON \"public\".slot.doctor_id = \"public\".doctor.\"id\" "
                                    + "WHERE \"public\".appointment.id = '" + appointment_id + "'";
                            rs = query1.sqlquery(sql);

                            rs.next();
                        %>

                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800 font-weight-bold">My Appointment - <%out.println(rs.getString("date"));%></h1>
                        </div>

                        <div class="row row-cols-1 row-cols-md-2">

                            <div class="col mb-2">
                                <div class="card">
                                    <div class="card-header">
                                        Appointment Details
                                    </div>
                                    <div class="card-body">
                                        <div class="mt-4">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend " >
                                                    <span class="input-group-text " id="basic-addon1">Date</span>
                                                </div>
                                                <input type="text" class="form-control" value="<%out.println(rs.getString("date"));%>"readonly>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Time</span>
                                                </div>
                                                <input type="text" class="form-control" value="<%out.println(rs.getString("time"));%>" readonly>
                                            </div>   
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Room</span>
                                                </div>
                                                <input type="text" class="form-control" value="Room 1"readonly>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Doctor</span>
                                                </div>
                                                <input type="text" class="form-control" value="<%out.println(rs.getString("doc_name"));%>"readonly>
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Status</span>
                                                </div>
                                                <input type="text" class="form-control text-capitalize" value="<%out.println(rs.getString("Status"));%>"readonly>
                                            </div>


                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col mb-2">
                                <div class="card h-100">
                                    <div class="card-header">
                                        Medical Record
                                    </div>
                                    <div class="card-body">
                                        <%

                                            ResultSet rsmedical = null;
                                            String sqlmedical = "SELECT * FROM public.medical_record "
                                                    + "WHERE appointment_id = '" + appointment_id + "'";
                                            rsmedical = query1.sqlquery(sqlmedical);

                                            if (rsmedical.next()) {
                                        %>
                                        <textarea class="form-control" aria-label="With textarea" readonly style="min-height:300px"> <%  out.println(rsmedical.getString("description")); %></textarea>
                                        <%
                                        } else {
                                        %>
                                        <div class="text-center">No Medical has been recorded</div>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col mb-2">
                                <div class="card my-4 h-100">
                                    <div class="card-header">
                                        Prescription
                                    </div>
                                    <div class="card-body">
                                        <%
                                            ResultSet rsmedicine = null;
                                            String sqlmedicine = "SELECT * FROM public.prescription "
                                                    + "INNER JOIN \"public\".medicine ON \"public\".prescription.medicine_id = \"public\".medicine.\"id\" "
                                                    + "WHERE appointment_id = '" + appointment_id + "'";
                                            rsmedicine = query1.sqlquery(sqlmedicine);

                                            if (rsmedicine.next()) {
                                        %>
                                        <table class="table">
                                            <thead >
                                                <tr>
                                                    <th scope="col">Medicine</th>
                                                    <th scope="col">Quantity</th>
                                                </tr>

                                            </thead>
                                            <tbody>
                                                <% do { %>
                                                <tr>
                                                    <td scope="col"><%  out.println(rsmedicine.getString("name")); %></th>
                                                    <td scope="col"><%  out.println(rsmedicine.getString("quantity")); %></th>
                                                </tr>
                                                <%
                                                    } while (rsmedicine.next());

                                                %>
                                            </tbody>
                                            <%                                            } else {
                                            %>
                                            <div class="text-center">No prescription has been recorded</div>
                                            <%
                                                }
                                            %>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

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
            <!-- /.content-wrapper -->
        </div>
        <!-- /.wrapper -->

        <!-- End of Main Content -->


    </div>

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

