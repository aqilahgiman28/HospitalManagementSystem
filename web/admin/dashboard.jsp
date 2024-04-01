<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbcon.dbConnect"%>
<%@page import="admin.Admin"%>

<% if (session.getAttribute("user_id") == null) {
        response.sendRedirect("/HospitalManagementSystem-main/admin/loginAdmin.jsp");
    } else {
        String id = (String) request.getSession().getAttribute("user_id");
%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>HMS Admin - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="icon" href="../assets/img/hospital_icon.png" >

        <!-- Custom styles for this template-->
        <link href="https://startbootstrap.github.io/startbootstrap-sb-admin-2/css/sb-admin-2.min.css" rel="stylesheet">


    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="component/sideNavBar.jsp" /> 
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <jsp:include page="component/topNavBar.jsp" /> 
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <!--                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                                <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                                                <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                                        class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                                            </div>-->

                        <!-- Content Row -->
                        <div class="row">

                            <%
                                dbConnect connection = new dbConnect();
                                String countSql = "SELECT "
                                        + "(SELECT COUNT(*) FROM public.appointment) AS total_appointments, "
                                        + "(SELECT COUNT(*) FROM public.doctor) AS total_doctors, "
                                        + "(SELECT COUNT(*) FROM public.patient) AS total_patients, "
                                        + "(SELECT COUNT(*) FROM public.slot) AS total_slots;";
                                ResultSet countRs = connection.sqlquery(countSql);

                                int totalAppointments = 0;
                                int totalDoctors = 0;
                                int totalPatients = 0;
                                int totalSlots = 0;
                                if (countRs.next()) {
                                    totalAppointments = countRs.getInt("total_appointments");
                                    totalDoctors = countRs.getInt("total_doctors");
                                    totalPatients = countRs.getInt("total_patients");
                                    totalSlots = countRs.getInt("total_slots");
                                }
                            %>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Total Doctor</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= totalDoctors%></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-user-md fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Total Patient</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= totalPatients%></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-user fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                    Total Slot</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= totalSlots%></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-clock fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pending Requests Card Example -->
                            <!--                        <div class="col-xl-3 col-md-6 mb-4">
                                                        <div class="card border-left-warning shadow h-100 py-2">
                                                            <div class="card-body">
                                                                <div class="row no-gutters align-items-center">
                                                                    <div class="col mr-2">
                                                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                                            Total Appointment</div>
                                                                        <div class="h5 mb-0 font-weight-bold text-gray-800">5</div>
                                                                    </div>
                                                                    <div class="col-auto">
                                                                        <i class="fas fa-calendar-plus fa-2x text-gray-300"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>-->


                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    Total Appointment</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= totalAppointments%></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar-plus fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <!-- Content Row -->

                            <div class="collapse" id="pagesCollapseAccount" data-bs-parent="#accordionSidenavPagesMenu">
                                <nav class="sidenav-menu-nested nav">
                                    <a class="nav-link" href="account-profile.html">Profile</a>

                                </nav>
                            </div>

                            <%

                                String sql = "SELECT a.*, u.*, a.id AS ad_id, u.id AS us_id "
                                        + "FROM public.admin AS a "
                                        + "JOIN public.\"user\" AS u ON a.user_id = u.id "
                                        + "WHERE u.id = '" + id + "' "
                                        + "LIMIT 1000 OFFSET 0;";

                                ResultSet rs = connection.sqlquery(sql);

                                if (rs.next()) {
                            %>
                            <!-- Main page content-->

                            <div class="container-xl px-4 mt-4">
                                <!-- Account page navigation-->
                                <hr class="mt-0 mb-4" />
                                <div class="row justify-content-center align-items-center">
                                    <div class="col-xl-8">
                                        <!-- Account details card-->
                                        <div class="card mb-4">
                                            <div class="card-header">Admin Details</div>
                                            <div class="card-body">
                                                <form action="../updateAdmin" method="post">
                                                    <!-- Form Group (username)-->
                                                    <div class="mb-3">
                                                        <label class="small mb-1">Username</label>
                                                        <input class="form-control" id="floatingInput" name="username" type="text" placeholder="description" value="<% out.println(rs.getString("username"));%>" />

                                                    </div>
                                                    <!-- Form Row-->
                                                    <div class="row gx-3 mb-3">
                                                        <!-- Form Group (first name)-->
                                                        <div class="col-md-6">
                                                            <label class="small mb-1">Email</label>
                                                            <input class="form-control" id="floatingInput" name="email" type="text" placeholder="description" value="<% out.println(rs.getString("email"));%>" />

                                                        </div>
                                                        <!-- Form Group (last name)-->
                                                        <div class="col-md-6">
                                                            <label class="small mb-1" >Password</label>
                                                            <input class="form-control" id="floatingInput" name="password" type="text" placeholder="description" value="<% out.println(rs.getString("password"));%>" />

                                                        </div>
                                                    </div>
                                                    <!-- Form Row        -->
                                                    <div class="row gx-3 mb-3">
                                                        <!-- Form Group (organization name)-->
                                                        <div class="col-md-6">
                                                            <label class="small mb-1" >Name</label>
                                                            <input class="form-control" id="floatingInput" name="name" type="text" placeholder="description" value="<% out.println(rs.getString("name"));%>" />
                                                        </div>

                                                        <!-- Form Group (birthday)-->
                                                        <div class="col-md-6">
                                                            <label class="small mb-1" >Phone number</label>
                                                            <input class="form-control" id="floatingInput" name="phone" type="text" placeholder="description" value="<% out.println(rs.getString("phone_number"));%>" />

                                                        </div>

                                                        <input name="id" type="hidden"  value="<% out.println(rs.getString("us_id"));%>" />
                                                    </div>
                                                    <!-- Save changes button-->
                                                    <div class="text-center"> 
                                                        <button class="btn btn-primary" type="submit">Update details</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><%

                                }
                            %>


                            <!-- /.container-fluid -->

                        </div>
                        <!-- End of Main Content -->

                        <!-- Footer -->
                        <jsp:include page="component/footer.jsp" /> 
                        <!-- End of Footer -->

                    </div>
                    <!-- End of Content Wrapper -->

                </div>
                <!-- End of Page Wrapper -->

                <!-- Scroll to Top Button-->
                <a class="scroll-to-top rounded" href="#page-top">
                    <i class="fas fa-angle-up"></i>
                </a>

                <!-- Logout Modal-->
                <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                <a class="btn btn-primary" href="../index.jsp">Logout</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bootstrap core JavaScript-->
                <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/jquery/jquery.min.js"></script>
                <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                <!-- Core plugin JavaScript-->
                <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/jquery-easing/jquery.easing.min.js"></script>

                <!-- Custom scripts for all pages-->
                <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/jquery/jquery.min.js"></script>

                <!-- Page level plugins -->
                <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/chart.js/Chart.min.js"></script>

                <!-- Page level custom scripts -->
                <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/js/demo/chart-area-demo.js"></script>
                <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/js/demo/chart-pie-demo.js"></script>

                <script data-cfasync="false" src="https://sb-admin-pro.startbootstrap.com/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                <script src="https://sb-admin-pro.startbootstrap.com/js/scripts.js"></script>
                </body>


                </html>
                <% }%>